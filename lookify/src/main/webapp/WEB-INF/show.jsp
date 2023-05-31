<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Burgers</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style=");">
	
	<h1 class="text-center" style="color: rgb(36, 209, 96)">Song Details</h1>
	<div style="background: rgb(67, 67, 67);" class="card border-light mx-auto w-50 mt-2 p-3 text-light">
		<p>Title: ${lookify.name }</p>
		<p>Artist: ${lookify.artist }</p>
		<p>Rating: ${lookify.rating }</p>
		<a class="text-light" href="/dashboard">Home</a>
	</div>
	
</body>
</html>