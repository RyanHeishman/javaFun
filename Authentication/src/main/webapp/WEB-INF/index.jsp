<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Authentication</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style="background-color:rgb(212, 212, 212);">
	<h1 style="color: rgb(36, 209, 96)">Welcome</h1>
	<div>
		<form:form action="/register" modelAttribute="newUser" method="POST">
			<h2>Register</h2>
			<form:label path="userName">User Name:</form:label>
			<form:errors path="userName"/>
			<form:input type="text" path="userName"/>
			<form:label path="email">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="text" path="email"/>
			<form:label path="password">Password:</form:label>
			<form:errors path="password"/>
			<form:input type="text" path="password"/>
			<form:label path="confirm">Confirm PW:</form:label>
			<form:errors path="confirm"/>
			<form:input type="text" path="confirm"/>
			<input type="submit" value="register"/>
		</form:form>
	</div>
	
	<div>
		<form:form action="/login" modelAttribute="newLogin" method="POST">
			<h2>Login</h2>
			<form:label path="email">Email:</form:label>
			<form:errors path="email"/>
			<form:input type="text" path="email"/>
			<form:label path="password">Password:</form:label>
			<form:errors path="password"/>
			<form:input type="text" path="password"/>
			<input type="submit" value="login"/>
		</form:form>
	</div>
	
</body>
</html>