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
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">	
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
	<jsp:include page="adminheader.jsp" /> 		
	<div class="container">
		<div class = "row">
			<div class = "col-sm-3 col-centered">
			<a href="./createcourse" type="button" class="btn btn-success btn-block">Create New Course</a>
			</div>
		</div>
		
		<div class="row top-buffer">
			<div class = "col-sm-8 col-centered">
				<table id="myTable" class="table table-striped tablesorter">
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
							<td align="center"><a href="<c:url value='/completecourse/${course.courseID}' />" >Complete/Delete</a>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>		
		</div>
	</div>
</body>
</html>