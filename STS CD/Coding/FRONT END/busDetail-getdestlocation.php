
<?php
	require 'common-sqlconnect.php';
	session_start();
	
	if(isset($_SESSION["destination"])){
		$destination = $_SESSION["destination"];
		$sql = "SELECT lat,lng FROM destlocations WHERE destination = '".$destination."'";
		$res = mysqli_query($conn,$sql);
		$row = mysqli_fetch_assoc($res);
		$lat = $row["lat"];
		$lng = $row["lng"];
		
		echo " ".$lat." ".$lng;
	}
	?>