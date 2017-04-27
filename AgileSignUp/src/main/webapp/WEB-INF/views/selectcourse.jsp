<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select a course</title>
</head>
<body>
	<h1>Setting course for <c:out value="${user.firstName}"></c:out> <c:out value="${user.lastName}"></c:out></h1>

	<form method="POST">
		<c:forEach items="${coursesList}" var="course">
			<c:choose>
			<c:when test="${course.courseID eq memberOfCourse}">
				<input type="radio" name="course" value="${course.courseID}" checked="checked">${course.courseDate}<br/>
			</c:when>
			<c:otherwise>
				<input type="radio" name="course" value="${course.courseID}">${course.courseDate}<br/>
			</c:otherwise>
			</c:choose>
    </c:forEach>
    	<button type="submit" name="submit" value="remove">Remove From Course</button>
		<button type="submit" name="submit" value="save">Submit</button>
	</form>

</body>
</html>