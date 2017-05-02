<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete a user</title>
</head>
<body>
	<form method=POST>
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<h4>Confirm deletion of: ${user.lastName}, ${user.firstName} (${user.email})</h4>
		<button type="submit" name="submit" value="delete">Delete</button>
		<button type="submit" name="submit" value="cancel">Cancel</button>
	</form>
</body>
</html>