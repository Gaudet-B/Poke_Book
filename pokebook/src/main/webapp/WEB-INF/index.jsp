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
		<div class="container" style="width: 90%; margin: auto;">
			<h1 class="text-light my-4 display-3">PokeBook</h1>
			<table class="table table-secondary table-hover">
				<thead>
					<tr>
						<th class="fs-4">Expense</th>
						<th class="fs-4">Vendor</th>
						<th class="fs-4">Amount</th>
						<th class="fs-4">Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach var="expense" items="${ expenses }">
					<tr>
						<td> <a class="link link-dark" href="/expenses/view/${ expense.id }"><c:out value="${ expense.name }"/></a> </td>
						<td><c:out value="${ expense.vendor }"/></td>
						<td><c:out value="${ expense.amount }"/></td>
						<td class="d-flex flex-row"> 
							<a class="link link-dark" href="/expenses/edit/${ expense.id }">edit</a>
							<form action="/expenses/delete/${ expense.id }" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" class="btn btn-sm btn-outline-danger ms-3" value="Delete"/>
							<!-- <a class="btn btn-sm btn-outline-danger ms-2" href="/expenses/delete/${ expense.id }">delete</a> -->
							</form>
						</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
			<div class="d-flex flex-column text-light" style="width: 80%;">
				<h3 class="mt-4">Track an Expense:</h3>
				
				<form:form action="/expenses/create" modelAttribute="expense" method="post" class="form">
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="name" class="form-label mt-2">Expense Name:</form:label>
						<form:input path="name" class="form-control" style="max-width: 80%;"/>
						<form:errors path="name" class="text-danger fs-6"/>
					</div>
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="vendor" class="form-label mt-2">Vendor:</form:label>
						<form:input path="vendor" class="form-control" style="max-width: 80%;"/>
						<form:errors path="vendor" class="text-danger fs-6"/>
					</div>
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="amount" class="form-label mt-2">Amount:</form:label>
						<form:input path="amount" class="form-control" style="max-width: 80%;"/>
						<form:errors path="amount" class="text-danger fs-6"/>
					</div>
					<div class="d-flex flex-row my-2 justify-content-between">
						<form:label path="description" class="form-label mt-2">Description:</form:label>
						<form:textarea path="description" class="form-control" style="max-width: 80%; min-height: 120px; max-height: fit-content"/>
						<form:errors path="description" class="text-danger fs-6"/>
					</div>
					
					<div class="d-flex flex-row justify-content-end">
						<input type="submit" class="btn btn-primary mt-2" value="Submit"/>
					</div>
					
				</form:form>
				
			</div>
		</div>
	</body>
</html>