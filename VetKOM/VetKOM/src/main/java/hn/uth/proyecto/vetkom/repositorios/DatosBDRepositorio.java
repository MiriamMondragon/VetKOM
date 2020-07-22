/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hn.uth.proyecto.vetkom.repositorios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Miriam
 */
public class DatosBDRepositorio {
    
    public static Connection getConnection() throws Exception {
        try {

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DatosBDRepositorio.class.getName()).log(Level.SEVERE, null, ex);
            }

            String connectionUrl = "jdbc:sqlserver://DESKTOP-R7UAJG0\\SQLEXPRESS01:1433;databaseName=BD2_Veterinaria";
            return DriverManager.getConnection(connectionUrl, "sa", "Sephiroth51342");

        } catch (SQLException e) {
            throw new Exception("No se pudo establecer la conexión: " + e.toString());
        }
    }
    
    public static Hashtable getPaises() throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Pais, Nombre_Pais FROM Paises";

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idPais = resultado.getInt("Id_Pais");
                String nombrePais = resultado.getString("Nombre_Pais");
                datos.put(idPais, nombrePais);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar paises: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getDeptos(int idPais) throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Departamento, Nombre_Departamento FROM Departamentos WHERE Id_Pais = " + idPais;

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idDepto = resultado.getInt("Id_Departamento");
                String nombreDepto = resultado.getString("Nombre_Departamento");
                datos.put(idDepto, nombreDepto);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar deptos: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getCiudades(int idDepto) throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Ciudad, Nombre_Ciudad FROM Ciudades WHERE Id_Departamento = " + idDepto;

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idCiudad = resultado.getInt("Id_Ciudad");
                String nombreCiudad = resultado.getString("Nombre_Ciudad");
                datos.put(idCiudad, nombreCiudad);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar ciudades: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getCiudad(int idCiudad) throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Ciudad, Nombre_Ciudad FROM Ciudades WHERE Id_Ciudad = " + idCiudad;

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int id = resultado.getInt("Id_Ciudad");
                String nombreCiudad = resultado.getString("Nombre_Ciudad");
                datos.put(id, nombreCiudad);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar ciudad: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getCargos() throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Cargo, Nombre_Cargo FROM Cargos";

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idCargo = resultado.getInt("Id_Cargo");
                String nombreCargo = resultado.getString("Nombre_Cargo");
                datos.put(idCargo, nombreCargo);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar cargos: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getReportaA() throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Empleado, Nombres, Apellidos FROM Empleados WHERE Activo = 1";

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idEmpleado = resultado.getInt("Id_Empleado");
                String nombre = resultado.getString("Nombres") + " " + resultado.getString("Apellidos");
                datos.put(idEmpleado, nombre);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar jefes: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getGeneros() throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Genero, Nombre_Genero FROM Generos";

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idGenero = resultado.getInt("Id_Genero");
                String genero = resultado.getString("Nombre_Genero");
                datos.put(idGenero, genero);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar generos: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getCategoriasProductos() throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Categoria, Nombre_Categoria FROM Categorias";

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idCategoria = resultado.getInt("Id_Categoria");
                String categoria = resultado.getString("Nombre_Categoria");
                datos.put(idCategoria, categoria);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar categorias: " + e.toString());
        }
        return datos;
    }
    
    public static Hashtable getProveedores() throws Exception {
        Hashtable datos = new Hashtable();
        try {
            Connection cnx = getConnection();
           
            String sql = "SELECT Id_Proveedor, Nombre_Proveedor FROM Proveedores";

            Statement st = cnx.createStatement();

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                int idProveedor = resultado.getInt("Id_Proveedor");
                String nombre = resultado.getString("Nombre_Proveedor");
                datos.put(idProveedor, nombre);
            }

            st.close();
            cnx.close();
        } catch (SQLException e) {
            throw new Exception("Error al buscar proveedores: " + e.toString());
        }
        return datos;
    }
    
}
