<%-- 
    Document   : index
    Created on : Jul 14, 2020, 11:11:33 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.PruebaConexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            PruebaConexion pc = new PruebaConexion();
            String mensaje = pc.conexion();
        %>
        
        <h2>
            <%=mensaje%>
        </h2>
    </body>
</html>
