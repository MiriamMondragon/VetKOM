<%-- 
    Document   : actualizarUsuario
    Created on : Jul 22, 2020, 2:08:40 PM
    Author     : Miriam
--%>

<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.UsuarioRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Actualizar Usuario</title>
    </head>
    <body>
        <%
            String idUsuario = request.getParameter("idUsuario");
            Usuario usuario = new Usuario();
            if(idUsuario != null && idUsuario.equals("")== false){
                UsuarioRepositorio uR = new UsuarioRepositorio();
                usuario = uR.buscar(idUsuario);
            }
            

            controladorDatosBD cL = new controladorDatosBD();
        Usuario us = new Usuario();
        if (request.getSession().getAttribute("usuario") != null) {
            us = (Usuario) request.getSession().getAttribute("usuario");
        }
        %>
        
        <header>

        </header>
        
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Empleado</h2>
                <form name="formulario" action="../../controladorUsuarios" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> Usuario: </label>
                    <input type="text"  name="idUsuario" required="true" value="<%if (us.getUsuario()!= null) {out.print(us.getUsuario());}else{out.print(usuario.getUsuario());}%>"/><br>
                    <label> Empleado: </label>
                    <select name="idEmpleado">
                        <%if(us.getIdEmpleado()!= 0){out.print(cL.getOpcionesJefes(us.getIdEmpleado()));}else{out.print(cL.getOpcionesJefes(usuario.getIdEmpleado()));}%>
                    </select><br>
                    <label> Clave: </label>
                    <input type="password"  name="clave" required="true"  maxlength="50" value='<%if (us.getClave()!= null) {out.print(us.getClave());}else{out.print(usuario.getClave());}%>'/><br>
                    <label> Fecha de Registro: </label>
                    <input type="date" name="fechaRegistro" readonly="true" value='<%
                        if (us.getFechaRegistro()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaRegistro());
                            out.print(fechaFinalDate);
                        }else{
                            if(usuario.getFechaRegistro() != null){
                                String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(usuario.getFechaRegistro());
                                out.print(fechaFinalDate);
                            }
                        }
                           %>'/><br>
                    <label> Fecha de Última Actualización: </label>
                    <input type="date" name="fechaModificacion" readonly="true" value='<%
                        if (us.getFechaModificacion()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(us.getFechaModificacion());
                            out.print(fechaFinalDate);
                        }else{
                            if(usuario.getFechaModificacion() != null){
                                String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(usuario.getFechaModificacion());
                                out.print(fechaFinalDate);
                            }
                        }
                           %>'/><br>
                    
                    <input class='boton' name="insert" type="submit" value="Actualizar Usuario" name="enviar" />
                    <input class='boton' name="insert" type="submit" value="Desactivar Usuario" name="enviar" />

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
