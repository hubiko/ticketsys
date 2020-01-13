<?php 
session_start();
$id = $_GET['uid'];
include("../miniHeader.php");?>

<head>
    <link rel="stylesheet" href="../css/main.css" type="text/css">
</head>

<body>
    <?php
        include("../sidebar.php");            
    ?>

    <div class="content">
        <div class="cHeader">
            <h1 style="margin-left:2%; padding-top:40px;">Tickety</h1>
        </div>
        <div class="window">
            <?php
                require_once("./tickets.php");
                $tickets = new Tickets();
                $tickets->ShowPart();
            ?>
        </div>
    </div>
</body>
