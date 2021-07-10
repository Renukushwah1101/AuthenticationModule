<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Error</title>



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
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="error-template">
				<h1>Oops!</h1>
				<h2>404 Not Found</h2>
				<div class="error-details">Sorry, an error has occured,
					Requested page not found!</div>
				<div class="error-actions">
					<a href="${pageContext.request.contextPath}/Site?page=home"
						class="btn btn-primary btn-lg"><span
						class="glyphicon glyphicon-home"></span> Take Me Home </a>
				</div>
			</div>
		</div>
	</div>
</div>

</html>
