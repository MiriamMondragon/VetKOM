<%-- 
    Document   : registrarFactura
    Created on : Jul 28, 2020, 8:48:58 AM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.objetos.DetalleFactura"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorPrincipal"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.FacturaRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Factura"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Crear Factura</title>
    </head>
    <%
        controladorDatosBD cL = new controladorDatosBD();
        controladorPrincipal controladorDetalle = new controladorPrincipal();
        
        Factura fac = new Factura();
        DetalleFactura det = new DetalleFactura();
        if (request.getSession().getAttribute("factura") != null) {
            fac = (Factura) request.getSession().getAttribute("factura");
        }
        if (request.getSession().getAttribute("detalle") != null) {
            det = (DetalleFactura) request.getSession().getAttribute("detalle");
        }
        
        FacturaRepositorio fR = new FacturaRepositorio();
        int numero = 0;
        if(fR.getIdentity() != 0){
            numero = fR.getIdentity();
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Registrar Factura</h2>
                <form name="formulario" action="../../controladorFacturas" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> No. Factura: </label>
                    <input type="number"  readonly="true" required="true" name="idFactura" value="<%if (fac.getIdFactura()!= 0) {out.print(fac.getIdFactura());}else{out.print(numero);}%>"/><br>
                    <label> No. Cita: </label>
                    <select name="idCita" required="true" >
                        <%out.print(cL.getOpcionesCitas(fac.getIdCita()));%>
                    </select><br>
                    <label> Fecha de la Factura: </label>
                    <input type="date" name="fechaFactura" required="true" readonly="true" value='<%
                        if (fac.getFechaFactura()!= null) {
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(fac.getFechaFactura());
                            out.print(fechaFinalDate);
                        }else{
                            String fechaFinalDate = new SimpleDateFormat("yyyy-MM-dd").format(Date.from(Instant.now()));
                            out.print(fechaFinalDate);
                        }
                           %>'/><br>
                    
                    <label> Método de Pago: </label>
                    <select name="idMetodoPago" required="true" >
                        <%out.print(cL.getOpcionesMetodosPago(fac.getIdMetodoPago()));%>
                    </select><br>
                    
                    <div class="detalles">
                        <label> Detalles: </label>
                        <%if (fac.getIdFactura()!= 0) {out.print(controladorDetalle.getTablaDetalles(fac.getIdFactura(), Date.from(Instant.now())));}else{out.print(controladorDetalle.getTablaDetalles(numero, Date.from(Instant.now())));}%>
                        <%out.print("<tr><td> Tipo de concepto: </td>");%>
                        <%out.print("<td> Descripción: </td>");%>
                        <%out.print("<td></td>");%>
                        <%out.print("<td> Impuesto: </td>");%>
                        <%out.print("<td> Descuento: </td></tr>");%>

                        <%out.print("<tr><td>");%>
                        <select name="tipoConcepto" onchange="formulario.submit()">
                            <option value="1" <%if(det.getTipo() == 1){out.print("selected");}%>>Producto</option>
                            <option value="2" <%if(det.getTipo() == 2){out.print("selected");}%>>Servicio</option>
                        </select>
                        <%out.print("</td>");%>
                        <%out.print("<td>");%>
                        <select name="idConcepto" onchange="formulario.submit()">
                            <option value="">Debe seleccionar un tipo de concepto</option>
                            <%
                                if(det.getTipo() != 0){out.print(cL.getOpcionesConceptos(det.getTipo(), det.getIdConcepto()));}
                            %>
                        </select>
                        <%out.print("</td>");%>
                        <%out.print("<td></td>");%>
                        <%out.print("<td>");%>
                        <select name="idImpuesto" required="true">
                            <%out.print(cL.getOpcionesImpuestos(det.getIdImpuesto()));%>
                        </select>
                        <%out.print("</td>");%>
                        <%out.print("<td>");%>
                        <select name="idDescuento" required="true">
                            <%out.print(cL.getOpcionesDescuentos(det.getIdDescuento()));%>
                        </select>
                        <%out.print("</td>");%>
                        <%out.print("<td>");%>
                        
                        <input class='botonDetalle' name="insert" type="submit" value="+"/><br>

                        <%out.print("</td>");%>
                        <%out.print("</tr>");%>
                        <%out.print("</table>");%>
                    </div><br>
                    
                    <label> SubTotal: </label>
                    <input type="number" name="subTotal" placeholder="1.00" step="0.01" min="1" required="true" readonly="true" value='<%if (fac.getSubtotal()!= 0) {out.print(fac.getSubtotal());}%>'/><br>

                    <label> Total: </label>
                    <input type="number" name="total" placeholder="1.00" step="0.01" min="1" required="true" readonly="true" value='<%if (fac.getTotal()!= 0) {out.print(fac.getTotal());}%>'/><br>

                    
                    <input class='boton' name="insert" type="submit" value="Guardar Factura" />

                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>