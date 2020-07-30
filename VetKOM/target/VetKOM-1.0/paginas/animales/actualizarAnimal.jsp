<%-- 
    Document   : actualizarAnimal
    Created on : 07-21-2020, 02:56:58 PM
    Author     : karol
--%>

<%@page import="hn.uth.proyecto.vetkom.repositorios.AnimalRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Animal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="../../estilos/tooltip.css">
        <title>Actualizar Animal</title>
    </head>
    <body>
        <%
            String idAnimal = request.getParameter("idAnimal");
            Animal animal = new Animal();
            if(idAnimal != null && idAnimal.equals("")== false){
                AnimalRepositorio aN = new AnimalRepositorio();
                int id = Integer.parseInt(idAnimal);
                animal = aN.buscar(id);
            }
            
            controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorEmpleados"
        int idEspecie = 0;
        int idRaza = 0;
        
        Animal ani = new Animal();
        if (request.getSession().getAttribute("animal") != null) {
            ani = (Animal) request.getSession().getAttribute("animal");
        }
        
        if (request.getSession().getAttribute("idEspecie") != null && request.getSession().getAttribute("idEspecie").equals("") == false) {
            String especie = String.valueOf(request.getSession().getAttribute("idEspecie"));
            idEspecie = Integer.valueOf(especie);
        }
        %>
        
        <header>

        </header>
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Animal</h2>
                <form name="formulario" action="../../controladorAnimales" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> No.Animal: </label>
                    <input type="number"  name="idAnimal"readonly="true" value="<%if (ani.getIdAnimal()!= 0) {out.print(ani.getIdAnimal());}else{out.print(animal.getIdAnimal());}%>"/><br>
                    <label> Nombre: </label>
                    <input type="text"  name="nombreAnimal" required="true" maxlength="50" value='<%if (ani.getNombre() != null) {out.print(ani.getNombre());}else{out.print(animal.getNombre());}%>'/><br>
                    <label> Especie </label>
                    <select name="especie" onchange="formulario.submit()">
                        <option value="">Debe seleccionar una Especie</option>
                        <%out.print(cL.getOpcionesEspecies(idEspecie));%>
                    </select><br>
                    <label> Raza: </label>
                    <select name="razaAnimal" required="true">
                        <option value="">Debe seleccionar una Especie</option>
                        <%if(idEspecie != 0){out.print(cL.getOpcionesRaza(idEspecie, idRaza));}else{out.print(cL.getRaza(animal.getIdRaza()));}%>
                    </select><br>

                    
                    <label> Dueno del Animal: </label>
                    <select name="clienteDuenio" required="true" >
                        <%if(ani.getIdClienteDuenio() != null && ani.getIdClienteDuenio() != ""){
                            out.print(cL.getOpcionesClienteDuenio(ani.getIdClienteDuenio()));
                            }
                        else{out.print(cL.getOpcionesClienteDuenio(animal.getIdClienteDuenio()));}%> 
                    </select><br>
                    <label> Fecha de Nacimiento: </label>
                    <input type="date" name="fechaNacimientoAnimal" required="true" value='<%
                        if (ani.getFechaNacimiento() != null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(ani.getFechaNacimiento());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(animal.getFechaNacimiento());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Tipo de Sangre: </label>
                    <input type="text"  name="tipoSangre" required="true" maxlength="50" value='<%if (ani.getTipoSangre()!= null) {out.print(ani.getTipoSangre());}else{out.print(animal.getTipoSangre());}%>'/><br>
                    <label> Genero: </label>
                    <select name="genero" required="true">
                        <%if(ani.getIdGenero()!= 0){out.print(cL.getOpcionesGeneros(ani.getIdGenero()));}else{out.print(cL.getOpcionesGeneros(animal.getIdGenero()));}%>
                    </select><br>
                    <label> Color: </label>
                    <select name="color" required="true">
                        <%if(ani.getIdColor()!= 0){out.print(cL.getOpcionesColores(ani.getIdColor()));}else{out.print(cL.getOpcionesColores(animal.getIdColor()));}%>
                    </select><br>  
                    <label> Esterilizado </label>
                    <select name="esterilizado" required="true">
                        <option value="1" <%if(ani.getEsterilizado() == 1){out.print("selected");}%>> Si </option>
                        <option value="2" <%if(ani.getEsterilizado() == 0){out.print("selected");}%>> No </option>
                    </select><br>

                    <label> Ruta de su fotografia: </label>
                    <input type="text"  name="rutaFoto" maxlength="100" value='<%if (ani.getRutaFoto()!= null) {
                            out.print(ani.getRutaFoto());
                        }else{if(animal.getRutaFoto()!= null){out.print(animal.getRutaFoto());}}%>'/><br>
                    
                    <label> Observaciones: </label> 
                    <textarea rows="4" cols="50"  name="observaciones"><%if (ani.getObservaciones()!= null) {
                            out.print(ani.getObservaciones());
                        }else{if(animal.getObservaciones()!= null){out.print(animal.getObservaciones());}}%>
                    </textarea><br>
                    
                    <br>
                    
                    <input class='boton' name="insert" type="submit" value="Actualizar Animal" name="enviar" />
                    <input class='boton' name="insert" type="submit" value="Desactivar Animal" name="enviar" />

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
