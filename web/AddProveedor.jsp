<%-- 
    Document   : AddProveedor
    Created on : Jun 5, 2017, 3:08:37 AM
    Author     : Fabio Victor
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar</title>
    </head>
    <body>
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
        <title>Agregar</title>
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
                    <a href="Calculo.jsp">Calcular</a>
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

    <h2>Registro de Proveedores</h2>
    <form action="">

        
        <input type="text" placeholder="Nombre" autofocus="" name="Nombre" onkeypress="return letras(event)" onpaste="return false" required/>

        <input type="text" placeholder="Cedula/RNC" maxlength="11"  name="Cedula" onkeypress="return números(event)" onpaste="return false" required/>

        <select name="TipoPersona" class="input2">
            <option value="0">Tipo Persona</option>
            <option>Física</option>
            <option>Jurídica</option>
        </select>

        <input type="date" name="Fecha"required/>

        <select name="Estado" class="input2">
            <option value="0">Estado</option>
            <option>Activo</option>
            <option>Inactivo</option>
        </select>

        <div class="input">
            <input type="submit" name="btnGrabar" value="Guardar"/>
        </div>

    </form>

    <%
        if (request.getParameter("btnGrabar") != null) {
    
            String Nombre = request.getParameter("Nombre");
            String Cedula = request.getParameter("Cedula");
            String TipoPersona = request.getParameter("TipoPersona");
            String Fecha = request.getParameter("Fecha");
            String Estado = request.getParameter("Estado");

            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();

                sta.executeUpdate("Insert into Proveedores values('" + Nombre + "','" + Cedula + "','" + TipoPersona + "','" + Fecha + "','" + Estado + "')");
                request.getRequestDispatcher("Proveedores.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();

            } catch (Exception e) {
                out.print(e + "");

            }

        }

    %>

</body>
</html>
