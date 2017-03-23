/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.cuentaresultadoDAO;
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
 * @author Sinergia003
 */
@Controller
public class cuentasresultadocontroller {
       @RequestMapping(value="CuentaResultado.gdc", method = RequestMethod.POST)
    public ModelAndView funCuentaresultado(
                           
                           @RequestParam("tipocr") String tipocr,
                           @RequestParam("codigo") String codigo,
                           @RequestParam("nombre") String nombre
    ) throws Exception{
    ModelAndView mv= new ModelAndView("pgrep");
    System.out.println( " aca estoy");
    cuentaresultadoDAO Cuentaresultado=new cuentaresultadoDAO();
      
          
        System.out.println(tipocr);   
        System.out.println(nombre);   
        System.out.println(codigo);
        
String rep=Cuentaresultado.agregarcuentaresultado(Integer.parseInt(tipocr),codigo, nombre);
     
 return mv;
    }
    @RequestMapping(value="xddxfdg.gdc", method = RequestMethod.POST)
    public ModelAndView funCuentaresultadoe(
                      @RequestParam("codigocr") String codigocr     
                           
    ) throws Exception{
    ModelAndView mv= new ModelAndView("pgcargarcombo");
    
    
    cuentaresultadoDAO Cuentaresultado=new cuentaresultadoDAO();
    ArrayList<String> id_area = new ArrayList<String>();
    ArrayList<String> id_tipo = new ArrayList<String>();
    ArrayList<String> codigo_area = new ArrayList<String>();
    ArrayList<String> codigom_cr = new ArrayList<String>();        
    ArrayList<String> nombrem_cr = new ArrayList<String>(); 
    List cuentasmadres =Cuentaresultado.llenarcuentamadre(Integer.parseInt(codigocr));
    
     List<Object[]> listDatosmadre = cuentasmadres;
            for (Object[] datos : listDatosmadre) {
                id_area.add((String) datos[0].toString());
                id_tipo.add((String) datos[1].toString());
                codigo_area.add((String) datos[2]);
                codigom_cr.add((String) datos[3]);
                nombrem_cr.add((String) datos[4]);  

            }  
           
            
        System.out.println("Ajax?????????????");
        System.out.println( id_area);
        System.out.println(id_tipo);
        System.out.println( codigo_area);
        System.out.println(codigom_cr);
        System.out.println(nombrem_cr);
            mv.addObject(" id_area", id_area);
            mv.addObject("id_tipo",id_tipo);
            mv.addObject("codigo_area",codigo_area);
            mv.addObject("codigom_cr",codigom_cr);
            mv.addObject("nombrem_cr",nombrem_cr);
     
 return mv;
    }
    
    @RequestMapping(value = "obtenercodigo.gdc", method = RequestMethod.POST)
    public ModelAndView funcobtener( @RequestParam("idcuenta") String cuenta ) throws Exception{
    ModelAndView mv= new ModelAndView("pgobtener");
    cuentaresultadoDAO obtenercuenta = new cuentaresultadoDAO();
    String cantidad =obtenercuenta.conteocuenta(Integer.parseInt(cuenta));
   
      
      
        
       
      mv.addObject("numerocuenta",cantidad);
    return mv;
            
    }
      @RequestMapping("CuentaResultado.gdc")
    public ModelAndView funCuentaresultado(){
    ModelAndView mv= new ModelAndView("pgSC_CuentaResultado");
    cuentaresultadoDAO infocuentar=new cuentaresultadoDAO();
    //obtener areacuentaResultados
        ArrayList<String> id_areacr = new ArrayList<String>();
        ArrayList<String> codigo_areacr = new ArrayList<String>();        
        ArrayList<String> nombre_areacr = new ArrayList<String>();        
       
        List resparea =infocuentar.areacr();
        List<Object[]> listDatosarea = resparea;
            for (Object[] datos : listDatosarea) {
                id_areacr .add((String) datos[0].toString());
                codigo_areacr.add((String) datos[1].toString());
                nombre_areacr.add((String) datos[2].toString());  

            }
     //obtener tipo
     ArrayList<String> id_tipocr = new ArrayList<String>();
     ArrayList<String> id_area = new ArrayList<String>();
        ArrayList<String> nombre_tipocr = new ArrayList<String>();        
        ArrayList<String> codigo_tipocr = new ArrayList<String>();        
      
        List resptipo =infocuentar.tipocr();
        List<Object[]> listDatostipo = resptipo;
           for (Object[] datos : listDatostipo) {
                id_tipocr.add((String) datos[0].toString());
                id_area.add((String) datos[1].toString());
               codigo_tipocr.add((String) datos[2].toString());
                nombre_tipocr.add((String) datos[3].toString());  
                 }
           // cuenta de resultado
           
           ArrayList<String> id_cuenta = new ArrayList<String>();
           ArrayList<String> id_madre = new ArrayList<String>();
           ArrayList<String> codigo_cuenta = new ArrayList<String>();        
           ArrayList<String> nombre_cuenta = new ArrayList<String>();        
          
           List respcuentar =infocuentar.CuentasResultado();
           List<Object[]> listDatoscuentar = respcuentar;
           for (Object[] datos : listDatoscuentar) {
                id_cuenta.add((String) datos[0].toString());
                id_madre.add((String) datos[1].toString());
               codigo_cuenta.add((String) datos[2].toString());
                nombre_cuenta.add((String) datos[3].toString());  
                 }
 //area de la cuenta
    mv.addObject("id_areacr",id_areacr );
    mv.addObject("codigo_areacr",codigo_areacr );
    mv.addObject("nombre_areacr", nombre_areacr);
    //tipo de la cuenta
    mv.addObject("id_tipocr",id_tipocr);
    mv.addObject("codigo_tipocr",codigo_tipocr);
    mv.addObject("nombre_tipocr",nombre_tipocr);
    //cuenta resultado
    mv.addObject("id_cuenta",id_cuenta);
    mv.addObject("id_madre",id_madre);
    mv.addObject("codigo_cuenta",codigo_cuenta);
    mv.addObject("nombre_cuenta",nombre_cuenta);
  
    return mv;
    }
     
}
