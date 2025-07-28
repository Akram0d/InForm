<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />

<title>Edit Profile</title>
<link href="/css/editprofile2.css" rel="stylesheet">

</head>

<body>
	<div class="background">
		<div class="blur">
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
			<div class="container-fluid px-1 py-5 mx-auto">
				<div class="row d-flex justify-content-center">
					<div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
						<div class="col">
							<div class="col text-end">
								<a href="/users/${user.id}" class="btn btn-dark">Back to
									Profile</a>
							</div>
						</div>
						<div class="card">
							<h5 class="text-center mb-4">Edit Your Profile Here</h5>
							<form:form action="/users/${user.id}/edit" method="post"
								modelAttribute="user" enctype="multipart/form-data">
								<input type="hidden" name="_method" value="put">

								<div class="row justify-content-between text-left">
									<div class="form-group col-sm-6 flex-column d-flex">
										<form:errors class="text-danger" path="firstName" />
										<label class="form-control-label px-3">First name:<span
											class="text-danger"> *</span></label>
										<form:input type="text" id="firstname" path="firstName"
											name="firstName" placeholder="Enter your first name" />
									</div>
									<div class="form-group col-sm-6 flex-column d-flex">
										<form:errors class="text-danger" path="lastName" />
										<label class="form-control-label px-3">Last name:<span
											class="text-danger"> *</span></label>
										<form:input type="text" id="lastname" path="lastName"
											name="lastName" placeholder="Enter your last name" />
									</div>
								</div>
								<div class="row justify-content-between text-left">
									<div class="form-group col-sm-6 flex-column d-flex">
										<form:errors class="text-danger" path="email" />
										<label class="form-control-label px-3">Email:<span
											class="text-danger"> *</span></label>
										<form:input type="text" id="email" path="email" name="email"
											placeholder="" />
									</div>
									<div class="mb-3 col-sm-6 flex-column d-flex text-start">
										<label for="image" class="form-label">Add Image
											(Optional):</label> <input class="form-control" type="file"
											name="file" id="file" />
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="form-group col-6">
										<button type="submit" class="btn-block btn-primary">Update
											Information</button>
									</div>
									<div class="form-group ">
										<sec:authorize access="hasRole('ADMIN')">
											<c:choose>
												<c:when test="${loggedUser.id == user.id}">
													<a href="/users/${loggedUser.id}" class="btn  btn-danger ">Cancel</a>
												</c:when>
												<c:otherwise>
													<a href="/admin/dashboard" class="btn  btn-danger ">Cancel</a>
												</c:otherwise>
											</c:choose>
										</sec:authorize>
										<sec:authorize access="hasRole('USER')">
											<a href="/users/${user.id}" class="btn  btn-danger ">Cancel</a>
										</sec:authorize>

									</div>

								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>