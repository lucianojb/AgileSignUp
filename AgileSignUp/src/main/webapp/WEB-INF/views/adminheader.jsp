<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse">

	<div class="container-fluid">
  		<div class="navbar-header">
      		<a class="navbar-brand pull-left" href="/signup">AFS TSA Agile Registration</a>
      
      		<sec:authorize access="isAuthenticated()">
				<ul class="nav navbar-nav navbar-center">
      				<li><a href="/signup/users">Users</a></li>
      				<li><a href="/signup/courses">Courses</a></li>
    			</ul>
    			<ul class="nav navbar-nav navbar-right">
      				<li><a href="/signup/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    			</ul>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
				<ul class="nav navbar-nav navbar-center">
      				<li><a href="/signup/register">Register</a></li>
    			</ul>
	    		<ul class=" nav navbar-nav navbar-right">
      				<li><a href="/signup/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    			</ul>
    		</sec:authorize>
    	</div>
  </div>
</nav>