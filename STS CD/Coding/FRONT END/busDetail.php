<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width , intial-scale=1">
<title>bus Detail</title>
<link rel="stylesheet" href="css/busDetail.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body onLoad="getlatlng()">
<?php 
	require 'common-sqlconnect.php';
	session_start();
	
	if(isset($_GET["busno"])){
		$busno = $_GET["busno"];
		$_SESSION["busno"]= $busno;	
	}
	
	if(isset($_SESSION["source"],$_SESSION["destination"])){
		$source = $_SESSION["source"];
		$destination = $_SESSION["destination"];
	}
	
	$count = 0;
	$sql0 = "SELECT stops FROM ".$busno." WHERE busno = '".$busno."';";
	$res0 = mysqli_query($conn,$sql0);
	if(mysqli_num_rows($res0) > 0){
		while($row = mysqli_fetch_assoc($res0)){
			$stops[] = $row["stops"];
			$count++;
		}
	}
	
	$sql1 = "SELECT seq FROM ".$busno." WHERE stops = '".$source."'";
	$res1 = mysqli_query($conn , $sql1);
	if(mysqli_num_rows($res1) > 0){
		while($row = mysqli_fetch_assoc($res1)){
			$source_seq = $row["seq"];
		}
	}
	
	$sql2 = "SELECT sum(bookcount),sum(getdowncount) FROM ".$busno." WHERE seq BETWEEN 1 AND ".$source_seq.";";
	$res2 = mysqli_query($conn,$sql2);
	if(mysqli_num_rows($res2) > 0){
		while($row = mysqli_fetch_assoc($res2)){
			$bookcountTotal = $row["sum(bookcount)"];
			$getdowncountTotal = $row["sum(getdowncount)"];
		}
	}
	
	$sql3 = "SELECT seat FROM listofbusses WHERE busno = '".$busno."';";
	$res3 = mysqli_query($conn,$sql3);
	if(mysqli_num_rows($res3) > 0){
		while($row = mysqli_fetch_assoc($res3)){
			$TotalSeat = $row["seat"];
		}
	}
	
	$freeSeat = $TotalSeat - $bookcountTotal + $getdowncountTotal;
	mysqli_close($conn);
?>
<header>
<div class="wrapper">
	<div class="header-container">
		<div class="head1">
			<i class="fa fa-arrow-left back" aria-hidden="true"></i>
			<div class="logo">
				<img src="assets/white_logo.png" alt="company_logo">
			</div>
		</div>
		<div class="head2">
			<h2 id="bus_name"><?php if(isset($busno)){ echo $busno; }?></h2>
			<input type="text" name="from" id="from" placeholder="From" value="<?php if(isset($_SESSION["source"])) {echo $_SESSION["source"];} ?>" disabled>
			<input type="text" name="to" id="to" placeholder="To" value="<?php if(isset($_SESSION["destination"])) {echo $_SESSION["destination"];} ?>" disabled>
		</div>
	</div>
</div>
</header>
<div class="container">
	<div class="wrapper">
		<div class="content_area">
			<div class="header2">
				<div class="seats">
					<h4>Free Seats</h4>
					<p class="seatCount"><?php if(isset($freeSeat)){ echo $freeSeat; }; ?></p>
				</div>			
				<div class="arrivalTime">
					<h4>Arriving in</h4>
					<p class="countdown"></p>
				</div>
			</div>
			<div class="mapsContainer">
				<div id="map-canvas"></div>
			</div>
			<button id="getGPSlocation">Get GPS location</button>
			<div class="infoArea">
				<div class="infotitle">Bus Stops</div>
				<div class="viaStages">
					<p>via</p>
					<div id="stops"><?php for($i=0;$i<$count;$i++){ echo $stops[$i]; } ?></div>	
				</div>
			</div>
		</div>
	</div>
</div>
<div id="lat" style="display: none">0</div>
<div id="lng" style="display: none">0</div>
<div id="destlat" style="display: none">0</div>
<div id="destlng" style="display: none">0</div>
<script> 
	
	function getlatlng(){
			if(window.XMLHttpRequest){
				xmlreq = new XMLHttpRequest();
			}
			xmlreq.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200 ){
				console.log(this.responseText);
				var location = this.responseText.split(" ");
				var lat = location[4];
				var lng = location[5];
				document.getElementById("lat").innerHTML = lat;
				document.getElementById("lng").innerHTML = lng;
				getdestlatlng();
			}
		}
		xmlreq.open("GET","busDetail-getlocation.php",true);
		xmlreq.send();
		
		var getdestlatlng = function(){
			req = new XMLHttpRequest();
			req.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var destlocation = this.responseText.split(" ");
					var destlat = destlocation[4];
					var destlng = destlocation[5];
					document.getElementById("destlat").innerHTML = destlat;
					document.getElementById("destlng").innerHTML = destlng;
				}
			}
			req.open("GET","busDetail-getdestlocation.php",true);
			req.send();
		};
	}
	
	
	 function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
          zoom: 7,
          center: {lat:13.082407 , lng:80.281369}
        });
        directionsDisplay.setMap(map);
		 
		 var buttonclickhandler = function(){
			 console.log("button clicked");
			 var latitude = document.getElementById("lat").innerHTML;
			 var longitude = document.getElementById("lng").innerHTML;
			 console.log(latitude,longitude);
			 var start = new google.maps.LatLng(latitude,longitude);
			 var destlat = document.getElementById("destlat").innerHTML;
			 var destlng = document.getElementById("destlng").innerHTML;
			  console.log(destlat,destlng);
			 var end = new google.maps.LatLng(destlat,destlng);
			 calculateAndDisplayRoute(directionsService, directionsDisplay,start,end);
		 }
		document.getElementById("getGPSlocation").addEventListener('click',buttonclickhandler);
      }
	
	 function calculateAndDisplayRoute(directionsService, directionsDisplay,start,end) {
        directionsService.route({
          origin: start,
          destination: end,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
			document.querySelector(".countdown").innerHTML = response.routes[0].legs[0].duration.text;
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnmJ8ez8q-iloQYZvT-20BgRvYmtnSUXA&callback=initMap">
</script>
</body>
</html>