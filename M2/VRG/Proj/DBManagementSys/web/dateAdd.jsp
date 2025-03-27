
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String date1 = request.getParameter("date1");

            int days =0;
            int months=0;
            int years=0;
            if (request.getParameter("days")!=null){
                days = Integer.parseInt(request.getParameter("days"));
            }
            if (request.getParameter("months")!=null){
                months = Integer.parseInt(request.getParameter("months"));
            }
            if (request.getParameter("years")!=null){
                years = Integer.parseInt(request.getParameter("years"));
            }

            Date first = null;

            if (date1!=null) first = new Date(date1);
                first = new Date(date1);
            
            Calendar cal1 = Calendar.getInstance();
            cal1.setTime(first);

            out.println("Data initiala:"+cal1.getTime()+"<br>");
            if (days>0) cal1.add(cal1.DATE, days);
            if (months>0) cal1.add(cal1.MONTH, months);
            if (years>0) cal1.add(cal1.YEAR, years);

            out.println("Data rezultata:"+cal1.getTime());
        %>
    </body>
</html>
