<%-- 
    Document   : registrarCita
    Created on : Jul 23, 2020, 10:16:18 AM
    Author     : Miriam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.CitaRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Cita"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Registrar Cita</title>
    </head>
    <%
        controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorEmpleados"
        Cita cit = new Cita();
        if (request.getSession().getAttribute("cita") != null) {
            cit = (Cita) request.getSession().getAttribute("cita");
        }
        
        CitaRepositorio cR = new CitaRepositorio();
        int numero = 0;
        if(cR.getIdentity() != 0){
            numero = cR.getIdentity();
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Registrar Cita</h2>
                <form name="formulario" action="../../controladorCitas" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> No. Cita: </label>
                    <input type="number"  name="idCita"readonly="true" value="<%if (cit.getIdCita()!= 0) {out.print(cit.getIdCita());}else{out.print(numero);}%>"/><br>
                    <label> Cliente: </label>
                    <select name="idDuenio" onchange="formulario.submit()">
                        <%out.print(cL.getOpcionesClienteDuenio(cit.getIdDuenio()));%>
                    </select><br>
                    <label> Mascota: </label>
                    <select name="idAnimal" required="true">
                        <option value="">Debe seleccionar al Dueño</option>
                        <%out.print(cL.getOpcionesAnimales(cit.getIdDuenio(), cit.getIdAnimal()));%>
                    </select><br>
                    <label> Cita para: </label>
                    <select name="idServicio" required="true" onchange="formulario.submit()">
                        <%out.print(cL.getOpcionesServicios(cit.getIdServicioSolicitado()));%>
                    </select><br>
                    <label> Empleado responsable: </label>
                    <select name="idEmpleado" required="true">
                        <%out.print(cL.getOpcionesPersonal(cit.getIdServicioSolicitado(), cit.getIdEmpleado()));%>
                    </select><br>
                    
                    <label> Fecha de la Cita: </label>
                    <input type="date" name="fechaCita" required="true" value='<%
                        if (cit.getFechaCita()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cit.getFechaCita());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Hora de la Cita: </label>
                    <input type="time" name="horaCita" min="09:00" max="18:00" required="true" value="<%
                        if(cit.getHoraCita() != null && cit.getHoraCita().equals("")== false){out.print(cit.getHoraCita());}%>"><br>
                    
                    <label> No. Sala: </label>
                    <input type="number"  name="noSala" required="true" value="<%if (cit.getNoSala()!= 0) {out.print(cit.getNoSala());}%>"/><br>
                    <label> Estado: </label>
                    <select name="idEstado" required="true" >
                        <%out.print(cL.getOpcionesEstados(cit.getIdEstado()));%>
                    </select><br>
                    
                    <label> Observaciones: </label>
                    <textarea rows="4" cols="50"  name="observaciones"><%if (cit.getObservaciones()!= null) {
                        out.print(cit.getObservaciones());}%>
                    </textarea><br>
                    
                    <input class='boton' name="insert" type="submit" value="Guardar Cita" name="enviar" />

                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
