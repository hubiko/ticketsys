
    <?php include ("./header.php");
            session_start();       
            if(isset($_SESSION["nick"])) {              //když jsi přihlášený, nemusíš se znovu přihlásit
            $link = mysqli_connect('localhost:3306', 'root', '', 'tickety');
            $dotaz = mysqli_query($link, "select * from uzivatele where id=".$_SESSION["id"]."");
            foreach($dotaz as $d) {
                $autor = $d["autorizuje_id"];
            }
                if($autor==3)  
                  header("Location: ./user/index_user.php?uid=".$_SESSION["id"]."");
                else 
                  header("Location: ./admin/index_admin.php?uid=".$_SESSION["id"]."");
                
                
          }?>
          
          <form action='#' method='post' class='frm'>
                <table class='window'>
                    <h1>Přihlášení:</h1>  
                    <tr><td>Nick:</td><td><input type='text' name='nick'></td></tr>
                    <tr><td>Heslo:</td><td><input type='password' name='pass'></td></tr> 
                    <tr><td><input type='submit' name='ok_L' value='Přihlásit se'></td><td></td></tr>
                </table>
            </form>
            <br>
           
         <?php
            
            
            if(isset($_POST["ok_L"])) {
                $nick = $_POST["nick"];
                $pass = $_POST["pass"];
                require_once('./account.php');
                $login = new Login($nick, $pass);
                $login->LogIn();				
            }         
    ?>
    <a href='./registration.php'>Registrace</a>
  </body>
</html>