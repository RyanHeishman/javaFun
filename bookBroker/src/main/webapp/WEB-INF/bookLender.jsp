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
	<h3>Hello, ${user.userName }. Welcome to...</h3>
	<h1 style="color: rgb(36, 209, 96)">The Book Broker!</h1>
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
		Available Books to borrow
	</div>
	<div>
		<table style="border: solid 1px;">
			<tr style="border: solid 1px;">
				<th style="border: solid 1px;">Title</th>
				<th style="border: solid 1px;">Author</th>
				<th style="border: solid 1px;">Posted By</th>
				<th style="border: solid 1px;">Actions</th>
			</tr>
			<tbody style="border: solid 1px;">
				<c:forEach var="books" items="${books }">
					<tr style="border: solid 1px;">
						<td style="border: solid 1px;"><a href="/book/${books.id }">${books.title }</a></td>			
						<td style="border: solid 1px;">${books.author }</td>
						<td style="border: solid 1px;">${books.user.userName }</td>
						<c:if test="${user!=books.user}">
							<td style="border: solid 1px;"><a href="/books/${books.id }/borrow">Borrow</a></td>	
						</c:if>
						<c:if test="${user==books.user}">
							<td style="border: solid 1px;"><a href="books/${books.id}/edit">edit</a></td>
							<td style="border: solid 1px;"><a href="/books/${books.id }/delete">delete</a></td>	
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	Books I'm borrowing...
	<table style="border: solid 1px;" class="table">
		
			<tr style="border: solid 1px;">
				<th style="border: solid 1px;">ID</th>
				<th style="border: solid 1px;">Title</th>
				<th style="border: solid 1px;">Author</th>
				<th style="border: solid 1px;">Owner</th>
				<th style="border: solid 1px;">Actions</th>
			</tr>
			<c:forEach var="books" items="${books}">
			
				<c:if test="${user.id==books.borrower.id}">
					<tr style="border: solid 1px;">
						<td style="border: solid 1px;"><c:out value="${books.id}"/></td>
						<td style="border: solid 1px;"><a href="book/${books.id}"><c:out value="${books.title}"/></a></td>
						<td style="border: solid 1px;"><c:out value="${books.author}"/></td>
						<td style="border: solid 1px;"><c:out value="${books.user.userName}"/></td>
						<c:if test="${user!=books.user}">
							<td style="border: solid 1px;"><a href="books/${books.id}/return">return</a></td>
						</c:if>
					</tr>
				</c:if>
				
			</c:forEach>
		
		</table>

</body>
</html>