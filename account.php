
<?php
    class Account {
        private $id, $name, $lastname, $nick, $pass, $email;
        public function Show() {    //zobrazí veškeré info o uživateli
            echo "<form method='post'>
            <table>
            <tr><td>ID: </td><td>".$_SESSION['id']."</td></tr>
            <tr><td>Jméno: </td><td>".$_SESSION['name']."</td></tr>
            <tr><td>Příjmení: </td><td>".$_SESSION['lastname']."</td></tr>
            <tr><td>Email: </td><td>".$_SESSION['email']."</td></tr>
            <tr><td>Nick: </td><td>".$_SESSION['nick']."</td></tr>        
            </table>
          </form><br>";
          }

        public function Edit() {

        } 
        
        public function Unlog(){
            unset($_SESSION["id"]);
            unset($_SESSION["name"]);
            unset($_SESSION["lastname"]);
            unset($_SESSION["nick"]);
            unset($_SESSION["email"]);
            unset($_SESSION["autor"]);
            header("Location: ../index.php");
        }
        
    }
    class Login extends Account {
        private $nickDB, $passDB, $link, $dotaz, $zapis;
        
        
        public function __construct($nick, $pass) {
            $this->nick = $nick;
            $this->pass = $pass;
        }

        public function LogIn() {
			
			include("./connectDB.php");//doma port 3307
			$this->pass=md5(md5($this->pass));
            $this->dotaz = mysqli_query($this->link, "select * from uzivatele where nick='$this->nick'
             and heslo='$this->pass'");
            while($this->zapis = mysqli_fetch_object($this->dotaz)) {
                $this->id = $this->zapis->id;
                $this->name = $this->zapis->jmeno;
                $this->lastname = $this->zapis->prijmeni;
                $this->nickDB = $this->zapis->nick;
                $this->passDB = $this->zapis->heslo;
                $this->email = $this->zapis->email;
                $this->autor = $this->zapis->autorizuje_id;     
            }
            echo $this->id;
            if($this->pass == isset($this->passDB)) {
                $_SESSION["id"] = $this->id;
                $_SESSION["name"] = $this->name;
                $_SESSION["lastname"] = $this->lastname;
                $_SESSION["nick"] = $this->nick;
                $_SESSION["email"] = $this->email;
                $_SESSION["autor"] = $this->autor;
                echo "Vítej ".$_SESSION["name"].""; 
                //echo "<td><a style='color: black;' href='user_prof.php?uid=".$_SESSION["id"]."'>Tickety</a></td>";
                echo $_SESSION["autor"];
                if($this->autor==3) {
                 header("Location: ./user/index_user.php?uid=".$_SESSION["id"]."");
				 }
                else {
                 header("Location: ./admin/index_admin.php?uid=".$_SESSION["id"].""); 
				}
                die();       
            } else 
               echo "Zadal jsi špatný login."; 
        }
    }

    class Register extends Account {
        public function __construct($name, $lastname, $nick, $pass, $passg, $email) {
            $this->name = $name;
            $this->lastname = $lastname;
            $this->nick = $nick;
            $this->pass = $pass;
            $this->passg = $passg;
            $this->email = $email;
        }

        public function Add() {
            if($this->name==null || $this->lastname==null || $this->nick==null || $this->pass==null || 
            $this->passg==null || $this->email==null) {
                echo "Vyplňtě všechna políčka formuláře.";
            } 
            else {
                if($this->pass!=$this->passg)
                    echo "Hesla se neshodují";
                else {
                    $this->pass = md5(md5($this->pass));
                    include("./connectDB.php");
                    $this->zapis = mysqli_query($this->link, "insert into uzivatele values (null, 
                    '$this->name', '$this->lastname', '$this->nick', 
                    '$this->pass', '$this->email', 3)");
                    if($this->zapis)
                      echo "Registrace proběhla úspěšně";
                  }
            } 
        }
    }
?>