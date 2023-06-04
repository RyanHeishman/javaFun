<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Club  | Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark text-center" style="background-color:rgb(212, 212, 212);">
	<h1 style="color: rgb(36, 209, 96)">Welcome, ${user.userName }</h1>
	<div>
		Books from everyone's shelves.
		<div>
			<a href="/logout">Logout</a>
		</div>
		<div>
			<a href="/book">+ Add a book to my shelf</a>
		</div>
	</div>
	<div>
		<table style="border: solid 1px;">
			<tr style="border: solid 1px;">
				<th style="border: solid 1px;">Title</th>
				<th style="border: solid 1px;">Author</th>
				<th style="border: solid 1px;">Posted By</th>
			</tr>
			<tbody style="border: solid 1px;">
				<c:forEach var="books" items="${books }">
					<tr style="border: solid 1px;">
						<td style="border: solid 1px;"><a href="/book/${books.id }">${books.title }</a></td>			
						<td style="border: solid 1px;">${books.author }</td>
						<td style="border: solid 1px;">${books.user.userName }</td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>