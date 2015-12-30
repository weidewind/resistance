
<%@ page import="resistance.Strain" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='stylesheets' file='bootstrap.css' /> " /> 		
		<g:set var="entityName" value="${message(code: 'strain.label', default: 'Strain')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-strain" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-strain" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list strain">
			
				<g:if test="${strainInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="strain.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${strainInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${strainInstance?.pseudosequence}">
				<li class="fieldcontain">
					<span id="pseudosequence-label" class="property-label"><g:message code="strain.pseudosequence.label" default="Pseudosequence" /></span>
					
						<span class="property-value" aria-labelledby="pseudosequence-label"><g:fieldValue bean="${strainInstance}" field="pseudosequence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${strainInstance?.resistance}">
				<li class="fieldcontain">
					<span id="resistance-label" class="property-label"><g:message code="strain.resistance.label" default="Resistance" /></span>
					
						<span class="property-value" aria-labelledby="resistance-label"><g:fieldValue bean="${strainInstance}" field="resistance"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:strainInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${strainInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
