<?php
	session_start();
	if(isset($_SESSION["id"]) && isset($_SESSION["name"]) && isset($_SESSION["lastname"]) && 
	isset($_SESSION["nick"]) && isset($_SESSION["email"]) && isset($_SESSION["autor"]) && $_SESSION["autor"]==1) {
		echo "admin";
		echo "<form action='#' method='post'>
		<input type='submit' name='logout' value='Odhlásit se'>
		</form>";
		if(isset($_POST["logout"])) {
			require_once("../account.php");
			session_start();
			$logout = new Account();
			$logout->Unlog();
		}
	} else {
		header("Location: ../index.php");
	}
	
?>