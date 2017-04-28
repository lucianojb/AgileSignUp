<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page to view users!</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div style="background: black !important" class="jumbotron text-center">
		<font color="white"> 
		  <a href="/signup/" style="color: white; text-decoration: none"><h1>AFS Agile Signup</h1></a>
		  <a href="/signup/users" style="color:white; text-decoration:none"><h6>Users</h6></a>
  		  <a href="/signup/courses" style="color:white; text-decoration:none"><h6>Courses</h6></a>
		  <p>User List</p>
		</font>
	</div>
	<div class="container">
		<table id="myTable" class="table table-striped">
			<thead class="thead-inverse">

				<tr align="center">
					<th style="text-align: center">First Name</th>
					<th style="text-align: center">Last Name</th>
					<th style="text-align: center">Email</th>
					<th style="text-align: center">Federal or Contractor</th>
					<th style="text-align: center">Division</th>
					<th style="text-align: center">Assigned to course?</th>
				</tr>
			</thead>


			<tbody>
				<c:forEach items="${userData}" var="user">
					<tr>
						<td align="center"><c:out value="${user.firstName}" /></td>
						<td align="center"><c:out value="${user.lastName}" /></td>
						<td align="center"><c:out value="${user.email}" /></td>
						<td align="center"><c:choose>
								<c:when test="${user.federal}">
							Federal <br />
								</c:when>
								<c:otherwise>
        					Contractor <br />
								</c:otherwise>
							</c:choose></td>
						<td align="center"><c:out value="${user.division}" /></td>
						<c:choose>
							<c:when test="${empty user.courseID}">
								<td align="center">No</td>
							</c:when>
							<c:otherwise>
								<td align="center">Yes</td>
							</c:otherwise>
						</c:choose>
						<td align="center"><a
							href="<c:url value='/preferreddate/${user.userID}' />">Set Preferred Date</a>
						<td align="center"><a
							href="<c:url value='/selectcourse/${user.userID}' />">Manage
								Course</a>
						<td align="center"><a
							href="<c:url value='/edituser/${user.userID}' />">Edit</a>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<a href="<c:url value='/createuser' />">Create New User</a>
	</div>
</body>
</html>