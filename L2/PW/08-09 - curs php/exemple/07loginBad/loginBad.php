<?php
    $formEmail = $_POST['email'];
    $formPassword = $_POST['parola'];

    mysql_connect("localhost", "root", "") or die(mysql_error());
    mysql_select_db("bufny") or die(mysql_error());

    $query = "SELECT * FROM useri WHERE email='$formEmail' AND parola='$formPassword'";
    print "Execut: $query<br/>";
    $result = mysql_query($query);
    if (mysql_num_rows($result) != 1)
        print "Userul si parola sunt incorecte.<br/>";
    else
        print "Autentificare reusita. Trebuie sa afisez suma din contul utilizatorului $formEmail<br/>";
?>



































<!--

Exemplu de select:

select * from useri where email='bufny@cs.ubbcluj.ro' and parola='sdfsdfcs';

Daca se introduce parola:
sdfsdfcs' or email='bufny@cs.ubbcluj.ro
selectul de mai sus intoarce intotdeauna o inregistrare! (inregistrarea pentru userul curent).

-->
