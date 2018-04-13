<%-- 
    Document   : DeleteCalculo
    Created on : Jun 6, 2017, 9:51:26 AM
    Author     : Fabio Victor
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado</title>
    </head>
    <body>
        <%

            String CuentaD = request.getParameter("CuentaD");

            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();

                sta.executeUpdate("delete from Calculo where CuentaD = " + CuentaD + " ");
                request.getRequestDispatcher("Calculo.jsp").forward(request, response);

            } catch (Exception e) {
                out.print(e + "");
            }

        %>
    </body>
</html>