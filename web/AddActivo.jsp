<%-- 
    Document   : AddActivo
    Created on : Jun 5, 2017, 6:16:10 AM
    Author     : Fabio Victor
--%>

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

    <h2>Registro de Activos Fijos</h2>
    <form action="">

        <select name="TipoActivo" class="input2" required>
            <option>Tipo Activo</option>
            <option>Terrenos</option>
            <option>Construcciones</option>
            <option>Instalaciones Técnicas</option>
            <option>Maquinarias</option>
            <option>Mobiliario</option>
            <option>Equipo Informatico</option>
            <option>Medios de Transportes</option>
        </select>
        
        <input type="text" placeholder="Nombre" name="Nombre" onkeypress="return letras(event)" onpaste="return false" required/>
        
        <select name="Departamento" class="input2" required>
            <option>Departamentos</option>
            <option>Recursos Humanos</option>
            <option>Contabilidad</option>
            <option>Tecnología de Información</option>
            <option>Mercadeo</option>
            <option>Ventas</option>
            <option>Compras</option>
            <option>Finanzas</option>
        </select>

        <input type="text" placeholder="Ubicación"  name="Ubicación"  onpaste="return false" required/>

        <input type="date" name="Fecha"required/>

        <input type="text" placeholder="Valor Compra"  name="Valor" onkeypress="return números(event)" onpaste="return false" required/>


        <div class="input">
            <input type="submit" name="btnGrabar" value="Guardar"/>
        </div>

    </form>

    <%
        if (request.getParameter("btnGrabar") != null) {
            
            String TipoActivo = request.getParameter("TipoActivo");
            String Nombre = request.getParameter("Nombre");
            String Departamento = request.getParameter("Departamento");
            String Ubicación = request.getParameter("Ubicación");
            String Fecha = request.getParameter("Fecha");
            String Valor = request.getParameter("Valor");

            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();

                sta.executeUpdate("Insert into Activos values('" + TipoActivo + "','" + Nombre + "','" + Departamento + "','" + Ubicación + "','" + Fecha + "', '"+Valor+"')");
                request.getRequestDispatcher("Activos.jsp").forward(request, response);
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
