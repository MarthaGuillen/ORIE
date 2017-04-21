/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.librodiarioDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LibroDiarioController {
     @RequestMapping(value = "librodiario.gdc")
     public ModelAndView funcLibrodiario(){
      ModelAndView mv = new ModelAndView("pgLibrodiario");
   

                   
      return mv;
     }
    @RequestMapping(value ="librodiarioobtener.gdc", method = RequestMethod.POST)
     public ModelAndView funbuscaroperaciones(@RequestParam("fecha") String fecha,
           @RequestParam("datosauditoria") int datosauditoria, HttpServletRequest request ) throws Exception{
     ModelAndView mv = new ModelAndView("pgajaxlibrodiario");
     int sociedad = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
     librodiarioDAO libro = new librodiarioDAO();
   
     List repuest = libro.filtrolibrodiario(sociedad,fecha);
     ArrayList<String> fechap = new ArrayList<String>();
    ArrayList<String> codigopartida = new ArrayList<String>();
    ArrayList<String> nombrepartida = new ArrayList<String>();    
    ArrayList<String> codigocuenta = new ArrayList<String>();
    ArrayList<String> nombrecuenta = new ArrayList<String>();    
    ArrayList<String> concepto = new ArrayList<String>();
    ArrayList<String> debe = new ArrayList<String>();
    ArrayList<String> haber = new ArrayList<String>();
    ArrayList<String> estado = new ArrayList<String>();
    ArrayList<String> usuario = new ArrayList<String>();
    ArrayList<String> fechacreo = new ArrayList<String>();
     
   
    float saldodebe = 0,saldohaber = 0;
     List<Object[]> listDatoorigen = repuest;
            for (Object[] datos : listDatoorigen) {
                fechap.add((String) datos[0].toString());
                codigopartida.add((String) datos[1].toString());
             
                nombrepartida.add((String) datos[2]);
              
                codigocuenta.add((String) datos[3]);
                nombrecuenta.add((String) datos[4]);
                concepto.add((String) datos[5]);
                debe.add((String) datos[6].toString());
              saldodebe+=Float.parseFloat((String) datos[6].toString());
              saldohaber+=Float.parseFloat((String) datos[7].toString());
                haber.add((String) datos[7].toString());
                estado.add((String) datos[8].toString());
                usuario.add((String) datos[9]);
                fechacreo.add((String) datos[10].toString());
                        }  
            System.out.println("Haber"+saldohaber);
            System.out.println("Debe"+saldodebe);
 
         
       mv.addObject("fechap",fechap);
       mv.addObject("codigopartida",codigopartida);
       mv.addObject("codigocuenta",codigocuenta);
       mv.addObject("nombrecuenta",nombrecuenta);
       mv.addObject("concepto",concepto);
       mv.addObject("debe",debe);
       mv.addObject("haber",haber);
       mv.addObject("estado",estado);
       mv.addObject("usuario",usuario);
       mv.addObject("fechacreo",fechacreo);
       mv.addObject("datosauditoria",datosauditoria);
       mv.addObject("saldohaber",saldohaber);
       mv.addObject("saldodebe",saldodebe);
     return mv;
     }
       
     
 
}
