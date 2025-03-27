<?php
  $host = "localhost";
  $user = "root";
  $pass = "";

  $con = mysql_connect($host, $user, $pass);
  if (!$con){
    echo "<a href='index.php'>Inapoi la prima pagina.</a><br>\n";
    die("Conexiunea s-a stricat:)");
  }
?>