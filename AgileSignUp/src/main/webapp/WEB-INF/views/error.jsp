<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Server error</title>
</head>
<body>
	<jsp:include page="adminheader.jsp" />	
	<div class = "container">
		<div class = "row">
			<div class = "col-sm-3 col-centered">
				<h1 style = "text-align:center">Something bad happened...</h1>
				<h3>${errorMessage}</h3>
			</div>
		</div>
		<div class = "row top-buffer">
			<div class = "col-sm-3 col-centered">
				<a href="/signup/" type="button" class="btn btn-success btn-block">Return Home</a>
			</div>
		</div>
	</div>
</body>
</html>