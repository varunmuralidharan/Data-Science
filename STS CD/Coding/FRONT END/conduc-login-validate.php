<?php 

require 'common-sqlconnect.php';
session_start();
if(isset($_GET["busno"],$_GET["password"])){
	$busno = $_GET["busno"];
	$pwd = $_GET["password"];
}

$sql = "SELECT busno,pwd FROM conductorlogin WHERE busno = '".$busno."' AND pwd = '".$pwd."';";
$res = mysqli_query($conn , $sql);

if(mysqli_num_rows($res) > 0){
	$_SESSION["busno"] = $busno;
	header('Location:conduc-mainpage.php');
}
else{
	echo "<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>";
	echo "<script>swal({
  title: 'Login Failed!',
  text: 'You clicked the button!',
  icon: 'error',
  button: 'Go to login page'
});</script>";
	echo "<a href='conduc-login.php'>Go to login page</a>";
	
	//header('Location:conduc-login.php');
}

?>