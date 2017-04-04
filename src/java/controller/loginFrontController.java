/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.loginDAO;
import modelo.dao.perfilDAO;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class loginFrontController {
    
    //validando
    @RequestMapping(value = "login.gdc")
    public ModelAndView inicio() throws Exception {
        ModelAndView mv = new ModelAndView("pgfrnLogin");
        
        
       
       
        return mv;
    }    
    
    //validando login
    @RequestMapping(value = "validaUs.gdc", method = RequestMethod.POST)
    public ModelAndView inicioValida(@RequestParam("xtp") String usr, @RequestParam("ptp") String pass,HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        //desencripta usuario 
        byte [] usrt = Base64.decodeBase64(usr);
        byte [] pasrt = Base64.decodeBase64(pass);
        String us = new String(usrt);
        String ps = new String(pasrt);
        loginDAO opc = new loginDAO();
        String p1 = new String(us.getBytes("ISO-8859-1"), "UTF-8");
        String p2 = new String(ps.getBytes("ISO-8859-1"), "UTF-8");
        //valida si el pass y el user son correctos, el estado es true y el tipo de usuario es back   
        String resp = opc.cargaRespuestas(p1, p2);
        perfilDAO op1c = new perfilDAO();
        if("Acceso".equals(resp)){
           String idus = "";
           String nomus = "";
           String cor = "";
           String fechc = "";
           String fechm = "";
           List listaP = op1c.cargaDatosusr(p1);
           List<Object[]> listDatosp = listaP;
           for (Object[] datos : listDatosp) {
                idus = (String) datos[0].toString();
                nomus = (String) datos[1].toString();
                cor = (String) datos[2].toString();
                fechc = (String) datos[3].toString();
                fechm = (String) datos[4].toString();
           } 
           //guarda variables de session usuario 
           request.getSession().setAttribute("ses_idusuario", idus);
           request.getSession().setAttribute("ses_usuario", nomus);
           request.getSession().setAttribute("ses_correo", cor);
           request.getSession().setAttribute("ses_estado", "Activa");
           request.getSession().setAttribute("ses_fechc", fechc);
           request.getSession().setAttribute("ses_fechm", fechm);
        }
        mv.addObject("resp", resp);
       
        return mv;
    }  
    
    
    @RequestMapping(value = "closeSes.gdc")
    public ModelAndView logout(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgfrnLogin");
        request.getSession().setAttribute("ses_idusuario", "");
        request.getSession().setAttribute("ses_usuario", "");
        request.getSession().setAttribute("ses_correo", "");
        request.getSession().setAttribute("ses_estado", "Des");
        request.getSession().setAttribute("ses_fechc", "");
        request.getSession().setAttribute("ses_fechm", "");
        perfilDAO opc = new perfilDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
            int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
            String id = opc.insertaBitacora("Se cerro sesion", 16, 6, idusuario);
       
        }
        }
        return mv;
    }  
    
     @RequestMapping(value = "closeSesU.gdc")
    public ModelAndView logoutU(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgFroLogin");
        request.getSession().setAttribute("ses_idusuario", "");
        request.getSession().setAttribute("ses_usuario", "");
        request.getSession().setAttribute("ses_correo", "");
        request.getSession().setAttribute("ses_estado", "Des");
        request.getSession().setAttribute("ses_fechc", "");
        request.getSession().setAttribute("ses_fechm", "");
        perfilDAO opc = new perfilDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
            int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
            String id = opc.insertaBitacora("Se cerro sesion", 16, 6, idusuario);
       
        }
        }
       
       
        return mv;
    }
    
    
}