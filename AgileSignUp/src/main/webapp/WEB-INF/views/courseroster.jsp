<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>List of Users</title>
</head>
<body>
		
		<jsp:include page="adminheader.jsp" /> 	
		
		<div class="container">
		<div class="row">
			<div class = "col-sm-8 col-centered">
				<h1 style="text-align: center"> User List</h1>

					<c:choose>
					<c:when test="${empty userList}">
						No users assigned to course.
					</c:when>
					<c:otherwise>
						
 						<table class="table table-bordered">
    					<thead>
      					<tr>
        					<th style="text-align: center;">Names</th>
        					<th style="text-align: center;">Signature</th>
      					</tr>
    					</thead>
    					<tbody>		
							<c:forEach items="${userList}" var="name">
								<tr>
									<td style="text-align: center" id="rosterName">${name.lastName}, ${name.firstName}</td>
									<td id="rosterSignature"></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
					</c:choose>
			</div>
		</div>
		<div class="row top-buffer">
			<div class = "col-sm-3 col-centered">
				<a href="../courses" type="button" class="btn btn-success btn-block">Return to Courses</a>
			</div>
		</div>
	</div>	
		
</body>
</html>