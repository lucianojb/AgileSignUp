<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


	<form method="POST">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-3">
					<div class="form-group">
						<label for="firstName">First Name</label> <input
							class="form-control" id="firstName" name="firstName" type="text"
							value="${user.firstName} " />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="lastName">Last Name</label> <input
							class="form-control" id="lastName" name="lastName" type="text"
							value="${user.lastName}" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-centered">
					<div class="form-group">
						<label for="email">Email</label> <input class="form-control"
							id="email" name="email" type="text" value="${user.email}" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-3 col-sm-offset-3">
					<div class="form-group">
						<label for="fed">Federal or Contractor</label> <select
							class="form-control" name="fed" id="fed" value="${user.federal}">
							<c:choose>
								<c:when test="${user.federal}">
									<option value="federal" selected="selected" > Federal</option>
									<option value="contractor"> Contractor</option>
									</c:when>
									<c:otherwise>>
									<option value="federal"  > Federal</option>
									<option value="contractor" selected="selected"> Contractor</option>
									</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="mySelect">Division</label> <select
							class="form-control" name="mySelect" id="mySelect">
							<c:forEach items="${divisions}" var="division">
								<c:choose>
									<c:when test="${division eq user.division}">
										<option selected="selected" value="${division}">${division}</option>
									</c:when>
									<c:otherwise>
										<option value="${division}">${division}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3 col-sm-offset-3">
									<button type="submit" class="btn btn-block" name="submit"
						value="cancel">Cancel</button>
				</div>

				<div class="col-sm-3">
					<button type="submit" class="btn btn-success btn-block"
						name="submit" value="save">Save</button>
				</div>
			</div>

		</div>
	</form>
</body>
</html>