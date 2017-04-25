<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body>
	<form method="POST">
		<input type="text" name="lastName" value="${user.lastName}" /><br />
		<input type="text" name="firstName" value="${user.firstName}" /><br />
		<input type="text" name="email" value="${user.email}" /><br />
		<c:choose>
			<c:when test="${user.federal}">
					<input type="radio" name="myradio" value="1" checked="checked"/>Federal
					<input type="radio" name="myradio" value="2"/>Contractor
				<br />
			</c:when>
			<c:otherwise>
				<input type="radio" name="myradio" value="1"/>Federal
				<input type="radio" name="myradio" value="2" checked="checked"/>Contractor
				<br />
			</c:otherwise>
		</c:choose>
		<button type="submit" name="submit" value="save">Save</button>
		<button type="submit" name="submit" value="cancel">Cancel</button>	
	</form>
</body>
</html>