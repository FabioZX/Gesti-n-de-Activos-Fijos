<%-- 
    Document   : DeleteActivo
    Created on : Jun 5, 2017, 6:36:21 AM
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

            String Valor = request.getParameter("Valor");

            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();

                sta.executeUpdate("delete from Activos where Valor = " + Valor + " ");
                request.getRequestDispatcher("Activos.jsp").forward(request, response);

            } catch (Exception e) {
                out.print(e + "");
            }

        %>
    </body>
</html>

