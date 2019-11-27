<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
<%@ include file="../resources/theme1/css/main.css"%>
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"
	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<c:if test="${!sessionScope.loggedIn}">

			<a class="navbar-brand" href="<c:url value="/"/>">Mobile Shop</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="<c:url value="/"/>">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/productCatalog"/>">Show All Products</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Categories </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<c:url value="/mobiles"/>">Mobiles</a>
							<a class="dropdown-item" href="<c:url value="/laptops" />">Laptops</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/aboutus"/>">About Us</a>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/contactus"/>">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/register"/>">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/login"/>">Login</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="search" method="get">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search" name="product">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Submit</button>
				</form>
			</div>
		</c:if>

		<c:if test="${sessionScope.loggedIn}">
			<c:if test="${sessionScope.role=='ROLE_ADMIN'}">
			
						<a class="navbar-brand" href="<c:url value="/adminHome"/>">Mobile Shop</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/category"/>">Manage Category</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/product"/>">Manage Product</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/supplier"/>">Manage Supplier</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/perform_logout"/>">Logout</a></li>
					</ul>
				</div>
			</c:if>


			<c:if test="${sessionScope.role=='ROLE_USER'}">

				<a class="navbar-brand" href="<c:url value="/"/>">Mobile Shop</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">

					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="<c:url value="/"/>">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/productCatalog"/>">Show All Products</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Categories </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="<c:url value="/mobiles"/>">Mobiles</a>
								<a class="dropdown-item" href="<c:url value="/laptops" />">Laptops</a>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/aboutus"/>">About Us</a>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/contactus"/>">Contact Us</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-uppercase" href="#"
							id="userDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">${sessionScope.username}</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<c:url value="/cart"/>">My cart</a>
								<a class="dropdown-item" href="<c:url value="/perform_logout"/>">Logout</a>
							</div></li>
					</ul>
					<form class="form-inline my-2 my-lg-0" action="search" method="get">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search" name="product">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Submit</button>
					</form>
				</div>
			</c:if>

		</c:if>
	</nav>