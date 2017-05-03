<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign users to course</title>
</head>
<body>
	Assigning users to course <fmt:formatDate value="${course.courseDate}" pattern="MM-dd-yyyy" />
	
	<form method=POST>
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	<c:forEach items="${userList}" var="user">
			<c:choose>
			<c:when test="${user.courseID eq course.courseID}">
				<input type="checkbox" value="${user.userID}" checked>${user.firstName} ${user.lastName}</input>
			</c:when>
			<c:otherwise>
				<input type="checkbox" value="${user.userID}">${user.firstName} ${user.lastName}</input>
			</c:otherwise>
			</c:choose>
    </c:forEach>
    			<button type="submit" class= "btn btn-success btn-block" name="submit" value="save">Assign users to course</button>
			<button type="submit" class= "btn btn-success btn-block" name="submit" value="cancel">Cancel</button>

    </form>
</body>
</html>