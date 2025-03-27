<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$who = $_GET['start']; //decodifire
$matrix = array(0 => array($_GET['el0'], $_GET['el1'], $_GET['el2']),
    1 => array($_GET['el3'], $_GET['el4'], $_GET['el5']),
    2 => array($_GET['el6'], $_GET['el7'], $_GET['el8'])
);

function checkGameOver() {
    global $matrix;
    if (($matrix[0][0] == $matrix[1][1] && $matrix[1][1] == $matrix[2][2] && $matrix[0][0] != 0) || ($matrix[0][2] == $matrix[1][1] && $matrix[1][1] == $matrix[2][0] && $matrix[0][2] != 0))
        return true;
    for ($i = 0; $i < 3; $i++)
        if (($matrix[$i][0] == $matrix[$i][1] && $matrix[$i][1] == $matrix[$i][2] && $matrix[$i][0] != 0) || ($matrix[0][$i] == $matrix[1][$i] && $matrix[1][$i] == $matrix[2][$i] && $matrix[0][$i])) 
            return true;
    return false;
}

function freeSpots() {
    global $matrix;
    $pozitiiArray = array();
    $k = 0;
    $poz = 0;
    for ($i = 0; $i < 3; $i++)
        for ($j = 0; $j < 3; $j++) {
            if ($matrix[$i][$j] == 0)
                $pozitiiArray[$k++] = $poz;
            $poz++;
        }
    return $pozitiiArray;
}

function computeMove($frees) {
    global $matrix;
    $i = 0;
    $j = 0;
    $pos = $frees[(rand() % count($frees))];

    $aux = 0;
    while ($aux < $pos) {
        if ($j < 2)
            $j++;
        else {
            $i++;
            $j = 0;
        }
        $aux++;
    }
    global $who;
    if ($who == 0)
        $matrix[$i][$j] = 1;
    else
        $matrix[$i][$j] = 2;
}

function toArray() {

    global $matrix;
    $array = array();
    $k = 0;
    for ($i = 0; $i < 3; $i++)
        for ($j = 0; $j < 3; $j++) {
            $array[$k] = $matrix[$i][$j];
            $k++;
        }
    return $array;
}

function respond($resp) {
    printf("{\"celula\": [ ");
    foreach ($resp as $i => $val)
        printf("\"%s\",", $val);
    printf(" ] }");
}

function main() {
    global $matrix;
    $response = array();

    if (checkGameOver()) {
        $response = toArray();
        $response[9] = "Winner";
        respond($response);
    } else {
        computeMove(freeSpots($matrix));
        if (checkGameOver()) {
            $response = toArray();
            $response[9] = "Loser";
            respond($response);
        } else if( count(freeSpots ($matrix))==0){
            $response = toArray();
            $response[9] = "Draw";
            respond($response);

        }
        else{
            $response = toArray();
            respond($response);
        }
    }
}

main();
?>
