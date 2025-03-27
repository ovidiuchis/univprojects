<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <link rel="stylesheet" type="text/css" href="style.css" />
 <%@ page import="rmComponent.DBManagement.DBManager" %>
 <%@ page import="rmComponent.DBManagement.Attribute" %>
 <%@ page import="rmComponent.DBManagement.ForeignKey" %>
 <%@ page import="rmComponent.DBManagement.Index" %>
 <%@ page import="rmComponent.DBManagement.Table" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>       
        <form method="get" action="insertTable2.jsp">
            <table>
                <tr><td>Table name:</td><td><input type="text" name="table"></td></tr>
                <tr><td>Number of fields:</td><td><input type="text" name="fieldsNo"></td></tr>
                <tr><td><input type="submit" value="Create table" ></td><td></td></tr>    
            </table>
        </form>

        <%
          session.setAttribute("database", request.getParameter("database"));
        %>
    </body>
</html>
