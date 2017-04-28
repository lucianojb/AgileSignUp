<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courses</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
    <body>
    
    	<div style="background:black !important" class="jumbotron text-center">
		<font color="white">
  		  	<a href="./" style= "color:white; text-decoration:none"><h1>AFS Agile Signup</h1></a>
  			<p>Course List</p> 
  	 		</font>
  	 	</div>
  	 	<center>
        <h1 id="banner">Login to Agile Sign-up</h1> 
        
        <c:url var="loginUrl" value="/login"/>
         
        <form action="${loginUrl}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<p><label for="username">User:</label></p>
			<input type="text" id="username" name="username"/> 
			
			<p><label for="password">Password:</label></p>
			<input type="password" id="password" name="password"> 

			<div> <br>
			<button type="submit" class="btn btn-success btn-center">Submit</a>
			</div>
</form>
</center>
    </body>
</html>