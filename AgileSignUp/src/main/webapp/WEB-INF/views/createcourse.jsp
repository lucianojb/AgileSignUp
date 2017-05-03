<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
<script>
    $(document).ready(function(){
      var date_input=$('input[name="pickedDate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
        orientation: "top right"
      };
      date_input.datepicker(options);
    })
</script>
<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
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
	<jsp:include page="adminheader.jsp" /> 
	
	<form name="myForm" ng-controller="DateController as dateCtrl"
			method="POST">
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	<div class="bootstrap-iso">
 	<div class="container-fluid">
	<div class = "row">
			<div class = "col-sm-4 col-sm-offset-4">
			     <div class="form-group"> <!-- Date input -->
        			<label class="control-label" for="pickedDate">Course Date</label>
        			<div class="input-group">
        				<input class="form-control" id="pickedDate" name="pickedDate" placeholder="	 MM/DD/YYY" type="text"/>
        			    <div class="input-group-addon">
        					<i class="fa fa-calendar-plus-o"></i>
       					</div>
       				</div>
      			</div>
            </div>
		</div>
	</div>	
	</div>	

	<div class="container">
			<div class = "row">
			<div class = "col-sm-3 col-centered">
				<button type="submit" class="btn btn-success btn-block">Create new course!</button>
				</form>
			</div>	
			</div>
			<div class = "row">
			<div class = "col-sm-3 col-centered">
				<h4 style="text-align: center">${errorMessage}</h4>
				</div>
			</div>
			
	</div>
</body>
</html>