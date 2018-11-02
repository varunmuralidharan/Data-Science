<?php
	require 'common-sqlconnect.php';
	session_start();

	if(isset($_SESSION["busno"],$_GET["date"],$_GET["segment"],$_GET["day"])){
		$busno = $_SESSION["busno"];
		$date = $_GET["date"];
		$segment = $_GET["segment"];
		$day = $_GET["day"];
		
		$sql = "SELECT count(*) FROM analysis WHERE date='".$date."' AND segment ='".$segment."' AND busno ='".$busno."'";
		$res = mysqli_query($conn,$sql);
		if(mysqli_num_rows($res)){
			while($row = mysqli_fetch_assoc($res)){
				$check = $row["count(*)"];
				echo "Success";
			}
		}
		
		if($check == 1){
			$sql1 = "UPDATE analysis SET count = count+1 WHERE date='".$date."' AND segment ='".$segment."' AND busno ='".$busno."'";
			$res1 = mysqli_query($conn,$sql1);
			echo "updated";
		}
		
		else{
			$sql2 = "INSERT INTO analysis (date,segment,busno,count,day) VALUES ('".$date."','".$segment."','".$busno."',1,'".$day."')";
			$res2 = mysqli_query($conn,$sql2);
		}
	}
?>
