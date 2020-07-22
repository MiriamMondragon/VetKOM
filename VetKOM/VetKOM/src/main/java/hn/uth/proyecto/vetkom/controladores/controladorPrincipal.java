/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hn.uth.proyecto.vetkom.controladores;

import hn.uth.proyecto.vetkom.objetos.Cliente;
import hn.uth.proyecto.vetkom.objetos.Empleado;
import hn.uth.proyecto.vetkom.objetos.Producto;
import hn.uth.proyecto.vetkom.objetos.Servicio;
import hn.uth.proyecto.vetkom.repositorios.ClienteRepositorio;
import hn.uth.proyecto.vetkom.repositorios.EmpleadoRepositorio;
import hn.uth.proyecto.vetkom.repositorios.ProductoRepositorio;
import hn.uth.proyecto.vetkom.repositorios.ServicioRepositorio;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Miriam
 */
public class controladorPrincipal {

    EmpleadoRepositorio empleadosRepo = new EmpleadoRepositorio();
    ClienteRepositorio clientesRepo = new ClienteRepositorio();
    ProductoRepositorio productoRepo = new ProductoRepositorio();
    ServicioRepositorio servicioRepo = new ServicioRepositorio();
    //facturas, animales, usuarios, citas

    public String getTablaFromBuscador(String filtro, String action) {
        String tabla = "";
        if (action.equals("Empleado")) {
            if (filtro != null) {
                tabla = "<table id='tabla'>";
                tabla += "<tr>";
                tabla += "<th>No. de Empleado</th>";
                tabla += "<th>Nombre del Empleado</th>";
                tabla += "<th>Ver Empleado</th>";
                tabla += "<tr>";
                try {
                    Empleado empleado = empleadosRepo.buscar(filtro);
                    String fila = "<tr>";
                    fila += "<td>" + empleado.getIdEmpleado() + "</td>";
                    fila += "<td>" + empleado.getNombres() + " " + empleado.getApellidos() + "</td>";
                    fila += "<td><a href=\"empleados/actualizarEmpleado.jsp?accion=actualizar&idEmpleado=" + empleado.getIdEmpleado() + "\"> Actualizar Empleado</a></td>";
                    tabla += fila;
                } catch (Exception ex) {
                    Logger.getLogger(controladorPrincipal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        if (action.equals("Cliente")) {
            if (filtro != null) {
                tabla = "<table id='tabla'>";
                tabla += "<tr>";
                tabla += "<th>No. Identidad del Cliente</th>";
                tabla += "<th>Nombre del Cliente</th>";
                tabla += "<th>Ver Cliente</th>";
                tabla += "<tr>";
                try {
                    Cliente cliente = clientesRepo.buscar(filtro);
                    String fila = "<tr>";
                    fila += "<td>" + cliente.getIdCliente() + "</td>";
                    fila += "<td>" + cliente.getNombres() + " " + cliente.getApellidos() + "</td>";
                    fila += "<td><a href=\"clientes/actualizarCliente.jsp?accion=actualizar&idCliente=" + cliente.getIdCliente() + "\"> Actualizar Cliente</a></td>";
                    tabla += fila;
                } catch (Exception ex) {
                    Logger.getLogger(controladorPrincipal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        if (action.equals("Producto")) {
            if (filtro != null) {
                tabla = "<table id='tabla'>";
                tabla += "<tr>";
                tabla += "<th>No. Producto</th>";
                tabla += "<th>Nombre del Producto</th>";
                tabla += "<th>Precio</th>";
                tabla += "<th>Ver Producto</th>";
                tabla += "<tr>";
                try {
                    Producto producto = productoRepo.buscar(filtro);
                    String fila = "<tr>";
                    fila += "<td>" + producto.getIdProducto()+ "</td>";
                    fila += "<td>" + producto.getNombre() + "</td>";
                    fila += "<td>" + producto.getPrecio()+ "</td>";
                    fila += "<td><a href=\"productos/actualizarProducto.jsp?accion=actualizar&idProducto=" + producto.getIdProducto()+ "\"> Actualizar Producto</a></td>";
                    tabla += fila;
                } catch (Exception ex) {
                    Logger.getLogger(controladorPrincipal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        if (action.equals("Servicio")) {
            if (filtro != null) {
                tabla = "<table id='tabla'>";
                tabla += "<tr>";
                tabla += "<th>No. Servicio</th>";
                tabla += "<th>Nombre del Servicio</th>";
                tabla += "<th>Precio</th>";
                tabla += "<th>Ver Servicio</th>";
                tabla += "<tr>";
                try {
                    Servicio servicio = servicioRepo.buscar(filtro);
                    String fila = "<tr>";
                    fila += "<td>" + servicio.getIdServicio()+ "</td>";
                    fila += "<td>" + servicio.getNombre() + "</td>";
                    fila += "<td>" + servicio.getPrecio()+ "</td>";
                    fila += "<td><a href=\"servicios/actualizarServicio.jsp?accion=actualizar&idServicio=" + servicio.getIdServicio()+ "\"> Actualizar Servicio</a></td>";
                    tabla += fila;
                } catch (Exception ex) {
                    Logger.getLogger(controladorPrincipal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return tabla;

    }
}