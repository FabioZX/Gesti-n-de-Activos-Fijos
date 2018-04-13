<%-- 
    Document   : Validación
    Created on : Jun 5, 2017, 1:53:17 AM
    Author     : Fabio Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
    </head>
    <body>
        <%!
            String username = null;
            String password = null;
        %>
        <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;
            try {
//                session.setAttribute("user", value);
            String user = ((String)(session.getAttribute("user")));
                username = request.getParameter("username");
                password = request.getParameter("password");
            } catch (Exception e) {
                getServletContext().getRequestDispatcher("/Login.jsp").include(request, response);
            }

            String zx = "SELECT * FROM login where username=? and password=?";

            if ((!(username.equals(null) || username.equals("")) && !(password.equals(null) || password.equals("")))) {
                try {
//                    System.out.println("USUARIO Y CONTRASEÑA NO SON NULL1");
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");
                    sta = cnx.prepareStatement(zx);
                    String sqlStatement = "SELECT * FROM login WHERE username='" + username
                            + "' AND password='" + password + "'";
                    rs = sta.executeQuery(sqlStatement);

                    if (rs.next()) {
//                        System.out.println(sqlStatement);
//                        System.out.println("USUARIO Y CONTRASEÑA SON VALIDOS1");
//                        String usernameDB = rs.getString("username");
//                        String passwordDB = rs.getString("password");
//                        if (username.equals(usernameDB) && password.equals(passwordDB)) {
                        response.sendRedirect("Menu.jsp");
//                        }
                    } else {
//                        System.out.println("USUARIO Y CONTRASEÑA NO SON VALIDOS1");
//                        getServletContext().getRequestDispatcher("/Login.jsp").include(request, response);
                        response.sendRedirect("Login.jsp");
                    }

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    e.printStackTrace();
                } finally {
                    rs.close();
                    sta.close();
                }
            } else {
//                System.out.println("USUARIO Y CONTRASEÑA SON NULL O ESTAN VACIOS1");
                getServletContext().getRequestDispatcher("/Login.jsp").include(request, response);
            }
        %>
    </body>
</html>