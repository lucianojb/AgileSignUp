<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select a course</title>
</head>
<body>
	<h1>Setting course for <c:out value="${user.firstName}"></c:out> <c:out value="${user.lastName}"></c:out></h1>
	<br />
	User preferred date is: 
	<c:choose>
		<c:when test="${not empty user.preferredCourseID}">
			<fmt:formatDate value="${preferredCourse.courseDate}" pattern="yyyy-MM-dd" />
		</c:when>
		<c:otherwise>
			No preferred course date
		</c:otherwise>
	</c:choose>
	<br />

	<form method="POST">
	<select name="course">
		<c:forEach items="${coursesList}" var="course">
			<c:choose>
			<c:when test="${course.courseID eq memberOfCourse}">
				<option value="${course.courseID}" selected="selected"><fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></option>
			</c:when>
			<c:otherwise>
				<option value="${course.courseID}"><fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></option>
			</c:otherwise>
			</c:choose>
    </c:forEach>
    </select>
    	<c:if test="${not empty user.courseID}">
    		<button type="submit" name="submit" value="remove">Remove From Course</button>
    	</c:if>
		<button type="submit" name="submit" value="save">Add to Selected Course</button>
	</form>

</body>
</html>