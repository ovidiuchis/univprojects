<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.DBManagement.Attribute" %>
<%@ page import="rmComponent.binFileManagement.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <br>
        <p class="doi"> Table <%= request.getParameter("table")%></p>
          <%
        	String database = request.getSession().getAttribute("database2").toString();
                String table = request.getParameter("table");

                DBManager catalogReader = new DBManager();
                ArrayList<Attribute> attributeList = catalogReader.getFields(database, table);

                out.println("<table border='1px'>");
                out.println("<tr>");
               // out.println("<th>RID</th>");
                for (int i=0;i<attributeList.size();i++){
                      Attribute at = attributeList.get(i);
                      out.println("<th>"+at.getName()+"</th>");
                }
                 out.println("</tr>");

                 
                 String fileName=catalogReader.getFileName(database, table);
                 BinFileManager bfm = new BinFileManager(database, table);

			/* bfm.rsFileName="c:/files/" + table+".kv";
	         bfm.fileName = "c:/files/" + table+".bin";
	         bfm.attr=attributeList;*/
	         bfm.getRecordStatus();

		 ArrayList<String[]> list = bfm.selectRecords();

	            for (int i=0;i<list.size();i++){
	            	out.println("<tr>");
	                String[] record = list.get(i);

	                for (int j=1;j<record.length;j++)
	                	out.println("<td>"+record[j]+"</td>");

                        out.println("</tr>");
                 }
                 out.println("</table>");
        %>
    </body>
</html>
