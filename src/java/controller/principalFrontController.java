/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class principalFrontController {
    
    @RequestMapping(value = "Principal.gdc")
    public ModelAndView inicioPerfil(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgfrnPrincipal");
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
            
            
            }
        
        
        }
        
        
        return mv;
    }
}
