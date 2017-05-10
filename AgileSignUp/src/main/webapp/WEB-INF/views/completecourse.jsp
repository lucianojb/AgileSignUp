<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete or Complete a course</title>
</head>
<body>
	<jsp:include page="adminheader.jsp" />
	<form method=POST>
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<div class = "container">
			<div class = "row">
				<div class = "col-sm-3 col-centered row-bordered">
				<h1 style = "text-align:center">Complete or Delete Course</h1>
				</div>
			</div>
			
			<div class = "row">
				<div class = "col-sm-3 col-centered">
					<h2 style = "text-align:center">Date: ${course.courseDate}</h2>
				</div>
			</div>
			
			<div class = "row top-buffer">
				<div class = "col-sm-2 col-sm-offset-3">
					<br><br> <h4 style = "text-align:center">Return to course list</h4><br>
					<button type="submit" class="btn btn-block" name="submit" value="cancel">Cancel</button>
				</div>
				
				<div class = "col-sm-2">	
					<h4 style = "text-align:center">Deleting course will delete course and remove all users from course</h4>
					<button type="submit" class="btn btn-danger btn-block" name="submit" value="delete">Delete</button>
				</div>
				
				<div class = "col-sm-2">	
					<h4 style = "text-align:center">Completing course will delete course and all users enrolled in course</h4>
					<button type="submit" class="btn btn-success btn-block" name="submit" value="complete">Complete</button>
				</div>
			
			</div>	
		</div>
	</form>
</body>
</html>