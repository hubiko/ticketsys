<?php
     $this->link = mysqli_connect('localhost:3307', 'root', '', 'tickety');
     mysqli_query($this->link, "SET NAMES 'utf8'");
?>