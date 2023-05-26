<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SafeTravels</title>
<link rel="stylesheet" type="text/css" href="/css/show.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="body">
	<div class="container">
		<div style="background:rgba(255, 255, 255, 0.548); border:5px solid white; margin-top: 20px " class="card mx-auto w-50 p-3" >
			<h1 style="color:rgb(204, 255, 0); text-shadow: 2px 2px 5px rgb(77, 77, 77);" class="text-warning">Expense Details</h1>
			<div style="border:5px solid white; background-color:rgba(255, 255, 255, 0.744);" class="text-dark mx-auto row w-100 p-4">
			
				<p>Expense: ${travel.expense }</p>
				<p>Description: ${travel.description }</p>
				<p>Vendor: ${travel.vendor }</p>
				<p>Amount: ${travel.amount }</p>
				<a href="/">Home</a>	
			</div>
		</div>	
	
	</div>
</body>
</html>