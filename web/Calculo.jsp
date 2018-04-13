<%-- 
    Document   : Calculo
    Created on : Jun 5, 2017, 1:44:18 PM
    Author     : Fabio Victor
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" type="text/css" href="stylemenu.css">
        <script src="header.js" type="text/javascript"></script>
        <title>Calcular</title>
    </head>
    <body>
        <table align="Center" border="0" width="700" class="container" id="datos">
            <tr  bgcolor="skyblue">
                <th colspan="9" class="container"><h1>Listado de Calculos<br>
                            <br></h1></th>
                <th> <a href="AddCalculo.jsp"> 
                        <img src="image/Add.png" width="40" height="40"></th>
                        <header class="header2">
            <div class="container">
            <div class="logo">ColdFusion</div>
                <nav class="">
                    <ul>
                        <a href="Menu.jsp">Inicio</a>
                        <a href="Activos.jsp">Activos Fijos</a>
                        <a href="Empleado.jsp">Empleados</a>
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
                            <br>
                <form method="GET" name="form1" action="Contenido.jsp" target="_black">                           
            <h2 align="center"><input id="searchTerm" type="search"  onkeyup="doSearch()" placeholder="        Buscar Elementos" class=""></h2>
            <div class="lol" align="center">
                <br>
            <input type="submit" value="Generar Reporte">
            </div>
            </form>
            </tr>
            <tr bgcolor="skyblue" id="header">
            <th>Tipo Activo</th><th>Activo Fijo</th>
            <th>Mes</th>
            <th>Costo</th><th>Porcentaje</th>
            <th>Depreciación</th><th>Monto Mensual</th>
            <th>Cuenta Compra</th><th>Cuenta Depreciación</th>
            <th>Acción</th>
            </tr>
           
            <%
            Connection cnx=null; 
            Statement sta=null;
            ResultSet rs=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx=DriverManager.getConnection("jdbc:mysql://localhost/man?user=root&password=");
                
                sta=cnx.createStatement();
                rs=sta.executeQuery("Select * From Calculo");
             
                while(rs.next()){
                %>
                
                <tr id="<%=rs.getString(2)%>" style="display: table-row">
                    <th name="ActivoFijo"><%=rs.getString(1)%></th>
                    <th name="Activo"><%=rs.getString(2)%></th>
                    <th name="Mes"><%=rs.getDate(3)%></th>
                    <th name="Costo"><%=rs.getInt(4)%></th>
                    <th name="Porcentaje"><%=rs.getFloat(5)%></th>
                    <th name="Depreciacion"><%=rs.getInt(6)%></th>
                    <th name="MontoMnesual"><%=rs.getFloat(7)%></th>
                    <th name="CuentaC"><%=rs.getString(8)%></th>
                    <th name="CuentaD"><%=rs.getString(9)%></th>   
                    <th>
                        <a href="EditCalculo.jsp?CuentaD=<%=rs.getString(9)%>">  
                        <img src="image/Edit.png" width="40" height="40">
                        </a>
                        
                        <a href="DeleteCalculo.jsp?CuentaD= <%=rs.getString(9)%>">
                        <img src="image/Delete.png" width="40" height="40">
                        </a>  
                        
                        
                    </th>
                </tr>
                <%
                }
                    sta.close();
                    rs.close();
                    cnx.close();
                
                }catch(Exception e){
            }
            %>
        </table>
        
    </body>
</html>
