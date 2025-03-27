<?php    
    $formEmail = $_POST['email'];
    $formPassword = $_POST['parola'];

    mysql_connect("localhost", "root", "") or die(mysql_error());
    mysql_select_db("bufny") or die(mysql_error());

    $query = "SELECT * FROM useri WHERE email='$formEmail'";
    // print $query . "<br/>";

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
    print "Parola valida. Sunteti autentificat ca " . $formEmail;

    foreach($_COOKIE as $header => $value)
        echo "<li>$header = $value</li>";

    print "<br/>";
    print "Id-ul de sesiune este: " . session_id() . "<br/>";

    $_SESSION['email'] = $formEmail;
?>

Click <a href="bankAccount.php">aici</a> pentru a accesa o pagina protejata.
