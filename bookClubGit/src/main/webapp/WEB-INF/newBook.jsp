<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Club | New Book</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style="background-color:rgb(212, 212, 212);">
	<h1 style="color: rgb(36, 209, 96)">Add A Book To Your Shelf</h1>
	<div>
		<form:form action="/books/new" modelAttribute="book" method="POST">
			<form:label path="title">Title:</form:label>
			<form:errors path="title"/>
			<form:input type="text" path="title"/>
			<form:label path="author">Author:</form:label>
			<form:errors path="author"/>
			<form:input type="text" path="author"/>
			<form:label path="description">My Thoughts:</form:label>
			<form:errors path="description"/>
			<form:input type="text" path="description"/>
			<div class="form-row">
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			<input type="submit" value="Add Book"/>
		</form:form>
	</div>
	
</body>
</html>