<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.DBManagement.Attribute" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <link rel="stylesheet" type="text/css" href="style.css" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script language="JavaScript">
        function save(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
            window.location.href='insert.jsp?table='+table;
        }
    </script>

    </head>
    <body>
        <br>
        <p class="doi"> Table <%= request.getParameter("table")%></p>
        <form method="get" action="save.jsp">
        <table border="1px">
            <tr><th>Field</th><th>Type</th><th>Length</th><th>Value</th></tr>
        <%
        	String database = request.getSession().getAttribute("database2").toString();
                String table = request.getParameter("table");

                DBManager catalogReader = new DBManager();
                ArrayList<Attribute> attributeList = catalogReader.getFields(database, table);

                for (int i=0;i<attributeList.size();i++){
                      Attribute at = attributeList.get(i);
                      out.println("<tr><td>"+at.getName()+"</td><td>"+at.getType()+"</td><td>"+at.getLength()+"</td><td><input type='text' name='"+at.getName()+"'</td></tr>");
                }

                out.println("<input type='hidden' name='table' value='"+table+"'/>");
        %>
        </table>

        <p><input type="submit" value="   ssave  "></p>
        </form>

    </body>
</html>