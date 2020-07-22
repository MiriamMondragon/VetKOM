<%-- 
    Document   : registrarAnimal
    Created on : 07-21-2020, 02:57:12 PM
    Author     : karol
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.AnimalRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Animal"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Registrar Animal</title>
    </head>
    <%
        controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorEmpleados"
        Animal ani = new Animal();
        if (request.getSession().getAttribute("animal") != null) {
            ani = (Animal) request.getSession().getAttribute("animal");
        }
        int idEspecie = 0;
        int idRaza = 0;
        int idColor = 0;
        String idClienteDuenio = "";
        
        if (request.getSession().getAttribute("idEspecie") != null && request.getSession().getAttribute("idEspecie").equals("") == false) {
            String especie = String.valueOf(request.getSession().getAttribute("idEspecie"));
            idEspecie = Integer.valueOf(especie);
        }
        if (request.getSession().getAttribute("idRaza") != null && request.getSession().getAttribute("idRaza").equals("") == false) {
            String raza = String.valueOf(request.getSession().getAttribute("idRaza"));
            idRaza = Integer.valueOf(raza);
        }
        if (request.getSession().getAttribute("idColor") != null && request.getSession().getAttribute("idColor").equals("") == false) {
            String color = String.valueOf(request.getSession().getAttribute("idColor"));
            idColor = Integer.valueOf(color);
        }
        if (request.getSession().getAttribute("idClienteDuenio") != null && request.getSession().getAttribute("idClienteDuenio").equals("") == false) {
            String clienteDuenio = String.valueOf(request.getSession().getAttribute("idClienteDuenio"));
            idClienteDuenio = (clienteDuenio);
        }
        AnimalRepositorio aN = new AnimalRepositorio();
        int numero = 0;
        if(aN.getIdentity() != 0){
            numero = aN.getIdentity();
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Registrar Animal</h2>
                <form name="formulario" action="../../controladorAnimales" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> No.Animal: </label>
                    <input type="number"  name="idAnimal" readonly="true" value="<%if (ani.getIdAnimal()!= 0) {out.print(ani.getIdAnimal());}else{out.print(numero);}%>"/><br>
                    <label> Nombre: </label>
                    <input type="text"  name="nombreAnimal" required="true" maxlength="50" value='<%if (ani.getNombre() != null) {out.print(ani.getNombre());}%>'/><br>   
                    <label> Especie: </label>
                    <select name="especie" required="true" onchange="formulario.submit()">
                        <option value="">Debe seleccionar una Especie</option>
                        <%out.print(cL.getOpcionesEspecies(idEspecie));%>
                    </select><br>
                    <label> Raza: </label>
                    <select name="razaAnimal" required="true">
                        <option value="">Debe seleccionar una Especie</option>
                        <%out.print(cL.getOpcionesRaza(idEspecie, idRaza));%>
                    </select><br>
                    <label> Dueno del Animal: </label>
                    <select name="clienteDuenio" required="true" >
                        <option value="">Debe seleccionar un Dueño</option>
                        <%out.print(cL.getOpcionesClienteDuenio(idClienteDuenio));%>
                    </select><br>
                    <label> Fecha de Nacimiento: </label>
                    <input type="date" name="fechaNacimientoAnimal" required="true" value='<%
                        if (ani.getFechaNacimiento() != null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(ani.getFechaNacimiento());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Tipo de Sangre: </label>
                    <input type="text"  name="tipoSangre" required="true" maxlength="50" value='<%if (ani.getTipoSangre()!= null) {out.print(ani.getTipoSangre());}%>'/><br>
                    <label> Genero: </label>
                    <select name="genero" required="true">
                        <option value="">Debe seleccionar un Genero</option>
                        <%out.print(cL.getOpcionesGeneros(idEspecie));%>
                    </select><br>
                    <label> Color: </label>
                    <select name="color" required="true">
                        <option value="">Debe seleccionar un Color</option>
                        <%out.print(cL.getOpcionesColores(idColor));%>
                    </select><br>
                    <label> Esterilizado </label>
                    <select name="esterilizado" required="true">
                        <option value="">Debe seleccionar una Opción</option>
                        <option value="1">Si</option>
                        <option value="2">No</option>
                    </select><br>
                    <label> Ruta de su fotografia: </label>
                    <input type="text"  name="rutaFoto" maxlength="100" value=''/><br>
                    <label> Observaciones: </label>
                    <input type="text"  name="observaciones" value=''/><br>
                    <br>
                    <input class='boton' name="insert" type="submit" value="Guardar Animal" name="enviar" />

                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
