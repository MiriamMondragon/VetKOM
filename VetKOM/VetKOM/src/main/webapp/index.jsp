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
        <a href="paginas/buscador.jsp?action=Cliente">Ir a buscador cliente</a><br>
        <a href="paginas/productos/registrarProducto.jsp">Ir a Producto</a>
        <a href="paginas/buscador.jsp?action=Producto">Ir a buscador producto</a><br>
        <a href="paginas/servicios/registrarServicio.jsp">Ir a Servicio</a>
        <a href="paginas/buscador.jsp?action=Servicio">Ir a buscador servicio</a><br>
        <a href="paginas/usuarios/registrarUsuario.jsp">Ir a Usuario</a>
        <a href="paginas/buscador.jsp?action=Usuario">Ir a buscador usuario</a><br>
        <a href="paginas/animales/registrarAnimal.jsp">Ir a Animal</a>
        <a href="paginas/buscador.jsp?action=Animal">Ir a buscador animal</a><br>
        <a href="paginas/citas/registrarCita.jsp">Ir a Cita</a>
        <a href="paginas/buscador.jsp?action=Cita">Ir a buscador cita</a><br>
    </body>
</html>
