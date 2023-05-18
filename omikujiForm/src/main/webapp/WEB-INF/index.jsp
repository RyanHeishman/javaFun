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
<body class="bg-gradient" style="background-color:rgb(49, 49, 49);">
	<div style="background-color:rgb(140, 140, 140)" class="card bg-gradient text-light mx-auto w-25 mt-5 ps-5 pe-5 mb-5">
		<h3 class="text-center mt-3 mb-3">Send an Omikuji</h3>
		
		<form class="row" action="/form" method="POST">
			
			<label for="select">Pick any number from 5 to 25:</label>
			<input class="num-input w-25 mb-3 mx-auto" type="number" name="select"/>
			<label for="city">Enter the name of any city:</label>
			<input class="mb-3" type="text" name="city" />
			<label for="person">Enter the name of a person:</label>
			<input class="mb-3" type="text" name="person" />
			<label for="hobby">Enter professional/hobby:</label>
			<input class="mb-3" type="text" name="hobby" />
			<label for="living">Enter any type of living thing:</label>
			<input class="mb-3" type="text" name="living" />
			<label for="nice">Say something nice to someone:</label>
			<textarea class="mb-3" name="nice" cols="30" rows="5"></textarea>
			<p style="font-style:italic;">Send and show a friend</p>
			<input style="background-color:black; color:white;" class="btn bg-gradient mb-3 w-25" type="submit" value="Send" />
			
		</form>


	</div>
</body>
</html>