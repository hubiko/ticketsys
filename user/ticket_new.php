
<head>
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<?php include "./nav.php";?>
<form method="post">
  <h1>Nový ticket</h1>
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