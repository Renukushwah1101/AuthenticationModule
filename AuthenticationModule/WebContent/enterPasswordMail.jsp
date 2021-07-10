<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>EnterPassword</title>



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
	<div class="container"
		style="margin: 100px; padding-left: 400px; padding-right: 400px; padding-top: 100px; padding-bottom: 100px">
		<form action="${pageContext.request.contextPath}/Operation"
			method="post">
			<div class="form-group">
				<label for="formGroupExampleInput">New Password</label> <input
					type="text" class="form-control" id="password" name="password"
					placeholder="Enter Password" required="required">
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput2">Confirm Password</label> <input
					type="text" class="form-control" id="con_password"
					name="con_password" placeholder="Enter Password" required="required">
			</div>
			<input type="hidden" name="form" value="updatepasswordmail">
			<center>
				<input type="submit" name="updatepasswordmail"value="updatepassword" class="btn btn-secondary"onclick="validatePassword();" />
			</center>
			<script type=text/javascript>
				function validatePassword() {
					var password = document.getElementById("password"), con_password = document
							.getElementById("con_password");

					if (password.value != con_password.value) {
						con_password.setCustomValidity("Password don't match");
					} else {
						con_password.setCustomValidity('');
					}

				}
				password.onchange = validatePassword;
				con_password.onKeyup = validatePassword;
			</script>

		</form>
	</div>



</body>

</html>
