<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Create a New Course</title>
<script  src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>
   angular.module('dateInputExample', [])
     .controller('DateController', ['$scope', function($scope) {
       $scope.example = {};
     }]);
</script>
</head>
<body>
	<div style="background:black !important" class="jumbotron text-center">
	<font color="white">
  		  <a href="./" style= "color:white; text-decoration:none"><h1>AFS Agile Signup</h1></a>
  		<p>Course List</p> 
  	 </font>
  	 </div>
	
	<h4>${errorMessage}</h4>
	<center>
	<div class="container">
		<form name="myForm" ng-controller="DateController as dateCtrl"
			method="POST">
			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			<label for="exampleInput">Pick a date for the course:</label> 
			<input type="date" id="pickedDate" name="pickedDate" style= "text-align: center" placeholder="yyyy-MM-dd" required />
			<button type="submit" class="btn btn-success btn-center">Create new course!</button>
		</form>
	</div>
	</center>
</body>
</html>