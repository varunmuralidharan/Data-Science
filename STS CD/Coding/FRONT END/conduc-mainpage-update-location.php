<?php 

require 'common-sqlconnect.php';
session_start();

if(isset($_SESSION["busno"],$_GET["lat"],$_GET["lng"])){
	$busno = $_SESSION["busno"];
	$lat = $_GET["lat"];
	$lng = $_GET["lng"];
	
	$sql = "UPDATE gpslocation SET lat =".$lat." , lng =".$lng." WHERE busno = '".$busno."';";
	$res = mysqli_query($conn,$sql);
}
?>