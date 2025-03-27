<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="rmComponent.DBManagement.DBManager" %>
<html>
<head>
    <title></title>

    <link rel="stylesheet" type="text/css" href="style.css" />

    <script language="JavaScript">
        function insert(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
           // window.location.href='insert.jsp?table='+table;
            window.location.href='insert.jsp?table='+table;//+'&database='+<!% request.getParameter("database")%>;
        }

         function view(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
            window.location.href='view.jsp?table='+table;//+'&database='+<!% request.getParameter("database")%>;
        }

		function update(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
          //  var db = <!% request.getParameter("database")%>;
            window.location.href='update.jsp?table='+table;//+'&database2='+db;
        }

         function deleteR(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
            window.location.href='delete.jsp?table='+table;//+'&database='+<%= request.getParameter("database")%>;
        }

        function dropTable(){
            var elem=document.getElementById('TB');
            var table=elem[elem.selectedIndex].value;
            window.location.href='dropTable.jsp?table='+table;//+'&database='+<%= request.getParameter("database")%>;
        }
    </script>
</head>

<body>

     <%
     session.setAttribute("database2", request.getParameter("database"));
    
    %>
    <br>
    <br>
    
    <p class="doi"> Please select a table</p>
    <%
    	DBManager catalogReader = new DBManager();
               ArrayList<String> tableList = catalogReader.getTables(request.getParameter("database"));

               out.println("<table><tr><td>");
               out.println("<select id='TB'>");

               for (int i=0;i<tableList.size();i++){
                    out.println("<option value='"+tableList.get(i)+"'>"+tableList.get(i) +"</option>");
               }
            
               out.println("</select>");
               out.println("</table>");
    %>

    <table>
          <tr><td><input type="button" id="A" value="INSERT " onclick="insert()"/></td></tr>
          <tr><td><input type="button" id="D" value="DELETE" onclick="deleteR()" /></td></tr>
          <tr><td><input type="button" id="V" value="SELECT" onclick="view()" /></td></tr>
          <tr><td><input type="button" id="Dr" value="DROP TABLE" onclick="dropTable()" /></td></tr>
			<tr><td><input type="button" name="U" value="Update index" onclick="update()" ></td></tr>
    </table>

</body>
</html>