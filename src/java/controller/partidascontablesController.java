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
import modelo.dao.partidaDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class partidascontablesController {
    @RequestMapping(value ="PartidasContables.gdc")
    public ModelAndView funpartidas(){
    ModelAndView mv = new ModelAndView("pgSC_partidasContables");
    ArrayList<String> idsociedad =new ArrayList<String>();   
     ArrayList<String> sociedadnombre =new ArrayList<String>();   
     ArrayList<String> logo =new ArrayList<String>();  
     
     //Sociedad
     cuentabalanceDAO balance = new cuentabalanceDAO();
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
             
        System.out.println(origen);
        System.out.println(codigo);
        System.out.println(nombre);
            mv.addObject("idorigen",origen);
            mv.addObject("codigoorigen",codigo);
            mv.addObject("nombreorigen",nombre);
       
     
    return mv;
    }
    @RequestMapping(value ="llenarcombocuentat.gdc",method = RequestMethod.POST)
    public ModelAndView funpartidassociedad(@RequestParam("origen") int origen){
    ModelAndView mv =new ModelAndView("pgcargarcombobalance");
    
 cuentabalanceDAO balance = new cuentabalanceDAO();
    ArrayList<String> idcuenta = new ArrayList<String>();
    ArrayList<String> codigocuenta = new ArrayList<String>();
    ArrayList<String> nombrecuenta = new ArrayList<String>();
        System.out.println("controller.cuentasbalanceController.funCuentaresultadoe()");
        System.out.println(origen);
    List cuentasmadres =balance.obtenercuenta(origen);
    
     List<Object[]> listDatosmadre = cuentasmadres;
            for (Object[] datos : listDatosmadre) {
                idcuenta.add((String) datos[0].toString());
                codigocuenta.add((String) datos[1].toString());
                nombrecuenta.add((String) datos[2]);
                           }  
           
            
   
        System.out.println(idcuenta);
        System.out.println(codigocuenta);
        System.out.println(nombrecuenta);
            mv.addObject("idcuenta", idcuenta);
            mv.addObject("codigocuenta",codigocuenta);
            mv.addObject("nombrecuenta",nombrecuenta);
             
     
    return  mv;
    }
   @RequestMapping(value ="llenarsubcuenta.gdc" , method = RequestMethod.POST)
   public ModelAndView funcllenarsubcuenta(
                @RequestParam("cuenta") int cuenta,
                @RequestParam("sociedad") int sociedad
   ){
           ModelAndView mv= new ModelAndView("pgcombsubcuenta");
           partidaDAO partiAO=new partidaDAO();
            ArrayList<String> idcuenta = new ArrayList<String>();
    ArrayList<String> codigocuenta = new ArrayList<String>();
    ArrayList<String> nombrecuenta = new ArrayList<String>();
        System.out.println("controller.cuentasbalanceController.funCuentaresultadoe()");
        System.out.println(cuenta);
        System.out.println(sociedad);
    List cuentasmadres =partiAO.vercuentapartida(cuenta, sociedad);
    
     List<Object[]> listDatosmadre = cuentasmadres;
            for (Object[] datos : listDatosmadre) {
                idcuenta.add((String) datos[0].toString());
                codigocuenta.add((String) datos[2].toString());
                nombrecuenta.add((String) datos[3]);
                           }  
           
          
        System.out.println(idcuenta);
        System.out.println(codigocuenta);
        System.out.println(nombrecuenta);
            mv.addObject("subidcuenta", idcuenta);
            mv.addObject("subcodigocuenta",codigocuenta);
            mv.addObject("subnombrecuenta",nombrecuenta);
       return mv;
   }
   
  
    
     @RequestMapping(value = "crearpartida.gdc" ,method =RequestMethod.POST)
    public  ModelAndView funcrearpartida(
              @RequestParam("nombret") String nombret,
            @RequestParam("fecha")  String fecha,
            @RequestParam("sociedad")  int sociedad,
           
            HttpServletRequest request
    ){
    ModelAndView mv =new ModelAndView("pgrep");
    int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
        partidaDAO partida =new partidaDAO();
        List<String> id=partida.agregarpartida( sociedad, nombret, fecha,idusuario);
       
        mv.addObject("id",id);
    return mv;
    }
     @RequestMapping(value = "agregarpartida.gdc" ,method =RequestMethod.POST)
    public  ModelAndView funagregartpartida(
              @RequestParam("idcrearpartida") int idcrearpartida,
              @RequestParam("subcuenta") int subcuenta,
              @RequestParam("descripcion") String descripcion,           
            @RequestParam("debe")  float debe,
            @RequestParam("haber")  float haber,
            @RequestParam("movimiento") String movimiento,
            HttpServletRequest request
    ){
    ModelAndView mv =new ModelAndView("pgobtener");
         System.out.println("controller.partidascontablesController.funagregarpartida() estou anjaklsa");
         System.out.println("");
    int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
        partidaDAO partida =new partidaDAO();
       List<String> id=partida.agregardatospartida(idcrearpartida,subcuenta,descripcion, debe, haber,movimiento,idusuario);
       System.out.println("Regreso del Dao");
       System.out.println(id);
        mv.addObject("id",id);
    return mv;
    }
}
