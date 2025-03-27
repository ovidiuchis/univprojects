<link rel="stylesheet" type="text/css" href="style.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.binFileManagement.BinFileManager" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String database = request.getParameter("database");
         DBManager cat = new DBManager();
         cat.deleteDatabase(database);

         BinFileManager bin = new BinFileManager();

         ArrayList<String> tables = cat.getTables(database);
         for (int i=0;i<tables.size();i++){
            bin.dropTable(tables.get(i)+".bin");
            bin.dropTable(tables.get(i)+".index");
            bin.dropTable(tables.get(i)+".rs");
         }

         out.println("<p> database deleted</p>");
         
        %>
    </body>
</html>
