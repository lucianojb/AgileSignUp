<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select a course for this user</title>
</head>
<body>
	<h1>Setting course for user:</h1>
	<c:out value="${user.firstName}"></c:out>

	<form method="POST">
		<c:forEach items="${coursesList}" var="course">
			<input type="radio" name="course">${course.courseDate}<br/>
    </c:forEach>
		<button type="submit">Submit</button>
	</form>

</body>
</html>