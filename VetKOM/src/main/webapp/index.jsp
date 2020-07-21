<%-- 
    Document   : index
    Created on : Jul 14, 2020, 11:11:33 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.objetos.Empleado"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.EmpleadoRepositorio"%>
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
            EmpleadoRepositorio ep = new EmpleadoRepositorio();
            Empleado empleado = ep.buscar(1);
        %>
        
        <h2>
            <%=empleado.getNombres()%>
        </h2>
        <a href="paginas/empleados/registrarEmpleado.jsp">Ir a empleado</a>
        <a href="paginas/buscador.jsp?action=Empleado">Ir a buscador empleado</a><br>
        <a href="paginas/clientes/registrarCliente.jsp">Ir a cliente</a>
        <a href="paginas/buscador.jsp?action=Cliente">Ir a buscador cliente</a>
    </body>
</html>
