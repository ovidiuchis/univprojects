<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="rmComponent.DBManagement.DBManager" %>

<html>
<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="style.css" />

    <script language="JavaScript">

        function loadTables(){
            var elem=document.getElementById('DB');
            var database=elem[elem.selectedIndex].value;
            window.location.href='tables.jsp?database='+database;
        }

         function insertTable(){
            var elem=document.getElementById('DB');
            var database=elem[elem.selectedIndex].value;
            window.location.href='insertTable.jsp?database='+database;
        }

         function dropDatabase(){
            var elem=document.getElementById('DB');
            var database=elem[elem.selectedIndex].value;
            window.location.href='dropDatabase.jsp?database='+database;
        }

        function createDatabase(){
            var elem=document.getElementById('DB');
            var database=elem[elem.selectedIndex].value;
            window.location.href='createDatabase.jsp?database='+database;
        }

        function query(){
            var elem=document.getElementById('DB');
            var database=elem[elem.selectedIndex].value;
            window.location.href='query.jsp?database='+database;
        }
    </script>
</head>
<body>
    <br>
    <br>
    <p class="doi"> Databases</p>
    
    <%
        DBManager catalogReader = new DBManager();
        ArrayList<String> databaseList = catalogReader.getDatabaseList();

        out.println("<table><tr><td>");
        out.println("<select id='DB'>");

        for (int i=0;i<databaseList.size();i++){
                    out.println("<option value='"+databaseList.get(i)+"'>"+databaseList.get(i) +"</option>");
        }

        out.println("</select>");
        out.println("</td></tr>");
        out.println("<tr><td><input type='button' onclick='loadTables()' value='TABLES'></td></tr>");
        out.println("<tr><td><input type='button' onclick='insertTable()' value='CREATE TABLE'></td></tr> ");
        out.println("<tr><td><input type='button' onclick='createDatabase()' value='CREATE DATABASE '></td></tr>");
        out.println("<tr><td><input type='button' onclick='dropDatabase()' value='DROP DATABASE'></td></tr></table> ");
		out.println("<tr><td><input type='button' onclick='query()' value=' Query '></td></tr></table>");
     %>

</body>
</html>

