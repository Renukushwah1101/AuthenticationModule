<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">


<title>Register</title>

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

</head>

<div class="container register-form">
	<div class="form">
		<div class="note">
			<p style="color: white;">
				Register with Us! <a
					href="${pageContext.request.contextPath}/Site?page=home"><span
					style="float: right;"><u><b>Login</b></u></span></a>
			</p>


		</div>

		<div class="form-content">

			<form action="${pageContext.request.contextPath}/Operation "
				action="#" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="Your Name *" value="" required="required" /><br />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="con_password"
								id="con_password" placeholder="Confirm Password *" value=""
								required="required" /><br />
						</div>
						<div class="form-group">
							<input type="text" name="email" id="email" class="form-control"
								placeholder="Email *" value="" required="required" />
						</div>

						<div class="file-upload-wrapper row">
							<div class="col-md-8">
								<button type="button" id="qr" class="btn btn-secondary">Sent
									QR code</button>
							</div>

							<br />
							<div style="padding-left: 25px">
								<input type="file" id="file" name="file" class="file-upload" required="required" />
							</div>
						</div>

					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="password" class="form-control" id="password"
								name="password " placeholder="Password *" value=""
								required="required" /><br />
						</div>
						<div class="form-group">
							<input type="text" name="phone" id="phone" class="form-control"
								placeholder="Phone no *" value="" required="required" />
						</div>
						<div class="row">
							<div class="col-md-4" style="padding-right: 0px">
								<button type="button" class="btn btn-secondary" id="sendotp">Sent
									OTP</button>
							</div>
							<div class="col-md-8"
								style="padding-right: 150px; padding-top: 10px;">
								<input class="form-control" id="enotp" name="enotp" type="text"
									placeholder="Enter OTP" required="required" />
							</div>
						</div>
					</div>
				</div>
				<br /> <br /> <br /> <input type="hidden" name="form"
					value="register"> <input class="si" id="verify"
					type="submit" value="VerifyDetails" onclick="validatePassword();">

				<script type=text/javascript>
					function validatePassword() {
						var password = document.getElementById("password"), con_password = document
								.getElementById("con_password");

						if (password.value != con_password.value) {
							con_password
									.setCustomValidity("Password don't match");
						} else {
							con_password.setCustomValidity('');
						}

					}
					password.onchange = validatePassword;
					con_password.onKeyup = validatePassword;
				</script>



			</form>
		</div>

	</div>

</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {

						$('#qr')
								.click(
										function() {
											var name = $('#name').val();
											var email = $('#email').val();
											//alert(phone);
											$
													.ajax({
														url : 'http://localhost:9090/AuthenticationModule/Operation?form=qr',
														method : 'POST',
														data : {
															'name' : name,

															'email' : email
														//pass value 
														},
														success : function(data) {
															//success function
															//return data form server
															alert('qr sent to:'
																	+ email
																	);
														},
														error : function(data) { //error function
															alert('Failed to qr :'
																	+ email);
															console.log(data)
														}
													});
										});
					});

	$(document)
			.ready(
					function() {

						$('#sendotp,#resendotp')
								.click(
										function() {

											var phone = $('#phone').val();
											//alert(phone);
											$
													.ajax({
														url : 'http://localhost:9090/AuthenticationModule/Operation?form=sendotp',
														method : 'POST',
														data : {
															'phone' : phone
														//pass value 
														},
														success : function(data) {
															//success function
															//return data form server
															alert('Otp sent to:'
																	+ phone);
														},
														error : function(data) { //error function
															alert('Failed to send Otp :'
																	+ phone);
															console.log(data)
														}
													});
										});
					});
</script>

</html>

