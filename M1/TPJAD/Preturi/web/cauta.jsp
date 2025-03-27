<%@page import="java.util.ArrayList"%>
<%@page import="Model.DBUtil" %>
<%@page import="Model.Produs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Preturi</title>
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
                        <h1>Cauta produse</h1>
                        <!--body-->
                        <form action="http://localhost:8080/Preturi/cauta.jsp" method="POST">
                            <input type="text"  name="cod" />
                            <input type="submit"  value=" Cauta " />
                        </form>
                        <% String cod = request.getParameter("cod");
                                    if (cod != null) {
                                        DBUtil bd4 = new DBUtil();
                                        ArrayList<Produs> prod = bd4.iaProduseLike(cod);
                                        if (prod != null) {
                                            for (int i = 0; i < prod.size(); i++) {
                                                out.println(prod.get(i).toStringFaraDet());
                                                out.println("</p></br></br>");
                                            }
                                        }
                                    }

                        %>


                        <!--body ends-->
                    </div>

                    <!-- end div#welcome -->

                </div>
                <!-- end div#content -->
                <div id="sidebar">
                    <ul>
                        <%@ include file="nav.jsp" %>
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


