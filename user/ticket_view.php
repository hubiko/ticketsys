<?php
    echo "tickets viewed.";
    require_once("./tickets.php");
    $tickets = new Tickets();
    $tickets->ShowPart();
?>