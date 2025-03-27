<%@page import="java.util.ArrayList"%>
<%@page import="Model.DBUtil" %>
<%@page import="Model.Produs" %>
<li id="submenu">
    <h2>Top produse vandute</h2>
    <ul>
        <% DBUtil bd2= new DBUtil();
            ArrayList<Produs> list= bd2.iaTopVandute();
            if (list !=null){
                for (int j=0;j< list.size();j++)
                    out.print(list.get(j).toStringVandut());
                }
                %>
    </ul>
</li>