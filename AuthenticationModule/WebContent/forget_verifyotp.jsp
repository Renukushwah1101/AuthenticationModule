<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Verify</title>



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
<center>
	<h1>Verify OTP</h1>
</center>
<form action="${pageContext.request.contextPath}/Operation" action="#"
	method="post">

	<div class="container"
		style="padding-top: 100px; padding-right: 150px; padding-left: 150px; margin-top: 10px;">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<button class="btn btn-secondary" id="sendotp" type="button">Sent
					OTP</button>
			</div>
			<input type="text" class="form-control" name="phone" id="phone"
				placeholder="Enter Mobile Number" aria-label=""
				aria-describedby="basic-addon1">
		</div>

		<div class="input-group mb-3">
			<input type="text" class="form-control" name="enotp"
				placeholder="Enter OTP" aria-label="Recipient's username"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<input type="hidden" name="form" value="verifyotp" /> <input
					class="btn btn-secondary" id="verifyotp" type="submit"
					value="verifyotp" />
			</div>
		</div>
	</div>
</form>
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
