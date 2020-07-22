<%-- 
    Document   : actualizarServicio
    Created on : Jul 21, 2020, 6:45:48 PM
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
        <title>Actualizar Servicio</title>
    </head>
    <body>
        <%
            String idServicio = request.getParameter("idServicio");
            Servicio servicio = new Servicio();
            if(idServicio != null && idServicio.equals("")== false){
                ServicioRepositorio sR = new ServicioRepositorio();
                int id = Integer.parseInt(idServicio);
                servicio = sR.buscar(id);
            }
        Servicio ser = new Servicio();
        if (request.getSession().getAttribute("servicio") != null) {
            ser = (Servicio) request.getSession().getAttribute("servicio");
        }
        %>
        
        <header>

        </header>
        
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Servicio</h2>
                <form name="formulario" action="../../controladorServicios" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> No.Servicio: </label>
                    <input type="number"  name="idServicio" readonly="true" value="<%if (ser.getIdServicio()!= 0) {out.print(ser.getIdServicio());}else{out.print(servicio.getIdServicio());}%>"/><br>
                    <label> Nombre del Servicio: </label>
                    <input type="text"  name="nombreServicio" required="true" maxlength="50" value='<%if (ser.getNombre() != null) {out.print(ser.getNombre());}else{out.print(servicio.getNombre());}%>'/><br>
                    <input type="text"  name="idEstado" value='<%if (ser.getIdEstado()!= 0) {out.print(ser.getIdEstado());}else{out.print(servicio.getIdEstado());}%>' hidden="true"/>
                    <label> Precio del Servicio: </label>
                    <input type="number" name="precio" placeholder="1.00" step="0.01" min="1" required="true" value='<%if (ser.getPrecio() != 0) {
                            out.print(ser.getPrecio());
                        }else{out.print(servicio.getPrecio());}%>'/><br>
                    
                    
                    <input class='boton' name="insert" type="submit" value="Actualizar Servicio" name="enviar" />
                    <input class='boton' name="insert" type="submit" value="Desactivar Servicio" name="enviar" />

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
