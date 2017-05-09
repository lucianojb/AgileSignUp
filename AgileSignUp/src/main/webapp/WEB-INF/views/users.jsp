<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/signup/resources/jquery.tablesorter.min.js"></script> 

<script type="text/javascript">
$(document).ready(function() 
	    { 
			jQuery.noConflict();
	        $("#myTable").tablesorter(); 
	    } 
	);
</script>

</head>
<body>

	<jsp:include page="adminheader.jsp" /> 
	<div class="container">
		<table id="myTable" class="table table-striped tablesorter">
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
							href="<c:url value='/selectcourse/${user.userID}' />">Manage
								Course</a>
						<td align="center"><a
							href="<c:url value='/edituser/${user.userID}' />">Edit</a>
						<td align="center"><a
							href="<c:url value='/deleteuser/${user.userID}' />">Delete</a>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>