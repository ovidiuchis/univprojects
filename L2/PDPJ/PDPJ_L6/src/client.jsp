<%-- 
    Document   : index
    Created on : 05-Jan-2011, 15:01:44
    Author     : Ovidiu Chis
--%>
<%@page import="java.util.Random"%>
<%@page import="app.DatabaseUtils"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client</title>
    </head>

    <%
                String client = (String) session.getAttribute("client");
                boolean results = false;
                boolean aResults = false;
                String res = null;
                String alertRes = null;
                Connection con = (Connection) application.getAttribute("conexiune");
                DatabaseUtils dbutil = new DatabaseUtils(con);
                if (client == null) {
                    Random rand = new Random();
                    client = Integer.toString(rand.nextInt(25000));
                    session.setAttribute("client", client);

                } else {
                    if (request.getParameter("goBtn") != null && request.getParameter("actiune").equals("Alerta")) {
                        String val = request.getParameter("date");
                        String camp = request.getParameter("criteriu");

                        dbutil.addAlert(camp, val, client);

                    }
                    if (request.getParameter("goBtn") != null && request.getParameter("actiune").equals("Anunt")) {
                        String val = request.getParameter("date");
                        String camp = request.getParameter("criteriu");
                        res = dbutil.getAnunturi(camp, val);
                        results = true;
                    }
                    if (request.getParameter("goBtn") == null && request.getParameter("check") != null) {
                        alertRes = dbutil.getAnunturiClient(client);
                        aResults = true;
                    }

                }
    %>
    <body>
        <form action="client.jsp" method="get">
            <div>
                <select name="actiune">
                    <option>Alerta</option>
                    <option>Anunt</option>
                </select>
            </div>
            <div>
                <select name="criteriu">
                    <option>Pret</option>
                    <option>Tara</option>
                </select>
                <input type="text" name="date" value="" size="50" id="date" />
            </div>
            <div>
                <input type="submit" value="GOOooo" name="goBtn" />
                <input type="hidden" id="param1" value="" name="client">
                <input type="submit" value="Check alert" name="check" />
            </div>
        </form>
        <% if (results) {
        %> <%=res%>
        <%}%>
        <% if (aResults) {
        %> <%=alertRes%>
        <%}%>    
    </body>
</html>
