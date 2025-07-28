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
<title>Register</title>
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
		<h1 class="text-center">Welcome To Fitness Castle</h1>
		<div class="row justify-content-evenly">
			<div class="col-4" id="rig">
				<form:form class="row g-3 mb-5" method="post" action="/registration"
					modelAttribute="user" enctype="multipart/form-data">
					<h2 class="text-light">Registration</h2>

					<div class="form-floating ">
						<form:errors class="text-light" path="firstName" />
						<form:input type="text" class="form-control" id="floatingInput"
							placeholder="e.g. 10" path="firstName" />
						<label for="floatingInput">First Name</label>
					</div>
					<div class="form-floating">
						<form:errors path="lastName" class="text-light" />
						<form:input type="text" class="form-control" id="floatingInput"
							placeholder="e.g. 10" path="lastName" />
						<label for="floatingInput">Last Name</label>
					</div>
					<div class="form-floating">
						<form:errors class="text-light" path="email" />
						<form:input type="email" class="form-control" id="floatingInput"
							placeholder="e.g. 10" path="email" />
						<label for="floatingInput">Email</label>
					</div>
					<div class="form-floating">
						<form:errors class="text-light" path="gender" />
						<form:select class="form-select"
							aria-label="Default select example" path="gender">
							<option selected value="">Gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</form:select>
					</div>
					<div class="mb-3 text-start">
						<label for="image" class="form-label text-light">Add Image
							(Optional):</label> <input class="form-control" type="file" name="file"
							id="file" />
					</div>
					<div class="form-floating">
						<form:errors class="text-light" path="password" />
						<form:input type="password" class="form-control"
							id="floatingInput" placeholder="e.g. 10" path="password" />
						<label for="floatingInput">Password</label>
					</div>
					<div class="form-floating">
						<form:errors class="text-light" path="confirm" />
						<form:input type="password" class="form-control"
							id="floatingInput" placeholder="e.g. 10" path="confirm" />
						<label for="floatingInput">Confirm Password</label>
					</div>
					<div class="d-grid gap-2 col-3 mx-auto">
						<button class="btn btn-outline-light" type="submit">Register</button>
					</div>
				</form:form>
				<p class="text-light my-3">
					Already have an account? <a
						class="btn btn-sm btn-outline-light ms-2" href="/login">Login</a>
				</p>
			</div>
		</div>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>