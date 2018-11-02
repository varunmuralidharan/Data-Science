<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body>
<?php
	session_start();
	require 'common-sqlconnect.php';
	$q = $_GET["term"];
	
	$sql = "SELECT busno FROM listofbusses WHERE route LIKE '%". mysql_real_escape_string($q) ."%'";	
	$res = mysqli_query($conn, $sql);
	if (mysqli_num_rows($res) > 0) {
		 while($row = mysqli_fetch_assoc($res)){
			 $busno = $row["busno"];
		 }
	}
	 
	$sql2 = "SELECT stops FROM ".$busno." WHERE stops LIKE '%".mysql_real_escape_string($q)."%'";
	$res2 = mysqli_query($conn , $sql2);
	if(mysqli_num_rows($res2) > 0){
		while($row = mysqli_fetch_assoc($res2)){
			echo '<option>'.$row["stops"],'<option>';
		}
	}
	mysqli_close($conn);
	?>
</body>
</html>