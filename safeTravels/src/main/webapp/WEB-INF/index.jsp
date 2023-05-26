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
<link rel="stylesheet" type="text/css" href="/css/index.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="body">
	<div class="container">
		<div class="left" style="margin-top: 20px;">
			<div style="background:rgba(255, 255, 255, 0.548); border:5px solid white; " class="card  mx-auto w-100 p-3" >
			<h1 style="color:rgb(204, 255, 0); text-shadow: 2px 2px 5px rgb(77, 77, 77);" class="text-warning">Safe Travels</h1>
				<table style="border:5px solid white; background-color:rgba(255, 255, 255, 0.744);" class="table mx-auto w-100">
				  <thead>
				    <tr>
				      <th scope="col">Expense</th>
				      <th scope="col">Vendor</th>
				      <th scope="col">Amount</th>
				      <th scope="col">Actions</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="travels" items="${travels }">
				    <tr>
				      <td><a href="/show/${travels.id }">${travels.expense }</a></td>
				      <td>${travels.vendor }</td>
				      <td>${travels.amount }</td>
				      <td><a href="/travel/${travels.id }/edit">Edit</a>  | 
				      <a href="/delete/${travels.id }"> Delete</a></td>
				    </tr>
				   </c:forEach>
				  </tbody>
				</table>
			</div>	
		</div>
		<div class="right" style="margin-top: 20px;">
	
			<div style="background:rgba(255, 255, 255, 0.548); border:5px solid white; " class="card mx-auto w-100 p-3">
			<h1 class="text-warning" style="color:rgb(204, 255, 0); text-shadow: 2px 2px 5px rgb(77, 77, 77);">Add an Expense:</h1>
				<form:form style="border:5px solid white; background-color:rgba(255, 255, 255, 0.744);" action="/travels" class="text-dark mx-auto row w-100 p-4" method="POST" modelAttribute="travel">
					
					<form:label class="mb-3" path="expense">Expense:</form:label>
					<form:errors path="expense" class="text-danger"/>
					<form:input class="mb-3" type="text" path="expense" />
					
					<form:label path="vendor" class="mb-3">Vendor:</form:label>
					<form:errors path="vendor" class="text-danger"/>
					<form:input type="text" class="mb-3" path="vendor"/>
					
					<form:label path="amount" class="mb-3">Amount:</form:label>
					<form:errors path="amount" class="text-danger"/>
					<form:input type="text" class="mb-3" path="amount" />
					
					<form:label path="description" class="mb-3">Description:</form:label>
					<form:errors path="description" class="text-danger"/>
					<form:input type="text" class="mb-3" path="description" />
					
					<input class="text-light btn mx-auto mb-3 w-25 bg-warning" type="submit" value="Submit"/>
					
				</form:form>
			</div>	
		</div>
	</div>
	

</body>
</html>