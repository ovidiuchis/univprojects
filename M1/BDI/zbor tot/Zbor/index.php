<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Zboruri</title>
        <meta name="description" content="Aplicatie web" />
        <link href="css/default.css" rel="stylesheet" type="text/css" />
    </head>


    <body>
        <div id="wrapper">
        <?php include 'header.php'; ?>
            <!-- end div#header -->
            <div id="page">
                <div id="content">
                    <div id="welcome">
                        <h1>Bun venit</h1>
                        <!--body-->
                        <p>
                            Aplicatia isi propune sa prezinte intr-o varianta foarte sumara informatii despre gestiunea unei companii aeriene.
                        </p>
                        <p>
                            Veti gasi navigand prin continut o lista cu flota de avioane disponibile fiecare avand un numar de detalii si alte informatii necesare,
                            de asemenea se stocheaza informatii despre aeroporturile tranzitate de aceste avioane si zborurile care sunt programate.
                        </p>

                        <p>
                            Desigur aplicatia nu isi propune sa trateze exhaustiv problematica aceasta intrucat ea (aplicatia) reprezinta doar un proiect de semestru
                            si isi atinge in modul de tratare a problemelor scopul minimal.
                        </p>


                        <!--body ends-->
                    </div>

                    <!-- end div#welcome -->

                </div>
                <!-- end div#content -->
                <div id="sidebar">
                    <ul>
                    <?php include 'nav.php'; ?>
                        <!-- end navigation -->
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


