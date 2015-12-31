
<%@ page import="resistance.Strain" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='stylesheets' file='bootstrap.css' /> " /> 	
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='stylesheets' file='dataTables.bootstrap.min.css' /> " /> 	
		<g:set var="entityName" value="${message(code: 'strain.label', default: 'Strain')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-strain" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-strain" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="maintable">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'strain.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="pseudosequence" title="${message(code: 'strain.pseudosequence.label', default: 'Pseudosequence')}" />
					
						<g:sortableColumn property="resistance" title="${message(code: 'strain.resistance.label', default: 'Resistance')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${strainInstanceList}" status="i" var="strainInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${strainInstance.id}">${fieldValue(bean: strainInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: strainInstance, field: "pseudosequence")}</td>
					
						<td>${fieldValue(bean: strainInstance, field: "resistance")}</td>
					
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<th>name</th>
						<th>sequence</th>
						<th>resistance</th>												
					</tr>
				</tfoot>
			</table>
			<div class="pagination">
				<g:paginate total="${strainInstanceCount ?: 0}" />
			</div>
		</div>
		<script>
		$(document).ready(function() {
   			 //$('#maintable').DataTable();
   			 // Setup - add a text input to each footer cell
   			 $('#maintable tfoot th').each( function () {
       		 		var title = $(this).text();
        			$(this).html( '<input type="text" placeholder="Filter by '+title+'" />' );
    			} );
 
   			 // DataTable
    			var table = $('#maintable').DataTable();
 
    		// Apply the search
    			table.columns().every( function () {
        		var that = this;
 
        		$( 'input', this.footer() ).on( 'keyup change', function () {
           		if ( that.search() !== this.value ) {
               		 that
                    	.search( this.value )
                    	.draw();
            	}
       			} );
    			} );
		} );
		

		
		</script>
	</body>
</html>
