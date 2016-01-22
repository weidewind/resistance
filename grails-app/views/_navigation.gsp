<%@ page import="resistance.Strain" %>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Resistance!</a>
    </div>
    <ul class="nav navbar-nav">
		<!--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
		<!--		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li> -->
		<!--		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> -->

		<g:if test="${session.user}">
			<li><g:link class="list" controller="strain" action="index"><g:message code="Strain list" args="resistance.Strain" /></g:link></li>
			<li><g:link class="create" controller="strain" action="create"><g:message code="Add strain" args="resistance.Strain" /></g:link></li>
			<li><g:link class="logout" controller="user" action="logout"><g:message code="Log out" args="resistance.Strain" /></g:link></li>
		</g:if>
		<g:else>
			<li><g:link class="list" controller="strain" action="index"><g:message code="Strain list" args="resistance.Strain" /></g:link></li>
			<li><g:link class="login" controller="user" action="login"><g:message code="Log in" args="resistance.Strain" /></g:link></li>
		</g:else>
		
    </ul>
  </div>
</nav>	