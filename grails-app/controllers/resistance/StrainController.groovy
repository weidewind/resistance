package resistance



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StrainController {
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def beforeInterceptor = [action:this.&checkUser,except:['index','show']]
def checkUser() {
if(!session.user) {
// i.e. user not logged in
redirect(controller:'user',action:'login')
return false
}
}
	
	
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Strain.list(params), model:[strainInstanceCount: Strain.count()]
    }

    def show(Strain strainInstance) {
        respond strainInstance
    }

    def create() {
        respond new Strain(params)
    }

    @Transactional
    def save(Strain strainInstance) {
        if (strainInstance == null) {
            notFound()
            return
        }

        if (strainInstance.hasErrors()) {
            respond strainInstance.errors, view:'create'
            return
        }

        strainInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'strain.label', default: 'Strain'), strainInstance.id])
                redirect strainInstance
            }
            '*' { respond strainInstance, [status: CREATED] }
        }
    }

    def edit(Strain strainInstance) {
        respond strainInstance
    }

    @Transactional
    def update(Strain strainInstance) {
        if (strainInstance == null) {
            notFound()
            return
        }

        if (strainInstance.hasErrors()) {
            respond strainInstance.errors, view:'edit'
            return
        }

        strainInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Strain.label', default: 'Strain'), strainInstance.id])
                redirect strainInstance
            }
            '*'{ respond strainInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Strain strainInstance) {

        if (strainInstance == null) {
            notFound()
            return
        }

        strainInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Strain.label', default: 'Strain'), strainInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'strain.label', default: 'Strain'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
