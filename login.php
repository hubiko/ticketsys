<?php
    class Login {
        public $id, $name, $lastname, $nick, $nickDB, $pass, $passDB, $email, $link, $dotaz, $zapis;

        public function __construct($nick, $pass) {
            $this->nick = $nick;
            $this->pass = $pass;
        }

        public function LogIn() {
			
			$this->link = mysqli_connect('localhost:4306', 'root', '', 'tickety'); //doma port 3307
			$this->pass=md5(md5($this->pass));
            $this->dotaz = mysqli_query($this->link, "select * from uzivatele where nick='$this->nick' and heslo='$this->pass'");
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
                $_SESSION["jmeno"] = $this->name;
                $_SESSION["prijmeni"] = $this->lastname;
                $_SESSION["nick"] = $this->nick;
                $_SESSION["email"] = $this->email;
                $_SESSION["autorizuje_id"] = $this->autor;
                echo "Vítej ".$_SESSION["jmeno"].""; 
                //echo "<td><a style='color: black;' href='user_prof.php?uid=".$_SESSION["id"]."'>Tickety</a></td>";
                echo $_SESSION["autorizuje_id"];
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

        public function Unlog(){
            unset($_SESSION["id"]);
            unset($_SESSION["jmeno"]);
            unset($_SESSION["prijmeni"]);
            unset($_SESSION["nick"]);
            unset($_SESSION["email"]);
            unset($_SESSION["autorizuje_id"]);
            header("Location: ./index.php");
        }
    }
?>