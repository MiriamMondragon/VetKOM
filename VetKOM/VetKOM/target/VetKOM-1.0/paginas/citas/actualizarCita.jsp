<%-- 
    Document   : actualizarCita
    Created on : Jul 23, 2020, 11:46:05 AM
    Author     : Miriam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.CitaRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Cita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Actualizar Cita</title>
    </head>
    <body>
        <%
            String idCita = request.getParameter("idCita");
            Cita cita = new Cita();
            if(idCita != null && idCita.equals("")== false){
                CitaRepositorio cR = new CitaRepositorio();
                int id = Integer.parseInt(idCita);
                cita = cR.buscar(id);
            }
            

            controladorDatosBD cL = new controladorDatosBD();
        Cita cit = new Cita();
        if (request.getSession().getAttribute("cita") != null) {
            cit = (Cita) request.getSession().getAttribute("cita");
        }
        %>
        
        <header>

        </header>
        
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Empleado</h2>
                <form name="formulario" action="../../controladorCitas" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> No. Cita: </label>
                    <input type="number"  name="idCita" readonly="true" value="<%if (cit.getIdCita()!= 0) {out.print(cit.getIdCita());}else{out.print(cita.getIdCita());}%>"/><br>
                    <label> Cliente: </label>
                    <select name="idDuenio" onchange="formulario.submit()">
                        <%if(cit.getIdDuenio() != null){out.print(cL.getOpcionesClienteDuenio(cit.getIdDuenio()));}else{out.print(cL.getOpcionesClienteDuenio(cita.getIdDuenio()));}%>
                    </select><br>
                    <label> Mascota: </label>
                    <select name="idAnimal" required="true">
                        <option value="">Debe seleccionar al Dueño</option>
                        <%if(cit.getIdDuenio() != null){out.print(cL.getOpcionesAnimales(cit.getIdDuenio(), cit.getIdAnimal()));}else{out.print(cL.getOpcionesAnimales(cita.getIdDuenio(), cita.getIdAnimal()));}%>
                    </select><br>
                    
                    <label> Cita para: </label>
                    <select name="idServicio" required="true" onchange="formulario.submit()">
                        <%if(cit.getIdServicioSolicitado()!= 0){out.print(cL.getOpcionesServicios(cit.getIdServicioSolicitado()));}else{out.print(cL.getOpcionesServicios(cita.getIdServicioSolicitado()));}%>
                    </select><br>
                    <label> Empleado responsable: </label>
                    <select name="idEmpleado" required="true">
                        <%if(cit.getIdServicioSolicitado()!= 0){out.print(cL.getOpcionesPersonal(cit.getIdServicioSolicitado(), cit.getIdEmpleado()));}else{out.print(cL.getOpcionesPersonal(cita.getIdServicioSolicitado(), cit.getIdEmpleado()));}%>
                    </select><br>
                    
                    
                    <label> Fecha del Registro: </label>
                    <input type="date" name="fechaIngreso" required="true" value='<%
                        if (cit.getFechaIngreso()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cit.getFechaIngreso());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cita.getFechaIngreso());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Fecha de la Cita: </label>
                    <input type="date" name="fechaCita" required="true" value='<%
                        if (cit.getFechaCita()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cit.getFechaCita());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cita.getFechaCita());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Hora de la Cita: </label>
                    <input type="time" name="horaCita" min="09:00" max="18:00" required="true" value='<%
                        if (cit.getHoraCita() != null && cit.getHoraCita().equals("")== false) {
                            out.print(cit.getHoraCita());
                        }else{
                            out.print(cita.getHoraCita());
                        }
                           %>'/><br>
                    <label> No. Sala: </label>
                    <input type="number"  name="noSala" required="true" value="<%if (cit.getNoSala()!= 0) {out.print(cit.getNoSala());}else{out.print(cita.getNoSala());}%>"/><br>
                    
                    <label> Estado: </label>
                    <select name="idEstado" required="true" >
                         <%if(cit.getIdEstado()!= 0){out.print(cL.getOpcionesEstados(cit.getIdEstado()));}else{out.print(cL.getOpcionesEstados(cita.getIdEstado()));}%>
                    </select><br>
                    
                    <label> Observaciones: </label>
                    <input type="text"  name="observaciones" value='<%if (cit.getObservaciones()!= null) {out.print(cit.getObservaciones());}else{if(cita.getObservaciones() != null){out.print(cita.getObservaciones());}}%>'/><br>
                    
                    <input class='boton' name="insert" type="submit" value="Actualizar Cita" name="enviar" />
                    <input class='boton' name="insert" type="submit" value="Desactivar Cita" name="enviar" />

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
