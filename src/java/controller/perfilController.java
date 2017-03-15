/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.perfilDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class perfilController {
    
    @RequestMapping(value = "perfil.gdc")
    public ModelAndView inicioPerfil(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgPerfil");
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
            int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
            perfilDAO opc = new perfilDAO();
            String idp = "";
            String nom = "";
            String decr = "";
            //caraga datos del perfil enviando el id del usuario        
            List listaP = opc.cargaDatosper(idusuario);
            List<Object[]> listDatosp = listaP;
            for (Object[] datos : listDatosp) {
                    idp = (String) datos[0].toString();
                    nom = (String) datos[1].toString();
                    decr = (String) datos[2].toString();

            } 
            request.getSession().setAttribute("ses_idperfil", idp);
            mv.addObject("nombrePerfil", nom);
            mv.addObject("descPerfil", decr);

            //Captura label de menus
            List listalabel = opc.cargaMeuLabel();
            ArrayList<String> label = new ArrayList<String>();
            ArrayList<String> idlbl = new ArrayList<String>();
            List<Object[]> listDatoslbl = listalabel;
            for (Object[] datos : listDatoslbl) {
                idlbl.add((String) datos[0].toString());
                label.add((String) datos[1]);  

            }
            mv.addObject("idlbl",idlbl);
            mv.addObject("label",label);

            //captura menus
            List listaMenu = opc.cargaMeuperfil(Integer.parseInt(idp));
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
            mv.addObject("menu",menu);
            mv.addObject("idMen",idMen);
            mv.addObject("pseudoMenu",pseudoMenu);
            mv.addObject("idmenlbl",idMenlbl);

            //captura opciones

            List listaOpciones = opc.cargaOpperfil(Integer.parseInt(idp));
            ArrayList<String> opcion = new ArrayList<String>();
            ArrayList<String> url = new ArrayList<String>();
            ArrayList<String> pseudoUrl = new ArrayList<String>();
            ArrayList<String> idmenuop = new ArrayList<String>();
            List<Object[]> listDatosopc = listaOpciones;
            for (Object[] datos : listDatosopc) {

                opcion.add((String) datos[1]);  
                url.add((String) datos[2]);
                pseudoUrl.add((String) datos[3]);
                idmenuop.add((String) datos[4].toString());


            }
            mv.addObject("opcion",opcion);
            mv.addObject("url",url);
            mv.addObject("pseudoOpcion",pseudoUrl);
            mv.addObject("idMenusOpc",idmenuop);

            //captura sub opciones


            //captura navegacion 
            List listaNav = opc.cargaNavperfil(Integer.parseInt(idp));
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
            mv.addObject("nav",nav);
            mv.addObject("idmenNav",idmenNav);

            //variables de sesion
            request.getSession().setAttribute("ses_idlbl", idlbl);
            request.getSession().setAttribute("ses_labels", label);
            request.getSession().setAttribute("ses_idmenus", idMen);
            request.getSession().setAttribute("ses_menus", menu);
            request.getSession().setAttribute("ses_iconosmenu", pseudoMenu);
            request.getSession().setAttribute("ses_idmenlbl", idMenlbl);
            request.getSession().setAttribute("ses_urlmen", urlmen);        
            request.getSession().setAttribute("ses_opciones", opcion);
            request.getSession().setAttribute("ses_urlOpciones", url);
            request.getSession().setAttribute("ses_iconoopciones", pseudoUrl);
            request.getSession().setAttribute("ses_idopcmen", idmenuop);
            request.getSession().setAttribute("ses_navegacion", nav);
            request.getSession().setAttribute("ses_idmenNav", idmenNav);

            //carga sociedades 
            String sociedaddefault = "";
            String idsociedaddefault = "";
            String Logosociedaddefault = "";
            ArrayList<String> idsoc = new ArrayList<String>();
            ArrayList<String> soc = new ArrayList<String>();
            ArrayList<String> log = new ArrayList<String>();
            List listaSoc = opc.cargaSociedad(idusuario);
            List<Object[]> listsoc = listaSoc;
            for (Object[] datos : listsoc) {
                idsoc.add((String) datos[0].toString());  
                soc.add((String) datos[1]);
                log.add((String) datos[2]);
                if("true".equals((String) datos[3].toString())){
                    sociedaddefault = (String) datos[1];
                    idsociedaddefault = (String) datos[0].toString();
                    Logosociedaddefault = (String) datos[2];
                }
            }
            request.getSession().setAttribute("ses_sociedadDefault", sociedaddefault);
            request.getSession().setAttribute("ses_idsociedad", idsociedaddefault);
            request.getSession().setAttribute("ses_logoSoc", Logosociedaddefault);
            mv.addObject("idsoc",idsoc);
            mv.addObject("soc",soc);
            mv.addObject("log",log);
        }
        }
        return mv;
    } 
    
}
