<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/aboutus.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>About Us</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a id="navbar-brand" href="/programs"> <img class="logo"
				src="/images/logo.png" alt="" width="50" height="35"
				style="width: 130px; height: 100px; margin-top: -40px; margin-bottom: -20px;" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/programs">Programs</a></li>
					<sec:authorize access="hasRole('ADMIN')">
						<li class="nav-item"><a class="nav-link"
							href="/admin/dashboard">Admin dashboard</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/admin/programs/new">Add Program</a></li>
						<li class="nav-item"><a class="nav-link" href="/exercises">Exercises</a></li>
					</sec:authorize>
				</ul>
				<c:choose>
					<c:when test="${loggedUser != null}">
						<ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
							<li class="my-2"><a href="/users/${loggedUser.id}"
								class="btn btn-outline-light me-2">Profile</a></li>
							<li class="my-2">
								<form id="logoutForm" method="POST" action="/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="submit"
										class="btn btn-outline-light me-2" value="Logout" />
								</form>
							</li>
						</ul>

					</c:when>
					<c:otherwise>

						<ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
							<li class="my-2"><a href="/registration"
								class="btn btn-outline-light me-2">Register</a></li>
							<li class="my-2"><a href="/login"
								class="btn btn-outline-light me-2">Login</a></li>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</nav>
	<div class="container p-0">
		<div class="row mt-5">
			<div
				class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 col-10 offset-1 text-center">
				<h4 class="text-dark">This is a place for people to find the
					workout they need, and the support to commit to these programs to
					acheive their goals.</h4>
			</div>
		</div>
		<div class="row mt-5">
			<div
				class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 col-10 offset-1 text-center">
				<h4 class="text-dark">Our Team:</h4>
			</div>
		</div>
		<div class="row mb-5 mt-3">
			<div class="col-lg-10 offset-lg-1 col-10 offset-1">
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<div class="col">
						<div class="card h-100">
							<img src="/images/Rafat.jpg" class="card-img-top" alt="rafat" />
							<div class="card-body bg-dark">
								<ul class="list-group list-group-flush bg-dark text-white-50">
									<li class="list-group-item bg-dark text-white-50">Rafat
										Darawshe</li>
									<li class="list-group-item bg-dark text-white-50">Full
										Stack Developer</li>
									<li class="list-group-item bg-dark text-white-50"><a
										href="mailto:rafatdarawshe2@gmail.com" class="text-white-50">rafatdarawshe2@gmail.com</a>
									</li>
									<li class="list-group-item bg-dark text-white-50">
										<div class="row">
											<div class="col mt-2">
												<a target="_blank" href="https://github.com/rafat-darawshe"
													class="card-link btn btn-outline-light float-end float-md-none">Github</a>
											</div>
											<div class="col mt-2">
												<a target="_blank"
													href="https://www.linkedin.com/in/rafat-darawshe-701712221/"
													class="card-link btn btn-outline-light">LinkedIn</a>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100">
							<img src="/images/Hassan.jpg" class="card-img-top" alt="mahmoud" />
							<div class="card-body bg-dark">
								<ul class="list-group list-group-flush bg-dark text-white-50">
									<li class="list-group-item bg-dark text-white-50">Hassan
										Odeh</li>
									<li class="list-group-item bg-dark text-white-50">Full
										Stack Developer</li>
									<li class="list-group-item bg-dark text-white-50"><a
										href="mailto:Hassanodeh1997@gmail.com" class="text-white-50">Hassanodeh1997@gmail.com</a>
									</li>
									<li class="list-group-item bg-dark text-white-50">
										<div class="row">
											<div class="col mt-2">
												<a target="_blank" href="https://github.com/Hassano1696"
													class="card-link btn btn-outline-light float-end float-md-none">Github</a>
											</div>
											<div class="col mt-2">
												<a target="_blank"
													href="https://www.linkedin.com/in/hassan-odeh-388072229
"
													class="card-link btn btn-outline-light">LinkedIn</a>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100">
							<img src="/images/sanad.jpg" class="card-img-top" alt="..." />
							<div class="card-body bg-dark">
								<ul class="list-group list-group-flush bg-dark text-white-50">
									<li class="list-group-item bg-dark text-white-50">Sanad
										Abu Shama</li>
									<li class="list-group-item bg-dark text-white-50">Full
										Stack Developer</li>
									<li class="list-group-item bg-dark text-white-50"><a
										href="mailto:abushamasanad@hotmail.com" class="text-white-50">abushamasanad@hotmail.com</a>
									</li>
									<li class="list-group-item bg-dark text-white-50">
										<div class="row">
											<div class="col mt-2">
												<a target="_blank" href="https://github.com/SanadAbuShama"
													class="card-link btn btn-outline-light float-end float-md-none">Github</a>
											</div>
											<div class="col mt-2">
												<a target="_blank"
													href="https://www.linkedin.com/in/sanad-abu-shama/"
													class="card-link btn btn-outline-light">LinkedIn</a>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>