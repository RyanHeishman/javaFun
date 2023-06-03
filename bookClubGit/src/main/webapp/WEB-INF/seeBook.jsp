<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Club  | Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style="background-color:rgb(212, 212, 212);">
	<h1 style="color: rgb(36, 209, 96)">${book.title }</h1>
	<h3>${book.user.userName } read ${book.title } by ${book.author }</h3> 
	<p>Here are ${book.user.userName }'s thoughts</p>
	<hr />
	<p>${book.description }</p>
	<hr />
	<a href="/welcome">Home</a>
	<c:if test="${user.id} == ${book.user.id }">
	<a href="/book/${book.id }/edit">Update Book</a>
	
	</c:if>
</body>
</html>