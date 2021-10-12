<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<meta charset="ISO-8859-1">
		<title> PokeBook </title>
	</head>
	<body class="bg-secondary p-2">
		<div class="container text-light">
			<div class="d-flex flex-row justify-content-between">
				<h1 class="display-4 my-4">Expense Details</h1>
				<a href="/expenses" class="link link-light mt-5">Go back</a>		
			</div>
			<div class="d-flex flex-column border border-dark bg-light text-dark p-2" style="max-width: 80%;">
				<div class="d-flex flex-row">
					<p class="me-4 text-decoration-underline">Expense Name:</p>
					<p class="ms-4"> <c:out value="${ expense.name }" /> </p>
				</div>
				<div class="d-flex flex-row">
					<p class="me-1 text-decoration-underline">Expense Description:</p>
					<p class="ms-1"> <c:out value="${ expense.description }" /> </p>
				</div>
				<div class="d-flex flex-row">
					<p class="me-5 text-decoration-underline">Vendor:</p>
					<p class="ms-5"> <c:out value="${ expense.vendor }" /> </p>
				</div>
				<div class="d-flex flex-row">
					<p class="me-4 text-decoration-underline">Amount Spent:</p>
					<p class="ms-4"> <c:out value="${ expense.amount }" /> </p>
				</div>
			</div>
		</div>
	</body>
</html>