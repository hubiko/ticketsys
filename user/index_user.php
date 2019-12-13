<head>
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
  <nav>
    <a href="./ticket_new">Nový ticekt</a>
    <a href="./ticket_view">Mé tickety</a>
  </nav>
  <article id='user_up'>
    <section id='user_info'>
        <?php session_start();
          require_once("../account.php");
          $show = new Account();             //profilové info
          $show->Show();
        ?>
    </section>
    <section id='user_ticketsPartly'>
      <?php
        require_once("./tickets.php");
        $showPart = new Tickets();
        $showPart->ShowPart();
      ?>    
    </section>
  </article>
  <article id='user_down'>

  </article>
  
</body>

<?php 
	if(isset($_SESSION["id"]) && isset($_SESSION["name"]) && isset($_SESSION["lastname"]) && 
	isset($_SESSION["nick"]) && isset($_SESSION["email"]) && isset($_SESSION["autor"]) 
	&& $_SESSION["autor"]==3) {    
                                         //kód
		echo "user";                                                 
		echo "<form action='#' method='post'>                            
		<input type='submit' name='logout' value='Odhlásit se'>
		</form>";
		if(isset($_POST["logout"])) {
			
			session_start();
			$logout = new Account();
			$logout->Unlog();
		}
		
	$id = $_GET["uid"]; //ošetřit
  echo $_SESSION["id"];

    

    
    

  }
