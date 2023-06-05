<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categories & Products | Home</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	
	<h1>Home</h1>
	<div>
		<a href="/categories/new">Add a Category</a>
	</div>
	<div>
		<a href="/products/new">Add a Product</a>
	</div>
	
	
	<hr />
	
		<table class="text-light table">
			  <thead>
			    <tr>
			      <th scope="col">Products</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="products" items="${products }">
				    <tr>
				      <td><a href="/products/${products.id }">${products.name} </a></td>
				    </tr>
				</c:forEach> 
			  </tbody>
		</table>
	
		<table class="text-light table">
			  <thead>
			    <tr>
			      <th scope="col">Categories</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="categories" items="${categories }">
				    <tr>
				      <td><a href="/categories/${categories.id }">${categories.name }</a></td>
				    </tr>
				</c:forEach> 
			  </tbody>
		
		</table>
	</div>

</body>
</html>