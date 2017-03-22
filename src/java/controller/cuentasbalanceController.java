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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class cuentasbalanceController {
    @RequestMapping(value= "CuentasBalance.gdc")
      public ModelAndView funCuentabalance(){
    ModelAndView mv = new ModelAndView("pgSC_CuentaBalance");
     cuentabalanceDAO balance = new cuentabalanceDAO();
     ArrayList<String> origen = new ArrayList<String>();
    ArrayList<String> codigo = new ArrayList<String>();
    ArrayList<String> nombre = new ArrayList<String>();
     
    List cuentaorigen =balance.obtenercuentaorigen();
    //obtener cuenta origen
     List<Object[]> listDatoorigen = cuentaorigen;
            for (Object[] datos : listDatoorigen) {
                origen.add((String) datos[0].toString());
                codigo.add((String) datos[1].toString());
                nombre.add((String) datos[2]);
                        }  
            mv.addObject("idorigen",origen);
            mv.addObject("codigoorigen",codigo);
            mv.addObject("nombreorigen",nombre);
     //obtener sociedad
     ArrayList<String> idsociedad =new ArrayList<String>();   
     ArrayList<String> sociedadnombre =new ArrayList<String>();   
     ArrayList<String> logo =new ArrayList<String>();  
     List sociedad =balance.obtenersociedad();
     List<Object[]> socieda=sociedad;
     for(Object [] datos: socieda){
         idsociedad.add((String)datos[0].toString());
         sociedadnombre.add((String)datos[1].toString());
         logo.add((String)datos[1].toString());
     }
     mv.addObject("idsociedad",idsociedad);
     mv.addObject("sociedadnombre",sociedadnombre);
     mv.addObject("logo",logo);
     
     
    return mv;
    }
      
      
      
      
      @RequestMapping(value = "agregarsubcuenta.gdc",method =RequestMethod.POST)
       public ModelAndView funAgregarsubcuenta(
          @RequestParam("origen") int origen,
          @RequestParam("cuenta") int cuenta,
          @RequestParam("sociedad") int sociedad,
          @RequestParam("codigosub") String codigosub,
           @RequestParam("nombre")  String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("observacion") String observacion,
             @RequestParam("estado")boolean estado,
             HttpServletRequest request
       )throws Exception{
       ModelAndView mv=new ModelAndView("pgSCagregarcuentabalance");
       int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
       cuentabalanceDAO balance = new cuentabalanceDAO();
       String resp=balance.agregarsubcuentabalance(cuenta, sociedad, codigosub, nombre, descripcion, observacion, estado, cuenta);
       return mv;
       }
     
       
       
       @RequestMapping(value = "agregarcuenta.gdc",method =RequestMethod.POST)
       public ModelAndView funAgregarcuenta(
          @RequestParam("origenmayor") int origenmayor,
          @RequestParam("codigomayor") String codigomayor,
          @RequestParam("nombremayor") String nombremayor,
          @RequestParam("obsevacionmayor") String obsevacionmayor,
          HttpServletRequest request
       )throws Exception{
       ModelAndView mv=new ModelAndView("pgSCagregarcuentabalance");
      int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
      cuentabalanceDAO balance = new cuentabalanceDAO();
      String resp=balance.agregarcuentabalance(origenmayor, codigomayor, nombremayor, obsevacionmayor, idusuario);
      
       return mv;
       }
      
       
       
       
       @RequestMapping(value = "agregarorigen.gdc",method =RequestMethod.POST)
       public ModelAndView funAgregarcuentaorigen(
          @RequestParam("codigoorigen") String codigoorigen,
          @RequestParam("nombreorigen") String nombreorigen,
          @RequestParam("observacionorigen") String observacionorigen,
            HttpServletRequest request
       )throws Exception{
       ModelAndView mv=new ModelAndView("pgSCagregarcuentabalance");
      int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
       cuentabalanceDAO balance = new cuentabalanceDAO();
      String resp;
          System.out.println("controller.cuentasbalanceController.funAgregarcuentaorigen()");
          System.out.println(codigoorigen+" "+ nombreorigen+" "+  observacionorigen+" "+ idusuario);
        resp = balance.agregarcuentorigen(codigoorigen, nombreorigen, observacionorigen,idusuario);
               return mv;
       }
      
    @RequestMapping(value="xddxfdg.gdc", method = RequestMethod.POST)
    public ModelAndView funCuentaresultadoe(
                      @RequestParam("origen") String codigocr     
                           
    ) throws Exception{
    ModelAndView mv= new ModelAndView("pgcargarcombobalance");
    
    cuentabalanceDAO balance = new cuentabalanceDAO();
    ArrayList<String> idcuenta = new ArrayList<String>();
    ArrayList<String> codigocuenta = new ArrayList<String>();
    ArrayList<String> nombrecuenta = new ArrayList<String>();
    List cuentasmadres =balance.obtenercuenta(Integer.parseInt(codigocr));
    
     List<Object[]> listDatosmadre = cuentasmadres;
            for (Object[] datos : listDatosmadre) {
                idcuenta.add((String) datos[0].toString());
                codigocuenta.add((String) datos[1].toString());
                nombrecuenta.add((String) datos[2]);
                           }  
           
            
        System.out.println("Ajax?????????????");
        System.out.println( idcuenta);
        System.out.println(codigocuenta);
        System.out.println( nombrecuenta);
       
            mv.addObject(" idcuenta", idcuenta);
            mv.addObject("codigocuenta",codigocuenta);
            mv.addObject("nombrecuenta",nombrecuenta);
            
     
 return mv;
    }
       
      
}
