/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class adminUsuarioController {
    
    //Administra Usuarios
    @RequestMapping(value = "adminuser.gdc")
    public ModelAndView inicio() throws Exception {
        ModelAndView mv = new ModelAndView("pgAdminUser");
        
        
       
       
        return mv;
    } 
    
    
}
