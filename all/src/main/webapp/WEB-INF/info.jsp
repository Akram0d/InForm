<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/info.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Add body parameters </title>
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
					<li class="nav-item"><a class="nav-link" href="/programs">Programs</a> </li>
					<sec:authorize access="hasRole('ADMIN')">
						<li class="nav-item"><a class="nav-link"
							href="/admin/dashboard">Admin dashboard</a></li>
							<li class="nav-item"><a class="nav-link"
							href="/admin/programs/new">Add Program</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/exercises">Exercises</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutus">About Us</a></li>
				</ul>
				<ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
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
	<div style="margin: auto; margin-top: 40px;" class="container">
		<div class="row justify-content-center">
			<div class="col-4 mb-5" style="margin-top: 160px;">
				<form class="row g-3 mb-5" method="post" action="/users/add_info">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<h2>Add Information</h2>
					<c:if test="${ageError != null}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<c:out value="${ageError}" />
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:if>
					<div class="form-floating mb-3 ">
						<input name="age" type="number" class="form-control"
							id="floatingInput" placeholder="e.g. 10" name="age"
							value="${loggedUser.age}"> <label for="floatingInput">Age</label>
					</div>
					<c:if test="${heightError != null}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<c:out value="${heightError}" />
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:if>
					<div class="form-floating mb-3">
						<input name="height" type="number" class="form-control"
							id="floatingInput" placeholder="e.g. 10" name="height"
							value="${loggedUser.height}"> <label for="floatingInput">Height(CM)</label>
					</div>
					<c:if test="${weightError != null}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<c:out value="${weightError}" />
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:if>
					<div class="form-floating mb-3 ">
						<input name="weight" type="number" class="form-control"
							id="floatingInput" placeholder="e.g. 10" name="weight"
							value="${loggedUser.weight}"> <label for="floatingInput">Weight(KG)</label>
					</div>
					<div class="d-grid gap-2 col-3 mx-auto">
						<button class="btn btn-secondary btn-lg" type="submit">Submit</button>
						<a href="/users/${loggedUser.id}" class="btn  btn-danger ">Cancel</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>