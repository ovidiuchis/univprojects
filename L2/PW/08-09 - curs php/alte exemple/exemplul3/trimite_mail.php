<?php
     $email = $_POST['email'];
     $from = $_POST['from'];

     mail("bufny@cs.ubbcluj.ro", "Salutari din Guest Book", $email, "From: $from");
     print "Done.";
?>
