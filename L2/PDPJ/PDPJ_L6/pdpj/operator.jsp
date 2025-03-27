<%-- 
    Document   : operator
    Created on : 05-Jan-2011, 16:01:02
    Author     : Ovidiu Chis
--%>

<%@page import="app.DatabaseUtils"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operator</title>
    </head>
    <body>

        <%
                    if (request.getParameter("addBtn") != null) {

                        String tara = request.getParameter("Tara");
                        String pret = request.getParameter("Pret");
                        String durata = request.getParameter("Zile");

                        Connection con = (Connection) application.getAttribute("conexiune");
                        DatabaseUtils dbutil = new DatabaseUtils(con);
                        dbutil.addAnunt(tara, pret, durata);
                    }
        %>
        <form action="operator.jsp"  method="get">
            <div >
                Tara:
                <input type="text" name="Tara"  size="50" id="tara"/>
            </div>
            <div>
                Pret:
                <input type="text" name="Pret" value="0" size="50" />
            </div>
            <div >
                Zile:
                <input type="text" name="Zile" value="0" size="50" />
            </div>
            <div>
                <input  type="submit" value="Adauga" name="addBtn" />
            </div>
        </form>
    </body>
</html>
