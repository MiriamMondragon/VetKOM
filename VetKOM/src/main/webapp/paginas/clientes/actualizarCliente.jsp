<%-- 
    Document   : actualizarCliente
    Created on : Jul 20, 2020, 4:21:49 PM
    Author     : Miriam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.ClienteRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="../../estilos/tooltip.css">
        <title>Actualizar Cliente</title>
    </head>
    <body>
        <%
            String idCliente = request.getParameter("idCliente");
            Cliente cliente = new Cliente();
            if(idCliente != null && idCliente.equals("")== false){
                ClienteRepositorio eR = new ClienteRepositorio();
                String id = idCliente;
                cliente = eR.buscar(id);
            }
            

            controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorEmpleados"
        Cliente cli = new Cliente();
        if (request.getSession().getAttribute("cliente") != null) {
            cli = (Cliente) request.getSession().getAttribute("cliente");
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
        %>
        
        <header>

        </header>
        
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Cliente</h2>
                <form name="formulario" action="../../controladorClientes" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> No. Identidad del Cliente: </label>
                    <input type="number"  required="true" name="idCliente" value="<%if (cli.getIdCliente() != null) {out.print(cli.getIdCliente());}else{out.print(cliente.getIdCliente());}%>"/><br>
                    <label> Nombres: </label>
                    <input type="text"  name="nombresCliente" required="true" maxlength="50" value='<%if (cli.getNombres() != null) {out.print(cli.getNombres());}else{out.print(cliente.getNombres());}%>'/><br>
                    <label> Apellidos: </label>
                    <input type="text"  name="apellidosCliente" required="true"  maxlength="50" value='<%if (cli.getApellidos() != null) {out.print(cli.getApellidos());}else{out.print(cliente.getApellidos());}%>'/><br>
                    <label> Fecha de Nacimiento: </label>
                    <input type="date" name="fechaNacimientoCliente" required="true" value='<%
                        if (cli.getFechaNacimiento() != null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cli.getFechaNacimiento());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cliente.getFechaNacimiento());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    <label> Fecha de Registro: </label>
                    <input type="date" name="fechaRegistroCliente" required="true" value='<%
                        if (cli.getFechaRegistro()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cli.getFechaRegistro());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(cliente.getFechaRegistro());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    
                    <label> Género: </label>
                    <select name="idGeneroCliente" required="true" >
                        <%if(cli.getIdGenero()!= 0){out.print(cL.getOpcionesGeneros(cli.getIdGenero()));}else{out.print(cL.getOpcionesGeneros(cliente.getIdGenero()));}%>
                    </select><br>
                    <label> Dirección: </label>
                    <input type="text"  name="direccionCliente" required="true" maxlength="50" value='<%if (cli.getDireccion() != null) {
                            out.print(cli.getDireccion());
                        }else{out.print(cliente.getDireccion());}%>'/><br>

                    <label> País: </label>
                    <select name="paisCliente" onchange="formulario.submit()">
                        <%out.print(cL.getOpcionesPaises(idPais));%>
                    </select><br>

                    <label> Departamento: </label>
                    <select name="departamentoCliente" onchange="formulario.submit()">
                        <option value="">Debe seleccionar un País</option>
                        <%out.print(cL.getOpcionesDepartamentos(idPais, idDepto));%>
                    </select><br>

                    <label> Ciudad: </label>
                    <select name="ciudadCliente" required="true">
                        <option value="">Debe seleccionar un Departamento</option>
                        <%if(idDepto != 0){out.print(cL.getOpcionesCiudades(idDepto));}else{out.print(cL.getCiudad(cliente.getIdCiudad()));}%>
                    </select><br>

                    <label> Ruta de su fotografia: </label>
                    <input type="text"  name="rutaFoto" maxlength="100" value='<%if (cli.getRutaFoto()!= null) {
                            out.print(cli.getRutaFoto());
                        }else{if(cliente.getRutaFoto()!= null){out.print(cliente.getDireccion());}}%>'/><br>
                    
                    <div class="tooltip">
                        <label> Teléfonos: </label>
                        <span class="tooltiptext">Ingresar varios teléfonos, separados por comas (,)</span>
                        <input type="text"  name="telefonos" value='<%if (cli.getTelefonos()!= null) {
                            out.print(cli.getTelefonos());
                        }else{if(cliente.getTelefonos()!= null){out.print(cliente.getTelefonos());}}%>'/><br>
                    </div>
                    <br>
                    
                    <input class='boton' name="insert" type="submit" value="Actualizar Cliente" name="enviar" />
                    <input class='boton' name="insert" type="submit" value="Desactivar Cliente" name="enviar" />

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
