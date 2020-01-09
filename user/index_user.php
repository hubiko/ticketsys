<head>
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
  <?php $id = $_GET['uid'];
  ?>
  <div class="sidebar">
    <div class="sHeader">
    
    </div>
    <?php 
      include "./nav.php";
    ?>
  </div>

  <div class="content">
    <div class="cHeader">
    
    </div>
    <div class="window">
        <div class="wHeader">
          <h3>Nový ticket</h3>
        </div>
        <form method="post">
            <table>
              <tr><td>Předmět:</td><td><input type="text" name="subject" ></td></tr>
              <tr><td>Kategorie:</td>
              <td><select name='category'>
                    <option value='obecné'>obecné</option>
                    <option value='hardware'>hardware</option>
                    <option value='software'>software</option>             
                  </select> </td></tr>
              <tr><td>Zpráva:</td><td><textarea cols='100' rows='10'name="desc"></textarea></td></tr>
              <tr><td>Odpovědi na mail:</td><td><input type='checkbox' name='mail'></td></tr>
              <tr><td><input type="submit" name="ok" value="Přidat"></td><td></td></tr>
            </table>
        </form>

<?php
    if(isset($_POST["ok"])) {
        $sub = $_POST["subject"];
        $desc = $_POST["desc"];
        $category = $_POST["category"];
        $mail = $_POST["mail"];
        
        if($sub == null || $desc == null || $category == null) {
          echo "Vyplňtě všechna pole formuláře.";
        } else {
            require_once("./tickets.php");
            $ticket = new Ticket($sub, $category, $desc, $mail);
            $ticket->Add();
        }
    }    
?>
    </div>
    <div class="info">
      
    </div>
  </div>
  
  <!--<article id='user_up'>
    <section id='user_info'>
    <?php /*session_start();
          require_once("../account.php");
          $show = new Account();             //profilové info
          $show->Show();
        ?>
          <form action="#" method='post'>
            <input type="submit" name="logout" value="Odhlásit se">
          </form>
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
		
		
	$id = $_GET["uid"]; //ošetřit
  echo $_SESSION["id"];
  if(isset($_POST["logout"])) {
    
    session_start();
    $logout = new Account();
    $logout->Unlog();
      }
    }
  */?>
    
