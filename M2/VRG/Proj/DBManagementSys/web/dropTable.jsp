<link rel="stylesheet" type="text/css" href="style.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.binFileManagement.BinFileManager" %>
<%@ page import="java.io.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <%
            String database = request.getSession().getAttribute("database2").toString();
            String table = request.getParameter("table");

            DBManager cat = new DBManager();
            cat.deleteTable(database, table);

            BinFileManager bin = new BinFileManager(database, table);
            bin.dropTable(table+".kv");
            bin.dropTable(table+".index");
            bin.dropTable(table+".rs");

            out.println("<b>deleted</b>");
        %>
    </body>
</html>
