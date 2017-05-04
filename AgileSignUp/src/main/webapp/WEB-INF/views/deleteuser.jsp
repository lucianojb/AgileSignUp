<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete a user</title>
</head>
<body>
	<jsp:include page="adminheader.jsp" /> 
	<form method=POST>
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		
	<div class = "container">
		<div class = "row">
			<div class = "col-sm-3 col-centered">
				<h1 style = "text-align: center">Delete User</h1>
				</div>
		</div>
		
		<div class = "row top-buffer">
			<div class = "col-sm-3 col-centered">
				<h4 style = "text-align: center">${user.firstName} ${user.lastName} (${user.email})</h4>	
			</div>
		</div>
				
		<div class = "row top-buffer">
			<div class = "col-sm-3 col-sm-offset-3">
				<button type="submit" class="btn btn-block" name="submit" value="cancel">Cancel</button>
			</div>
				
			<div class = "col-sm-3">
				<button type="submit" class="btn btn-danger btn-block" name="submit" value="delete">Delete</button>
			</div>
		</div>
	</div>
	</form>
</body>
</html>