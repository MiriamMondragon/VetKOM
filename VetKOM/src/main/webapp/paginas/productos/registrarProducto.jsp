<%-- 
    Document   : registrarProducto
    Created on : Jul 21, 2020, 3:29:17 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.repositorios.ProductoRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Producto"%>
<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Añadir Producto</title>
    </head>
    <%
        controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorProductos"
        Producto pro = new Producto();
        if (request.getSession().getAttribute("producto") != null) {
            pro = (Producto) request.getSession().getAttribute("producto");
        }
        
        ProductoRepositorio pR = new ProductoRepositorio();
        int numero = 0;
        if(pR.getIdentity() != 0){
            numero = pR.getIdentity();
        }
    %>
    <body>
        <header>

        </header>

        <div class="principal">
            <div class="formulario">
                <h2>Añadir Producto</h2>
                <form name="formulario" action="../../controladorProductos" method="POST">
                    <input type="text"  name="accion" value="nuevo" hidden="true"/>
                    <label> No.Producto: </label>
                    <input type="number"  name="idProducto" readonly="true" value="<%if (pro.getIdProducto()!= 0) {out.print(pro.getIdProducto());}else{out.print(numero);}%>"/><br>
                    <label> Nombre del Producto: </label>
                    <input type="text"  name="nombreProducto" required="true" maxlength="50" value='<%if (pro.getNombre() != null) {out.print(pro.getNombre());}%>'/><br>
                    <label> Proveedor: </label>
                    <select name="idProveedor" required="true" >
                        <%out.print(cL.getOpcionesProveedores(pro.getIdProveedor()));%>
                    </select><br>
                    <label> Categoría del Producto: </label>
                    <select name="idCategoria" required="true" >
                        <%out.print(cL.getOpcionesCategorias(pro.getIdCategoria()));%>
                    </select><br>
                    <label> Descripción de la Cantidad por Unidad: </label>
                    <input type="text"  name="cantidadUnidad" required="true" maxlength="50" value='<%if (pro.getCantidadUnidad()!= null) {out.print(pro.getCantidadUnidad());}%>'/><br>
                    <label> Cantidad en Almacén: </label>
                    <input type="number"  name="cantidadAlmacen" required="true" value="<%if (pro.getCantidadAlmacen()!= 0) {out.print(pro.getCantidadAlmacen());}%>"/><br>
                    <label> Cantidad Mínima en Almacén: </label>
                    <input type="number"  name="cantidadMinima" required="true" value="<%if (pro.getCantidadMinima()!= 0) {out.print(pro.getCantidadMinima());}%>"/><br>
                    <label> Cantidad Máxima en Almacén: </label>
                    <input type="number"  name="cantidadMaxima" required="true" value="<%if (pro.getCantidadMaxima()!= 0) {out.print(pro.getCantidadMaxima());}%>"/><br>
                    <label> Precio de la Unidad: </label>
                    <input type="number" name="precio" placeholder="1.00" step="0.01" min="1" required="true" value="<%if (pro.getPrecio()!= 0) {out.print(pro.getPrecio());}%>"/><br>
                    
                    <input class='boton' name="insert" type="submit" value="Guardar Producto" name="enviar" />

                </form>
            </div>
        </div>

        <footer>

        </footer>
    </body>
</html>
