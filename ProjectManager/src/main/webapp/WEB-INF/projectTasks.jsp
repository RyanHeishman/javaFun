<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Manager | ${project.title } Tasks</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="mx-auto text-center">
	<h1 class="text-info">Project: ${project.title }</h1>
	<h6 class="text-info">Project Lead: ${project.lead.firstName }</h6>
	<div>
	<hr />
	<a href="/logout">Logout</a>
	
	<div class="mb-3">
		<a href="/dashboard">Dashboard</a>
	</div>
	
		<form:form action="/projects/new/tasks" modelAttribute="task" method="POST">
			
			<div class="mb-3 mx-auto mt-3">
				<form:label path="description">Add a task ticket for this team:</form:label>
				<form:errors path="description"/>
				<form:textarea class="mx-auto form-control w-25" path="description" rows="3"></form:textarea>
			</div>
		
			<div class="form-row">
				<form:errors path="project" class="error"/>
				<form:input type="hidden" path="project" value="${project.id}" class="form-control"/>
			</div>
			
			<input class="btn bg-info text-light mb-3" type="submit" value="Add Task"/>
		
		</form:form>
		
		<div class="card w-25 border-none mt-3 mx-auto shadow-sm p-3">
			 
			 <c:forEach var="tasks" items="${tasks }">
			 	<c:if test="${project==tasks.project}">
			 		<h6>Added by ${tasks.project.lead.firstName } at <fmt:formatDate value="${tasks.createdAt}" pattern="HH:MMa MMMM dd"/>:</h6>
			 		<p>${tasks.description }</p>
			 		<hr />
			 	</c:if>
			 </c:forEach>
			 
		</div>
	</div>
	
</body>
</html>