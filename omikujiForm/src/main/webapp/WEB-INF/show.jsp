<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date" import="java.text.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form Test</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="background-color:rgb(49, 49, 49); height:800px" class="bg-gradient">
	<div style="background-color:rgb(140, 140, 140)" class="card text-light bg-gradient mx-auto w-50 mt-5 ps-5 pe-5 mb-5">
		<h3 class="text-center mt-3 mb-3">Here's your Omikuji</h3>
		<p>In <c:out value="${select }"/> years you will live in <c:out value="${city }"/> with <c:out value="${person }"/> as your roommate.
		You will be selling <c:out value="${hobby }"/> for a living. 
		The next time you see a <c:out value="${living }"/>, you will have good luck. Also, <c:out value="${nice }"/>.
		</p>
		<a class="text-center mb-3" href="/">Go Back</a>
	</div>
</body>
</html>