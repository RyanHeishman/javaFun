<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lookify | Search</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style=");">
	<h1 style="color: rgb(36, 209, 96)">Songs by ${searchTerm}</h1>
	<div style="background:rgb(67, 67, 67);" class="card border-light mx-auto w-50 mt-2 p-3">
		<table style="border:5px solid white; border:5px solid rgb(37, 37, 37);" class="table table-light mt-3">
		  <thead>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Delete</th>
		    </tr>
		  </thead>
		  <tbody style="border:5px solid rgb(37, 37, 37);">
				<c:forEach var="songs" items="${songs }">
					<tr style="border:5px solid rgb(37, 37, 37);">

				      <td>${songs.name}</td>
				      <td>${songs.rating }</td>
				      <td><a href="">Delete</a></td>
			    	</tr>
					
				</c:forEach>
		  </tbody>
		</table>
		<a class="text-light" href="/dashboard">Home</a>
	</div>
	
</body>
</html>