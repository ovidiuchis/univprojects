<link rel="stylesheet" type="text/css" href="style.css" />
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.DBManagement.Attribute" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>JSP Page</title>

        <script language="JavaScript">
        function deleteR(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
           // window.location.href='insert.jsp?table='+table;
            window.location.href='deleteRecord.jsp?table='+table;//+'&database='+<!% request.getParameter("database")%>;
        }
    </script>

    </head>
    <body>
        <br>
        <form method="post" action ="deleteRecord.jsp">
        <p class="doi"> Table <%= request.getParameter("table")%></p>
        <p > introduce a RID</p>

        <p ><input name="rid" type="text"/></p>
        <p> <input name="btn" type="submit" value ="Delete records"> </p>
       
        <%
        	String database = request.getSession().getAttribute("database2").toString();
                String table = request.getParameter("table");
                String rids = request.getParameter("table");

                out.println("<input type='hidden' name='table' value='"+table+"'/>");
                out.println("<input type='hidden' name='database' value='"+database+"'/>");

        %>
        </form>


    </body>
</html>
