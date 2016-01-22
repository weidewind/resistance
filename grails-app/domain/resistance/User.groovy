package resistance

class User
{
Long id
String email
String password
String toString()
{ "$email" }
static constraints = {
 email(email:true)
 password(blank:false, password:true)
}
}
