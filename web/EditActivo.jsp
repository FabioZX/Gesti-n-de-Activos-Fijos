<%-- 
    Document   : EditActivo
    Created on : Jun 5, 2017, 6:36:10 AM
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

        <h2>Editar Activos Fijos</h2>

        <%
            String Valor = request.getParameter("Valor");

            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from Activos where Valor= '" + Valor + "'");

                while (rs.next()) {

        %>
       <form action="">

        <select name="TipoActivo" class="input2" required>
            <option><%=rs.getString(1)%></option>
            <option>Terrenos</option>
            <option>Construcciones</option>
            <option>Instalaciones Técnicas</option>
            <option>Maquinarias</option>
            <option>Mobiliario</option>
            <option>Equipo Informatico</option>
            <option>Medios de Transportes</option>
        </select>
        
        <input type="text" value="<%=rs.getString(2)%>" name="Nombre" onkeypress="return letras(event)" onpaste="return false" required/>
        
        <select name="Departamento" class="input2" required>
            <option><%=rs.getString(3)%></option>
            <option>Recursos Humanos</option>
            <option>Contabilidad</option>
            <option>Tecnología de Información</option>
            <option>Mercadeo</option>
            <option>Ventas</option>
            <option>Compras</option>
            <option>Finanzas</option>
        </select>

        <input type="text" value="<%=rs.getString(4)%>"  name="Ubicación"  onpaste="return false" required/>

        <input type="date" value="<%=rs.getDate(5)%>"  name="Fecha"required/>

        <input type="text" value="<%=rs.getString(6)%>"   name="Valor" onkeypress="return números(event)" onpaste="return false" required />

        <div class="input">
            <input type="submit" name="btnGrabar" value="Guardar"/>
        </div>

    </form>

        <%

                }
            } catch (Exception e) {
                out.print(e + "");
            }

            if (request.getParameter("btnGrabar") != null) {
                
                String TipoActivo = request.getParameter("TipoActivo");
                String Nombre = request.getParameter("Nombre");
                String Departamento = request.getParameter("Departamento");
                String Ubicación = request.getParameter("Ubicación");
                String Fecha = request.getParameter("Fecha");
                

                sta.executeUpdate("Update Activos set TipoActivo='" + TipoActivo + "', Nombre='" + Nombre + "', Departamento='" + Departamento + "', Ubicación='" + Ubicación + "', Fecha='" + Fecha +"' where Valor='" + Valor + "'");
                request.getRequestDispatcher("Activos.jsp").forward(request, response);

            }


        %>
    </body>
</html>