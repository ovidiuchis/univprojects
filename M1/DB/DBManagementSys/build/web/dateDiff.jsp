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
            String date2 = request.getParameter("date2");

            int days =0;
            int months=0;
            int years=0;/*
            if (request.getParameter("days")!=null){
                days = Integer.parseInt(request.getParameter("days"));
            }
            if (request.getParameter("months")!=null){
                months = Integer.parseInt(request.getParameter("months"));
            }
            if (request.getParameter("years")!=null){
                years = Integer.parseInt(request.getParameter("years"));
            }*/

            Date first = null;
            Date second = null;
            if (date1!=null && date2!=null ){
                first = new Date(date1);
                second = new Date(date2);
            }

            Calendar cal1 = Calendar.getInstance();
            //cal1.set(first.getYear(), first.getMonth(), first.getDay());
            cal1.setTime(first);

            Calendar cal2=Calendar.getInstance();
            if (date2!=null){
                cal2.setTime(second);

                 // Get date in milliseconds
                long milisecond1 = cal1.getTimeInMillis();
                long milisecond2 = cal2.getTimeInMillis();

                // Find date difference in milliseconds
                long diffInMSec = milisecond2 - milisecond1;

                // Find date difference in days
                // (24 hours 60 minutes 60 seconds 1000 millisecond)
                long diffOfDays = diffInMSec / (24 * 60 * 60 * 1000);

                out.println("The difference is : " + diffOfDays + " days.<br>");
            }

            out.println("Date 1:"+cal1.getTime()+"<br>");/*
            if (days>0) cal1.add(cal1.DATE, (-1)*days);
            if (months>0) cal1.add(cal1.MONTH,(-1)*months);
            if (years>0) cal1.add(cal1.YEAR,(-1)* years);*/

            out.println("Date 2:"+cal2.getTime());
        %>
    </body>
</html>
