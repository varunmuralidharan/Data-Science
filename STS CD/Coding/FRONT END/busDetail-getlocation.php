<?php 
require 'common-sqlconnect.php';
session_start();

if(isset($_SESSION["busno"])){
	$busno = $_SESSION["busno"];
	
	$sql = "SELECT lat,lng FROM gpslocation WHERE busno = '".$busno."'";
	$res = mysqli_query($conn,$sql);
	if(mysqli_num_rows($res) > 0){
		while($row =  mysqli_fetch_assoc($res)){
			$lat = $row["lat"];
			$lng = $row["lng"];
		}
	}
	
	echo " ".$lat." ".$lng;
}
?>
