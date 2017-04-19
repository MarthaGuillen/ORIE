/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.cuentabalanceDAO;
import modelo.dao.librodiarioDAO;
import modelo.dao.operacion;
import modelo.dao.partida;
import modelo.dao.partidaDAO;
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
     public ModelAndView funbuscaroperaciones(@RequestParam("fecha") String fecha, HttpServletRequest request ) throws Exception{
     ModelAndView mv = new ModelAndView("pgajaxlibrodiario");
     int sociedad = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
     librodiarioDAO libro = new librodiarioDAO();
     partida partida =new partida();
     operacion operaciones = new operacion();
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
     
   
   
     List<Object[]> listDatoorigen = repuest;
            for (Object[] datos : listDatoorigen) {
                fechap.add((String) datos[0].toString());
                codigopartida.add((String) datos[1].toString());
                nombrepartida.add((String) datos[2]);
                codigocuenta.add((String) datos[3]);
                nombrecuenta.add((String) datos[4]);
                concepto.add((String) datos[5]);
                debe.add((String) datos[6].toString());
                haber.add((String) datos[7].toString());
                estado.add((String) datos[8].toString());
                usuario.add((String) datos[9]);
                fechacreo.add((String) datos[10].toString());
                        }  
            System.out.println("controller.LibroDiarioController.funbuscaroperaciones()");
            System.out.println(concepto);
          List<partida> part = new ArrayList();  
           for(int i=0;i<codigopartida.size();i++){
                String nombrepartid = "";
               List<operacion> op =new ArrayList();
                float parcial = 0;
               if(i==0){
               nombrepartid= nombrepartida.get(i);
                 for( int j=0;j<nombrepartida.size();j++){
                  if(nombrepartid==nombrepartida.get(j)){
                    //operaciones=  );
                      op.add(new operacion(codigocuenta.get(j), nombrecuenta.get(j), concepto.get(j),Float.parseFloat(debe.get(j)),Float.parseFloat(haber.get(j))));
                      parcial+=Float.parseFloat(debe.get(j));
                  }
                 }
                // partida=new partida(fechap.get(i),nombrepartida.get(i), codigopartida.get(i), op, parcial, estado.get(i), usuario.get(i), fechacreo.get(i));
                 part.add(new partida(fechap.get(i),nombrepartida.get(i), codigopartida.get(i), op, parcial, estado.get(i), usuario.get(i), fechacreo.get(i)));
                }else{
                 
                   if(nombrepartid!=nombrepartida.get(i)){
                   nombrepartid= nombrepartida.get(i);
                    
                 for( int j=0;j<nombrepartida.size();j++){
                  if(nombrepartid==nombrepartida.get(j)){
                    operaciones=  new operacion(codigocuenta.get(j), nombrecuenta.get(j), concepto.get(j),Float.parseFloat(debe.get(j)),Float.parseFloat(haber.get(j)));
                      op.add(operaciones);
                      parcial+=Float.parseFloat(debe.get(j));
                  }
                 }
                 partida=new partida(fechap.get(i),nombrepartida.get(i), codigopartida.get(i), op, parcial, estado.get(i), usuario.get(i), fechacreo.get(i));
                 part.add(partida);
                   }
               
               }
           }
           
         System.out.println(part.size());
         mv.addObject("list", part);
     return mv;
     }
       
     
 
}
