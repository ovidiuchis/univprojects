<?php
function aduna($i, $j) {
    return $i + $j;
}

function check(&$i) {
    $i = 2;
}

//print aduna(4, 7) . "<br/>";
$x = 1;
check($x);
print $x;
?>
