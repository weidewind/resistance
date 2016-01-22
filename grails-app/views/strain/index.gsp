
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
<!--		<a href="#list-strain" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> -->

<g:render template="../navigation"/>
		<div class="container">
		<div id="list-strain" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="maintable" class="table table-striped table-hover">
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
    			var table = $('#maintable').DataTable({"sPaginationType": "bootstrap"}); // {"sPaginationType": "bootstrap"} added later to bootstrap pagination style
 
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
		

		
	/* Bootstrap style ordering */	
/*
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sSortAsc": "header headerSortDown",
    "sSortDesc": "header headerSortUp",
    "sSortable": "header"
} );
*/
		
		/* API method to get paging information */
$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
	return {
		"iStart":         oSettings._iDisplayStart,
		"iEnd":           oSettings.fnDisplayEnd(),
		"iLength":        oSettings._iDisplayLength,
		"iTotal":         oSettings.fnRecordsTotal(),
		"iFilteredTotal": oSettings.fnRecordsDisplay(),
		"iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
		"iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	};
}

/* Bootstrap style pagination control */
$.extend( $.fn.dataTableExt.oPagination, {
	"bootstrap": {
		"fnInit": function( oSettings, nPaging, fnDraw ) {
			var oLang = oSettings.oLanguage.oPaginate;
			var fnClickHandler = function ( e ) {
				e.preventDefault();
				if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
					fnDraw( oSettings );
				}
			};

			$(nPaging).addClass('pagination').append(
				'<ul class="pagination pagination-sm">'+
					'<li class="prev disabled"><a href="#">&larr; '+oLang.sPrevious+'</a></li>'+
					'<li class="next disabled"><a href="#">'+oLang.sNext+' &rarr; </a></li>'+
				'</ul>'
			);
			var els = $('a', nPaging);
			$(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
			$(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
		},

		"fnUpdate": function ( oSettings, fnDraw ) {
			var iListLength = 5;
			var oPaging = oSettings.oInstance.fnPagingInfo();
			var an = oSettings.aanFeatures.p;
			var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

			if ( oPaging.iTotalPages < iListLength) {
				iStart = 1;
				iEnd = oPaging.iTotalPages;
			}
			else if ( oPaging.iPage <= iHalf ) {
				iStart = 1;
				iEnd = iListLength;
			} else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
				iStart = oPaging.iTotalPages - iListLength + 1;
				iEnd = oPaging.iTotalPages;
			} else {
				iStart = oPaging.iPage - iHalf + 1;
				iEnd = iStart + iListLength - 1;
			}

			for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
				// Remove the middle elements
				$('li:gt(0)', an[i]).filter(':not(:last)').remove();

				// Add the new list items and their event handlers
				for ( j=iStart ; j<=iEnd ; j++ ) {
					sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
					$('<li '+sClass+'><a href="#">'+j+'</a></li>')
						.insertBefore( $('li:last', an[i])[0] )
						.bind('click', function (e) {
							e.preventDefault();
							oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
							fnDraw( oSettings );
						} );
				}

				// Add / remove disabled classes from the static elements
				if ( oPaging.iPage === 0 ) {
					$('li:first', an[i]).addClass('disabled');
				} else {
					$('li:first', an[i]).removeClass('disabled');
				}

				if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
					$('li:last', an[i]).addClass('disabled');
				} else {
					$('li:last', an[i]).removeClass('disabled');
				}
			}
		}
	}
} );
		
		
		
		</script>
	</body>
</html>
