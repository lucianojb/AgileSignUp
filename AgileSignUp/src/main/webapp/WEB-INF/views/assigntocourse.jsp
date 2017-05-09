<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/signup/resources/jquery.checkall.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
	$(document).ready(function() {
		var a = document.getElementById("numberSelected");
		var b = document.querySelectorAll('input[name="checkbox"]:checked').length;
		a.innerHTML = b + "/" + ${maxAttendees} + " Attendees &#10004";
		
		$(document).on("click", "#checkbox", update_checked);
		
		function update_checked() {
			var a = document.getElementById("numberSelected");
			var b = document.querySelectorAll('input[name="checkbox"]:checked').length;
			a.innerHTML = b + "/" + ${maxAttendees} + " Attendees";
			if(b > ${maxAttendees}){
				a.style.color = "red";
				a.innerHTML = a.innerHTML + " &#10008";
			}else{
				a.style.color = "black";
				a.innerHTML = a.innerHTML + " &#10004";
			}
		};
		
		$('.check-all').click(function() {
			$('input:checkbox').prop('checked', this.checked);
			update_checked();
		})
	});
</script>
<title>Assign users to course</title>
</head>
<body>

	<jsp:include page="adminheader.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-centered row-bordered">
				<h1 style="text-align: center">Course Assignment</h1>
			</div>
		</div>
		<div class="row top-buffer">
			<div class="col-sm-3 col-centered">
				<h2 style="text-align: center">
					Date:
					<fmt:formatDate value="${course.courseDate}" pattern="MM-dd-yyyy" />
				</h2>
			</div>
		</div>


		<form method=POST>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="row">
				<div class="col-sm-3 col-centered">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center"><input class="check-all"
									type="checkbox" name="mainCheckbox" id="toggle-all"></th>
								<th class="text-center">First Name</th>
								<th class="text-center">Last Name</th>
								<th class="text-center">Assigned to Course</th>
								<th class="text-center">Selected as Preferred Course</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user">
								<tr>
									<c:choose>
										<c:when test="${user.courseID eq course.courseID}">
											<td align="center"><input id="checkbox" type="checkbox" name="checkbox"
											value="${user.userID}" checked></td>
										</c:when>
										<c:otherwise>
											<td align="center"><input id="checkbox" type="checkbox" name="checkbox"
											value="${user.userID}"></td>
										</c:otherwise>
									</c:choose>
									<td align="center"><a
										href="<c:url value='/selectcourse/${user.userID}' />">${user.firstName}</a></td>
									<td align="center"><a
										href="<c:url value='/selectcourse/${user.userID}' />">${user.lastName}</a></td>
									<c:choose>
										<c:when test="${user.courseID eq course.courseID}">
											<td align="center">Yes</td>
										</c:when>
										<c:otherwise>
											<td align="center">No</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${user.preferredCourseID eq course.courseID}">
											<td align="center">Yes</td>
										</c:when>
										<c:otherwise>
											<td align="center">No</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="row">
				<div class = "col-sm-3 col-centered">
					<h5 style = "text-align:center" id="numberSelected"></h5>		
				</div>
			
				
			</div>


			<div class="row top-buffer">
				<div class="col-sm-2 col-sm-offset-4">
					<button type="submit" class="btn btn-block" name="submit"
						value="cancel">Cancel</button>
				</div>
				<div class="col-sm-2">
					<button type="submit" class="btn btn-success btn-block"
						name="submit" value="save">Assign users to course</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>