<%-- 
    Document   : buscador
    Created on : Jul 16, 2020, 12:16:33 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.controladores.controladorPrincipal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Buscador</title>
    </head>
    <!--Desde la pantalla anterior se le debe redireccionar con un action="" de lo que se quiere buscar, ejemplo action="Empleado" e igual debe devolverlo luego de realizar la busqueda-->

    <%
        String action = (String) request.getParameter("action");
        if (action != null) {
            request.getSession().setAttribute("action", action);
        } else {
            action = (String) request.getSession().getAttribute("action");
        }
    %>

    <body>

        <header>

        </header>

        <div class="principal">
            <div class="buscador">
                <h2>Buscar <%=action%></h2>
                <div class="formulario">
                    <form>
                        <input type="text" name="filtro"/>
                        <input class='boton' type="submit" value="Buscar"/><br>
                    </form>
                </div>
                <%
                    controladorPrincipal cP = new controladorPrincipal();
                    String filtro = request.getParameter("filtro");
                    if (filtro != null) {
                        out.print(cP.getTablaFromBuscador(filtro, action));
                    }
                %>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
