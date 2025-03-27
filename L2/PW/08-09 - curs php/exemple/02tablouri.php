<?php
    $echipe = array("CFR", "Steaua", "Dinamo");
    print $echipe[0] . "<br/>";
    print count($echipe) . "<br/>";

    $portari = array("CFR"=>"Stancioiu", "Steaua"=>"Tatarusanu", "Dinamo"=>"Dolha");
    print $portari["CFR"] . "<br/>";

    $antrenori["CFR"] = "Cartu";
    $antrenori["Steaua"] = "Lacatus";
    $antrenori["Dinamo"] = "Andone";

    print $antrenori["CFR"] . "<br/>";
?>
