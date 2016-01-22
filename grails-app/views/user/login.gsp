<html>
 <head>
 <meta name="layout" content="main">
 <link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='stylesheets' file='bootstrap.css' /> " />
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
 <title>User Login</title>
 </head>
 <body>
 <g:render template="../navigation"/>
<div class="container">	
 <g:form class="form-horizontal" role="form"  action="doLogin" method="post">

 <p>Enter your login details below:</p>
	<div class="form-group"> 
		<label class = "control-label col-sm-2" for='email'>Email:</label>
		<div class="col-sm-10">
			<input id="email" type='text' name='email' value='${user?.email}' />
		</div>
	</div>
	<div class="form-group"> 
		<label class = "control-label col-sm-2" for='password'>Password:</label>
		<div class="col-sm-10">
			<input id="password" type='password' name='password' value='${user?.password}' />
		</div>
	</div>

 <div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
		<input type="submit" value="Log in"></input>
	</div>
 </div>
 </g:form>
 </div>
 </body>
</html>