<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Of Attendees</title>
</head>
<body>
	<jsp:include page="adminheader.jsp" /> 	
	
	<div class="container">
		<div class="row">
			<div class = "col-sm-3 col-centered">
				<h1 style="text-align: center"> Email List </h1>
					<c:choose>
					<c:when test="${empty emailList}">
						No users assigned to course.
					</c:when>
					<c:otherwise>
						<c:forEach items="${emailList}" var="email">
							${email};
						</c:forEach>
					</c:otherwise>
					</c:choose>
			</div>
		</div>
		<div class="row top-buffer">
			<div class = "col-sm-3 col-centered">
				<a href="../courses" type="button" class="btn btn-success btn-block">Return to Courses</a>
			</div>
		</div>
	</div>	
</body>
</html>