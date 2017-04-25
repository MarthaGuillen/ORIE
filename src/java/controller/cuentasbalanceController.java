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
      public ModelAndView funCuentabalance( HttpServletRequest request){
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
        System.out.println("controller.cuentasbalanceController.funCuentabalance() Enviando");     
        System.out.println(origen);
        System.out.println(codigo);
        System.out.println(nombre);
            mv.addObject("idorigen",origen);
            mv.addObject("codigoorigen",codigo);
            mv.addObject("nombreorigen2",nombre);
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
     //tabla
      ArrayList<String> nombreorigen = new ArrayList<String>();
    ArrayList<String> codigocuentabalance = new ArrayList<String>();
    ArrayList<String> nombrecuentabalance = new ArrayList<String>();
    ArrayList<String> codigosubcuenta = new ArrayList<String>();
    ArrayList<String> nombresubcuenta = new ArrayList<String>();
    ArrayList<String> estadosubcuenta = new ArrayList<String>();
     int id_sociedad = Integer.parseInt((String) request.getSession().getAttribute("ses_idsociedad"));
    List cuentaorige =balance.generarcatalagos(id_sociedad);
    //obtener cuenta origen
     List<Object[]> listDatoorige = cuentaorige;
            for (Object[] datos : listDatoorige) {
                nombreorigen.add((String) datos[0]);
                codigocuentabalance.add((String) datos[1]);
                nombrecuentabalance.add((String) datos[2]);
                codigosubcuenta.add((String) datos[3]);
                nombresubcuenta.add((String) datos[4]);
                estadosubcuenta.add((String) datos[5].toString());
                        }  
             
          System.out.println(nombreorigen);
          System.out.println(codigocuentabalance);
          System.out.println(nombrecuentabalance);
          System.out.println(codigosubcuenta);
          System.out.println(nombresubcuenta);
          System.out.println(estadosubcuenta);
            mv.addObject("nombreorigen",nombreorigen);
            mv.addObject("codigocuentabalance",codigocuentabalance);
            mv.addObject("nombrecuentabalance",nombrecuentabalance);
            mv.addObject("codigosubcuenta",codigosubcuenta);
            mv.addObject("nombresubcuenta",nombresubcuenta);
            mv.addObject("estadosubcuenta",estadosubcuenta);
  
    return mv;
    }
      
      
      
      
     
      @RequestMapping(value = "agregarSubcuenta.gdc",method =RequestMethod.POST)
       public ModelAndView funsubcuenta(
          @RequestParam("cuenta") int cuenta,
          @RequestParam("sociedad") int sociedad,
           @RequestParam("nombre")  String nombre,
            @RequestParam("observacion") String observacion,
             @RequestParam("depuracion") String depuracion,
             HttpServletRequest request
       )throws Exception{
       ModelAndView mv=new ModelAndView("pgSCagregarcuentabalance");
       System.out.println(" estoy entrando en subcuenta");
       int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
       cuentabalanceDAO balance = new cuentabalanceDAO();
        List resp=balance.agregarsubcuentabalance(cuenta, sociedad, nombre, observacion, depuracion, idusuario);
        System.out.println("controller.cuentasbalanceController.funAgregarsubcuenta jers ()"+resp.get(0));
       mv.addObject("resp",resp.get(0));
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
      mv.addObject("resp",resp);
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
        mv.addObject("resp",resp);
        return mv;
       }
      
    @RequestMapping(value="combobalance.gdc", method = RequestMethod.POST)
    public ModelAndView funCuentaresultadoe(
                      @RequestParam("origen") int codigocr     
                           
    ) throws Exception{
    ModelAndView mv= new ModelAndView("pgcargarcombobalance");
    
    cuentabalanceDAO balance = new cuentabalanceDAO();
    ArrayList<String> idcuenta = new ArrayList<String>();
    ArrayList<String> codigocuenta = new ArrayList<String>();
    ArrayList<String> nombrecuenta = new ArrayList<String>();
        System.out.println("controller.cuentasbalanceController.funCuentaresultadoe()");
        System.out.println(codigocr);
    List cuentasmadres =balance.obtenercuenta(codigocr);
    
     List<Object[]> listDatosmadre = cuentasmadres;
            for (Object[] datos : listDatosmadre) {
                idcuenta.add((String) datos[0].toString());
                codigocuenta.add((String) datos[1].toString());
                nombrecuenta.add((String) datos[2]);
                           }  
           
            
   
       
            mv.addObject("idcuenta", idcuenta);
            mv.addObject("codigocuenta",codigocuenta);
            mv.addObject("nombrecuenta",nombrecuenta);
            
     
 return mv;
    }
       
      
}
