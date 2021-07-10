<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Verify</title>
 


  <link href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assests/css/styles.css">
    <script src="assests/js/app.js"></script>
</head>
<center><h1>Verify QR code</h1></center>

<form  action="${pageContext.request.contextPath}/Operation"  action="#"  method="post" enctype="multipart/form-data">
<div class="container" style="padding-top:100px;padding-right:150px;padding-left:150px;margin-top:10px;">
  <div class="input-group mb-3">
    <input type="text" class="form-control"  id="email" name="email" placeholder="Enter Email" aria-label="Recipient's username" aria-describedby="basic-addon2">
    <div class="input-group-append">
      <button class="btn btn-secondary" id="qr"  type="button">Sent QR code</button>
    </div>
  </div>
  

    
    <div style="padding-left:25px">
      <input  type="file" id="file" name="file" class="file-upload" data-max-file-size="2M"/>
     <input type="hidden" name="form" value="verifyqrcode"/>
    <input class="btnSubmit" id="verifyqrcode" type="submit"  value="verifyqrcode" />
                  
  </div>
</div>
</form>
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	 
	  $('#qr').click(function() {
		 
	    var email = $('#email').val();
	    //alert(phone);
	    $.ajax({
	        url: 'http://localhost:9090/AuthenticationModule/Operation?form=qrcode',
	        method: 'POST',
	        data: {
	        	
	            'email': email//pass value 
	          },
	        success: function(data){ 
	          //success function
	          //return data form server
	          alert('qr sent to:'+email);
	        },
	        error: function(data){ //error function
	          alert('Failed to qr :'+ email);
	          console.log(data)
	        }
	      });
	  });
	});



</script>

</html>
