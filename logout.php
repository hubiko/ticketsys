<?php session_start(); 
            unset($_SESSION["id"]);
            unset($_SESSION["jmeno"]);
            unset($_SESSION["prijmeni"]);
            unset($_SESSION["nick"]);
            unset($_SESSION["email"]);
            unset($_SESSION["autorizuje_id"]);
            header("Location: ./index.php");