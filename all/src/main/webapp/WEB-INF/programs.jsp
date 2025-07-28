<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="/css/programs.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Programs</title>
</head>
<body>
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
							<li class="nav-item"><a class="nav-link"
							href="/admin/programs/new">Add Program</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/exercises">Exercises</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutus">About Us</a></li>
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
	<div class="container">
		<c:if test="${error != null}">
			<div class="row mt-5">
				<div class="col-6 offset-3">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<c:out value="${error}" />
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</div>
			</div>
		</c:if>

		<sec:authorize access="hasRole('USER')">
			<h4 class="my-5 text-dark text-center">Recommended programs
				based on your BMI:</h4>
			<div class="row mb-5 row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
				<c:forEach var="program" items="${programs}">
					<c:if
						test="${program.minBmi <= loggedUser.bmi && loggedUser.bmi <= program.maxBmi}">
						<div class="col">
							<div class="card h-100 bg-dark text-light">
								<c:choose>
									<c:when test="${program.image == null}">
										<img src="/images/logo.png" class="card-img-top" alt="..." />
									</c:when>
									<c:otherwise>
										<img src="${program.image}" class="card-img-top" alt="..." />
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<h5 class="card-title">
										<c:out value="${program.name}" />
									</h5>
									<ul class="list-group list-group-flush mb-2">
										<li class="list-group-item bg-dark text-light"><c:out
												value="${program.description}" /></li>
										<li class="list-group-item bg-dark text-light">BMI range:
											<fmt:formatNumber type="number" maxFractionDigits="1"
												value="${program.minBmi}" /> - <fmt:formatNumber
												type="number" maxFractionDigits="1"
												value="${program.maxBmi}" />
										</li>
									</ul>
									<p class="card-text">
										<a href="/programs/${program.id}/schedule"
											class="btn btn-outline-light">View Details</a>
									</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<h4 class="my-5 text-light text-center">Other programs:</h4>
			<div class="row mb-5 row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
				<c:forEach var="program" items="${programs}">
					<c:if
						test="${loggedUser.bmi < program.minBmi || loggedUser.bmi > program.maxBmi}">
						<div class="col">
							<div class="card h-100 bg-dark text-light">
								<c:choose>
									<c:when test="${program.image == null}">
										<img src="/images/logo.png" class="card-img-top" alt="..." />
									</c:when>
									<c:otherwise>
										<img src="${program.image}" class="card-img-top" alt="..." />
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<h5 class="card-title">
										<c:out value="${program.name}" />
									</h5>
									<ul class="list-group list-group-flush mb-2">
										<li class="list-group-item bg-dark text-light"><c:out
												value="${program.description}" /></li>
										<li class="list-group-item bg-dark text-light">BMI range:
											<fmt:formatNumber type="number" maxFractionDigits="1"
												value="${program.minBmi}" /> - <fmt:formatNumber
												type="number" maxFractionDigits="1"
												value="${program.maxBmi}" />
										</li>
									</ul>
									<p class="card-text">
										<a href="/programs/${program.id}/schedule"
											class="btn btn-outline-light">View Details</a>
									</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
			<div class="row my-5 row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
				<c:forEach var="program" items="${programs}">
					<div class="col">
						<div class="card h-100 bg-dark text-light">
							<c:choose>
								<c:when test="${program.image == null}">
									<img src="/images/logo.png" class="card-img-top" alt="..." />
								</c:when>
								<c:otherwise>
									<img src="${program.image}" class="card-img-top" alt="..." />
								</c:otherwise>
							</c:choose>
							<div class="card-body">
								<h5 class="card-title">
									<c:out value="${program.name}" />
								</h5>
								<ul class="list-group list-group-flush mb-2">
									<li class="list-group-item bg-dark text-light"><c:out
											value="${program.description}" /></li>
									<li class="list-group-item bg-dark text-light">BMI range:
										<fmt:formatNumber type="number" maxFractionDigits="1"
											value="${program.minBmi}" /> - <fmt:formatNumber
											type="number" maxFractionDigits="1" value="${program.maxBmi}" />
									</li>
								</ul>
								<p class="card-text">
									<a href="/programs/${program.id}/schedule"
										class="btn btn-outline-light">View Details</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</sec:authorize>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>