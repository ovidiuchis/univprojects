<html>
<head>
      <title>Un alt exemplu cu AJAX si PHP</title>
      <link href="style.css" type="text/css" rel="stylesheet">
      <script type="text/javascript" src="ajax.js">
      </script>
</head>

<?php
  mysql_connect("localhost", "root", "") or die(mysql_error());
  mysql_select_db("programare_web") or die(mysql_error());
  $result = mysql_query("SELECT max(length(plecare)) AS n FROM trenuri");
  $row = mysql_fetch_array($result);
  $n = $row['n'];
?>

<body>
<!--
<body onLoad="document.getElementById('afiseaza').disabled=true; document.getElementById('plecare').selectedIndex = 0;">
-->

<table border="0">
  <tr>
    <td>Statie de plecare:</td>
    <td>
      <select id="plecare" onChange="doRequest('plecare', this.options[this.selectedIndex].value, 'sosire', 'GET')">
      <option value="NA" selected="selected">
        <?php
          for ($i = 0; $i < $n; $i++)
            printf(" ");
        ?></option>

      <?php
      $result = mysql_query("SELECT plecare FROM trenuri group by plecare order by plecare");
      while ($row = mysql_fetch_array($result)) {
        printf("<option value=\"%s\">%s</option>\n", $row['plecare'], $row['plecare']);
      }
      ?>
     </select>
    </td>
  </tr>
  <tr>
    <td>Statie de sosire:</td>
    <td>
      <select id="sosire">
      </select>

    </td>
  </tr>
  <tr><td colspan="2"></td></tr>
  <tr><td colspan="2"><input type="button" value="Afiseaza Trenurile" disabled="disabled" id="afiseaza" onClick="doAnotherRequest('plecare', 'sosire', 'GET')"/></td></tr>
  </table>

<br>

<div id="mersulTrenurilor">
</div>

</body>

</html>