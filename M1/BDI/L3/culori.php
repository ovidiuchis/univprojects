<?php

$m = $_POST['m'];
$index = 1;
$array[0] = $m;
$m = $m * 2;
while ($m < 255) {
    $array[$index] = $m;
    $m = $m * 2;
    $index++;
}

echo "<table align=\"center\">";
foreach ($array as $r) {
    foreach ($array as $g) {
        foreach ($array as $b) {
            echo "<tr>";
            $rgb = "rgb(" . $r . "," . $g . "," . $b . ")";
            $afis = "Background "."(" . $r . "," . $g . "," . $b . ")";
            $rComplementary = 255 - $r;
            $gComplementary = 255 - $g;
            $bComplementary = 255 - $b;
            $rgbComplementary = "rgb(" . $rComplementary . "," . $gComplementary . "," . $bComplementary . ")";
            $afis= $afis . "  Text "."(" . $rComplementary . "," . $gComplementary . "," . $bComplementary . ")";
            echo"<td style='background-color:" . $rgb . "; color:" . $rgbComplementary . ";'>" . $afis . "</td>";
            echo"</tr>";
        }
    }
}
echo "</table>";
?>