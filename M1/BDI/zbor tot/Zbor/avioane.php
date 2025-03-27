<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Flota de avioane</title>
        <link href="css/default.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function selectareAvion(id){
                window.location.href="zboruri.php?idAvion=" + id;
            }
        </script>
    </head>


    <body>
        <div id="wrapper">
            <?php include 'header.php'; ?>


            <!-- end div#header -->
            <div id="page">
                <div id="content">

                    <h1>Avioane din flota</h1>
                    <?php
                    include "DBCon.php";
                    mysql_select_db("cobd0429") or die(mysql_error());
                    $resultAv = mysql_query("SELECT id, tip, capacitate, urlpoza FROM avioane");
                    while ($av = mysql_fetch_row($resultAv)) {

                        echo "<p>";
                        echo "<image src=\"" . $av[3] . "\" WIDTH=400 HEIGHT=300 /> </br>";
                        echo "Tip avion: " . $av[1] . "</br>";
                        echo "Capacitate avion: " . $av[2] . "</br>";
                        echo "</br>";

                        echo "<input type=\"button\" value=\"Vezi zboruri\" onclick=\"selectareAvion(" . $av[0] . ");\" style=\"width: 100px\"><br /><br />";
                        echo "</p>";
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


