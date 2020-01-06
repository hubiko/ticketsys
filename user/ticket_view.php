<?php include("../header.php");
session_start();include "./nav.php";?>

<head>
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>

<body>
<?php
    echo "tickets viewed.";
    require_once("./tickets.php");
    $tickets = new Tickets();
    $tickets->ShowAll();
?>
</body>