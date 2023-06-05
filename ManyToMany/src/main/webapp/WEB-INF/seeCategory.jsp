<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categories & Products | ${category.name }</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	
	<h1>${category.name }</h1>
		<a class="text-light" href="/">Home</a>
		<hr />
		<h3>Products:</h3>
		<c:forEach var="assignedProducts" items="${assignedProducts }">
		<p>${assignedProducts.name }</p>
		</c:forEach>
		
		<hr />
	
		<h4>Add a Product:</h4>
	
		<div class="m-2">
		<form action="/categories/${category.id }" method="POST">
			<select name="productId" id="productId">
				
				<c:forEach var="unassignedProducts" items="${unassignedProducts }">
					<option value="${unassignedProducts.id }">${unassignedProducts.name }</option>
				</c:forEach>
			
			</select>
			<input type="submit" value="add" />
		</form>
	</div>

	
	
	</div>
</body>
</html>