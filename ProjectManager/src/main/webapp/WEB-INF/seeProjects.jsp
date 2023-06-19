<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Manager | ${project.title }</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="mx-auto text-center">
	
	<h1 class="text-info">Project Details</h1>
	<hr />
	<a href="/logout">Logout</a>
	
	<div class="mb-3">
		<a href="/dashboard">Dashboard</a>
	</div>

	<div class="text-center mx-auto mb-3">
		
		<div>
			<h5 class="text-info">Project: </h5>
			<p>${project.title }</p>
		</div>
		
		<div>
			<h5 class="text-info">Description: </h5>
			<p>${project.description }</p>
		</div>
		
		<div>
			<h5 class="text-info">DueDate: </h5>
			<p><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></p>
		</div>
		
		<div>
			<a href="/projects/${project.id }/tasks">See Tasks</a>
		</div>
		<div>
			<c:if test="${user==project.lead}">
				<a href="/projects/${project.id }/delete"><input type="submit" value="Delete" class="btn bg-danger text-light"/></a>
			</c:if>
		</div>
		
		
	
	</div>
</body>
</html>