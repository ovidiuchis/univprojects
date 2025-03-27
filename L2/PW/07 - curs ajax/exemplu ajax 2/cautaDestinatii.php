<?php
  $plecare=$_GET['plecare'];
  mysql_connect("localhost", "root", "") or die(mysql_error());
  mysql_select_db("programare_web") or die(mysql_error());
  $result = mysql_query("SELECT sosire FROM trenuri where plecare=\"$plecare\" group by sosire order by sosire");

  printf("{\"sosiri\": [ ");
  while ($row = mysql_fetch_array($result))
    printf("\"%s\",", $row['sosire']);
  printf(" ] }");
?>
