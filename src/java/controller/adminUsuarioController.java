/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.adminUsuariosDAO;
import modelo.dao.perfilDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class adminUsuarioController {
    
    //Administra Usuarios
    @RequestMapping(value = "adminuser.gdc")
    public ModelAndView inicio(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgAdminUser");
        
        adminUsuariosDAO opc = new adminUsuariosDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Envia usuarios
                List listaEN = opc.cargaUsuarios();
                ArrayList<String> iduse = new ArrayList<String>();
                ArrayList<String> usuario = new ArrayList<String>();
                ArrayList<String> correo = new ArrayList<String>();
                ArrayList<String> nombrec = new ArrayList<String>();
                ArrayList<String> estado = new ArrayList<String>();
                ArrayList<String> creador = new ArrayList<String>();
                ArrayList<String> perfil = new ArrayList<String>();
                ArrayList<String> idp = new ArrayList<String>();
                List<Object[]> listDatosEN = listaEN;
                for (Object[] datos : listDatosEN) {
                    iduse.add((String) datos[0].toString()); 
                    usuario.add((String) datos[1].toString()); 
                    correo.add((String) datos[2].toString()); 
                    nombrec.add((String) datos[3].toString()); 
                    estado.add((String) datos[4].toString()); 
                    creador.add((String) datos[5].toString()); 
                    idp.add((String) datos[6].toString()); 
                    perfil.add((String) datos[7].toString()); 
                }
                mv.addObject("idusLista",iduse);
                mv.addObject("usuarioLista",usuario);
                mv.addObject("correoLista",correo);
                mv.addObject("nombrecLista",nombrec);
                mv.addObject("estadoLista",estado);
                mv.addObject("creadorLista",creador);
                mv.addObject("idpLista",idp);
                mv.addObject("perfilLista",perfil);
                //Carga perfiles
                
                List listaPer = opc.cargaPerfilLista();
                ArrayList<String> idper = new ArrayList<String>();
                ArrayList<String> nomper = new ArrayList<String>();
                ArrayList<String> desc = new ArrayList<String>();
                List<Object[]> listDatosPer = listaPer;
                for (Object[] datos : listDatosPer) {
                    idper.add((String) datos[0].toString()); 
                    nomper.add((String) datos[1].toString()); 
                    desc.add((String) datos[2].toString()); 
                }
                mv.addObject("idper",idper);
                mv.addObject("nomper",nomper);
                mv.addObject("desc",desc);
            }
        
        
        }
       
        return mv;
    } 
    
    //Administra Usuarios
    @RequestMapping(value = "cargaPerfilSel.gdc")
    public ModelAndView cargaPerf(@RequestParam("idpe") int idp,HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        
        adminUsuariosDAO opc = new adminUsuariosDAO();
        perfilDAO opc1 = new perfilDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Envia usuarios
                //Captura label de menus
                    String cadena = "";
                    List listalabel = opc1.cargaMeuLabelPorPerfil(idp);
                    ArrayList<String> label = new ArrayList<String>();
                    ArrayList<String> idlbl = new ArrayList<String>();
                    List<Object[]> listDatoslbl = listalabel;
                    for (Object[] datos : listDatoslbl) {
                        idlbl.add((String) datos[0].toString());
                        label.add((String) datos[1]);  

                    }
                    

                    //captura menus
                    List listaMenu = opc1.cargaMeuperfil(idp);
                    ArrayList<String> menu = new ArrayList<String>();
                    ArrayList<String> idMen = new ArrayList<String>();
                    ArrayList<String> urlmen = new ArrayList<String>();
                    ArrayList<String> pseudoMenu = new ArrayList<String>();
                    ArrayList<String> idMenlbl = new ArrayList<String>();
                    List<Object[]> listDatosMenu = listaMenu;
                    for (Object[] datos : listDatosMenu) {
                        idMen.add((String) datos[0].toString());
                        menu.add((String) datos[1]);  
                        pseudoMenu.add((String) datos[2]); 
                        idMenlbl.add((String) datos[3].toString()); 
                        urlmen.add((String) datos[4].toString()); 
                    }
                   

                    //captura navegacion 
                    List listaNav = opc1.cargaNavperfil(idp);
                    ArrayList<String> idnav = new ArrayList<String>();
                    ArrayList<String> nav = new ArrayList<String>();
                    ArrayList<String> hru = new ArrayList<String>();
                    ArrayList<String> icono = new ArrayList<String>();
                    ArrayList<String> idmenNav = new ArrayList<String>();
                    List<Object[]> listDatosnav = listaNav;
                    for (Object[] datos : listDatosnav) {

                        idnav.add((String) datos[0].toString());  
                        nav.add((String) datos[1]);
                        hru.add((String) datos[2]);
                        icono.add((String) datos[3].toString());
                        idmenNav.add((String) datos[4].toString()); 

                    }
                    
                    String cadena1 = "<div class='col-md-6'>";
                    String cadena2 = "<div class='col-md-6'>";
                    int cambiante = 0;
                    for(int i=0;i<idlbl.size();i++){
                       cadena += "<h2>"+label.get(i).toString()+"</h2>"; 
                       cadena += "<ul style='list-style-type:none'>";
                       for(int j=0;j<idMen.size();j++){
                            if(idMenlbl.get(j).toString() == null ? idlbl.get(i).toString() == null : idMenlbl.get(j).toString().equals(idlbl.get(i).toString())){
                                cadena += "<li><div class='checkbox-custom fill checkbox-success mb5'>";
                                cadena += "<input type='checkbox'  checked=\"\" disabled=\"\" id='men"+idMen.get(j)+"' value='men"+idMen.get(j)+"' onclick=\"activaVista('divmen"+idMen.get(j)+"');\">";
                                cadena += "<label for='men"+idMen.get(j)+"'>"+menu.get(j)+"</label>";
                                cadena += "</div></li>";
                                cadena += "<ul style='list-style-type:none'>";
                                cadena += "<div id='divmen"+idMen.get(j)+"'>";
                                for(int k=0;k<idnav.size();k++){
                                   if(idmenNav.get(k) == null ? idMen.get(j) == null : idmenNav.get(k).equals(idMen.get(j))){
                                       
                                       cadena += "<li><div class='checkbox-custom fill checkbox-success mb5'>";
                                       cadena += "<input  checked=\"\" disabled=\"\" type='checkbox' id='nav"+idnav.get(k)+"' value='nav"+idnav.get(k)+"' onclick=\"activaNav('"+idnav.get(j)+"');\">";
                                       cadena += "<label for='nav"+idnav.get(k)+"'>"+nav.get(k)+"</label>";
                                       cadena += "</div></li>";
                                       
                                   }
                                }
                                cadena += "</div>";
                                cadena += "</ul>";
                            }
                       }
                       cadena += "</ul>";
                       if(cambiante==0){
                          cambiante = 1; 
                          cadena1 += cadena;
                       }else{
                          cambiante = 0; 
                          cadena2 += cadena;
                       }
                       cadena = "";
                    }
                    cadena1 += "</div>";
                    cadena1 += "</div>";
                    mv.addObject("cadena1",cadena1);
                    mv.addObject("cadena2",cadena2);
                    mv.addObject("validaCadena","si");

            }
        
        
        }
       
        return mv;
    } 
}
