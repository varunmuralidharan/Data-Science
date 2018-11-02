<?php 
	require 'common-sqlconnect.php';
	session_start();
	if(isset($_GET["source"],$_GET["destination"],$_GET["ticketcount"],$_SESSION["busno"])){
		$source = $_GET["source"];
		$_SESSION["source"] = $_GET["source"];
		$destination = $_GET["destination"];
		$_SESSION["destination"] = $_GET["destination"];
		$ticketcount = $_GET["ticketcount"];
		$_SESSION["ticketcount"] = $_GET["ticketcount"];
		$busno = $_SESSION["busno"];
		
		$counter = 0;
		$sql = "UPDATE ".$busno." SET bookcount = bookcount + ".$ticketcount." WHERE stops = '".$source."'";
		echo $sql;
		$res = mysqli_query($conn,$sql);
		if(mysqli_affected_rows($conn) > 0){
			$counter++;
		}
		
		$sql2 = "UPDATE ".$busno." SET getdowncount = getdowncount + ".$ticketcount." WHERE stops = '".$destination."'";
		echo $sql2;
		$res2 = mysqli_query($conn,$sql2);
		if(mysqli_affected_rows($conn) > 0){
			$counter++;
		}
		
		$sql3 = "SELECT seq FROM ".$busno." WHERE stops = '".$source."';";
		$res3 = mysqli_query($conn,$sql3);
		$row = mysqli_fetch_assoc($res3);
		$source_seq = $row["seq"];
		
		
		$sql4 = "SELECT sum(bookcount),sum(getdowncount) FROM ".$busno." WHERE seq BETWEEN 1 AND ".$source_seq.";";
		$res4 = mysqli_query($conn,$sql4);
		if(mysqli_num_rows($res3)>0){
			while($row = mysqli_fetch_assoc($res4)){
				$occupiedSeats = $row["sum(bookcount)"] - $row["sum(getdowncount)"];
			}
		}
	}
	
	if(isset($res,$res2)){
		if($counter > 1){
			echo "<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script><script>swal({
			title:'Updated successfully',
			text:'".$occupiedSeats."',
			icon:'success',
			})
			.then(function(){
				location.href='conduc-ticket-generation.php'
			});
			</script>
			";
		}
		else{
			echo "<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script><script>swal({
			title:'Update failed',
			text:'".$occupiedSeats."',
			icon:'error',
			})
			.then(function(){
				location.href='conduc-ticket-generation.php'
			});</script>";
		}
	}
?>