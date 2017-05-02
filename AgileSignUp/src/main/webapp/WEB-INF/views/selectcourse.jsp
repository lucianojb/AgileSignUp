<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select a course</title>
</head>
<body>
	<jsp:include page="adminheader.jsp" />
	
	
	<div class = "container">
		<div class = "row">
			<div class = "col-sm-3 col-centered">	
				<h3>Course Selection:</h3>
				<h1 style = "text-align: center;"><c:out value=" ${user.firstName}"></c:out> <c:out value="${user.lastName}"></c:out></h1>	
			</div>
		</div>
		<div class = "row top-buffer">
			<div class = "col-sm-3 col-centered">	
				<c:choose>
				<c:when test="${not empty user.preferredCourseID && user.preferredCourseID > -1}">
					<p style = "text-align:center;">User preferred date is: 
					<fmt:formatDate value="${preferredCourse.courseDate}" pattern="MM-dd-yyyy" /></p>
				</c:when>
				<c:otherwise>
					<p style = "text-align:center">User has no preferred course date</p>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	
	<div class = "row top-buffer">
	
			<c:choose>
			<c:when test="${not empty user.courseID}">
				<div class = "col-sm-3 col-sm-offset-3">	
			</c:when>
			<c:otherwise>
				<div class = "col-sm-3 col-centered">
			</c:otherwise>
			</c:choose>
			
			<form method="POST">
			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			<c:choose>
			<c:when test="${not empty coursesList}">
			<div class="form-group">
				<label class="control-label" for="course">Select Course:</label>
				<select class="form-control" name="course">
			<c:forEach items="${coursesList}" var="course">
			<c:choose>
			<c:when test="${course.courseID eq memberOfCourse}">
				<option value="${course.courseID}" selected="selected"><fmt:formatDate value="${course.courseDate}" pattern="MM-dd-yyyy" /></option>
			</c:when>
			<c:otherwise>
				<option value="${course.courseID}"><fmt:formatDate value="${course.courseDate}" pattern="MM-dd-yyyy" /></option>
			</c:otherwise>
			</c:choose>
    </c:forEach>
    </select>
    	</div>
    
			<button type="submit" class= "btn btn-success btn-block" name="submit" value="save">Add to Selected Course</button>
    	</div>
    				<div class = "col-sm-3">	
    			<c:if test="${not empty user.courseID}">
    			<label class="control-label">Assigned Course:</label>
    				<p style = "text-align: center; padding-top:4px; padding-bottom:15px;"> <fmt:formatDate value="${enrolledCourseDate}" pattern="MM-dd-yyyy" /> <p>
    				<button type="submit" class = "btn btn-danger btn-block" name="submit" value="remove">Remove From Assigned Course</button>
    			</c:if>
				</form>
			</div>
			</div>
    	</div>
    
    <div class = "row">

    </c:when>
    <c:otherwise>
    	No other courses available to add user to!
    </c:otherwise>   
    </c:choose>
   </div>
   </div>
    
   
			</div>
</body>
</html>