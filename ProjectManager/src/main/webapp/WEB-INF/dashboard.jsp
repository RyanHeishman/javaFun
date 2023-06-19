<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h1 class="text-info">Welcome ${user.firstName }</h1>
	<hr />
	<a href="/logout">Logout</a>
	
	<div class="mb-3">
		<a href="/projects/new">New Project</a>
	</div>

	<h3 class="text-info">All Projects...</h3>
	<div class="d-flex w-75 mx-auto mb-3">
		<table class="text-dark table">
			<thead>
			    <tr>
			      <th scope="col">Project</th>
			      <th scope="col">Team Lead</th>
			      <th scope="col">DueDate</th>
			      <th scope="col">Actions</th>
			    </tr>
			</thead>
			  <tbody>
			    <c:forEach var="unassignedProjects" items="${unassignedProjects }">
				    <tr>
				      <td><a href="/projects/${unassignedProjects.id }">${unassignedProjects.title }</a></td>
				      <td>${unassignedProjects.lead.firstName}</td>
				      <td><fmt:formatDate value="${unassignedProjects.dueDate}" pattern="MMMM dd"/></td>
				      <c:if test="${user!=unassignedProjects.lead}">
							<td><a href="/projects/${unassignedProjects.id }/jointeam">Join Team</a></td>	
						</c:if>
						<c:if test="${user==unassignedProjects.lead}">
							<td><a href="/projects/${unassignedProjects.id }/edit">edit</a></td>
						</c:if>
				    </tr>
				</c:forEach> 
			  </tbody>
		</table>
	</div>
	
	<h3 class="text-info">Your Projects...</h3>
	<div class="d-flex w-75 mx-auto">
	<table class="table">
		
			<tr>
				<th  scope="col">Project</th>
				<th  scope="col">Team Lead</th>
				<th  scope="col">DueDate</th>
				<th  scope="col">Actions</th>
			</tr>
			<c:forEach var="assignedProjects" items="${assignedProjects}">
						<tr>
							<td><a href="/projects/${assignedProjects.id }"><c:out value="${assignedProjects.title}"/></a></td>
							<td><c:out value="${assignedProjects.lead.firstName}"/></td>
							<td><fmt:formatDate value="${assignedProjects.dueDate}" pattern="MMMM dd"/></td>
							<c:if test="${user!=assignedProjects.lead}">
								<td><a href="/projects/${assignedProjects.id }/return">Leave Team</a></td>
							</c:if>
							<c:if test="${user==assignedProjects.lead}">
								<td><a href="/projects/${assignedProjects.id }/edit">Edit</a></td>
							</c:if>
						</tr>
			</c:forEach>
		
		</table>
	
	</div>
		
</body>
</html>