<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/registration.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>LogIn</title>
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
					<li class="nav-item"><a class="nav-link" href="/aboutus">About
							Us</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-md-fluid  border-primary m-5 p-4 ">
		<c:if test="${registerSuccess != null}">
			<div class="row">
				<div class="col-6 offset-3">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<c:out value="${registerSuccess}" />
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</div>
			</div>
		</c:if>
		<h1 class="text-center">Welcome To Fitness Castle</h1>
		<div class="row justify-content-evenly">
			<div class="col-4" id="log">
				<form class="row g-3" method="POST" action="/login">
					<h2 class="text-light">Login</h2>
					<c:if test="${logoutMessage != null}">
						<p class="text-light">
							<c:out value="${logoutMessage}"></c:out>
						</p>

					</c:if>
					<c:if test="${errorMessage != null}">
						<p class="text-light">
							<c:out value="${errorMessage}"></c:out>
						</p>
					</c:if>
					<div class="form-floating">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="e.g. 10" name="username"> <label
							for="floatingInput">Email</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingInput"
							placeholder="e.g. 10" name="password"> <label
							for="floatingInput">Password</label>
					</div>
					<div class="d-grid gap-2 col-3 mx-auto">
						<button class="btn btn-outline-light" type="submit">Login</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<p class="text-light my-5">
					Don't have an account? <a class="btn btn-sm btn-outline-light ms-2"
						href="/registration">Register</a>
				</p>
			</div>
		</div>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>