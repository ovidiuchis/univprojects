<link rel="stylesheet" type="text/css" href="style.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.DBManagement.Attribute" %>
<%@ page import="rmComponent.binFileManagement.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String table = request.getParameter("table");
            String database = request.getParameter("database");
            String rids = request.getParameter("rid");

            String ridsList[] = rids.split(",");
            int ridList[] = new int[rids.length()];
            for (int i=0;i<ridsList.length;i++)
                ridList[i]=Integer.parseInt(ridsList[i]);

            DBManager catalogReader = new DBManager();
            ArrayList<Attribute> attributeList = catalogReader.getFields(database, table);
            String fileName=catalogReader.getFileName(database, table);
            BinFileManager bfm = new BinFileManager(database, table);

        //    bfm.readFile(fileName, attributeList);
        //    bfm.deleteRecord(ridList);
        //    bfm.writeFile(fileName, attributeList);

            bfm.fileName=catalogReader.getFileName(database, table);
		/*String fn[]=fileName.split(".");
		String ff="";
		for(int i=0;i<fn.length-1;i++)
			ff+=fn[i];
                */

	    bfm.rsFileName="c:/files/" + table+".rs";
	    bfm.indexFileName="c:/files/" + table+".index";
	    bfm.fileName = "c:/files/" + table+".kv";//bfm.fileName;
	    bfm.attr=attributeList;
	    bfm.getRecordStatus();
	    bfm.deleteRecord(ridList);

	    out.println("record deleted");
        %>
    </body>
</html>
