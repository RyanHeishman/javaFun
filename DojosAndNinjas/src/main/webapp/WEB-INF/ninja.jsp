<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dojos & Ninjas | New Ninja</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="col w-50 p-3 mt-5 border-info border border-5 card bg-secondary text-light mx-auto">
	<h1>New Ninja</h1>
		<form:form action="/ninja/new" method="POST" modelAttribute="ninja">
			<div class="m-2">
				<form:label path="firstName">First Name: </form:label>
				<form:input type="text" path="firstName"/>
			</div>
			
			<div class="m-2">
				<form:label path="lastName">Last Name: </form:label>
				<form:input type="text" path="lastName"/>
			</div>

			<div class="m-2">
				<form:label path="age">Age: </form:label>
				<form:input type="int" path="age"/>
			</div>
			
			<div class="m-2">
				<form:label path="dojo">Dojo: </form:label>
				<form:select path="dojo">
						<c:forEach var="dojo" items="${dojo }">
							<option value="${dojo.id }">${dojo.name }</option>
						</c:forEach>
				</form:select>
			</div>
			
			
			<input class="btn bg-light m-2" type="submit" value="Create Ninja"/>
		</form:form>
		<a class="text-light" href="/">Home</a>
	</div>

</body>
</html>