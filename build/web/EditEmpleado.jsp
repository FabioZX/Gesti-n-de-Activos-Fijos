<%-- 
    Document   : EditEmpleado
    Created on : Jun 3, 2017, 12:39:03 AM
    Author     : Fabio Victor
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script>
            function números(e) {

                key = e.keyCode || e.which;

                teclado = String.fromCharCode(key);

                nume = "0123456789";

                espe = "8-37-38-46";

                tecla_espe = false;

                for (var i in espe) {

                    if (key === espe[i]) {

                        tecla_espe = true;
                    }

                }

                if (nume.indexOf(teclado) === -1 && !tecla_espe) {

                    return false;

                }

            }
        </script>

        <script>
            function letras(e) {

                key = e.keyCode || e.which;

                teclado = String.fromCharCode(key).toLowerCase();

                letra = " zxcvbnmasdfghjklqwertyuiopñáéíóú'";

                espe = "8-37-38-46-160-130-161-162-163";

                tecla_espe = false;

                for (var i in espe) {

                    if (key === espe[i]) {

                        tecla_espe = true;
                        break;
                    }

                }

                if (letra.indexOf(teclado) === -1 && !tecla_espe) {

                    return false;

                }

            }
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="form.css">
        <link rel="stylesheet" type="text/css" href="stylemenu.css">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <title>Editar</title>
    </head>
    <body>

        <header class="header2">
            <div class="container">
                <div class="logo">ColdFusion</div>
                <nav class="">
                    <ul>
                        <a href="Menu.jsp">Inicio</a>
                        <a href="Activos.jsp">Activos Fijos</a>
                        <a href="Empleado.jsp" >Empleados</a>
                        <a href="Proveedores.jsp"  >Proveedores</a>
                        <a href="Calculo">Calcular</a>
                    </ul>
                </nav>    
            </div>              
        </header>   
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <h2>Editar Registro de Empleados</h2>

        <%
            String Cedula = request.getParameter("Cedula");

            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from Empleado where Cedula= '" + Cedula + "'");

                while (rs.next()) {

        %>
        <form action="">

            <input type="text" value="<%=rs.getString(1)%>" name="Nombre" onkeypress="return letras(event)" onpaste="return false" required/>

            <input type="text" value="<%=rs.getString(2)%>" name="Cedula" maxlength="11" onkeypress="return números(event)" onpaste="return false" required/>

            <select name="Departamento" class="input2">
                <option><%=rs.getString(3)%></option>
                <option>Recursos Humanos</option>
                <option>Contabilidad</option>
                <option>Tecnología de Información</option>
                <option>Mercadeo</option>
                <option>Ventas</option>
                <option>Compras</option>
                <option>Finanzas</option>

            </select>


            <input type="date" value="<%=rs.getDate(4)%>"  name="Fecha"  required/>

            <select name="Estado" class="input2">
                <option><%=rs.getString(5)%></option>
                <option>Activo</option>
                <option>Inactivo</option>
            </select>

            <div class="input">
                <input type="submit" name="btnGrabar" value="Editar"/>
            </div>

        </form>


        <%

                }
            } catch (Exception e) {
                out.print(e + "");
            }

            if (request.getParameter("btnGrabar") != null) {

                String Nombre = request.getParameter("Nombre");
                String Departamento = request.getParameter("Departamento");
                String Fecha = request.getParameter("Fecha");
                String Estado = request.getParameter("Estado");

                sta.executeUpdate("Update Empleado set Nombre='" + Nombre + "', Departamento='" + Departamento + "', Fecha='" + Fecha + "', Estado='" + Estado + "' where Cedula='" + Cedula + "'");
                request.getRequestDispatcher("Empleado.jsp").forward(request, response);

            }


        %>
    </body>
</html>