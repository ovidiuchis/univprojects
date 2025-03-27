<?php

$formEmail = $_POST['email'];
$formPassword = $_POST['parola'];

mysql_connect("localhost", "bufny", "cucubau") or die(mysql_error());
mysql_select_db("bufny") or die(mysql_error());

$query = "SELECT * FROM useri WHERE email='" . $formEmail . "' AND parola='" . $formPassword ."'";
print "Execut: " . $query . "<br>";
$result = mysql_query($query);
if (mysql_num_rows($result) != 1) {
  // Userul si parola sunt incorecte
  header("Location: invalidLogin.php");
  return;
}
else {
  session_start();
  print "Userul si parola corecte.<br>";
  $_SESSION['email'] = $formEmail;
  ?>
  Click <a href="bankAccount.php">aici</a> pentru a accesa o pagina protejata.
  <?php
}
?>



































<?php
/*
Exemplu de select:

select * from useri where email='bufny@cs.ubbcluj.ro' and parola='sdfsdfcs';

Daca se introduce parola:
sdfsdfcs' or email='bufny@cs.ubbcluj.ro
selectul de mai sus intoarce intotdeauna o inregistrare! (inregistrarea pentru userul curent).
*/
?>