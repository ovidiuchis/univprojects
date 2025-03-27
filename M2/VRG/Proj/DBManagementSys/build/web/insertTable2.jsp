<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="rmComponent.DBManagement.DBManager" %>
<%@page import="java.util.ArrayList" %>
 

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
           <script language="JavaScript">

        function foreignKey(){
            window.location.href='tables.jsp?database='+database;
        }

        function uncheckRadio(id) {
         var radio = document.getElementById(id);
         if (radio.checked == true)
             radio.checked = false;
         else
             radio.checked = true;
         }
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <p class="doi"> Table <%= request.getParameter("table")%></p>
        <%
           String table = request.getParameter("table");
           String database = session.getAttribute("database").toString();
           session.setAttribute("table", table);
        %>

        <form method="get" action="insertTable3.jsp" name="form1">
        <table border="1px">
            <tr><th>Field</th><th>Type</th><th>Length</th><th>Not Null</th><th>Primary key</th><th>Index</th><th>Unique</th><th>Foreign key</th><th>Ref table</th><th>Ref field</th></tr>
            <%
               int fieldsNo = Integer.parseInt(request.getParameter("fieldsNo"));
               session.setAttribute("fieldsNo", fieldsNo);

               DBManager cat = new DBManager();
               ArrayList<String> tableList = cat.getTables(database);
               ArrayList<String> fieldList = cat.getAllFieldNames(database);

               for (int i=0;i<fieldsNo;i++){
                   out.println("<tr><td><input type='text' name='field"+i+"'></td>");
                   out.println("<td>");
                   out.println("<select name='types"+i+"'>");
                   out.println("<option value='VARCHAR'> VARCHAR</option>");
                   out.println("<option value='CHAR'>CHAR</option>");
                   out.println("<option value='INT'>INT</option>");
                   out.println("<option value='DOUBLE'>DOUBLE</option>");
                   out.println("<option value='FLOAT'>FLOAT</option>");
                   out.println("<option value='BYTE'>BYTE</option>");
                   out.println("<option value='LONG'>LONG</option>");
                   out.println("<option value='SHORT'>SHORT</option>");
					out.println("<option value='DATE'>DATE</option>");
                   out.println("</select>");
                   out.println("</td>");
                   out.println("<td><input type='text' name='len"+i+"'></td>");

                   out.println("<td><input type='radio' id='nul"+i+"' name='nul"+i+"' ondblclick='uncheckRadio(this.id);'></td>");
                   out.println("<td><input type='radio' id='pk"+i+"' name='pk"+i+"' value='pk"+i+"' ondblclick='uncheckRadio(this.id);'></td>");
                   out.println("<td><input type='radio' id='ind"+i+"' name='ind"+i+"' value='ind"+i+"' ondblclick='uncheckRadio(this.id)'></td>");
                   out.println("<td><input type='radio' id='uq"+i+"' name='uq"+i+"' value='uk"+i+"' ondblclick='uncheckRadio(this.id)'></td>");
                   out.println("<td><input type='radio' id='fk"+i+"' name='fk"+i+"' value='fk"+i+"' ondblclick='uncheckRadio(this.id)'></td>");
                   
                   out.println("<td>");
                   out.println("<select name='reftab"+i+"'>");
                   for (int j=0;j<tableList.size();j++){
                         out.println("<option value='"+tableList.get(j)+"'>"+tableList.get(j)+"</option>");
                   }
                   out.println("</select>");
                   out.println("</td>");
  
                   //out.println("<td><input type='text' name='reffield"+i+"'></td>");
                   out.println("<td>");
                   out.println("<select name='refatt"+i+"'>");

                   for (int j=0;j<fieldList.size();j++){
                         out.println("<option value='"+fieldList.get(j)+"'>"+fieldList.get(j)+"</option>");
                   }
                   out.println("</select>");
                   out.println("</td>");
                   out.println("</tr>");

               }
            %>        
        </table>
        <p >
        <input type="submit" value="Create table">

        </p>
            </form>
    </body>
</html>
