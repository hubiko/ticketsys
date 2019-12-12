<form action='#' method='post'>
            <table>
              <h1>Registrace:</h1>
              <tr><td>Jméno:</td><td><input type='text' name='name'></td></tr>
              <tr><td>Příjmení:</td><td><input type='text' name='lastname'></td></tr>
              <tr><td>Nick:</td><td><input type='text' name='nick'></td></tr>
              <tr><td>Heslo:</td><td><input type='password' name='pass'></td></tr>
              <tr><td>Heslo znovu:</td><td><input type='password' name='passg'></td></tr>
              <tr><td>Email:</td><td><input type='text' name='email'></td></tr>
              <tr><td><input type='submit' name='ok_R' value='Zaregistrovat'></td><td></td></tr>
            </table>
</form>

<?php
    if(isset($_POST["ok_R"])) {
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $nick = $_POST["nick"];
        $pass = $_POST["pass"];
        $passg = $_POST["passg"];
        $email = $_POST["email"];
        require_once('./account.php');
        $register = new Register($name, $lastname, $nick, $pass, $passg, $email);
        $register->Add();				
    }
?>