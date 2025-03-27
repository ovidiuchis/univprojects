<%@page import="java.sql.*"%>


<select>

<%
  Connection con = (Connection) application.getAttribute("conexiune");
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM orase ORDER BY oras");
  while (rs.next()) {
    String oras = rs.getString(1);
    %>
      <option value="<%=oras%>"><%=oras%></option>
    <%
  }


%>

</select>