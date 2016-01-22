package resistance
class UserController {
	def login = {
	}
	def logout = {
		session.user = null
		redirect (controller:'strain', action:'index')
	}
	def doLogin = {
		def user = User.findWhere(email:params['email'],
		password:params['password'])
		session.user = user
		if (user)
			redirect(controller:'strain',action:'index')
		else
			redirect(controller:'user',action:'login')
	}

}
