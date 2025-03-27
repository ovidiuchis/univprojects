<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Aeroporturi tranzitate</title>
        <link href="css/default.css" rel="stylesheet" type="text/css" />
    </head>


    <body>
        <div id="wrapper">
            <?php include 'header.php'; ?>


            <!-- end div#header -->
            <div id="page">
                <div id="content">
                    <h1>Aeroporturi</h1>
                    <?php
                    include "DBCon.php";
                    mysql_select_db("cobd0429") or die(mysql_error());
                    $resultA = mysql_query("SELECT  oras, descriere, facilitati, parcare FROM aeroporturi");
                    while ($a = mysql_fetch_row($resultA)) {

                        echo "<p>";
                        echo "Oras aeroport: <b>" . $a[0] . "</b></br>";
                        echo "Descriere sumara " . $a[1] . "</br>";
                        echo "Dispune de facilitatile: " . $a[2] . "</br>";
                        echo "Are parcare disponibila: <b> " . $a[3] . "</b></br>";
                        echo "</br>";


                        echo "</p>";
                    }
                    ?>

                    <h1>Adaugare aeroport nou</h1>

                    <form method='POST' action='adaugaAeroport.php'>
                        Oras:
                        <input type="text" name="oras"/> </br>
                        Descriere:
                        <input type="text" name="desc"/></br>
                        Facilitati:
                        <input type="text" name="facilitati"/></br>
                        Parcare:
                        <input type="text" name="parcare"/></br></br>
                        <input type="submit" value="Salveaza" />
                    </form>

                </div>
                <!-- end div#content -->
                <div id="sidebar">
                    <ul>
                        <?php include 'nav.php'; ?>

                    </ul>
                </div>
                <!-- end div#sidebar -->
                <div style="clear: both; height: 1px"></div>
            </div>
            <?php include 'footer.php'; ?>
        </div>
        <!-- end div#wrapper -->
    </body>
</html>


