<%-- 
    Document   : registrarServicio
    Created on : Jul 21, 2020, 6:17:54 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.repositorios.ServicioRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Añadir Servicio</title>
    </head>
    </head>
    <%
        Servicio ser = new Servicio();
        if (request.getSession().getAttribute("servicio") != null) {
            ser = (Servicio) request.getSession().getAttribute("servicio");
        }
        
        ServicioRepositorio sR = new ServicioRepositorio();
        int numero = 0;
        if(sR.getIdentity() != 0){
            numero = sR.getIdentity();
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Añadir Servicio</h2>
                <form name="formulario" action="../../controladorServicios" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> No.Servicio: </label>
                    <input type="number"  name="idServicio" readonly="true" value="<%if (ser.getIdServicio()!= 0) {out.print(ser.getIdServicio());}else{out.print(numero);}%>"/><br>
                    <label> Nombre del Servicio: </label>
                    <input type="text"  name="nombreServicio" required="true" maxlength="50" value='<%if (ser.getNombre() != null) {out.print(ser.getNombre());}%>'/><br>
                    <label> Precio del Servicio: </label>
                    <input type="number" name="precio" placeholder="1.00" step="0.01" min="1" required="true" value="<%if (ser.getPrecio()!= 0) {out.print(ser.getPrecio());}%>"/><br>
                    
                    <input class='boton' name="insert" type="submit" value="Guardar Servicio" name="enviar" />

                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
