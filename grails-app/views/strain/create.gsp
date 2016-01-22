<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='stylesheets' file='bootstrap.css' /> " /> 
		<g:set var="entityName" value="${message(code: 'strain.label', default: 'Strain')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
<!--		<a href="#create-strain" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> -->
<g:render template="../navigation"/>

<div class="container">
		<div id="create-strain" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${strainInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${strainInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form class="form-horizontal" role="form" url="[resource:strainInstance, action:'save']" >
					<g:render template="form"/>
					<div class="form-group"> 
						<div class="col-sm-offset-2 col-sm-10">					
							<g:submitButton name="create" class="btn btn-default" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
				
			</g:form>
		</div>
		</div>
	</body>
</html>
