<?php
    error_reporting(0);
    session_start(); // session.auto_start = 0 in php.ini

    $email = $_SESSION['email'];

    if ($email == "") {
        print 'Nu sunteti autentificat. Va rugam sa mergeti la <a href="form.php">pagina de login</a> pentru a va autentifica.';
        return;
    }

    mysql_connect("localhost", "root", "") or die(mysql_error());
    mysql_select_db("bufny") or die(mysql_error());

    $query = "SELECT suma FROM useri WHERE email='$email'";
    // print $query . "<br/>";
    $result = mysql_query($query);
    $row = mysql_fetch_array($result);
    $suma = $row['suma'];
    // print $suma;

    print "Sunteti $email<br/>";
    print "In depozitul dumneavoastra se gasesc $suma euro.<br/>";
?>
<br/>  
<a href="logout.php">Log out</a>
