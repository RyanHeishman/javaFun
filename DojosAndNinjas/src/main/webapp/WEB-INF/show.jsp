<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dojos & Ninjas | ${dojo.name }</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	<h1><c:out value="${dojo.name }"></c:out></h1>
		<table class="text-light table">
			  <thead>
			    <tr>
			      <th scope="col">First Name</th>
			      <th scope="col">Last Name</th>
			      <th scope="col">Age</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="ninja" items="${dojo.ninjas }">
				    <tr>
				      <td>${ninja.firstName }</td>
				      <td>${ninja.lastName }</td>
				      <td>${ninja.age }</td>
				    </tr>
				</c:forEach> 
			  </tbody>
			</table>
			<a class="text-light" href="/">Home</a>
	</div>

</body>
</html>