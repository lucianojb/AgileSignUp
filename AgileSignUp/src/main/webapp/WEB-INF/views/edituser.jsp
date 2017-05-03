<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body>
<jsp:include page="adminheader.jsp" />


	<sf:form method="POST" commandName="user">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-3">
					<div class="form-group">
						<label for="firstName">First Name</label> <sf:input
							class="form-control" id="firstName" name="firstName" path="firstName" type="text"
							value="${user.firstName}" />
							<sf:errors path="firstName"/>	
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="lastName">Last Name</label> <sf:input
							class="form-control" id="lastName" name="lastName" path="lastName" type="text"
							value="${user.lastName}" />
							<sf:errors path="lastName"/>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-centered">
					<div class="form-group">
						<label for="email">Email</label> <sf:input class="form-control"
							id="email" name="email" type="text" path="email" value="${user.email}" />
							<sf:errors path="email"/>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-3 col-sm-offset-3">
					<div class="form-group">
						<label for="fed">Federal or Contractor</label> <sf:select
							class="form-control" name="fed" id="fed" path="federal" value="${user.federal}">
							<c:choose>
								<c:when test="${user.federal}">
									<sf:option value="true" path="federal" selected="selected" > Federal</sf:option>
									<sf:option value="false" path="federal"> Contractor</sf:option>
									</c:when>
									<c:otherwise>>
									<sf:option value="true"  path="federal"> Federal</sf:option>
									<sf:option value="false" path="federal" selected="selected"> Contractor</sf:option>
									</c:otherwise>
							</c:choose>
						</sf:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="mySelect">Division</label> 
						<sf:select class="form-control" name="mySelect" id="mySelect" path="division">
							<c:forEach items="${divisions}" var="division">
								<c:choose>
									<c:when test="${division eq user.division}">
										<sf:option path="division" selected="selected" value="${division}">${division}</sf:option>
									</c:when>
									<c:otherwise>
										<sf:option path="division" value="${division}">${division}</sf:option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</sf:select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2 col-sm-offset-4">
					<button type="submit" class="btn btn-success btn-block"
						name="submit" value="save">Save</button>
				</div>

				<div class="col-sm-2">
					<button type="submit" class="btn btn-block" name="submit"
						value="cancel">Cancel</button>
				</div>
			</div>

		</div>
	</sf:form>
</body>
</html>