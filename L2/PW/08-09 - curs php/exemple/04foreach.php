<?php
$antrenori["CFR"] = "Cartu";
$antrenori["Steaua"] = "Lacatus";
$antrenori["Dinamo"] = "Andone";

foreach ($antrenori as $antrenor)
    print $antrenor . "<br/>";

foreach ($antrenori as $echipa=>$antrenor)
    print "$antrenor e antrenor la $echipa <br/>";

?>
