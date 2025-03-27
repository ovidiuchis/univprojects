<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
if ((!isset($_POST['oras']))||(!isset($_POST['desc']))||(!isset($_POST['parcare'])))
    die("Nu s-au completat toate datele");
  else {
      include "DBCon.php";
    mysql_select_db("cobd0429") or die(mysql_error());

    $oras= addslashes($_POST['oras']);
    $desc= addslashes($_POST['desc']);
    $facil= addslashes($_POST['facilitati']);
    $parcare= addslashes($_POST['parcare']);
    mysql_query("INSERT INTO aeroporturi(oras, descriere, facilitati,parcare) VALUES('" . $oras . "', '" . $desc .  "', '" . $facil .  "', '" . $parcare.  "')")
    or die(mysql_error());
    header("Location: aeroporturi.php");

  }

?>
