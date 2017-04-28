<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
</head>
<body>
	<form method="POST">
		<b>First Name</b><input type="text" name="firstName"/><br />
		<b>Last Name</b><input type="text" name="lastName"/><br />
		<b>Email</b><input type="text" name="email"/><br /> 
		<b>Federal or Contractor?</b><br /> 
		<input type="radio" name="myRadio" value="federal"checked="checked" />Federal 
		<input type="radio" name="myRadio" value="contractor" />Contractor <br />
		<select name="mySelect">
			<c:forEach items="${divisions}" var="division">
				<option value="${division}">${division}</option>
			</c:forEach>
		</select>
		Select preferred course date:<br />
		<select name="course">
		<c:forEach items="${coursesList}" var="course">
			<option value="${course.courseID}"><fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></option>
		</c:forEach>
		</select>
		<br />
		<button type="submit" name="submit" value="create">Create</button>
		<button type="submit" name="submit" value="cancel">Cancel</button>
	</form>
</body>
</html>