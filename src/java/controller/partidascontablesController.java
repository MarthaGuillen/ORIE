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
      //obtener cuenta origen
    ArrayList<String> origen = new ArrayList<String>();
    ArrayList<String> codigo = new ArrayList<String>();
    ArrayList<String> nombre = new ArrayList<String>();
     
    List cuentaorigen =balance.obtenercuentaorigen();
   
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
                   
           //obtener datos de la partida
       partidaDAO p =new partidaDAO();
       /*  List resp = p.mostrarpartidas();
         ArrayList<String> npartida =  new ArrayList<String>();
    ArrayList<String> nombrepartida = new ArrayList<String>();
    ArrayList<String> fechap = new ArrayList<String>();
    ArrayList<String> sociedadpartida = new ArrayList<String>();
    ArrayList<String> usuariopartida = new ArrayList<String>();
     List<Object[]> listDatos = resp;
            for (Object[] datos : listDatos) {
                npartida.add((String) datos[0].toString());
                nombrepartida.add((String) datos[1]);
                fechap.add((String) datos[2].toString());
                sociedadpartida.add((String) datos[3].toString());
                usuariopartida.add((String) datos[4]);
                           } 
            mv.addObject("npartida",npartida);
            mv.addObject("nombrepartida",nombrepartida);
            mv.addObject("fechap",fechap);
            mv.addObject("sociedadpartida",sociedadpartida);
            mv.addObject("usuariopartida",usuariopartida);*/
     
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
            @RequestParam("subcuenta") int subcuenta,
            @RequestParam("fecha")  String fecha,
            @RequestParam("sociedad")  int sociedad,
           
            HttpServletRequest request
    ){
    ModelAndView mv =new ModelAndView("pgrep");
    int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
        partidaDAO partida =new partidaDAO();
        List<String> id=partida.agregarpartida(subcuenta, sociedad, nombret, fecha,idusuario);
       
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
       String id=partida.agregardatospartida(idcrearpartida,subcuenta,descripcion, debe, haber,movimiento,idusuario);
       System.out.println("Regreso del Dao");
       System.out.println(id);
        mv.addObject("numerocuenta",id);
    return mv;
    }
    
    //crear contrapartida
    @RequestMapping (value = "Crearcontrapartida.gdc",method = RequestMethod.POST)
    public ModelAndView funtobtoperacion(@RequestParam("transaccion") int transaccion , HttpServletRequest request){
    ModelAndView mv = new ModelAndView("pgrep");
    partidaDAO partida = new partidaDAO();
     int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
    List dpartida = partida.obtenerdatospartida(transaccion);
    ArrayList<String> idsociedad =  new ArrayList<String>();
    ArrayList<String> nombrep = new ArrayList<String>();
    ArrayList<String> subcuenta = new ArrayList<String>();
    List<Object[]> listp = dpartida;
     for (Object[] datos : listp) {
                idsociedad.add((String) datos[0].toString());
                nombrep.add((String) datos[1]);
                subcuenta.add((String) datos[2].toString());
     }
     String nombrecontra=nombrep.get(0)+ "(Contrapartida)";
             
             
             
   List<String>  crearcontrapartida=partida.crearcontrapartida(Integer.parseInt(subcuenta.get(0)),Integer.parseInt(idsociedad.get(0)) ,nombrecontra, idusuario);
       
        
    String  idcontrapartida=crearcontrapartida.get(0);
    System.out.println(idcontrapartida+"   jjj");
    int contra_partida=Integer.parseInt(idcontrapartida);
    List modificarpartida =  partida.modificarpartida(transaccion);
    String modificar =modificarpartida.get(0).toString();
    List operaciones =partida.obteneroperacion(transaccion);
    ArrayList<String> operacion =  new ArrayList<String>();
    ArrayList<String> subcuentap = new ArrayList<String>();
    ArrayList<String> debep = new ArrayList<String>();
    ArrayList<String> haberp = new ArrayList<String>();
    ArrayList<String> concepto = new ArrayList<String>();
    ArrayList<String> movi = new ArrayList<String>();
     List<Object[]> listDatos = operaciones;
            for (Object[] datos : listDatos) {
                operacion.add((String) datos[0].toString());
                subcuentap.add((String) datos[1].toString());
                concepto.add((String) datos[2]);
                debep.add((String) datos[3].toString());
                haberp.add((String) datos[4].toString());
                movi.add((String) datos[5].toString());
                           } 
            ArrayList<String> res = new ArrayList<String>();
            System.out.println(modificar+" revisando modificar ;"+contra_partida);
          if(modificar=="Exito" || contra_partida>0 ){
          System.out.println("entrar:=> "+concepto.size());
              for (int i = 0; i < concepto.size(); i++) {
                 
                  String Descrip=concepto.get(i);
                  int cuenta=Integer.parseInt(subcuentap.get(i));
                  float deb = Float.parseFloat(debep.get(i));
                  float habe =Float.parseFloat(haberp.get(i));
                  String mov=movi.get(i);
                  System.out.println("i=>"+i+"1 "+Descrip+"2 "+deb+" 3"+habe+" 4 "+mov);
                  if(mov.equals("D")){
                    
                     String oper =partida.agregardatospartida(contra_partida, cuenta, Descrip, habe, deb, "H", idusuario);
                       res.add(oper);
                     System.out.println(" e=>"+oper);
                  }else if(mov.equals("H")){
                  String oper =partida.agregardatospartida(contra_partida, cuenta, Descrip, habe, deb, "D", idusuario);
                     res.add(oper);
                      System.out.println(" e=>"+oper);
                  }
              }
          
          }
        System.out.println("controller.partidascontablesController.funtobtoperacion()");
        System.out.println("arr=> " +res);
        mv.addObject("insert", res);
    return mv;
    }
          
    
    
    @RequestMapping(value = "partidast.gdc" ,method =RequestMethod.POST)
    public  ModelAndView funactualizardatosdepartidas(
              @RequestParam("sociedad") int sociedad      
    ){
    ModelAndView mv =new ModelAndView("pgajax");
      
    
         //obtener datos de la partida
       partidaDAO p =new partidaDAO();
         List resp = p.mostrarpartidas(sociedad);
         ArrayList<String> idpartida =  new ArrayList<String>();
    ArrayList<String> codigopartida = new ArrayList<String>();
    ArrayList<String> fechap = new ArrayList<String>();
    ArrayList<String> nombrepartida = new ArrayList<String>();
    ArrayList<String> usuariopartida = new ArrayList<String>();
    ArrayList<String> estado = new ArrayList<String>();
     List<Object[]> listDatos = resp;
            for (Object[] datos : listDatos) {
                idpartida.add((String) datos[0].toString());
                codigopartida.add((String) datos[1]);
                fechap.add((String) datos[2].toString());
                nombrepartida.add((String) datos[3].toString());
                usuariopartida.add((String) datos[4]);
                estado.add((String) datos[5].toString());
                           } 
          mv.addObject("idpartida",idpartida);
            mv.addObject("codigopartida",codigopartida);
            mv.addObject("fechap",fechap);
            mv.addObject("nombrepartida",nombrepartida);
            mv.addObject("usuariopartida",usuariopartida);
            mv.addObject("estado",estado);
            System.out.println("controller.partidascontablesController.funactualizardatosdepartidas()");
            System.out.println(idpartida+" "+codigopartida+" "+fechap);
         
    return mv;
    }
    
 

}

 