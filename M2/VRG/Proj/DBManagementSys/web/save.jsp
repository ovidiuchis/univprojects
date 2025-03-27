<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@ page import="rmComponent.DBManagement.ForeignKey" %>
<%@ page import="rmComponent.DBManagement.Attribute" %>
<%@ page import="rmComponent.binFileManagement.*" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String database = request.getSession().getAttribute("database2").toString();
            String table = request.getParameter("table");

            DBManager catalogReader = new DBManager();
            ArrayList<Attribute> attributeList = catalogReader.getFields(database, table);
            
             BinFileManager bfm = new BinFileManager(database, table);
             
             String[] valueList = new String[attributeList.size()];

             int okPk=1; int okFk=1;
             for (int i=0;i<attributeList.size();i++){
                         Attribute at = attributeList.get(i);
                         valueList[i]=request.getParameter(at.getName());
                         if (at.getType().equals("date")){
                            String pattern = "MM/dd/yyyy";
                            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                            String strDate = valueList[i];
                            out.println(valueList[i]);
                            try {
                                    sdf.applyPattern(pattern);
                                    out.println(sdf.parse(strDate));

                                   
                            } catch (ParseException e) {
                                    out.println("Wrong date format!");
                                    e.printStackTrace();
                            }

                         }
                         
                        // System.out.println (valueList[i]);
                         if (catalogReader.isPrimaryKey(database, table, at.getName()))
                             if (bfm.getRecords(at.getName(), valueList[i]).size()>0){
                                 out.println("Primary key constraint violation!");
                                 okPk=0;
                          }
                         
                             if (catalogReader.isForeignKey(database, table, at.getName())){   

                                ForeignKey fk = catalogReader.getForeignKey(database, table);
                                if (fk!=null){
                                    String refAtt = fk.getRefAttribute();
                                    String refTable = fk.getRefTable();
                                    BinFileManager bfm2 = new BinFileManager(database, refTable);
                                    if (bfm2.getRecords(refAtt, valueList[i]).size()==0){
                                        out.println("Foreign key constraint violation!");
                                        okFk=0;
                                   }
                                }
                                else okFk=1;
                             }
            }


             
            if (okPk==1 && okFk==1)
                    { bfm.insertRecord(valueList);
                      out.println("record added");
                    }
              
        %>
    </body>
</html>
