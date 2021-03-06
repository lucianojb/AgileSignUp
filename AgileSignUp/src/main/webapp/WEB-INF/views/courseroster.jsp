<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
</head>
<body>	
		<div class="container">
		<div class="row">
			<div class = "col-sm-8 col-centered">

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
</body>
</html>