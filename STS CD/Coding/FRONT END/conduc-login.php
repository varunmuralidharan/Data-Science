<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width , intial-scale=1">
<title>Conductor Login</title>
<link rel="stylesheet" href="css/conduc_login.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<?php 
	session_start();
	require 'common-sqlconnect.php';
	$sql = "SELECT busno FROM conductorlogin";
	$res  = mysqli_query($conn,$sql);
?>
<div class="wrapper">
	<div class="login_form">
		<div class="titleLogo">
			<img src="assets/blue_logo.png" alt="logo">
		</div>
		<div class="login_content">
			<form action="conduc-login-validate.php" method="get">
				<div class="busno_content">
					<label for="busno">Busno</label>
					<input type="text" name="busno" id="busno" list="mybusno">
					<datalist id="mybusno">
						<?php 
							if(mysqli_num_rows($conn) > 0){
								while($row = mysqli_fetch_assoc($res)){
									echo "<option>".$row['busno']."</option>";
								}
							}
						?>
					</datalist>
				</div>
				<div class="password_content">
					<label for="password">Password</label>
					<input type="password" id="password" name="password">
				</div>
				<input type="submit" value="Login">
			</form>
		</div>
	</div>
</div>
</body>
</html>