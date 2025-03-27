<%@page import="java.util.ArrayList"%>
<%@page import="Model.DBUtil" %>
<%@page import="Model.Categorie" %>
<li id="submenu">
    <h2>Categorii produse</h2>
    <ul>
        <% DBUtil bd2= new DBUtil();
            ArrayList<Categorie> list= bd2.iaCategorii();
            if (list !=null){
                for (int j=0;j< list.size();j++)
                    out.print(list.get(j).toString());
                }


                %>
    </ul>
</li>