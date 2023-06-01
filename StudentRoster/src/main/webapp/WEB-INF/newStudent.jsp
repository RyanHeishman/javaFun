<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Roster | New Student</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	<h1>New Student</h1>
		
		<form:form action="/student/new" method="POST" modelAttribute="student">
			
			<div class="m-2">
				<form:label path="name">Name: </form:label>
				<form:input type="text" path="name"/>
			</div>
			
			<div class="m-2">
				<form:label path="dorm">Dorm: </form:label>
				<form:select path="dorm">
						<c:forEach var="dorm" items="${dorm }">
							<option value="${dorm.id }">${dorm.name }</option>
						</c:forEach>
				</form:select>
			</div>
			
			
			<input class="btn bg-light m-2" type="submit" value="Add Student"/>
		</form:form>
		<a class="text-light" href="/">Dashboard</a>
	</div>

</body>
</html>