<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courses</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/signup/resources/jquery.tablesorter.min.js"></script> 

<script type="text/javascript">
$(document).ready(function() 
	    { 
	        $("#myTable").tablesorter(); 
	    } 
	);
</script>
</head>
<body>
	<div style="background:black !important" class="jumbotron text-center">
	<font color="white">
  		  <a href="/signup/" style= "color:white; text-decoration:none"><h1>AFS Agile Signup</h1></a>
  		  <a href="/signup/users" style="color:white; text-decoration:none"><h6>Users</h6></a>
  		  <a href="/signup/courses" style="color:white; text-decoration:none"><h6>Courses</h6></a>
  		<p>Course List</p> 
  	 </font>
  	 </div>
  	 <center>
	<a href="./createcourse "button type="button" class="btn btn-success btn-center">Create New Course</a>
	</center>
	<div class="container">
	<table id="myTable"
				class="table table-striped tablesorter">
				<thead class="thead-inverse">

					<tr>
						<th style="text-align: center">Course Date</th>
						<th style="text-align: center">Number Attendees</th>
						<th style="text-align: center">Available?</th>
					</tr>
				</thead>


				<tbody>
					<c:forEach items="${courseData}" var="course">
						<tr>
							<td align="center"><fmt:formatDate value="${course.courseDate}" pattern="yyyy-MM-dd" /></td>
							<td align="center"><c:out value="${course.numberAttendees}" /></td>
							<td align="center"><c:choose>
								<c:when test="${course.isAvailable}">
							Yes <br />
								</c:when>
								<c:otherwise>
        					No <br />
								</c:otherwise>
							</c:choose></td>
							<td align="center"><a href="<c:url value='/attendeeslist/${course.courseID}' />" >Generate Email List</a>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			</div>

</body>
</html>