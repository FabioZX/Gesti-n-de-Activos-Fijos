<%-- 
    Document   : Contenido
    Created on : Jun 2, 2017, 12:59:31 PM
    Author     : Fabio Victor
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>

        <script>

            /*function aExcel()
            {
                vExcel = window.open("calculo.jsp", "", "status=0, toolbar=0, location=0, menubar=0, resizable=0, width=200, height=200");
            }*/

        </script>

        <script src="header.js" type="text/javascript"></script>
        <title>Calcular</title>
    </head>
    <body>
        <table align="Center" border="0" width="400" class="container" id="datos">
            <tr  bgcolor="coral">
                <th colspan="9" ><h1>Reporte del Sistema de Gestión de Activos Fijos</h1></th>
            <form method="GET" name="form1" action="" target="_black">                           
                <h2 align="center"><input id="searchTerm" type="search"  onkeyup="doSearch()" placeholder="        Buscar Elementos" class=""></h2>
                <div class="lol">
                </div>
            </form>
        </tr>
        <h1>Sé que se ve feo y sin estilo, pero esto no es para tirarle foto</h1>
        <tr bgcolor="coral" id="header">
            <th>Tipo Activo</th><th>Activo Fijo</th>
            <th>Fecha</th>
            <th>Costo</th><th>Porcentaje</th>
            <th>Depreciación</th><th>Monto Mensual</th>
            <th>Cuenta Compra</th><th>Cuenta Depreciación</th>
        </tr>

        <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            response.setHeader("Content-Disposition", "attachment;filename=\"Reporte.xls\"");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");

                sta = cnx.createStatement();
                rs = sta.executeQuery("Select * From Calculo");

                while (rs.next()) {
        %>

        <th name="ActivoFijo"><%=rs.getString(1)%></th>
        <th name="Activo"><%=rs.getString(2)%></th>
        <th name="Mes"><%=rs.getDate(3)%></th>
        <th name="Costo"><%=rs.getInt(4)%></th>
        <th name="Porcentaje"><%=rs.getFloat(5)%></th>
        <th name="Depreciacion"><%=rs.getInt(6)%></th>
        <th name="MontoMnesual"><%=rs.getFloat(7)%></th>
        <th name="CuentaC"><%=rs.getString(8)%></th>
        <th name="CuentaD"><%=rs.getString(9)%></th>   

    </tr>
    <%
            }
            sta.close();
            rs.close();
            cnx.close();

        } catch (Exception e) {
        }
    %>
</table>

</body>
</html>
