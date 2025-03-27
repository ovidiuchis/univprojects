<?php
  $plecare=$_GET['plecare'];
  $sosire=$_GET['sosire'];
  mysql_connect("localhost", "root", "") or die(mysql_error());
  mysql_select_db("programare_web") or die(mysql_error());
  $result = mysql_query("SELECT * FROM trenuri where plecare=\"$plecare\" and sosire=\"$sosire\"");

  printf("{ \"trenuri\": [ ");
  while ($row = mysql_fetch_array($result)) {
//    printf("Trenul de la %s la %s pleaca la ora %d si %d minute", $row['plecare'], $row['sosire'], $row['ora'], $row['minut']);
    printf("{ \"plecare\": \"%s\", \"sosire\": \"%s\", \"ora\": %d, \"minut\": %d}, ", $row['plecare'], $row['sosire'], $row['ora'], $row['minut']);
  }
  printf(" ] }");
?>
