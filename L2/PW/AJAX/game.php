<?php
 error_reporting(0);
?>

<html>
<head>
<title>Joc X-0</title>
  <script type="text/javascript" src="ajax.js">
   </script>
</head>
<body onload="init()">

<form id="joc">
      <input type="button" id="0" value="   " onClick="doRequest(this.id, 'GET')"/>
      <input type="button" id="1" value="   " onClick="doRequest(this.id, 'GET')"/>
      <input type="button" id="2" value="   " onClick="doRequest(this.id, 'GET')"/><br/>
      <input type="button" id="3" value="   " onClick="doRequest(this.id, 'GET')"/>
      <input type="button" id="4" value="   " onClick="doRequest(this.id, 'GET')"/>
      <input type="button" id="5" value="   " onClick="doRequest(this.id, 'GET')"/><br/>
      <input type="button" id="6" value="   " onClick="doRequest(this.id, 'GET')"/>
      <input type="button" id="7" value="   " onClick="doRequest(this.id, 'GET')"/>
      <input type="button" id="8" value="   " onClick="doRequest(this.id, 'GET')"/>
</form>
</body>
</html>