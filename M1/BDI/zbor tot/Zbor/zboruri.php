<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Zboruri</title>
        <link href="css/default.css" rel="stylesheet" type="text/css" />
    </head>


    <body>
        <div id="wrapper">
            <?php include 'header.php'; ?>


            <!-- end div#header -->
            <div id="page">
                <div id="content">

                    <h1>Zboruri pentru avionul:
                        <?php
                        include "DBCon.php";
                        mysql_select_db("cobd0429") or die(mysql_error());
                        $idAvion = $_GET['idAvion'];
                        $resultAv = mysql_query("SELECT  tip FROM avioane where id=" . $idAvion);
                        $av = mysql_fetch_row($resultAv);
                        echo $av[0];
                        ?>
                    </h1>
                    <?php
                        $idAvion = $_GET['idAvion'];
                        include "DBCon.php";
                        mysql_select_db("cobd0429") or die(mysql_error());
                        $resultRute = mysql_query("SELECT  z.durata, z.legaturi, at1.Oras, at2.oras
                                                    from zboruri z
                                                     join aeroporturi at1 on at1.id=z.idSursa
                                                    join aeroporturi at2 on at2.id=z.idDestinatie
                                                    where z.idAvion=" . $idAvion);
                        while ($rut = mysql_fetch_row($resultRute)) {
                            echo "<p>";
                            echo "<b>Ruta </b>" . "</br>";
                            echo "Plecare din:". $rut[2] ."</br>";
                            echo " Aterizare in: ".$rut[3]."</br>";
                            echo "Durata zborului: ".$rut[0]."</br>";
                            echo "Legaturi necesare: ".$rut[1]."</br>";
                            echo "</p> </br>";
                        }
                    ?>
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


