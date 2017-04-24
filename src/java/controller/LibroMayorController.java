/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.test.annotations.WrapToTest;
 
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.libroMayorDAO;
import modelo.util.HibernateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LibroMayorController {
    String dire ="/web/resources/pdf"; 
    @RequestMapping(value="libromayor.gdc")
    public ModelAndView funcLibroMayor(){
      ModelAndView mv= new ModelAndView("pgSC_libroMayor");
        return mv;
    }
    
    
   @RequestMapping(value ="libromayordatos.gdc", method = RequestMethod.POST)
     public ModelAndView funbuscaroperaciones(@RequestParam("fecha") String fecha,
           @RequestParam("fecha2") String fecha2, HttpServletRequest request ) throws Exception{
     ModelAndView mv = new ModelAndView("pgajaxlibromayor");
       System.out.println(" "+fecha);
       System.out.println(" "+fecha2);
          libroMayorDAO libro = new libroMayorDAO();
          int sociedad = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
   List cuentalibroMayor= libro.cuentaslibroMayor(fecha, fecha2, sociedad);
    ArrayList<String> Codigocuentam = new ArrayList<String>();
    ArrayList<String> nombrecuentam = new ArrayList<String>(); 
      List<Object[]> listDato = cuentalibroMayor;
            for (Object[] datos : listDato) {
                Codigocuentam.add((String) datos[0].toString());
                nombrecuentam.add((String) datos[1].toString());
            }
     mv.addObject("Codigocuentam", Codigocuentam);
     mv.addObject("nombrecuentam", nombrecuentam);
     
     List repuest = libro.filtrolibroMayor(fecha, fecha2, sociedad);
     ArrayList<String> fechap = new ArrayList<String>();
    ArrayList<String> codigopartida = new ArrayList<String>();      
    ArrayList<String> codigocuenta = new ArrayList<String>();
    ArrayList<String> nombrecuenta = new ArrayList<String>();    
    ArrayList<String> concepto = new ArrayList<String>();
    ArrayList<String> debe = new ArrayList<String>();
    ArrayList<String> haber = new ArrayList<String>();
    ArrayList<String> Saldo = new ArrayList<String>();
    float saldodebe = 0,saldohaber = 0,saldo=0;
     List<Object[]> listDato2 = repuest;
            for (Object[] datos : listDato2) {
                fechap.add((String) datos[0].toString());
                codigopartida.add((String) datos[1].toString());
                codigocuenta.add((String) datos[2]);
                nombrecuenta.add((String) datos[3]);
                concepto.add((String) datos[4]);
                debe.add((String) datos[5].toString());
              saldodebe+=Float.parseFloat((String) datos[5].toString());
              saldohaber+=Float.parseFloat((String) datos[6].toString());
                haber.add((String) datos[6].toString());
                saldo+=saldodebe-saldohaber;
                Saldo.add(String.valueOf(saldo));
               
                        } 
           /* mv.addObject("fechap", fechap);
            mv.addObject("codigopartida", codigopartida);
            mv.addObject("codigocuenta", codigocuenta);
            mv.addObject("nombrecuenta", nombrecuenta);
            mv.addObject("concepto", concepto);
            mv.addObject("debe", debe);
            mv.addObject("haber", haber);
            mv.addObject("saldodebe", saldodebe);
            mv.addObject("saldohaber", saldohaber);
            mv.addObject("Saldo", Saldo);*/
      
        String ruta= HibernateUtil.class.getResource("/../../").getPath();
         System.out.println(ruta);
        ruta=ruta.replace("%20", " ");
        String rutafinal= ruta.replace("%20", " ");
        //File path1 = new File(rutafinal+"../portalCandidato/Candidato"+idCandidato+"/"+"HOJA" + idCandidato + ".pdf");
    
     System.out.println(ruta);
     System.out.println(rutafinal);
        return mv;
     }
}
