<?php

if (isset($_GET['view']))
    $view = $_GET['view'];
else
    $view = 'main.php';

$view = addslashes($view);

include("pages.php");

if (! isset($pages[$view])) {
    header("HTTP/1.1 404 Not Found");
    die;
}


?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles/style.css?v=1"/>
    <title><?php print $pages[$view]; ?></title>
</head>

<body bgcolor="white" class="text">

<div class="menu">    
    <ul>
        <li><a href="./">Pagina principala</a></li>
        <li><label class="trigger">Activitate didactica</label>
            <div class="submenu">
                <ul>
                    <li><a href="index.php?view=retele.php"><font style="font-size: 100%;">&#187;</font> Retele de calculatoare</a></li>
                    <li><a href="index.php?view=protocoale.php"><font style="font-size: 100%;">&#187;</font> Protocoale de securitate in comunicatii</a></li>
                    <li><a href="index.php?view=pw.php"><font style="font-size: 100%;">&#187;</font> Programare Web</a></li>
                </ul>
            </div>
        </li>

    </ul>
</div>

<div class="continut">
    <!-- continut -->
    <?php
    include($view);
    ?>
</div>

</body>
</html>
