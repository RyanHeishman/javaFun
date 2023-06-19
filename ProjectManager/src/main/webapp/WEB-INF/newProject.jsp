<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Manager | New Project</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="text-center" style="">
	<h1 class="text-info">Create Project</h1>
	
	<div class="mx-auto">
		<div class="card w-50 shadow-lg mx-auto p-3">
			<form:form action="/projects/new" modelAttribute="project" method="POST">
				
				<div class="mb-3 mt-3">
					<form:label path="title">Title:</form:label>
					<form:errors path="title"/>		
					<form:input type="text" path="title"/>
				</div>
				<div class="mb-3">
					<form:label path="description">Description:</form:label>
					<form:errors path="description"/>		
					<form:input type="text" path="description"/>
				</div>
				<div class="mb-3">
					<form:label path="dueDate">Due Date:</form:label>
					<form:errors path="dueDate"/>		
					<form:input type="date" path="dueDate"/>
				</div>
				<div>
					<form:errors path="lead" class="error"/>
					<form:input type="hidden" path="lead" value="${userId}" class="form-control"/>
				</div>
				<input class="btn bg-info text-light mb-3" type="submit" value="Submit" />
			</form:form>
		</div>
	</div>
	
</body>
</html>