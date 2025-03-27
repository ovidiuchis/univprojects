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
                        <h1>Detalii despre produs</h1>
                        <!--body-->
                        <p>

                        <%
                                    String id=request.getParameter("id");

                                    DBUtil bd = new DBUtil();
                                    Produs p = bd.iaProdus(id);
                                    if (p !=null)
                                       out.print(p.scrieCuOferte());
                        %>
                        </p>
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


