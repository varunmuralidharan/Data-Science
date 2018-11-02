
<html>
<head>
<title>Ticket generation</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width , intial-scale=1">
</head>
<style>
    .wrapper{
        width:50%;
        margin:0 auto;
        text-align:center;
    }
    img{
        margin-bottom:50px;
    }
    #mainPage{
        text-align:center;
        margin-left:-16%;
        margin-top:50px;
    }
</style>
<body>
<div class="wrapper">
<?php 
    session_start();
    include "QRGenerator.php";
    $text = $_SESSION["source"].",".$_SESSION["destination"].",".$_SESSION["ticketcount"];
    $qrcode = new QRGenerator($text,50);
    print "<img src='". $qrcode->generate() ."' height='150px' width='150px'>"
?>
    <button id="mainPage" onclick="gotomainpage()">Go to main page</button>
</div>
</body>
<script>
    function gotomainpage(){
        window.location="conduc-mainpage.php";
    }
</script>
</html>