<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Agile SignUp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="background:black !important" class="jumbotron text-center">
	<font color="white">
  		  <a href="./" style= "color:white; text-decoration:none"><h1>AFS Agile Signup</h1></a> 
  	 </font>
  	 </div>

<center>	

<div class="row">
  <div class="col-sm-6">
  <h1> Edit Users</h1>
  <a href="./users">Create and edit users</a><br/>
  </div>
  <div class="col-sm-6">
  <h1> Edit Courses </h1>
  <a href="./courses">View, edit and assign users to courses</a><br/></div>
</div>
</center>
</body>
</html>
