<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
</head>
<body>
	<sf:form method="POST" commandName="user">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<b>First Name</b><sf:input type="text" name="firstName" path="firstName"/><br />
		<b>Last Name</b><sf:input type="text" name="lastName" path="lastName"/><br />
		<b>Email</b><sf:input type="text" name="email" path="email"/><br /> 
		<b>Federal or Contractor?</b><br /> 
		<sf:radiobutton name="myRadio" checked="checked" path="federal"/>Federal 
		<sf:radiobutton name="myRadio" path="federal"/>Contractor <br />
		<sf:select name="mySelect" path="division">
			<c:forEach items="${divisions}" var="division">
				<sf:option value="${division}" path="division">${division}</sf:option>
			</c:forEach>
		</sf:select>
		<br />Select preferred course date:<br />
		<sf:select name="course" path="preferredCourseID">
		    <sf:option selected="selected" value="-1" path="preferredCourseID">No Preferred Date</sf:option>
		<c:forEach items="${coursesList}" var="course">
			<sf:option value="${course.courseID}" path="preferredCourseID"><fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></sf:option>
		</c:forEach>
		</sf:select>
		<br />
		<button type="submit" name="submit" value="create">Register</button>
		<button type="submit" name="submit" value="cancel">Cancel</button>
	</sf:form>
</body>
</html>