<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/adminDashboard.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img class="logo"
				src="/images/logo.png" alt="" width="50" height="35" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/programs">Programs</a>
						<sec:authorize access="hasRole('ADMIN')">
							<li class="nav-item"><a class="nav-link"
								href="/admin/programs/new">Add Program</a></li>
						</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/exercises">Exercises</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutus">About
							Us</a></li>
				</ul>
				<ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
					<li class="my-2"><a href="/users/${loggedUser.id}"
						class="btn btn-outline-light me-2">Profile</a></li>
					<li class="my-2"><form id="logoutForm" method="POST"
							action="/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit"
								class="btn btn-outline-light me-2" value="Logout" />
						</form></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container my-5">
		<h4 class="text-center">All Users</h4>
		<div class="row">
			<div class="col-md-8 offset-md-2 col">
				<table class="table table-striped table-dark">
					<thead>
						<tr>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Email</th>
							<th scope="col">Role</th>
							<th scope="col">Actions</th>
							<th scope="col">Make Admin</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${allUsers}">
							<tr>
								<td><c:out value="${user.firstName}" /></td>
								<td><c:out value="${user.lastName}" /></td>
								<td><c:out value="${user.email}" /></td>
								<td><c:choose>
										<c:when test='${user.roles.get(0).name == "ROLE_ADMIN"}'>
											Admin
										</c:when>
										<c:otherwise>
											Normal
										</c:otherwise>
									</c:choose></td>
								<td><c:if
										test='${user.roles.get(0).name == "ROLE_USER" || user.id == loggedUser.id}'>
										<a href="/users/${user.id}/edit"
											class="btn btn-sm btn-success">Edit</a>
									</c:if></td>
								<td><c:if test='${user.roles.get(0).name == "ROLE_USER"}'>

										<form method="POST" action="/users/${user.id}">
											<input type="hidden" name="_method" value="put"> <input
												type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> <input type="submit"
												class="btn btn-sm btn-primary me-2" value="Make Admin" />
										</form>
									</c:if></td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row my-4">
			<h4 class="text-center">Your Programs</h4>
			<div class="col-md-8 offset-md-2 col">
				<table class="table table-striped table-dark">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Description</th>
							<th scope="col">BMI Range</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="program" items="${loggedUser.programs}">
							<tr>
								<td><c:out value="${program.name}" /></td>
								<td><c:out value="${program.description}" /></td>
								<td><fmt:formatNumber value="${program.minBmi}"
										maxFractionDigits="1" /> - <fmt:formatNumber
										value="${program.maxBmi}" maxFractionDigits="1" /></td>
								<td><a href="/admin/${program.id}/edit"
									class="btn btn-sm btn-success">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>