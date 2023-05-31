<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lookify | Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style=";">
	
	<div style="width: 100%; height: 50px;">
		<div style="display: flex; justify-content: space-evenly; align-items: center;">
			<div style="display:flex; gap: 20px; align-items:center;">
				<h1><a style="color: rgb(36, 209, 96)" href="/songs/new">Add New</a></h1>
				<h1><a style="color: rgb(36, 209, 96)" href="/topten">Top Ten</a></h1>
			
			</div>
			<div>
				<form action="/dashboard" method="post">
					<input id="artist" name="artist" placeholder="search" />
					<input style="background-color: rgb(36, 209, 96)" class="btn text-light" type="submit" value="Search" />
				</form>
			</div>
		</div>
	</div>
	
	<div style="background:rgb(67, 67, 67);;" class="card border-light mx-auto w-50 mt-2 p-3">
		<table style="border:5px solid white; border:5px solid rgb(37, 37, 37);;" class="table table-light mt-3">
		  <thead>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Arist</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Delete</th>
		    </tr>
		  </thead>
		  <tbody style="border:5px solid rgb(37, 37, 37);;">
				<c:forEach var="lookifys" items="${lookifys }">
					<tr style="border:5px solid rgb(37, 37, 37);">
				      <td><a href="/songs/${lookifys.id }">${lookifys.name }</a></td>
				      <td>${lookifys.artist }</td>
				      <td>${lookifys.rating }</td>
				      <td><a href="/delete/${lookifys.id }">Delete</a></td>
			    	</tr>
					
				</c:forEach>
		  </tbody>
		</table>
	</div>
	
</body>
</html>