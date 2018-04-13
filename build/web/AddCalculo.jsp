<%-- 
    Document   : AddCalculo
    Created on : Jun 5, 2017, 3:03:23 PM
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

    <h2>Registro de Calculo</h2>
    <form action="">

        <select name="ActivoFijo" class="input2" required>
            <option value="0">Tipo Activo</option>
            <option>Terrenos</option>
            <option>Construcciones</option>
            <option>Instalaciones Técnicas</option>
            <option>Maquinarias</option>
            <option>Mobiliario</option>
            <option>Equipo Informatico</option>
            <option>Medios de Transportes</option>
        </select>

        <input id="Activo" type="text" placeholder="Activo Fijo" name="Activo" required/>

        <input id="Mes" type="date" name="Mes"required/>

        <input id="Costo" type="text" placeholder="Costo" name="Costo" onkeypress="return número(event)" onblur="depreciacion()" onpaste="return false" required/>

        <input id="Porcentaje" type="text" placeholder="Porcentaje" name="Porcentaje" onkeypress="return número(event)"onblur="depreciacion()" onpaste="return false" required/>

        <input id="Depreciacion" type="text" placeholder="Depreciacion" name="Depreciacion" readonly="readonly" onkeypress="return número(event)" onchange="return depreciacionMensual()" onpaste="return false"/>

        <input id="MontoMensual" type="text" placeholder="Monto Mensual" name="MontoMensual" readonly="readonly" onkeypress="return número(event)" onpaste="return false" />

        <input id="CuentaC" type="text" placeholder="Cuenta Contable" name="CuentaC" onkeypress="return número(event)" onpaste="return false" required/>

        <input id="CuentaD" type="text" placeholder="Cuenta Depreciación" name="CuentaD" onkeypress="return número(event)"  onpaste="return false" required/>

        <div class="input">
            <input type="submit" name="btnGrabar" value="Guardar"/>
        </div>

    </form>

    <%

        if (request.getParameter("btnGrabar") != null) {

            String ActivoFijo = request.getParameter("ActivoFijo");
            String Activo = request.getParameter("Activo");
            String Mes = request.getParameter("Mes");
            Integer Costo = Integer.parseInt(request.getParameter("Costo"));
            float Porcentaje = Float.parseFloat(request.getParameter("Porcentaje"));
            int Depreciacion = Integer.parseInt(request.getParameter("Depreciacion"));
            float MontoMensual = Float.parseFloat(request.getParameter("MontoMensual"));
            String CuentaC = request.getParameter("CuentaC");
            String CuentaD = request.getParameter("CuentaD");

            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();

                sta.executeUpdate("Insert into Calculo values('" + ActivoFijo + "', '" + Activo + "', '" + Mes + "','" + Costo + "', '" + Porcentaje + "', '" + Depreciacion + "', '" + MontoMensual + "', '" + CuentaC + "', '" + CuentaD + "')");
                request.getRequestDispatcher("Calculo.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();

            } catch (Exception e) {
//                out.print(e + "");
                e.printStackTrace();

            }

        }

    %>

    <script>
        function depreciacion() {
            var costo = document.getElementById('Costo');
            var porcentaje = document.getElementById('Porcentaje');

            var intCosto = Number(costo.value);
            var intPorcentaje = Number(porcentaje.value);

            if (intPorcentaje > 0) {
                intPorcentaje = intPorcentaje / 100;
            }

            var intDepreciacion = intCosto * intPorcentaje;

            var depreciacion = document.getElementById('Depreciacion');
            depreciacion.value = intDepreciacion;
            depreciacion.onchange();
            
        }

        function depreciacionMensual() {
//            var depreciacion = document.getElementById('Depreciacion');

//            var intDepreacion = depreciacion.value;
//            document.getElementById('MontoMensual').value = 0
//            var MontoMensual = document.getElementById('MontoMensual');
//            var IntMontoMensual = MontoMensual.value = intDepreacion/12;
            document.getElementById('MontoMensual').value = document.getElementById('Depreciacion').value / 12;

        }
        
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


</body>


</html>
