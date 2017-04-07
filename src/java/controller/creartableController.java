
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
public class creartableController {
      @RequestMapping(value= "crearcatalalagos.gdc", method = RequestMethod.POST)
      public ModelAndView funCuentabalance(@RequestParam("idSociedad") int sociedad){
    ModelAndView mv = new ModelAndView("pgSC_tablacatalago");
     cuentabalanceDAO balance = new cuentabalanceDAO();
     ArrayList<String> nombreorigen = new ArrayList<String>();
    ArrayList<String> codigocuentabalance = new ArrayList<String>();
    ArrayList<String> nombrecuentabalance = new ArrayList<String>();
    ArrayList<String> codigosubcuenta = new ArrayList<String>();
    ArrayList<String> nombresubcuenta = new ArrayList<String>();
    ArrayList<String> estadosubcuenta = new ArrayList<String>();
     
    List cuentaorigen =balance.generarcatalagos(sociedad);
    //obtener cuenta origen
     List<Object[]> listDatoorigen = cuentaorigen;
            for (Object[] datos : listDatoorigen) {
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
      
      
}
