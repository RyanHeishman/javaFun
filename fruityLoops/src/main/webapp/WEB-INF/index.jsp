<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date" import="java.text.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fruity Loops</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 class="text-center mt-5" style="color:pink;">Fruit Store</h1>
	<div style="background:pink;" class="card border-light mx-auto w-50 mt-2 p-3">
		<table style="border:5px solid pink;" class="table table-light mt-3">
		  <thead>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Price</th>
		    </tr>
		  </thead>
		  <tbody style="border:5px solid pink;">
			<c:forEach var="fruits" items="${fruits}">
			    <tr style="border:5px solid pink;">
			      <td><c:out value="${fruits.name}"/></td>
			      <td><c:out value="${fruits.price}"/></td>
			    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
	</div>
</body>
</html>