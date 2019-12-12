<?php
    class Register extends Login {
        public $name, $lastname, $passg, $email;

        public function __construct($name, $lastname, $passg, $email) {
            parent::__construct();
            $this->name = $name;
            $this->lastname = $lastname;
            $this->passg = $passg;
            $this->email = $email;
        }

        public function Add() {
            if($this->name==null || $this->lastname==null || $this->nick==null || $this->pass==null || $this->passg==null || $this->email==null) {
                echo "Vyplňtě všechna políčka formuláře.";
            } 
            else {
                if($pass!=$passg)
                    echo "Hesla se neshodují";
                else {
                    $pass = md5(md5($pass));
                    $link = mysqli_connect('localhost:3307', 'root', '', 'tickety');
                    $zapis = mysqli_query($link, "insert into uzivatele values (null, '$this->name', '$this->lastname', '$this->nick', '$this->pass', '$this->email', 3)");
                    if($zapis)
                      echo "Registrace proběhla úspěšně";
                  }
            } 
        }
    }
?>

     

<?php
      
      
                                                
   
?>