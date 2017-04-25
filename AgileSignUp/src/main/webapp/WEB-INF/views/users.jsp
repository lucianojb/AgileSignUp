<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page to view users!</title>
</head>
<body>
	<table id="myTable"
		class="table table-responsive table-striped table-bordered tablesorter">
		<thead class="thead-inverse">

			<tr>
				<th>User ID</th>
				<th>Last Name</th>
				<th>First Name</th>
				<th>Email</th>
				<th>Federal or Contractor?</th>
				<th>Division</th>
			</tr>
		</thead>


		<tbody>
			<c:forEach items="${userData}" var="user">
				<tr>
					<td><c:out value="${user.userID}" /></td>
					<td><c:out value="${user.lastName}" /></td>
					<td><c:out value="${user.firstName}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><c:choose>
						<c:when test="${user.federal}">
							Federal <br />
						</c:when>
						<c:otherwise>
        					Contractor <br />
						</c:otherwise>
					</c:choose></td>
					<td><c:out value="${user.division}" /></td>
					<td><a href="<c:url value='/edituser/${user.userID}' />" >Edit</a>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html>