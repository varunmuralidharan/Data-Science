<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width , intial-scale=1">
<title>Bus Display</title>
<link rel="stylesheet" href="css/busesDisplay.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
</head>
<body>
<?php
	session_start();
	if(isset($_REQUEST["source"])){
		$_SESSION["source"] = $_REQUEST["source"];
		$_COOKIE["source"] = $_REQUEST["source"];
	}
	if(isset($_REQUEST["destination"])){
		$_SESSION["destination"] = $_REQUEST["destination"];
		$_COOKIE["destination"] = $_REQUEST["destination"];
	}
	
	require 'common-sqlconnect.php';
	
	$sql = "SELECT DISTINCT busno FROM listofbusses WHERE route LIKE '%".$_SESSION["source"]."%' AND route LIKE '%".$_SESSION["destination"]."%'";
	
	$res = mysqli_query($conn,$sql);
	if(mysqli_num_rows($res) > 0){
		while($row = mysqli_fetch_assoc($res)){
		$busno[] = $row["busno"];
		}
	}
	if(isset($busno)){
		$count = count($busno);
	}
	mysqli_close($conn);
?>
<header>
	<div class="wrapper">
		<div class="header_container">
			<div class="head1">
				<i class="fa fa-arrow-left back" onClick="go_back()" aria-hidden="true"></i>
				<div class="logo">
					<img src="assets/white_logo.png" alt="company_logo">
				</div>
				<i class="gps" style="visibility: hidden"></i>
			</div>
			<div class="head2">
				<input type="text" name="source" id="from"  value="<?php if(isset($_SESSION["source"])){ echo $_SESSION["source"]; }  ?>" disabled>
				<input type="text" name="destination" id="to"  value="<?php if(isset($_SESSION["destination"])) {echo $_SESSION["destination"]; }?>" disabled>
			</div>
		</div>
	</div>
</header>
<div class="container">
	<div class="wrapper">
		<div class="content_area">
			<div class="title">
				<h2>List of buses in route</h2>
			</div>
			<?php
				for($i=0;$i<$count;$i++){
			?>
			<div class="card">
				<h3 id="busname"><?php if(isset($busno[$i])){ echo $busno[$i]; }  ?></h3>
				<button id="check_avail" onClick="viewDetail(this)">Check Availability</button>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<script>
	function go_back(){
		window.location = "/stssite/index.html";
	}
	function viewDetail(ele){		
		var busno = ele.previousElementSibling.innerHTML;

		var d = new Date();
		var dd = d.getDate();
		var mm = d.getMonth()+1; 
		var day = new Array();
		day[0]="Sunday";
		day[1]="Monday";
		day[2]="Tuesday";
		day[3]="Wednesday";
		day[4]="Thursday";
		day[5]="Friday";
		day[6]="Saturday";
		var sendday = day[d.getDay()+1];
		var yyyy = d.getFullYear();
		if(dd<10){
			dd='0'+dd;
		} 
		if(mm<10){
			mm='0'+mm;
		} 
		var date = dd+'/'+mm+'/'+yyyy;
		
		var Hour = d.getHours();
		if(Hour>=4 && Hour<=10){
			var sendHour = "morn";
		}
		else if(Hour>=11 && Hour<=14){
			var sendHour = "noon";
		}
		else if(Hour>=15 && Hour<=19){
			var sendHour = "eve";
		}
		else if(Hour>=20 && Hour<=22){
			var sendHour = "night";
		}
		
		xmlreq = new XMLHttpRequest();
		xmlreq.onreadystatechange = function(){
			if(this.status == 200 && this.readyState == 4){
				window.location = "/stssite/busDetail.php?busno="+busno;
			}
		}
		xmlreq.open("GET","update-analysis.php?date="+date+"&segment="+sendHour+"&day="+sendday,true);
		xmlreq.send();
	}
</script>
</body>
</html>