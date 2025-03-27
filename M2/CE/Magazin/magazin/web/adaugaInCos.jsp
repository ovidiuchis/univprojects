<%@page import="java.util.ArrayList"%>
<%@page import="Model.DBUtil" %>
<%@page import="Model.Produs" %>
<%@page import="Model.Cos" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Magazin online</title>
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
                        <h1>Pana acum ai in cos</h1>
                        <!--body-->
                        <p>

                            <%
                                String id = request.getParameter("id");

                                Cos tcos = (Cos) session.getAttribute("cos");
                                if (tcos == null) {
                                    tcos = new Cos();
                                    session.setAttribute("cos", tcos);
                                }
                                DBUtil bd = new DBUtil();
                                if (id != null) {
                                    Produs p = bd.iaProdus(id);
                                    tcos.adaugaInCos(p);
                                    session.setAttribute("total", tcos.iaTotal());
                                }
                                if (tcos != null) {
                                    out.print(tcos.afiseazaProduse());
                                                                    }
                            %>
                        </p>
                        <center>
                            <a href="finalizare.jsp" style="font-size:16;color: red">Checkout (Total:<% out.print(session.getAttribute("total")); %>)</a>
                        </center>
                        <!--body ends-->
                    </div>

                    <!-- end div#welcome -->

                </div>
                <!-- end div#content -->
                <div id="sidebar">
                    <ul>
                        <%@ include file="topproduse.jsp" %>
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


