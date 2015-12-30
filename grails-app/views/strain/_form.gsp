<%@ page import="resistance.Strain" %>



<div class="fieldcontain ${hasErrors(bean: strainInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="strain.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${strainInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: strainInstance, field: 'pseudosequence', 'error')} required">
	<label for="pseudosequence">
		<g:message code="strain.pseudosequence.label" default="Pseudosequence" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pseudosequence" required="" value="${strainInstance?.pseudosequence}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: strainInstance, field: 'resistance', 'error')} required">
	<label for="resistance">
		<g:message code="strain.resistance.label" default="Resistance" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="resistance" required="" value="${strainInstance?.resistance}"/>

</div>

