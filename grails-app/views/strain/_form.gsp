<%@ page import="resistance.Strain" %>

<div class="form-group ${hasErrors(bean: strainInstance, field: 'name', 'error')} required">
	<label class = "control-label col-sm-2" for="name">
		<g:message code="strain.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="name" class = "form-control" required="" value="${strainInstance?.name}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: strainInstance, field: 'pseudosequence', 'error')} required">
	<label class = "control-label col-sm-2" for="pseudosequence">
		<g:message code="strain.pseudosequence.label" default="Pseudosequence" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="pseudosequence" class = "form-control" required="" value="${strainInstance?.pseudosequence}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: strainInstance, field: 'resistance', 'error')} required">
	<label class = "control-label col-sm-2" for="resistance">
		<g:message code="strain.resistance.label" default="Resistance" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="resistance" class = "form-control" required="" value="${strainInstance?.resistance}"/>
	</div>
</div>


