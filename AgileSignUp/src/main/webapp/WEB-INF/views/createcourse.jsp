<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

	<form name="myForm" ng-controller="DateController as dateCtrl"
		method="POST">
		<label for="exampleInput">Pick a date for the course:</label> 
		<input type="date" id="pickedDate" name="pickedDate" placeholder="yyyy-MM-dd" required />
		<button type="submit">Create new course!</button>
	</form>


</body>
</html>