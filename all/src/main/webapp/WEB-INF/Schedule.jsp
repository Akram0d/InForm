<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Schedule</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
 
<style>
.logo {
	width: 130px;
	height: 100px;
	margin-top: -40px;
	margin-bottom: -20px;
}

.background {
	background-image: url("/images/gym3.avif");
}

.blur {
	background: rgba(255, 255, 255, 0.2);
	backdrop-filter: blur(5px);
	width: 100%;
	height: 100%;
}
</style>

</head>

<body>
	<div class="background">
		<div class="blur">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/programs"> <img class="logo"
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

					<sec:authorize access="hasRole('ADMIN')">
						<li class="nav-item"><a class="nav-link"
							href="/admin/dashboard">Admin dashboard</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/exercises">Exercises</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutus">About
							Us</a></li>

				</ul>
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
			</div>
		</div>
	</nav>
			<main class="container-sm mt-5 p-5">
				<div class="row mb-5">
					<div class="col text-light">
						<h3>
							<c:out value="${program.name}" />
							's schedule!
						</h3>
						<p>
							Category:
							<c:out value="${program.category}" />
						</p>
						<p>
							Instructor:
							<c:out value="${program.creator.firstName}" />
							<c:out value="${program.creator.lastName}" />
						</p>
						<p>
							Subscribers:
							<c:out value="${program.subscribers.size()}" />
						</p>
						<p>
							BMI range:
							<c:out value="${program.minBmi}" />
							-
							<c:out value="${program.maxBmi}" />
						</p>
					</div>
					<div class="col text-end">
						<a href="/programs" class="btn btn-dark">Back to programs</a>
					</div>
				</div>
				<div class="row">
					<div>
						<h3 class="text-warning">You can check the Exercises tap above for a reference!</h3>
					</div>
					<table class="table align-middle bg-white">
						<thead class="bg-light">
							<tr>
								<th>Day</th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Saturday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day1}" />
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Sunday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day2}" />
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Monday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day3}" />
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Tuesday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day4}" />
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Wednesday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day5}" />
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Thursday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day6}" />
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-1">Friday</p>
									</div>
								</td>

								<td>
									<p class="fw-normal mb-1">
										<c:out value="${program.day7}" />
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<sec:authorize access="hasRole('USER')">
					<div class="row">
						<c:choose>
							<c:when test="${program.id == loggedUser.subscribedProgram.id}">
								<div class="col">
									<button class="btn btn-secondary float-end" disabled="disabled">
										Subscribed!</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col text-end">
									<form action="/programs/${program.id}/subscribe" method="post">
										<input type="hidden" name="_method" value="put"> <input
											type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<button class="btn btn-dark float-end">Subscribe</button>
									</form>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</sec:authorize>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>