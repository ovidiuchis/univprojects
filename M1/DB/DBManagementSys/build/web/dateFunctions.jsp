<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <table align="center">
            <tr>
                <td>
        <form method="POST" action="dateAdd.jsp">
           <table>
            <tr><td>Date1</td><td><input type='text' name='date1'/><td></tr>
            <tr><td>Days</td><td><input type='text' name='days'/><td></tr>
            <tr><td>Months</td><td><input type='text' name='months'/><td></tr>
            <tr><td>Years</td><td><input type='text' name='years'/><td></tr>
            <tr><td><input type='submit' value="DateAdd()"></td></tr>
        </table>
        </form>
                </td>
                <td></td>
                <td>

        <form method="POST" action="dateDiff.jsp">
           <table>
            <tr><td>Date1</td><td><input type='text' name='date1'/><td></tr>
            <tr><td>Date2</td><td><input type='text' name='date2'/><td></tr>
            <!--<tr><td>Days</td><td><input type='text' name='days'/><td></tr>
            <tr><td>Months</td><td><input type='text' name='months'/><td></tr>
            <tr><td>Years</td><td><input type='text' name='years'/><td></tr>!-->
            <tr><td><input type='submit' value="DateDiff()"></td></tr>
        </table>
        </form>
                </td>
        </table>
       
    </body>
</html>
