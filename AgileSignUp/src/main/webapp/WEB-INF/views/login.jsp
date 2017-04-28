<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 
<html>
    <body>
        <h1 id="banner">Login to Security Demo</h1> 
        
        <c:url var="loginUrl" value="/login"/>
         
        <form action="${loginUrl}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<p><label for="username">User:</label></p>
			<input type="text" id="username" name="username"/> 

			<p><label for="password">Password:</label></p>
			<input type="password" id="password" name="password"> 

			<div>
				<input name="submit" type="submit"/>
			</div>
</form>
    </body>
</html>