<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courses</title>
</head>
<body>
	<table id="myTable"
				class="table table-responsive table-striped table-bordered tablesorter">
				<thead class="thead-inverse">

					<tr>
						<th>Course ID</th>
						<th>Course Date</th>
						<th>Number Attendees</th>
					</tr>
				</thead>


				<tbody>
					<c:forEach items="${courseData}" var="course">
						<tr>
							<td><c:out value="${course.courseID}" /></td>
							<td><c:out value="${course.courseDate}" /></td>
							<td><c:out value="${course.numberAttendees}" /></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
	
	<a href="./createcourse">Create New Course</a>
</body>
</html>