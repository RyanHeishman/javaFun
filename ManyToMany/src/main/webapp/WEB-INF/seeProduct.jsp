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
	
	<h1>${product.name }</h1>
		<a class="text-light" href="/">Home</a>
		<hr />
		<h3>Categories:</h3>
		<c:forEach var="assignedCategories" items="${assignedCategories }">
		<p>${assignedCategories.name }</p>
		</c:forEach>
		
		<hr />
	
		<h4>Add a Category:</h4>
	
		<div class="m-2">
		<form action="/products/${product.id }" method="POST">
			<select name="categoryId" id="categoryId">
				
				<c:forEach var="unassignedCategories" items="${unassignedCategories }">
					<option value="${unassignedCategories.id }">${unassignedCategories.name }</option>
				</c:forEach>
			
			</select>
			<input type="submit" value="add" />
		</form>
	</div>

	
	
	</div>
</body>
</html>