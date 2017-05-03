<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete or Complete a course</title>
</head>
<body>
	<form method=POST>
		<h1>Course: <fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></h1>
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<h4>Completing course will delete course and all users enrolled in course</h4> <br />
		<button type="submit" name="submit" value="complete">Complete</button> <br />
		<h4>Deleting course will delete course and remove all users from course</h4> <br />
		<button type="submit" name="submit" value="delete">Delete</button> <br />
		<button type="submit" name="submit" value="cancel">Cancel</button>
	</form>
</body>
</html>