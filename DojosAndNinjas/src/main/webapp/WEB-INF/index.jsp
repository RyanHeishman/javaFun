<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dojos & Ninjas | Home</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	<h1>New Dojo</h1>
		<form:form action="/dojo/new" method="POST" modelAttribute="dojo">
			<form:label path="name">Name: </form:label>
			<form:input type="text" path="name"/>
			<input type="submit" value="Submit"/>
		</form:form>
	<a class="text-light" href="/ninja">Add New Ninja</a>
	</div>
</body>
</html>