<%-- 
    Document   : actualizarFactura
    Created on : Jul 29, 2020, 3:30:30 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.controladores.controladorPrincipal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.FacturaRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Ver Factura</title>
    </head>
    <body>
        <%
            String idFactura = request.getParameter("idFactura");
            controladorPrincipal controladorDetalle = new controladorPrincipal();
            Factura factura = new Factura();
            if(idFactura != null && idFactura.equals("")== false){
                FacturaRepositorio fR = new FacturaRepositorio();
                int id = Integer.parseInt(idFactura);
                factura = fR.buscar(id);
            }
            

            controladorDatosBD cL = new controladorDatosBD();
        Factura fac = new Factura();
        if (request.getSession().getAttribute("factura") != null) {
            fac = (Factura) request.getSession().getAttribute("factura");
        }
        %>
        
        <header>

        </header>
        
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Empleado</h2>
                <form name="formulario" action="../../controladorFacturas" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> No. Factura: </label>
                    <input type="number"  required="true" readonly="true" name="idFactura" value="<%if (fac.getIdFactura()!= 0) {out.print(fac.getIdFactura());}else{out.print(factura.getIdFactura());}%>"/><br>
                    <label> No. Cita: </label>
                    <select name="idCita" disabled="true" >
                        <%if(fac.getIdCita()!= 0){out.print(cL.getOpcionesCitasTodas(fac.getIdCita()));}else{out.print(cL.getOpcionesCitasTodas(factura.getIdCita()));}%>
                    </select><br>
                   
                    <label> Fecha de la Factura: </label>
                    <input type="date" name="fechaFactura" required="true" readonly="true" value='<%
                        if (fac.getFechaFactura()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(fac.getFechaFactura());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(factura.getFechaFactura());
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    
                    <label> Método de Pago: </label>
                    <select name="idMetodoPago" required="true" disabled="true" >
                         <%if(fac.getIdMetodoPago()!= 0){out.print(cL.getOpcionesMetodosPago(fac.getIdMetodoPago()));}else{out.print(cL.getOpcionesMetodosPago(factura.getIdMetodoPago()));}%>
                    </select><br>
                    
                    <div class="detalles">
                        <label> Detalles: </label>
                        <%if (fac.getIdFactura()!= 0) {out.print(controladorDetalle.verTablaDetalles(fac.getIdFactura(), fac.getFechaFactura()));}else{out.print(controladorDetalle.verTablaDetalles(factura.getIdFactura(), factura.getFechaFactura()));}%>
                        <%out.print("</table>");%>
                    </div><br>
                    
                    <label> SubTotal: </label>
                    <input type="number" name="subTotal" placeholder="1.00" step="0.01" min="1" required="true" readonly="true" value='<%if (fac.getSubtotal()!= 0) {out.print(fac.getSubtotal());}else{out.print(factura.getSubtotal());}%>'/><br>
                    
                    <label> Total: </label>
                    <input type="number" name="total" placeholder="1.00" step="0.01" min="1" required="true" readonly="true" value='<%if (fac.getTotal()!= 0) {out.print(fac.getTotal());}else{out.print(factura.getTotal());}%>'/><br>
                    
                    <input class='boton' name="insert" type="submit" value="Anular Factura"/>

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
