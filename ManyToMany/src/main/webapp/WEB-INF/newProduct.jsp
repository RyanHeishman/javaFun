<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categories & Products | New Product</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	<h1>New Product</h1>
		<a class="text-light" href="/">Home</a>
		<hr />
		
		<form:form action="/products/new" method="POST" modelAttribute="product">
			
			<form:label path="name">Name: </form:label>
			<form:input type="text" path="name"/>
			
			<form:label path="description">Description: </form:label>
			<form:input type="text" path="description"/>
			
			<form:label path="price">Price: </form:label>
			<form:input type="float" path="price"/>
			
			<input type="submit" value="Submit"/>
		
		</form:form>
	
	
	</div>
</body>
</html>