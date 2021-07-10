<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>

<head>
<title>Authentication  </title>
<meta charset="utf-8">




<link
	href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="assests/css/styles.css">
<script src="assests/js/app.js"></script>
</head>
<body>
	<section id="title">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-sm navbar-dark fixed">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/Site?page=home">Authentication
					Module</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="#footer">Contact</a>
						</li>


					</ul>

				</div>
			</nav>

			<div class="row">
				<div class="col-lg-6">
					<h1>Authentication System using OTP and QR code</h1>
					<a
						href="${pageContext.request.contextPath}/Operation?page=registration"><button
							type="button" class="btn btn-dark btn-lg" data-toggle="modal"
							data-target="#RegModal">Registration</button></a>
					<button type="button" class="btn btn-outline-light btn-lg"
						data-toggle="modal" data-target="#loginModal">login</button>
				</div>

			</div>
		</div>
	</section>
	<!--registration-->



	<!--login-->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"> &times; </span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>Login</h4>
					</div>
					<br />
					<div class="d-flex flex-column text-center">
						<form action="${pageContext.request.contextPath}/Operation "
							action="#" method="post">
							<div class="form-group">
								<input type="email" class="form-control" name="email1"
									id="email1" placeholder="Your email address...">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password1"
									id="password1" placeholder="Your password...">
							</div>

							<input type="hidden" name="form" value="login"> <input
								class="btn btn-info btn-block btn-round" id="dblogin"
								type="submit" value="Login" />

						</form>
						<div class="modal-footer d-flex justify-content-center">
							<div class="signup-section">
								<a
									href="${pageContext.request.contextPath}/Operation?page=forgetpassword"
									class="text-info">Forget Password</a>.
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<div class="signup-section">
						Not a member yet? <a
							href="${pageContext.request.contextPath}/Operation?page=registration"
							class="text-info"> Register</a>.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Features -->

	<section id="features">

		<div class="row">
			<div class=" feature-box col-lg-4 col-md-6">
				<i class="icon fas fa-check-circle fa-4x"></i>
				<h3>Easy to use.</h3>
				<p>So easy to use, even your child could do it.</p>
			</div>
			<div class=" feature-box col-lg-4 col-md-6">
				<i class="icon fas fa-bullseye fa-4x"></i>
				<h3>Delivering Best</h3>
				<p>Delivering best is our mission and vision.</p>
			</div>
			<div class=" feature-box col-lg-4 col-md-6">
				<i class="icon fas fa-heart fa-4x"></i>
				<h3>Guaranteed to work.</h3>
				<p>If the things are going wrong then you may contact us.</p>
			</div>
		</div>
	</section>

	<!-- Testimonials -->
	<section id="testimonials">
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<footer id="footer">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<h2>Today's need If you are surfing on to the internet.</h2>
						<img class="testimonial-image" src="assests/images/1.jpeg"
							alt="dog-profile">

					</div>
					<div class="carousel-item">
						<h2 class="testimonial-text">We and you with security feels
							safe.</h2>
						<img class="testimonial-image" src="assests/images/2.jpg"
							alt="lady-profile">

					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</footer>
		</div>
	</section>












	<c:import url="include/footer.jsp"></c:import>
</body>

</html>
