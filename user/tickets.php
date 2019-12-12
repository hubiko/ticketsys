<?php
    class Ticket {
        public $id, $subject, $desc, $category, $mail, $user_id, $category_id, $date, $autor_id,
        $status_id, $cat_query, $cat_db, $insert, $link, $status;

        public function __construct($subject, $category, $desc, $mail) {
            $this->subject = $subject;
            $this->category = $category;
            $this->desc = $desc;
            $this->mail = $mail;
        }

        public function getUserId() {
            session_start();
            $this->user_id = $_SESSION["id"];
            return $this->user_id;
        }
        public function getCategoryId() {
            $this->link = mysqli_connect('127.0.0.1:3306', 'root', '', 'tickety');
            $this->cat_query = mysqli_query($this->link, "select id from kategorie where typ='$this->category'");
            while($this->cat_db = mysqli_fetch_object($this->cat_query)) {
              $this->category_id = $this->cat_db->id;
            }  
            return $this->category_id;              
        }
        public function getDate() {
            $this->date = date("Y/m/d h:i:s");
            return $this->date;
        } 

        public function Add() { //ticket_new.php   
            $this->link = mysqli_connect('127.0.0.1:3306', 'root', '', 'tickety');                                                                                                     
            $this->insert = mysqli_query($this->link, "insert into tickety values (null, '$this->subject', 
            '$this->desc', '".$this->getCategoryId()."', 
            '".$this->getUserId()."', 3, 1, 0, '".$this->getDate()."', 0)");
            if($this->insert) 
                echo "Přidán nový ticket.";
            else 
                echo "!!!";
        }

        public function Delete() {

        }
        public function ChangeStatus() {

        }
        public function Change() {

        }
    }

    class Tickets extends Ticket{
        public $ticket_query, $status_query, $status_c, $q, $record;
        public function ShowAll() { //ticket_view.php

        }

        public function ShowPart() { 
             $this->link = mysqli_connect('localhost:3306', 'root', '', 'tickety');
             $this->ticket_query = mysqli_query($this->link, "select * from tickety where ma_uzivatele_id=".$this->getUserId()."
              order by id desc");
             foreach($ticket_query as $q) {               
                 $this->cat_query = mysqli_query($this->link, "select * from kategorie where 
                 id=".$this->q["kategorizuje_id"]."");
                 $this->record = mysqli_fetch_object($this->cat_query);
                 $this->category = $this->record->typ;              
                 
                 $this->status_query = mysqli_query($this->link, "select * from statusy where 
                 id=".$this->q["statusuje_id"]."");
                 $this->record = mysqli_fetch_object($this->status_query);
                 $this->status = $this->record->nazev;
                 $this->status_c = $this->record->barva;
                 
                 $this->user_query = mysqli_query($this->link, "select * from uzivatele where 
                 id=".$this->d["ma_uzivatele_id"]."");
                 $this->record = mysqli_fetch_object($this->user_query);
                 $this->user = $this->record->nick;
                 $this->id_ticket = $this->d["id"];
                 echo "<tr><td>".$this->d["id"]."</td><td>".$this->d["predmet"]."</td><td>$this->category</td>
                 <td style='background-color: $this->status_c;'>$this->status</td>
                 <a href='./ticket_one_user.php?uid=$id&tid=$id_ticket'>+</a></td></tr>";
             }                             
         } 


    }
?>