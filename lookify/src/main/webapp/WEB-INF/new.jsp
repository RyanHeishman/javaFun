<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lookify | New Song</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark">
	<h1 style="color: rgb(36, 209, 96)" class="text-center">Add a Song</h1>
	
	<div style="background:rgb(67, 67, 67); " class="card border-light mx-auto w-50 mt-2 p-3">
		<form:form style="border:5px solid white; background-color:rgb(37, 37, 37);" action="/songs" class="text-light mx-auto row w-75 p-4" modelAttribute="lookify" method="POST">
			
			<form:label class="mb-3" path="name">Name:</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input class="mb-3" type="text" path="name" />
			
			<form:label class="mb-3" path="artist">Artist:</form:label>
			<form:errors path="artist" class="text-danger"/>
			<form:input class="mb-3" type="text" path="artist" />
			
			<form:label path="rating" class="mb-3">Rating:</form:label>
			<form:errors path="rating" class="text-danger"/>
			<form:input type="number" class="mb-3" path="rating" />
			
			<input style="background-color: rgb(36, 209, 96)" class="text-light btn mx-auto mb-3 w-25" type="submit" value="Update"/>
			
		</form:form>
		<a class="text-light mt-2 text-center" href="/dashboard">Home</a>
	</div>
	
	
</body>
</html>