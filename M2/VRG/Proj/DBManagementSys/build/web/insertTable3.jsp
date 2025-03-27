<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <link rel="stylesheet" type="text/css" href="style.css" />
 <%@ page import="rmComponent.DBManagement.DBManager" %>
 <%@ page import="rmComponent.DBManagement.Attribute" %>
 <%@ page import="rmComponent.DBManagement.ForeignKey" %>
 <%@ page import="rmComponent.DBManagement.Index" %>
 <%@ page import="rmComponent.DBManagement.Table" %>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="indexComponent.BPlusindex.*" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String database = session.getAttribute("database").toString();
           String table = session.getAttribute("table").toString();
           int fieldsNo = Integer.parseInt(session.getAttribute("fieldsNo").toString());

           ArrayList<String> indexList = new ArrayList<String>();
           ArrayList<String> primaryKeyList = new ArrayList<String>();
           ArrayList<String> uniqueKeyList = new ArrayList<String>();
           ArrayList<Attribute> attList = new ArrayList<Attribute>();
           ArrayList<String> indexAttrList = new ArrayList<String>();
           ForeignKey fk= null;

           for (int i=0;i<fieldsNo;i++){
               String field = request.getParameter("field"+i);
               String type = request.getParameter("types"+i).toString().toLowerCase();
               int length ;
               if (type.equals("char") || type.equals("varchar")){
                    length = Integer.parseInt(request.getParameter("len"+i));
               }
               else
                   length=0;
               int nul = 1;
               if (request.getParameter("nul"+i)!=null) nul = 0;
               if (request.getParameter("pk"+i)!=null) primaryKeyList.add(field);
               if (request.getParameter("ind"+i)!=null) indexAttrList.add(field);
               if (request.getParameter("uq"+i)!=null) uniqueKeyList.add(field);
               if (request.getParameter("fk"+i)!=null){
                   fk = new ForeignKey(field, request.getParameter("reftab"+i).toString(),request.getParameter("refatt"+i).toString());
                }
               Attribute att = new Attribute(field, type, length, 1);
               attList.add(att);
           }
            String fileName = table+".kv";
			String indexFileName = table+".index";
			Index index = new Index(indexFileName, 20,indexList);
            //Table newTable = new Table(database,table, fileName, null, 0, null, null, attList);
            Table newTable = new Table(database,table,fileName,index,0,primaryKeyList,fk,attList);

            DBManager catalog = new DBManager();
            catalog.insertTable(newTable);

            out.println("<p>table inserted</p>");			
			for (int i=0;i<primaryKeyList.size();i++){
                bplusTest bp = new bplusTest(database, table);
                bp.indexOnAttr = primaryKeyList.get(i);
                bp.indexFileName = table+"_"+bp.indexOnAttr+".index";
                bp.createIndexFile(primaryKeyList.get(i));
            }

            for (int i=0;i<indexAttrList.size();i++){
                bplusTest bp = new bplusTest(database, table);
                bp.indexOnAttr = indexAttrList.get(i);
                bp.indexFileName = table+"_"+bp.indexOnAttr+".index";
                bp.createIndexFile(indexAttrList.get(i));
            }
        %>
    </body>
</html>