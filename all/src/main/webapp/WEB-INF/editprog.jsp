<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page isErrorPage="true"%>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/newProgram.css">
<meta charset="ISO-8859-1">
<title>Edit a program</title>
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
					</li>
					<sec:authorize access="hasRole('ADMIN')">
						<li class="nav-item"><a class="nav-link"
							href="/admin/dashboard">Admin dashboard</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/admin/programs/new">Add Program</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/exercises">Exercises</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutus">About
							Us</a></li>
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
	<div class="container">
		<div class="row my-5">
			<div class="col-xl-8 col-md-10 offset-xl-2 offset-md-1 col">
				<div class="row mb-5">
					<div class="col">
						<form:form action="/programs/${program.id}/delete" method="post">
							<input type="hidden" name="_method" value="delete">
							<button type="submit" class="btn btn-info  btn-dark">Delete
								${program.name} program</button>
						</form:form>
					</div>
					<div class="col text-end">
						<a href="/programs" class="btn btn-dark">Back to programs</a>

					</div>
				</div>
				<div class="col text-center">
					<h3>Edit ${program.name} program</h3>
				</div>

				<div class="row">
					<div class="col text-start">
						<form:form action="/admin/${program.id}/edit" method="POST"
							modelAttribute="program" enctype="multipart/form-data">
							<input type="hidden" name="_method" value="put">

							<div class="row">
								<div class="col-md-6 col-12">

									<div class="mb-3">
										<form:errors class="text-danger" path="name" />
										<form:input type="text" class="form-control" id="name"
											path="name" placeholder="Name" />
									</div>
									<div class="mb-3">
										<form:label path="minBmi">Category:</form:label>
										<form:errors class="text-danger" path="category" />
										<form:select class="form-select"
											aria-label="Default select example" path="category">
											<option selected value="weightloss">Weightloss</option>
											<option value="weightlifting">Weightlifting</option>
											<option value="cardio">Cardio</option>
										</form:select>
									</div>
									<div class="mb-3">
										<div>
											<form:errors class="text-danger" path="minBmi" />
										</div>
										<form:label path="minBmi">Minimum BMI:</form:label>
										<form:input path="minBmi" type="number" class="form-control" />
									</div>
									<div class="mb-3">
										<div>
											<form:errors class="text-danger" path="maxBmi" />
										</div>
										<form:label path="minBmi">Maximum BMI:</form:label>
										<form:input path="maxBmi" type="number" class="form-control" />
									</div>
									<div class="mb-3">
										<form:errors class="text-danger" path="description" />
										<form:textarea class="form-control" id="description"
											path="description" placeholder="Description" rows="3"></form:textarea>
									</div>
									<div class="mb-3 text-start">
										<label for="image" class="form-label">Add Image:</label> <input
											class="form-control" type="file" name="file" id="file" />
									</div>

									<div class="mb-3">
										<form:errors class="text-danger" path="day1" />
										<form:textarea class="form-control" id="day1" path="day1"
											placeholder="Day 1" rows="3"></form:textarea>
									</div>
									<div class="mb-3">
										<form:errors class="text-danger" path="day2" />
										<form:textarea class="form-control" id="day2" path="day2"
											placeholder="Day 2" rows="3"></form:textarea>
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<form:errors class="text-danger" path="day3" />
										<form:textarea class="form-control" id="day3" path="day3"
											placeholder="Day 3" rows="3"></form:textarea>
									</div>
									<div class="mb-3">
										<form:errors class="text-danger" path="day4" />
										<form:textarea class="form-control" id="day4" path="day4"
											placeholder="Day 4" rows="3"></form:textarea>
									</div>
									<div class="mb-3">
										<form:errors class="text-danger" path="day5" />
										<form:textarea class="form-control" id="day5" path="day5"
											placeholder="Day 5" rows="3"></form:textarea>
									</div>
									<div class="mb-3">
										<form:errors class="text-danger" path="day6" />
										<form:textarea class="form-control" id="day1" path="day6"
											placeholder="Day 6" rows="3"></form:textarea>
									</div>
									<div class="mb-3">
										<form:errors class="text-danger" path="day7" />
										<form:textarea class="form-control" id="day1" path="day7"
											placeholder="Day 7" rows="3"></form:textarea>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-dark float-end ms-2">Update ${program.name} program</button>
							<a href="/admin/dashboard" class="btn btn-danger float-end">Cancel</a>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>