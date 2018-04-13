<%-- 
    Document   : Proveedores
    Created on : Jun 5, 2017, 3:01:38 AM
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
        <title>Proveedores</title>
        
    </head>
    <body>
        <table align="Center" border="0" width="700"class="container" id="datos">
            <tr  bgcolor="skyblue">
                <th colspan="5" class="container"><h1>Listado de Proveedores<br>
                            <br></h1></th>
                <th> <a href="AddProveedor.jsp"> 
                        <img src="image/Add.png" width="40" height="40"></th>
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
                            <br>
                            <h2 align="center"><input id="searchTerm" type="search" onkeyup="doSearch()" placeholder="        Buscar Elementos"></h2>                           

            </tr>
            <tr bgcolor="skyblue" id="header">
            <th>Nombre</th>
            <th>Cedula/RNC</th><th>Tipo Persona</th>
            <th>Fecha de Inqreso</th><th>Estado</th>
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
                rs=sta.executeQuery("Select * From Proveedores");
                
                while(rs.next()){
                %>
                <tr>
                    <th><%=rs.getString(1)%></th>
                    <th><%=rs.getString(2)%></th>
                    <th><%=rs.getString(3)%></th>
                    <th><%=rs.getDate(4)%></th>
                    <th><%=rs.getString(5)%></th>
                    
                    <th>
                        <a href="EditProveedor.jsp?Cedula=<%=rs.getString(2)%>">  
                        <img src="image/Edit.png" width="40" height="40">
                        </a>
                        
                        <a href="DeleteProveedor.jsp?Cedula= <%=rs.getString(2)%>">
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
