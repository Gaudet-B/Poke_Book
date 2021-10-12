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
		<div class="container" style="width: 80%; margin: auto;">
			<div class="d-flex flex-row justify-content-between">
				<h1 class="text-light my-4 display-3">Edit Expense</h1>
				<a class="link link-light mt-5" href="/expenses">Go back</a>
			</div>
			<form:form action="/expenses/update/${ expense.id }" modelAttribute="expense" method="post" class="form text-light" style="max-width: 80%">
				
				<input type="hidden" name="_method" value="put">
				<!-- <form:input type="hidden" path="id" value="${ expense.id }" />  -->
				
				<div class="d-flex flex-column">
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="name" class="form-label mt-2" style="min-width: 108px;">Expense Name:</form:label>
						<form:input path="name" class="form-control" style="max-width: 80%; min-width: 415px;"/>
					</div>
					<form:errors path="name" class="text-danger fs-6 text-end mb-2"/>
				</div>
				
				<div class="d-flex flex-column">
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="vendor" class="form-label mt-2" style="min-width: 108px;">Vendor:</form:label>
						<form:input path="vendor" class="form-control" style="max-width: 80%; min-width: 415px;"/>
					</div>
					<form:errors path="vendor" class="text-danger fs-6 text-end mb-2"/>
				</div>
				
				<div class="d-flex flex-column">
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="amount" class="form-label mt-2" style="min-width: 108px;">Amount:</form:label>
						<form:input path="amount" class="form-control" style="max-width: 80%; min-width: 415px;"/>
					</div>
					<form:errors path="amount" class="text-danger fs-6 text-end mb-2"/>
				</div>
				
				<div class="d-flex flex-column">
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="description" class="form-label mt-2" style="min-width: 108px;">Description:</form:label>
						<form:textarea path="description" class="form-control" style="max-width: 80%; min-width: 415px; min-height: 120px; max-height: fit-content"/>
					</div>
					<form:errors path="description" class="text-danger fs-6 text-end mb-2"/>
				</div>
				
				<div class="d-flex flex-row justify-content-end">
					<input type="submit" class="btn btn-primary mt-2" value="Submit"/>
				</div>
				
			</form:form>
		</div>
	</body>
</html>