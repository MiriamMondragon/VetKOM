<%-- 
    Document   : registrarEmpleado
    Created on : Jul 15, 2020, 3:12:06 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.EmpleadoRepositorio"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Empleado"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="../../estilos/tooltip.css">
        <title>Registrar Empleado</title>
    </head>
    <%
        controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorEmpleados"
        Empleado em = new Empleado();
        if (request.getSession().getAttribute("empleado") != null) {
            em = (Empleado) request.getSession().getAttribute("empleado");
        }
        int idPais = 0;
        if (request.getSession().getAttribute("idPais") != null && request.getSession().getAttribute("idPais").equals("") == false) {
            String pais = String.valueOf(request.getSession().getAttribute("idPais"));
            idPais = Integer.valueOf(pais);
        }
        int idDepto = 0;
        if (request.getSession().getAttribute("idDepto") != null && request.getSession().getAttribute("idDepto").equals("") == false) {
            String depto = String.valueOf(request.getSession().getAttribute("idDepto"));
            idDepto = Integer.valueOf(depto);
        }
        EmpleadoRepositorio eR = new EmpleadoRepositorio();
        int numero = 0;
        if(eR.getIdentity() != 0){
            numero = eR.getIdentity();
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Registrar Empleado</h2>
                <form name="formulario" action="../../controladorEmpleados" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> No.Empleado: </label>
                    <input type="number"  name="idEmpleado"readonly="true" value="<%if (em.getIdEmpleado() != 0) {out.print(em.getIdEmpleado());}else{out.print(numero);}%>"/><br>
                    <label> Nombres: </label>
                    <input type="text"  name="nombresEmpleado" required="true" maxlength="50" value='<%if (em.getNombres() != null) {out.print(em.getNombres());}%>'/><br>
                    <label> Apellidos: </label>
                    <input type="text"  name="apellidosEmpleado" required="true"  maxlength="50" value='<%if (em.getApellidos() != null) {out.print(em.getApellidos());}%>'/><br>
                    <label> Fecha de Nacimiento: </label>
                    <input type="date" name="fechaNacimientoEmpleado" required="true" value='<%
                        if (em.getFechaNacimiento() != null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(em.getFechaNacimiento());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Fecha de Contratación: </label>
                    <input type="date" name="fechaContratacionEmpleado" required="true" value='<%
                        if (em.getFechaContratacion()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(em.getFechaContratacion());
                            out.print(fechaFinalDate);
                           }
                           %>'/><br>
                    <label> Fecha de Finalización de Contrato: </label>
                    <input type="date" name="fechaFinalizacionContratoEmpleado" required="true" value='<%
                        if (em.getFechaFinalizacionContrato() != null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(em.getFechaFinalizacionContrato());
                            out.print(fechaFinalDate);
                           }
                           %>'/><br>
                    <label> Cargo: </label>
                    <select name="cargoEmpleado" required="true" >
                        <%out.print(cL.getOpcionesCargos(em.getIdCargo()));%>
                    </select><br>
                    <label> Reporta a: </label>
                    <select name="reportaEmpleado">
                        <option value="0">Ninguno</option>
                        <%out.print(cL.getOpcionesJefes(em.getReportaA()));%>
                    </select><br>
                    <label> Dirección: </label>
                    <input type="text"  name="direccionEmpleado" required="true" maxlength="50" value='<%if (em.getDireccion() != null) {out.print(em.getDireccion());}%>'/><br>

                    <label> País: </label>
                    <select name="paisEmpleado" onchange="formulario.submit()">
                        <%out.print(cL.getOpcionesPaises(idPais));%>
                    </select><br>

                    <label> Departamento: </label>
                    <select name="departamentoEmpleado" required="true" onchange="formulario.submit()">
                        <option value="">Debe seleccionar un País</option>
                        <%out.print(cL.getOpcionesDepartamentos(idPais, idDepto));%>
                    </select><br>

                    <label> Ciudad: </label>
                    <select name="ciudadEmpleado" required="true">
                        <option value="">Debe seleccionar un Departamento</option>
                        <%out.print(cL.getOpcionesCiudades(idDepto));%>
                    </select><br>

                    <label> Ruta de su fotografia: </label>
                    <input type="text"  name="rutaFoto" maxlength="100" value=''/><br>
                    <label> Notas: </label>
                    <input type="text"  name="notas" value=''/><br>
                    <div class="tooltip">
                        <label> Teléfonos: </label>
                        <span class="tooltiptext">Ingresar varios teléfonos, separados por comas (,)</span>
                        <input type="text"  name="telefonos" value=''/><br>
                    </div>
                    <br>
                    <input class='boton' name="insert" type="submit" value="Guardar Empleado" name="enviar" />

                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
