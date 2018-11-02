<?php
    session_start();
    if(isset($_GET["result"])){
        $result = $_GET["result"];
        $res = explode(",",$result);
        $source = $res[0];
        $destination = $res[1];
        $ticketcount = $res[2]; 
    }
?>
<style>
    .wrapper{
        width:80%;
        margin:0 auto;
        text-align:center;
    }
    .source:before{
        content:'Source: ';
    }
    .destination:before{
        content:'Destination: ';
    }
    .ticketcount:before{
        content:'Number of tickets: ';
    }
    .today_date:before{
        content:'Ticket issued date: ';
    }
</style>
<body>
    <div class="wrapper"> 
        <div class="ticket_info">
            <p class="source"><?php if(isset($source)){echo $source;} else{ echo ("<script>document.write(localStorage.getItem('source'));</script>");} ?></p>
            <p class="destination"><?php if(isset($destination)){echo $destination;} else { echo ("<script>document.write(localStorage.getItem('destination'));</script>");} ?></p>
            <p class="ticketcount"><?php if(isset($ticketcount)){echo $ticketcount;} else {echo ("<script>document.write(localStorage.getItem('ticketcount'));</script>");} ?></p>
            <p class="today_date">0 <?php echo("<script>if(localStorage.getItem('date') != null || localStorage.getItem('date') != undefined){document.write(localStorage.getItem('date'));}</script>"); ?></p>
            <button id="save_btn" onclick="savedata()">Save ticket</button>
            <button id="home_btn" onclick="homepageredirect()">Go to home page</button>
        </div>
    </div>
</body>

<?php
    if(isset($source,$destination,$ticketcount)){
    ?>
    <script>
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1;
        var yyyy = today.getFullYear();
        if(dd<10){
         dd='0'+dd;
     };
     if(mm<10){
         mm='0'+mm;
     }; 
     var tod = dd+'/'+mm+'/'+yyyy;
     document.querySelector(".today_date").innerHTML = tod;

     function savedata(){
        var source = document.querySelector(".source").innerHTML;
        console.log(source);
        var destination = document.querySelector(".destination").innerHTML;
        console.log(destination);
        var ticketcount = document.querySelector(".ticketcount").innerHTML;
        console.log(ticketcount);
        var todayDate = document.querySelector(".today_date").innerHTML;
        localStorage.setItem('source',source);
        localStorage.setItem('destination',destination);
        localStorage.setItem('ticketcount',ticketcount);
        localStorage.setItem('date',todayDate);

        //checking if item is set
        console.log(localStorage.getItem('source'));
        console.log(localStorage.getItem('destination'));
        console.log(localStorage.getItem('ticketcount'));
        console.log(localStorage.getItem('date'));
     }

    </script>
    <?php
    }
?>
<script>
        function homepageredirect(){
         window.location = "index.html";
     }
</script>