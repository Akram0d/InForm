<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/profilePage.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Your Profile</title>
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
	<div class="container my-5">
		<div class="row mt-5 mb-3">
			<div
				class="my-5 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-xl-6 offset-xl-3">
				<div class="card mb-3 bg-dark text-light " style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-md-6 col-12">
							<c:choose>
								<c:when test="${thisUser.image != null}">
									<img src="${thisUser.image}" class="img-fluid rounded-start"
										alt="...">
								</c:when>
								<c:otherwise>
									<img src="/images/userPlaceholder.png"
										class="img-fluid rounded-start" alt="...">

								</c:otherwise>
							</c:choose>

						</div>
						<div class="col-md-6">
							<div class="card-body">
								<h5 class="card-title">
									<c:out value="${thisUser.firstName}" />
									<c:out value="${thisUser.lastName}" />
								</h5>
								<ul class="list-group list-group-flush ">
									<li class="list-group-item bg-dark text-light"><a
										href="mailto:${thisUser.email}"
										class="text-light text-decoration-none"><c:out
												value="${thisUser.email}" /></a></li>
									<sec:authorize access="hasRole('USER')">
										<c:choose>

											<c:when test="${thisUser.subscribedProgram != null}">
												<li class="list-group-item bg-dark text-light">Program:
													<c:out value="${thisUser.subscribedProgram.name}" />
												</li>
											</c:when>
											<c:otherwise>

												<li class="list-group-item bg-dark text-light">Not
													Subscribed!</li>
											</c:otherwise>
										</c:choose>
									</sec:authorize>
									<li class="list-group-item bg-dark text-light"><c:choose>
											<c:when test="${thisUser.age == 0}">
														Age: Not Provided!
											</c:when>
											<c:otherwise>Age:
												<fmt:formatNumber type="number" maxFractionDigits="0"
													value="${thisUser.age}" />
											</c:otherwise>
										</c:choose></li>
									<li class="list-group-item bg-dark text-light"><c:choose>
											<c:when test="${thisUser.height == 0}">
														Height: Not Provided!
											</c:when>
											<c:otherwise>Height:
												<fmt:formatNumber type="number" maxFractionDigits="0"
													value="${thisUser.height}" />
											</c:otherwise>
										</c:choose></li>
									<li class="list-group-item bg-dark text-light"><c:choose>
											<c:when test="${thisUser.weight == 0}">
														Weight: Not Provided!
											</c:when>
											<c:otherwise>Weight:
												<fmt:formatNumber type="number" maxFractionDigits="0"
													value="${thisUser.weight}" />
											</c:otherwise>
										</c:choose></li>
									<li class="list-group-item bg-dark text-light"><c:choose>
											<c:when test="${thisUser.bmi == 0}">
														BMI: Not Calculated!
											</c:when>
											<c:otherwise>BMI:
												<fmt:formatNumber type="number" pattern="##.#"
													value="${thisUser.bmi}" />
											</c:otherwise>
										</c:choose></li>
									<li class="list-group-item bg-dark text-light"><c:if
											test="${loggedUser.id == thisUser.id}">
											<a href="/info" class="btn btn-sm btn-success">Add/Edit
												Info</a>
										</c:if> <a href="/users/${thisUser.id}/edit"
										class="btn btn-sm btn-success">Edit Profile</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${thisUser.subscribedProgram != null}">
			<div class="row">
				<div class="col">
					<h4 class="my-3">Here's Your Schedule, Champ!</h4>
					<h4 class="my-3">
						<i> <c:out value="${thisUser.subscribedProgram.name}" /> with
							<c:out value="${thisUser.subscribedProgram.creator.firstName}" />
						</i>
					</h4>
					<table class="table rounded-3 mb-0 bg-secondary text-light">
						<thead class="bg-light text-dark border border-dark">
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
										<c:out value="${thisUser.subscribedProgram.day1}" />
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
										<c:out value="${thisUser.subscribedProgram.day2}" />
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
										<c:out value="${thisUser.subscribedProgram.day3}" />
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
										<c:out value="${thisUser.subscribedProgram.day4}" />
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
										<c:out value="${thisUser.subscribedProgram.day5}" />
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
										<c:out value="${thisUser.subscribedProgram.day6}" />
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
										<c:out value="${thisUser.subscribedProgram.day7}" />
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>