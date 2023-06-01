<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Roster | ${dorm.name }</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	
		<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
			
			<h1><c:out value="${dorm.name }"></c:out></h1>
				<table class="text-light table">
					  <thead>
					    <tr>
					      <th scope="col">Name</th>
					      <th scope="col">Actions</th>
					    </tr>
					  </thead>
					  <tbody>
					    <c:forEach var="student" items="${dorm.students }">
						    <tr>
						      <td>${student.name }</td>
						      <td><a href="/delete/${student.id }">Remove</a></td>
						    </tr>
						</c:forEach> 
					  </tbody>
					</table>
					<a class="text-light" href="/">Dashboard</a>
		</div>

</body>
</html>