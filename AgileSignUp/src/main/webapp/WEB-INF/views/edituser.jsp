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
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		First Name: <input type="text" name="firstName" value="${user.firstName}" /><br />
		Last Name: <input type="text" name="lastName" value="${user.lastName}" /><br />
		Email: <input type="text" name="email" value="${user.email}" /><br />
		Federal or Contractor?<br />
		<c:choose>
			<c:when test="${user.federal}">
					<input type="radio" name="myradio" value="federal" checked="checked"/>Federal
					<input type="radio" name="myradio" value="contractor"/>Contractor
				<br />
			</c:when>
			<c:otherwise>
				<input type="radio" name="myradio" value="federal"/>Federal
				<input type="radio" name="myradio" value="contractor" checked="checked"/>Contractor
				<br />
			</c:otherwise>
		</c:choose>
		Division:<br />
		<select name="myselect">
			<c:forEach items="${divisions}" var="division">
				<c:choose>
					<c:when test="${division eq user.division}">
						<option selected="selected" value="${division}">${division}</option>
					</c:when>
					<c:otherwise>
						<option value="${division}">${division}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select><br />
		<button type="submit" name="submit" value="save">Save</button>
		<button type="submit" name="submit" value="cancel">Cancel</button>	
	</form>
</body>
</html>