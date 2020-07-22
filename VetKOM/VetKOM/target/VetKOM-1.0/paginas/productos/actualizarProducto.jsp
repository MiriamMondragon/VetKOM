<%-- 
    Document   : actualizarProducto
    Created on : Jul 21, 2020, 4:54:48 PM
    Author     : Miriam
--%>

<%@page import="hn.uth.proyecto.vetkom.controladores.controladorDatosBD"%>
<%@page import="hn.uth.proyecto.vetkom.repositorios.ProductoRepositorio"%>
<%@page import="hn.uth.proyecto.vetkom.objetos.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <title>Actualizar Producto</title>
    </head>
    <body>
        <%
            String idProducto = request.getParameter("idProducto");
            Producto producto = new Producto();
            if(idProducto != null && idProducto.equals("")== false){
                ProductoRepositorio pR = new ProductoRepositorio();
                int id = Integer.parseInt(idProducto);
                producto = pR.buscar(id);
            }
            

            controladorDatosBD cL = new controladorDatosBD();
        //action="../../controladorProductos"
        Producto pro = new Producto();
        if (request.getSession().getAttribute("producto") != null) {
            pro = (Producto) request.getSession().getAttribute("producto");
        }
        %>
        
        <header>

        </header>
        
        <div class="principal">
            <div class="formulario">
                <h2>Actualizar Producto</h2>
                <form name="formulario" action="../../controladorProductos" method="POST">
                    <input type="text"  name="accion" value="actualizar" hidden="true"/>
                    <label> No.Producto: </label>
                    <input type="number"  name="idProducto" readonly="true" value="<%if (pro.getIdProducto()!= 0) {out.print(pro.getIdProducto());}else{out.print(producto.getIdProducto());}%>"/><br>
                    <label> Nombre del Producto: </label>
                    <input type="text"  name="nombreProducto" required="true" maxlength="50" value='<%if (pro.getNombre() != null) {out.print(pro.getNombre());}else{out.print(producto.getNombre());}%>'/><br>
                    <label> Proveedor: </label>
                    <select name="idProveedor" required="true" >
                        <%if(pro.getIdProveedor()!= 0){out.print(cL.getOpcionesProveedores(pro.getIdProveedor()));}else{out.print(cL.getOpcionesProveedores(producto.getIdProveedor()));}%>
                    </select><br>
                    <label> Categoría del Producto: </label>
                    <select name="idCategoria" required="true" >
                        <%if(pro.getIdCategoria()!= 0){out.print(cL.getOpcionesCategorias(pro.getIdCategoria()));}else{out.print(cL.getOpcionesCategorias(producto.getIdCategoria()));}%>
                    </select><br>
                    <label> Descripción de la Cantidad por Unidad: </label>
                    <input type="text"  name="cantidadUnidad" required="true" maxlength="50" value='<%if (pro.getCantidadUnidad()!= null) {
                            out.print(pro.getCantidadUnidad());
                        }else{out.print(producto.getCantidadUnidad());}%>'/><br>

                    <label> Cantidad en Almacén: </label>
                    <input type="number"  name="cantidadAlmacen" required="true" value='<%if (pro.getCantidadAlmacen() != 0) {
                            out.print(pro.getCantidadAlmacen());
                        }else{out.print(producto.getCantidadAlmacen());}%>'/><br>
                    <label> Cantidad Mínima en Almacén: </label>
                    <input type="number"  name="cantidadMinima" required="true" value='<%if (pro.getCantidadMinima()!= 0) {
                            out.print(pro.getCantidadMinima());
                        }else{out.print(producto.getCantidadMinima());}%>'/><br>
                    
                    <label> Cantidad Máxima en Almacén: </label>
                    <input type="number"  name="cantidadMaxima" required="true" value='<%if (pro.getCantidadMaxima()!= 0) {
                            out.print(pro.getCantidadMaxima());
                        }else{out.print(producto.getCantidadMaxima());}%>'/><br>
                    <label> Precio de la Unidad: </label>
                    <input type="number" name="precio" placeholder="1.00" step="0.01" min="1" required="true" value='<%if (pro.getPrecio() != 0) {
                            out.print(pro.getPrecio());
                        }else{out.print(producto.getPrecio());}%>'/><br>
                    
                    
                    <input class='boton' name="insert" type="submit" value="Actualizar Producto" name="enviar" />
                    <input class='boton' name="insert" type="submit" value="Desactivar Producto" name="enviar" />

                </form>
            </div>
        </div>
        
        <footer>

        </footer>
    </body>
</html>
