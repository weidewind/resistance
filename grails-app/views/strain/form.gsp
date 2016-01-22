<%@ page import="resistance.Strain" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='stylesheets' file='bootstrap.css' /> " /> 
		<g:set var="entityName" value="${message(code: 'strain.label', default: 'Strain')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>


	<div class="form-group ${hasErrors(bean: strainInstance, field: 'name', 'error')} required">
		<label for="name">
			<g:message code="strain.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="name" class = "form-control" required="" value="${strainInstance?.name}"/>

	</div>

	<div class="form-group ${hasErrors(bean: strainInstance, field: 'pseudosequence', 'error')} required">
		<label for="pseudosequence">
			<g:message code="strain.pseudosequence.label" default="Pseudosequence" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="pseudosequence" class = "form-control"  required="" value="${strainInstance?.pseudosequence}"/>

	</div>

	<div class="fieldcontain ${hasErrors(bean: strainInstance, field: 'resistance', 'error')} required">
		<label for="resistance">
			<g:message code="strain.resistance.label" default="Resistance" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="resistance" required="" value="${strainInstance?.resistance}"/>

	</div>

	</body>
</html>

