<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Roster | Home</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	<h1>Dorms</h1>
		<table class="text-light table">
			  <thead>
			    <tr>
			      <th scope="col">Name</th>
			      <th scope="col">Actions</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="dorm" items="${dorm }">
				    <tr>
				      <td>${dorm.name }</td>
				      <td><a href="/dorm/${dorm.id }">See Students</a></td>
				    </tr>
				</c:forEach> 
			  </tbody>
			</table>
			<a class="text-light" href="/">Home</a>
			<a href="/dorm">Add New Dorm</a>
			<a href="/student">Add New Student</a>
	</div>

</body>
</html>