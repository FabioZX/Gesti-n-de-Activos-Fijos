<%-- 
    Document   : EditCalculo
    Created on : Jun 6, 2017, 9:51:40 AM
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
                        <a href="Proveedores.jsp">Proveedores</a>
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

        <h2>Editar Calculo</h2>

        <%
            String CuentaD = request.getParameter("CuentaD");

            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from Calculo where CuentaD= '" + CuentaD + "'");

                while (rs.next()) {

        %>
       <form action="">
        
        <select name="ActivoFijo"  class="input2" required>
            <option><%=rs.getString(1)%></option>
            <option>Terrenos</option>
            <option>Construcciones</option>
            <option>Instalaciones Técnicas</option>
            <option>Maquinarias</option>
            <option>Mobiliario</option>
            <option>Equipo Informatico</option>
            <option>Medios de Transportes</option>
        </select>
        
        <input type="text" placeholder="Activo Fijo" value="<%=rs.getString(2)%>" name="Activo" onkeypress="return letras(event)" onpaste="return false" required/>

        <input type="date" name="Mes" value="<%=rs.getDate(3)%>" required/>
        
        <input type="text" value="<%=rs.getInt(4)%>" placeholder="Costo" name="Costo" onkeypress="return número(event)" onpaste="return false" required/>
        
        <input type="text" value="<%=rs.getFloat(5)%>" placeholder="Porcentaje" name="Porcentaje" onkeypress="return número(event)" onpaste="return false" required/>
        
        <input type="text" value="<%=rs.getInt(6)%>" placeholder="Depreciacion" name="Depreciacion" onkeypress="return número(event)" onpaste="return false"/>

        <input type="text" value="<%=rs.getFloat(7)%>" placeholder="MontoMensual" name="MontoMensual" onkeypress="return número(event)" onpaste="return false" />
        
        <input type="text" value="<%=rs.getString(8)%>" placeholder="Cuenta Contable" name="CuentaC" onkeypress="return número(event)" onpaste="return false" required/>
        
        <input type="text" value="<%=rs.getString(9)%>" placeholder="Cuenta Depreciación" name="CuentaD" onkeypress="return número(event)" onpaste="return false" required/>

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
                
                String ActivoFijo = request.getParameter("ActivoFijo");
                String Activo = request.getParameter("Activo");
                String Mes = request.getParameter("Mes");
                Integer Costo = Integer.parseInt(request.getParameter("Costo"));
                Float Porcentaje = Float.parseFloat(request.getParameter("Porcentaje"));
                Integer Depreciacion = Integer.parseInt(request.getParameter("Depreciacion"));
                Float MontoMensual = Float.parseFloat(request.getParameter("MontoMensual"));
                String CuentaC = request.getParameter("CuentaC");

                sta.executeUpdate("Update Calculo set ActivoFijo='" + ActivoFijo + "', Activo='" + Activo + "',  Mes='" + Mes + "', Costo='" + Costo + "', Porcentaje='" + Porcentaje + "', Depreciacion='" + Depreciacion +"', MontoMensual='" + MontoMensual + "', CuentaC='" + CuentaC + "' where CuentaD='" + CuentaD + "'");
                request.getRequestDispatcher("Calculo.jsp").forward(request, response);

            }


        %>
    </body>
</html>
