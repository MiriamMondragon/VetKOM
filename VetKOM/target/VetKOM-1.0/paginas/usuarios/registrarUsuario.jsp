<%-- 
    Document   : registrarUsuario
    Created on : Jul 22, 2020, 11:05:48 AM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.objetos.Usuario"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Registrar Usuario</title>
    </head>
    <%
        controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorEmpleados"
        Usuario us = new Usuario();
        if (request.getSession().getAttribute("usuario") != null) {
            us = (Usuario) request.getSession().getAttribute("usuario");
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Registrar Empleado</h2>
                <form name="formulario" action="../../controladorUsuarios" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> Usuario: </label>
                    <input type="text"  name="idUsuario" required="true" value="<%if (us.getUsuario()!= null) {out.print(us.getUsuario());}%>"/><br>
                    <label> Empleado: </label>
                    <select name="idEmpleado">
                        <%out.print(cL.getOpcionesJefes(us.getIdEmpleado()));%>
                    </select><br>
                    <label> Clave: </label>
                    <input type="password"  name="clave" required="true"  maxlength="50" value='<%if (us.getClave()!= null) {out.print(us.getClave());}%>'/><br>
                    
                    <input class='boton' name="insert" type="submit" value="Guardar Usuario" name="enviar" />
                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
