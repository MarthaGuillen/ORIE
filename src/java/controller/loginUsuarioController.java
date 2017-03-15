/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.loginDAO;
import modelo.dao.loginFrontDAO;
import modelo.dao.mailDAO;
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
public class loginUsuarioController {
    public static final String emailUsr = "infosystemprueba@gmail.com";
    public static final String emailPas = "gdc2017Sinergia";
    //validando
    @RequestMapping(value = "Inicio.gdc")
    public ModelAndView inicio() throws Exception {
        ModelAndView mv = new ModelAndView("pgFroLogin");
            return mv;
    }  
    
    
    //insert usuario
    @RequestMapping(value = "userget.gdc")
    public ModelAndView getuser(@RequestParam("xusrten") String xusrt, @RequestParam("ptpr") String pass, @RequestParam("nombre") String nombre,@RequestParam("correo") String correo) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        loginFrontDAO opc = new loginFrontDAO();
        byte [] usrt = Base64.decodeBase64(xusrt);
        byte [] pasrt = Base64.decodeBase64(pass);
        String us = new String(usrt);
        String ps = new String(pasrt);
        
        String p1 = new String(us.getBytes("ISO-8859-1"), "UTF-8");
        String p2 = new String(ps.getBytes("ISO-8859-1"), "UTF-8");
        String p3 = new String(nombre.getBytes("ISO-8859-1"), "UTF-8");
        String p4 = new String(correo.getBytes("ISO-8859-1"), "UTF-8");
        //inserta usuario
        String resp = opc.insertaUsuario(p3, p1,p4,p2);
        if(!"N".equals(resp)){
            mailDAO c = new mailDAO();   
            c.setContrasenia(emailPas);
            c.setUsuario(emailUsr);
            c.setAsunto("Del Campo International School");
            c.setMensaje("<!DOCTYPE html>" +
"<html>" +
"<head>" +
"<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
"<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>" +
"<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>" +
"</head>" +
"  <style>" +
"    " +
"	  " +
"	  .btn {" +
"  -webkit-border-radius: 28;" +
"  -moz-border-radius: 28;" +
"  border-radius: 28px;" +
"  font-family: Arial;" +
"  color: #ffffff;" +
"  font-size: 20px;" +
"  background: #0e6e15;" +
"  padding: 10px 20px 10px 20px;" +
"  text-decoration: none;" +
"}" +
"" +
".btn:hover {" +
"  background: #3cb0fd;" +
"  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);" +
"  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);" +
"  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);" +
"  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);" +
"  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);" +
"  text-decoration: none;" +
"}" +
"    </style>" +
"<body>  " +
"    <table style='border-bottom: 8px solid #0e6e15;'>" +
"                              <tr>" +
"                                <th>" +
"                                  <h1 style='align:center;font-family:Helvetica;'>Bienvenido(a) a nuestra plataforma de matricula online.</h1>" +
"                                  " +
"                                </th>" +
"                                " +
"                              </tr>" +
"							  <tr>" +
"                                <th>" +
"                                  <img src='http://drive.google.com/uc?export=view&id=0B-N3gWTKJr8jcHFBVGs1R0lKVms' align='center' width='30%'>" +
"                                  " +
"                                </th>" +
"                                " +
"                              </tr>" +
"    </table> " +
"    <h4 style='font-family:Helvetica;'>Para terminar de configurar su cuenta, por favor de clic en la siguiente boton:</h4> " +
"    <table>" +
"        <tr>" +
"            " +
"            <th><a style='color:white; -webkit-border-radius: 28;" +
"  -moz-border-radius: 28;" +
"  border-radius: 28px;" +
"  font-family: Arial;" +
"  color: #ffffff;" +
"  font-size: 20px;" +
"  background: #0e6e15;" +
"  padding: 10px 20px 10px 20px;" +
"  text-decoration: none;' href='http://localhost:8080/ORIE/activarCuenta.gdc?id="+correo+"' class='btn'>Activar cuenta</a><br></th>" +
"			" +
"        </tr>" +
"    </table><br><br>	" +
"</body>" +
"" +
"</html>");
            c.setDestino(correo);
            emailController co=new emailController();
            if(co.enviarCorreo(c)){
             
            }else{
              
            }    
        }
        
        mv.addObject("resp", resp);
        
        
        return mv;
    }
    
    //Valida Login
    @RequestMapping(value = "validaUsuario.gdc", method = RequestMethod.POST)
    public ModelAndView inicioValida(@RequestParam("xtp") String usr, @RequestParam("ptp") String pass,HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        //desencripta usuario 
        byte [] usrt = Base64.decodeBase64(usr);
        byte [] pasrt = Base64.decodeBase64(pass);
        String us = new String(usrt);
        String ps = new String(pasrt);
        loginFrontDAO opc = new loginFrontDAO();
        String p1 = new String(us.getBytes("ISO-8859-1"), "UTF-8");
        String p2 = new String(ps.getBytes("ISO-8859-1"), "UTF-8");
        //valida si el pass y el user son correctos, el estado es true y el tipo de usuario es back   
        String resp = opc.cargaRespuestas(p1, p2);
        
        if("Acceso".equals(resp)){
           String idus = "";
           String nomus = "";
           String cor = "";
           String fechc = "";
           String fechm = "";
           perfilDAO op1c = new perfilDAO();
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
    
    
    @RequestMapping(value = "activarCuenta.gdc",  method = RequestMethod.GET)
    public ModelAndView acti(@RequestParam("id") String correo) throws Exception {
        ModelAndView mv = new ModelAndView("pgActivacion");
        loginFrontDAO opc = new loginFrontDAO();
        String p2 = new String(correo.getBytes("ISO-8859-1"), "UTF-8");
        String resp = opc.updateUsuarioCuenta(p2);
        mv.addObject("resp", resp);
        return mv;
    } 
    
    
}
