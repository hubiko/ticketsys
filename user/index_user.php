<?php session_start();
	if(isset($_SESSION["id"]) && isset($_SESSION["name"]) && isset($_SESSION["lastname"]) && 
	isset($_SESSION["nick"]) && isset($_SESSION["email"]) && isset($_SESSION["autor"]) 
	&& $_SESSION["autor"]==3) {                                         //kód
		echo "user";                                                 
		echo "<form action='#' method='post'>                            
		<input type='submit' name='logout' value='Odhlásit se'>
		</form>";
		if(isset($_POST["logout"])) {
			require_once("../account.php");
			session_start();
			$logout = new Account();
			$logout->Unlog();
		}
		
	
$id = $_GET["uid"]; //ošetřit
echo $_SESSION["id"];
?>

<div id='main'>
  <div id='container'>
    <div id='profile'>
      <div id="menu">                         <!--Menu-->
        <a class='user_menu' <?php echo "href='ticket_view.php?uid=$id'";?>>Mé tickety</a>
        <a class='user_menu' <?php echo "href='ticket_new.php?uid=$id'";?>>Nový ticket</a>
      </div>
      
      <div id='UPbox'>  <!-- Vrchní-->     
        <div id='avatar'> 
        </div>
        
        <div id='tickets'>
          <table id="admin"> 
          <tr><td>ID</td> <td>Předmět</td> <td>Kategorie</td> <td>Status</td></tr>
          <?php
          
          require_once('./tickets.php');
          $show = new Tickets();
          $show->Show();
                                                                                                   
            echo "</table>";
           
?>
        </div>
      </div>
      
      <div id='DOWNbox'>  <!-- Spodní-->
        <div id='persinfo'>
            <?php $user = mysqli_query($link, "select * from uzivatele where id=$id");
            if($user) 
              foreach($user as $u) {
                $jmeno = $u["jmeno"];
                $prijmeni = $u["prijmeni"];
                $email = $u["email"];
                $nick = $u["nick"];
              }
            echo "<table>
              <tr><td>ID klienta:</td><td>$id</td></tr>
              <tr><td>Jméno:</td><td>$jmeno</td></tr>
              <tr><td>Příjmení:</td><td>$prijmeni</td></tr>
              <tr><td>Email:</td><td>$email</td></tr>
              <tr><td>Nick:</td><td>$nick</td></tr>
              <tr><td><a href='user_edit.php'>Změnit</a></td></tr>
            </table>";
          
         ?> 
        </div>
        
        <div id='compinfo'>
          <table>
            <tr><td>ID společnosti:</td><td></td></tr>
            <tr><td>Název společnosti:</td><td></td></tr>
            <tr><td>Adresa:</td><td></td></tr>
            <tr><td>Email:</td><td></td></tr>
            <tr><td>Telefon:</td><td></td></tr>              
          </table>
        </div>
      </div>      
    </div>
    
    <div id='stats'>     <!-- Statistiky-->
    </div>
  </div>
</div> 
	
<?php 

	}                                                                   //konec kódu

/*	else {
		header("Location: ../index.php");
	} */



	