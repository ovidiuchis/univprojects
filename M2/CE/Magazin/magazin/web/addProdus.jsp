<%@page import="java.util.ArrayList"%>
<%@page import="Model.DBUtil" %>
<%@page import="Model.Produs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Ovidiu Chis online</title>
        <meta name="description" content="Aplicatie web" />
        <link href="css/default.css" rel="stylesheet" type="text/css" />
    </head>


    <body>
        <div id="wrapper">
            <%@ include file="header.jsp" %>
            <!-- end div#header -->
            <div id="page">
                <div id="content">
                    <div id="welcome">
                        <form action="http://localhost:8080/Magazin/addProdus.jsp" method="POST">
                            <fieldset>
                                <legend>Informatii produs</legend>
                                Produs <input type="text"  name="produs" />
                                </br>
                                Detalii <input type="textarea"  name="detalii" /> </br>
                                Pret <input type="textarea"  name="pret" /> </br>
                                URL poza <input type="textarea"  name="url" /> </br>
                                Categoria <input type="textarea"  name="categ" /> </br>
                                <input type="submit"  value=" Adauga " />
                            </fieldset>
                            </legend>      
                        </form>

                        <!--body ends-->
                    </div>
                    
                    <%
                        String produs=request.getParameter("produs");
                        String detalii=request.getParameter("detalii");
                        String pret=request.getParameter("pret");
                        String url=request.getParameter("url");
                        String categoria=request.getParameter("categ");
                        DBUtil db= new DBUtil();
                        if (produs!=null && detalii !=null && categoria!=null)
                            if (db.adaugaProdus(produs, detalii, Float.valueOf(pret), url, Integer.valueOf( categoria)))
                                out.println("S-a adaugat cu succes un produs!");
                                                
                      %>

                    <!-- end div#welcome -->

                </div>
                <!-- end div#content -->
                <div id="sidebar">
                    <ul>
                        <%@ include file="comenzi.jsp" %>
                        <!-- end navigation -->
                    </ul>
                </div>
                <!-- end div#sidebar -->
                <div style="clear: both; height: 1px"></div>
            </div>

            <%@ include file="footer.jsp" %>
        </div>
        <!-- end div#wrapper -->
    </body>
</html>


