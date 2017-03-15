/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.fomularioDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class matriculaPrimerIngreso {
    
    
            
    @RequestMapping(value = "PrimerIngreso.gdc")
    public ModelAndView PrimerIngreso(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgFroMatriculaPrimerIngreso");
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
            
            
            }
        
        
        }
        
        
        return mv;
    }
    
    @RequestMapping(value = "formulario.gdc")
    public ModelAndView PrimerIngresoform(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgformularioPrimerIngreso");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Envia Nacionalidades
                List listaEN = opc.cargaNacionalidades();
                ArrayList<String> nompN = new ArrayList<String>();
                
                List<Object[]> listDatosEN = listaEN;
                for (Object[] datos : listDatosEN) {
                    nompN.add((String) datos[1].toString());  
                    

                }
                mv.addObject("nacionTemp",nompN);
            
            
            }
        
        
        }
        
        
        return mv;
    }
    
}
