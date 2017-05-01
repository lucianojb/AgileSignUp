<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Agile SignUp</title>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="adminheader.jsp" /> 	
<div class = "container">
	<div class="row">
  		<div class="col-sm-3 col-sm-offset-3">
  			<h1 class="text-center">Edit Users</h1>
			<p class = "text-center"> View and edit users, as well as reassign the course they
			are currently enrolled in.</p>
  			<a href="./users" class="btn btn-info btn-block" role="button">See Users</a>
  		</div>
  		<div class="col-sm-3">
  			<h1 class="text-center"> Edit Courses </h1>
  			<p class = "text-center"> See and edit course dates, see attendees, and create new
  			course dates.</p>
  			<a href="./courses" class="btn btn-info btn-block" role="button">See Courses</a>
		</div>
	</div>
</div>
</body>
</html>
