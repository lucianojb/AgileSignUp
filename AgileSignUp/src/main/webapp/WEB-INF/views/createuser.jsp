<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register for an Agile Course</title>

<script type="text/javascript">
$(document).ready(function(){
	document.getElementById('selectThis').selectedIndex = 0;
});
</script>
</head>
<body>

	<jsp:include page="adminheader.jsp" /> 	 
	
  	<sf:form method="POST" commandName="user">
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	
  	<div class="container">
  	
  	
  	      <div class = "row">
              <div class = "col-sm-3 col-centered">
              <h1 style = "text-align:center; font-weight: bold;">TSA Agile Services (TAS) </h1>
              </div>
          </div>
          
          <div class = "row">
              <div class = "col-sm-6 col-centered">
              <h2 style = "text-align:center">Agile Way Fundamentals Training Registration </h2>
              </div>
          </div>
          
          <div class = "row">
              <div class = "col-sm-7 col-centered">
              <h4 style = "text-align:center">
                  Thank you for taking the time to register for this course. We look forward to having you in our training! 
                Please be on the lookout for a follow-up email with additional information closer to the class start date.
            </h4>
              </div>
          </div>
  	
  		<div class= "row top-buffer">
  			<div class="col-sm-3 col-sm-offset-3">	
  				<div class="form-group">
					<label for="firstName">First Name</label>
			 		<sf:input class="form-control" id="firstName" name="firstName" path="firstName" type="text"/>
			 		<sf:errors path="firstName"/>
				</div>
			</div>
		
			<div class="col-sm-3">	
				<div class="form-group">
					<label for="lastName">Last Name</label>
			 		<sf:input class="form-control" id="lastName" name="lastName" path="lastName" type="text"/>
			 		<sf:errors path="lastName"/>
				</div>
			</div>
		</div>
	
		<div class = "row">
			<div class="col-sm-6 col-centered">	
				<div class="form-group">
					<label for="email">Email</label>
			 		<sf:input class="form-control" id="email" name="email" path="email" type="text"/>
			 		<sf:errors path="email"/>
				</div>
			</div>
		</div>

		<div class = "row">
			<div class="col-sm-3 col-sm-offset-3">
		  		<div class="form-group">
		  			<label class="control-label" for="fed">Federal or Contractor</label>
					<sf:select class="form-control" path="federal" id="selectThis">
						<sf:option value="true" path="federal">Federal</sf:option>
						<sf:option value="false" path="federal">Contractor</sf:option>
					</sf:select>
				</div>
			</div>
	
			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label" for="mySelect">Division</label>
						<sf:select class="form-control" name="mySelect" id="mySelect" path="division">
						<c:forEach items="${divisions}" var="division">
							<sf:option value="${division}" path="division">${division}</sf:option>
						</c:forEach>
						</sf:select>
				</div>
			</div>
		</div>
		
		<div class = "row">
			<div class="col-sm-6 col-centered">	
				<div class="form-group">
					<label class="control-label" for="course">Select preferred course date:</label>
						<sf:select class="form-control" name="course" path="preferredCourseID">
							<sf:option selected="selected" value="-1" path="preferredCourseID">No Preferred Date</sf:option>
						<c:forEach items="${coursesList}" var="course">
							<sf:option value="${course.courseID}" path="preferredCourseID"><c:out value="${course.courseDate}"/></sf:option>
						</c:forEach>
						</sf:select>
				</div>
			</div>
		</div>
		
		<div class = "row">
			<div class = "col-sm-2 col-centered">
				<button type="submit" class="btn btn-success btn-block" name="submit" value="create">Register</button>
			</div>
		</div>
			
	</div>
	</sf:form>
</body>
</html>