<%-- 
    Document   : Login
    Created on : Jun 2, 2017, 10:31:37 AM
    Author     : Fabio Victor
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <link rel="stylesheet" type="text/css" href="font-awesome.css"/>
    </head>
    <body>    
        <div class="container">
            <img src="image/ninja-background-128.png">
           
                 <form method="GET" action="Validación.jsp"> 
                     
                <div class="form-input">
                    <input type="text" name="username"   placeholder="Enter Username" autofocus="">
                </div>
                <div class="form-input">
                    <input type="password" name="password" placeholder="Enter Password" >
                </div>     
             
                      <input type="submit" name="submit" value="LOGIN" class="btnlogin"> 
                     
               
            </form>    
        </div>
         <footer>
            <p>Login created by <a class="footer-text" href=#">Fabio_ZX</a></p>
        </footer>
    </body>
</html>
