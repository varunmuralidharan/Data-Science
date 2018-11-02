<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width , intial-scale=1">
<title>Conduc Mainpage</title>
<link rel="stylesheet" href="css/conduc-mainpage.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<?php
	require 'common-sqlconnect.php';
	session_start();
	if(isset($_SESSION["busno"])){
		$busno = $_SESSION["busno"];
		$sql = "SELECT stops FROM ".$busno." WHERE busno = '".$busno."'";
		$res = mysqli_query($conn,$sql);
	}
	
	$counter = 0;
	if(isset($res)){
		if(mysqli_num_rows($res) > 0){
			while($row = mysqli_fetch_assoc($res)){
				$stops[] = $row["stops"];
				$counter++;
			}
		}
	}
	
?>
<header>
	<div class="wrapper">
		<div class="header_container">
			<div class="head1">
				<h3 id="busnumber">17D</h3>
				<div class="logo">
					<img src="assets/white_logo.png" alt="company_logo">
				</div>
				<i class="fas fa-bars" onClick="dispSignout(this)"></i>
				<p id="sign_out" onClick="signout()">Sign out</p>
			</div>
		</div>
	</div>
</header>
<div class="container">
	<div class="wrapper">
		<div class="content_area">
			<div class="title">
				<h3>Ticket Booking</h3>
			</div>
			<div class="booking_form">
				<form action="conduc-mainpage-update-values.php" method="get">
					<input type="text" name="source" id="source" placeholder="source" list="myroutes">
					<input type="text" name="destination" id="destination" placeholder="destination" list="myroutes">
					<input type="number" name="ticketcount" id="ticket-count" placeholder="Number of seats">
					<input type="submit" value="Book">
					<datalist>
						<?php 
							for($i=0;$i<$counter;$i++){
								echo "<option>".$stops[$i]."</option>";
							}
						?>
					</datalist>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	function dispSignout(){
	var signout = document.getElementById("sign_out");

	if(signout.style.display === "block"){
		signout.style.display = "none";
	}
	else{
		signout.style.display = "block";
	}
	}
	
	function signout(){
		location.href = "conduc-login.php";
	}

	setInterval(function(){
		if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } },10000);
		function showPosition(position) {
		console.log(position.coords.latitude);
		console.log(position.coords.longitude);
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		
		if(window.XMLHttpRequest){
			xmlreq2 = new XMLHttpRequest();
		}
		xmlreq2.open("GET","conduc-mainpage-update-location.php?lat="+lat+"&lng="+lng,true);
		xmlreq2.send();
	}
</script>
</body>
</html>