<head>
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
  
  <?php 
  include("../miniHeader.php");
  $id = $_GET['uid'];
  include("../sidebar.php") ;
  ?>

  <div class="content">
    <div class="cHeader">
      <h1 style="margin-left:2%; padding-top:40px;">Dashboard</h1>
    </div>
    <div class="contentBackg">
      <div class="window">
          <div class="wHeader">
            <h3>Nový ticket</h3>
          </div>
          <div class="wContent">
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
        
    </div>
    <div class="info">
        <div class="iHeader">
          <h3>Profil</h3>
        </div>
        <div class="iContent">
          <div class="avatar">
            <div class="pic">
              
            </div>
          </div>
          <div class="iTable">
            <?php session_start();
            require_once("../account.php");
            $show = new Account();             //profilové info
            $show->Show();
            ?>
          </div>
        </div>
    </div>
    </div>
  </div>
  
  <!--<article id='user_up'>
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
  ?>
    
