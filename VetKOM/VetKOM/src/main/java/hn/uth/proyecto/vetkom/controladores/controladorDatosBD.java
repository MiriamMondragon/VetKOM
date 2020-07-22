/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hn.uth.proyecto.vetkom.controladores;

import hn.uth.proyecto.vetkom.repositorios.DatosBDRepositorio;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Miriam
 */
public class controladorDatosBD {

    DatosBDRepositorio lr = new DatosBDRepositorio();

    public String getOpcionesPaises(int seleccionado) {
        Hashtable paises = new Hashtable();
        String opcion = "";
        try {
            paises = lr.getPaises();
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(paises.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + paises.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + paises.get(i.intValue()).toString() + "</option>";
            }
        }

        /*for (Object key : paises.keySet()){
            out.print("<option value='" + key.toString() + "'>" + paises.get(key).toString() + "</option>"); 
        }
         */
        return opcion;
    }
    
    public String getOpcionesDepartamentos(int idPais, int seleccionado) {
        Hashtable deptos = new Hashtable();
        String opcion = "";
        try {
            deptos = lr.getDeptos(idPais);
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(deptos.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + deptos.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + deptos.get(i.intValue()).toString() + "</option>";
            }
        }

        return opcion;
    }
    
    public String getOpcionesCiudades(int idDepto) {
        Hashtable ciudades = new Hashtable();
        String opcion = "";
        try {
            ciudades = lr.getCiudades(idDepto);
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(ciudades.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            opcion += "<option value='" + i.toString() + "'>" + ciudades.get(i.intValue()).toString() + "</option>";
        }

        return opcion;
    }
    
    public String getCiudad(int idCiudad) {
        Hashtable ciudades = new Hashtable();
        String opcion = "";
        try {
            ciudades = lr.getCiudad(idCiudad);
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(ciudades.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            opcion += "<option value='" + i.toString() + "' selected>" + ciudades.get(i.intValue()).toString() + "</option>";
        }

        return opcion;
    }
    
    public String getOpcionesCargos(int seleccionado){
        Hashtable cargos = new Hashtable();
        String opcion = "";
        try {
            cargos = lr.getCargos();
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(cargos.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + cargos.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + cargos.get(i.intValue()).toString() + "</option>";
            }
        }

        return opcion;
    }
    
    public String getOpcionesJefes(int seleccionado){
        Hashtable reporta = new Hashtable();
        String opcion = "";
        try {
            reporta = lr.getReportaA();
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(reporta.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + reporta.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + reporta.get(i.intValue()).toString() + "</option>";
            }
        }

        return opcion;
    }
    
    public String getOpcionesGeneros(int seleccionado) {
        Hashtable generos = new Hashtable();
        String opcion = "";
        try {
            generos = lr.getGeneros();
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(generos.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + generos.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + generos.get(i.intValue()).toString() + "</option>";
            }
        }

        return opcion;
    }
    
    public String getOpcionesProveedores(int seleccionado) {
        Hashtable proveedores = new Hashtable();
        String opcion = "";
        try {
            proveedores = lr.getProveedores();
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(proveedores.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + proveedores.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + proveedores.get(i.intValue()).toString() + "</option>";
            }
        }

        return opcion;
    }
    
    public String getOpcionesCategorias(int seleccionado) {
        Hashtable categorias = new Hashtable();
        String opcion = "";
        try {
            categorias = lr.getCategoriasProductos();
        } catch (Exception ex) {
            Logger.getLogger(controladorDatosBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Integer> listaOrdenada = Collections.list(categorias.keys());
        Collections.sort(listaOrdenada);
        Iterator<Integer> it = listaOrdenada.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if(seleccionado != 0 && seleccionado == i.intValue()){
                opcion += "<option value='" + i.toString() + "' selected>" + categorias.get(i.intValue()).toString() + "</option>";
            }else{
                opcion += "<option value='" + i.toString() + "'>" + categorias.get(i.intValue()).toString() + "</option>";
            }
        }

        return opcion;
    }

}
