<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

<link rel="stylesheet" href='<c:url value="resources/css/bootstrap.min.css" />' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
</head>
<body>
	<jsp:include page="header.jsp" /> 	 
	
  	<form method="POST">
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	
  	<div class="container">
  		<div class= "row">
  			<div class="col-sm-3 col-sm-offset-3">	
  				<div class="form-group">
					<label for="firstName">First Name</label>
			 		<input class="form-control" id="firstName" name="firstName" type="text" />
				</div>
			</div>
		
			<div class="col-sm-3">	
				<div class="form-group">
					<label for="lastName">Last Name</label>
			 		<input class="form-control" id="lastName" name="lastName" type="text" />
				</div>
			</div>
		</div>
	
		<div class = "row">
			<div class="col-sm-6 col-centered">	
				<div class="form-group">
					<label for="email">Email</label>
			 		<input class="form-control" id="email" name="email" type="text" />
				</div>
			</div>
		</div>

		<div class = "row">
			<div class="col-sm-3 col-sm-offset-3">
		  		<div class="form-group">
		  			<label for="fed">Federal or Contractor</label>
					<select class="form-control" name="fed" id="fed">
						<option value="federal" > Federal</option>
						<option value="contractor"> Contractor</option>
					</select>
				</div>
			</div>
	
			<div class="col-sm-3">
				<div class="form-group">
					<label for="mySelect">Division</label>
						<select class="form-control" name="mySelect" id="mySelect">
						<c:forEach items="${divisions}" var="division">
							<option value="${division}">${division}</option>
						</c:forEach>
						</select>
				</div>
			</div>
		</div>
		
		<div class = "row">
			<div class="col-sm-6 col-centered">	
				<div class="form-group">
					<label for="course">Select preferred course date:</label>
						<select class="form-control" name="course">
							<option selected value=-1>No Preferred Date</option>
						<c:forEach items="${coursesList}" var="course">
							<option value="${course.courseID}"><fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></option>
						</c:forEach>
						</select>
				</div>
			</div>
		</div>
		
		<div class = "row">
			<div class = "col-sm-2 col-sm-offset-4">
				<button type="submit" class="btn btn-success btn-block" name="submit" value="create">Register</button>
			</div>
		
			<div class = "col-sm-2">
				<button type="submit" class="btn btn-block" name="submit" value="cancel">Cancel</button>
			</div>
		</div>
			
	</div>
	</form>
</body>
</html>