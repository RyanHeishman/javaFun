<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Manager</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="text-center" style="">
	<h1 class="text-info">Project Manager</h1>
	<p>A place for teams to manage projects</p>
	
	<div class="d-flex w-75 mx-auto">
		<div class="card w-50 border border-radius-rounded border-0 shadow-sm mx-auto me-3">
		
		<div style="width: 100%; height: 70px; border-bottom: solid 2px rgba(0, 0, 0, 0.023); background-color: rgb(241, 241, 241);">
			<h2 class="mt-3">Register</h2>
		</div>
			
			<form:form action="/register" modelAttribute="newUser" method="POST">
				
				<div class="mb-3 mt-3">
					<form:label path="firstName">First Name:</form:label>	
					<form:errors path="firstName"/>
					<form:input type="text" path="firstName"/>
				</div>
				<div class="mb-3">
					<form:label path="lastName">Last Name:</form:label>	
					<form:errors path="lastName"/>	
					<form:input type="text" path="lastName"/>
				</div>
				<div class="mb-3">
					<form:label path="email">Email:</form:label>
					<form:errors path="email"/>		
					<form:input type="text" path="email"/>
				</div>
				<div class="mb-3">
					<form:label path="password">Password:</form:label>
					<form:errors path="password"/>		
					<form:input type="password" path="password"/>
				</div>
				<div class="mb-3">
					<form:label path="confirm">Confirm Password:</form:label>
					<form:errors path="confirm"/>		
					<form:input type="password" path="confirm"/>
				</div>
				<input class="btn bg-info text-light mb-3" type="submit" value="Submit" />
			</form:form>
		</div>
		<div class="card w-50 border border-radius-rounded border-0 shadow-sm mx-auto me-3">
			
			<div style="width: 100%; height: 70px; border-bottom: solid 2px rgba(0, 0, 0, 0.023); background-color: rgb(241, 241, 241);">
				<h2 class="mt-3">Login</h2>
			</div>

			<form:form action="/login" modelAttribute="newLogin" method="POST">
				
				<div class="mb-3 mt-3">
					<form:label path="email">Email:</form:label>
					<form:errors path="email"/>		
					<form:input type="text" path="email"/>
				</div>
				<div class="mb-3">
					<form:label path="password">Password:</form:label>
					<form:errors path="password"/>		
					<form:input type="password" path="password"/>
				</div>
				<input class="btn bg-info text-light mb-3" type="submit" value="Submit" />
			</form:form>
		
		</div>
	
	</div>
	
</body>
</html>