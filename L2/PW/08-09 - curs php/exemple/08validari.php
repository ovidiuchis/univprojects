<?php

if (isset($_GET['view']))
    $view = $_GET['view'];
else
    $view = 'valoare_implicita';
$view = addslashes($view);

?>
