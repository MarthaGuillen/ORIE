package controller;
import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFont;

import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import static com.itextpdf.kernel.pdf.PdfName.BaseFont;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.test.annotations.WrapToTest;

import java.awt.Font;
 
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
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

///



@Controller
public class LibroMayorController {
    public static final String rut = HibernateUtil.class.getResource("/../../").getPath()+"/resources";
   public static final String rutp =rut.replace("%20", " ");
    public static final String fuente = rutp+"/fonts/Corbel.ttf";  
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
          int sociedad = Integer.parseInt((String) request.getSession().getAttribute("ses_idsociedad"));
          String sociedadnom = (String) request.getSession().getAttribute("ses_sociedadDefault");
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
            mv.addObject("fechap", fechap);
            mv.addObject("codigopartida", codigopartida);
            mv.addObject("codigocuenta", codigocuenta);
            mv.addObject("nombrecuenta", nombrecuenta);
            mv.addObject("concepto", concepto);
            mv.addObject("debe", debe);
            mv.addObject("haber", haber);
            mv.addObject("saldodebe", saldodebe);
            mv.addObject("saldohaber", saldohaber);
            mv.addObject("Saldo", Saldo);
     //crear evento
     
           
           
           
      // crear libro
       double saldop=0;
        String ruta= HibernateUtil.class.getResource("/../../").getPath();
         System.out.println(ruta);
        ruta=ruta.replace("%20", " ");
        String rutafinal= ruta.replace("%20", " ");
        System.out.println(rutafinal+"/web/resources/pdf/1.pdf");
        PdfWriter writer = new PdfWriter(rutafinal+"resources/pdf/1.pdf");
       
PdfDocument pdf = new PdfDocument(writer); 
Document document = new Document(pdf, PageSize.LETTER);
document.setMargins(20, 20, 20, 20);
   //Create event-handlers
        String header = sociedadnom;
        Header headerHandler = new Header(header);
        PageXofY footerHandler = new PageXofY(pdf);
  //Assign event-handlers
        pdf.addEventHandler(PdfDocumentEvent.START_PAGE,headerHandler);
      //variable encabezado
       VariableHeaderEventHandler handler2 = new VariableHeaderEventHandler();
        pdf.addEventHandler(PdfDocumentEvent.END_PAGE, handler2);
       
        

  // File path1 = new File(rutafinal+"../web/resources/pdf/"+sociedadnom+"-"+fecha+"-"+fecha2+".pdf");
     //*****fuente
        PdfFont baseFont= PdfFontFactory.createFont(FontConstants.TIMES_ROMAN);
        
    
        System.out.println(baseFont);
        Table table = new Table(new float[]{24, 8, 8,15,15,8, 8, 8, 8});
        //table.setWidthPercent(100);
     
        table.setBorder(new SolidBorder(0));
        document.add(new Paragraph("").setFont(baseFont));
        document.add(new Paragraph("").setFont(baseFont));
            table.addHeaderCell(new Cell().add(new Paragraph("FECHA").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("PARTIDA").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("CUENTA").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("NOMBRE DE LA CUENTA").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("CONCEPTO").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("SALDO INICIAL").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("DEBE").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("HABER").setFont(baseFont).setFontSize(7)));
            table.addHeaderCell(new Cell().add(new Paragraph("SALDO").setFont(baseFont).setFontSize(7)));
            double saldodebev=0,tdebe=0,saldohaberv=0,thaber=0,Saldot=0;
            DecimalFormat df = new DecimalFormat("#.00");
        for (int i = 0; i < Codigocuentam.size()-1; i++) {  
            System.out.println(Codigocuentam.size());
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont)).setBorder(Border.NO_BORDER).setFontSize(8));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont)).setBorder(Border.NO_BORDER).setFontSize(8));
            table.addCell(new Cell().add(new Paragraph(Codigocuentam.get(i)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph(nombrecuentam.get(i)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            saldodebev=0;tdebe=0;saldohaberv=0;thaber=0;Saldot=0;
            for (int j = 0; j < fechap.size()-1; j++) {
                String codigoh=Codigocuentam.get(i);
                String codigod=codigocuenta.get(j);
                
                if (codigod.equals(codigoh)) {
                    saldodebev=Double.parseDouble(debe.get(j));
                    tdebe+=saldodebev;
                    saldohaberv=Double.parseDouble( haber.get(j));
                    thaber+=saldohaberv;
                    Saldot+=saldodebev-saldohaberv;
                    System.out.println(j+"sumando los debe; "+saldodebev+"Sumando los haber ; "+saldohaberv+" saldo "+Saldot );
                table.addCell(new Cell().add(new Paragraph(fechap.get(j)).setFont(baseFont).setFontSize(6)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(codigopartida.get(j)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(codigocuenta.get(j)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(nombrecuenta.get(j)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(concepto.get(j)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph("0").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(debe.get(j)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(haber.get(j)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
                table.addCell(new Cell().add(new Paragraph(String.valueOf(df.format(Saldot)).replace(',','.')).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER)); 
                
                }
                 }
            
            saldop=tdebe-thaber;
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph(nombrecuentam.get(i)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("Saldos").setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph(String.valueOf(tdebe)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph(String.valueOf(thaber)).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph(String.valueOf(df.format(saldop)).replace(',','.')).setFont(baseFont).setFontSize(7)).setBorder(Border.NO_BORDER));
           
            
            System.out.println(i+" "+" "+nombrecuentam.get(i)+" "+tdebe+" "+thaber +"saldo total ; "+saldop); 
            saldodebev=0;
                saldohaberv=0;
                Saldot=0; 
               thaber=0;
               thaber=0;
                
       }
        
        
        document.add(table.setBorder(Border.NO_BORDER));
        document.close();
        

    
     System.out.println(ruta);
     System.out.println(rutafinal);
        return mv;
     }
      //Header event handler
    protected class Header implements IEventHandler {
        String header;
        public Header(String header) {
            this.header = header;
        }
        @Override
        public void handleEvent(Event event) {
            //Retrieve document and
            PdfDocumentEvent docEvent = (PdfDocumentEvent) event;
            PdfDocument pdf = docEvent.getDocument();
            PdfPage page = docEvent.getPage();
            Rectangle pageSize = page.getPageSize();
            PdfCanvas pdfCanvas = new PdfCanvas(
                    page.getLastContentStream(), page.getResources(), pdf);
            Canvas canvas = new Canvas(pdfCanvas, pdf, pageSize);
            canvas.setFontSize(18f);
            //Write text at position
            canvas.showTextAligned(header,
                    pageSize.getWidth() / 2,
                    pageSize.getTop() - 30, TextAlignment.CENTER);
        }
    }
 
    //page X of Y 
    protected class PageXofY implements IEventHandler {
        protected PdfFormXObject placeholder;
        protected float side = 20;
        protected float x = 300;
        protected float y = 25;
        protected float space = 4.5f;
        protected float descent = 3;
        public PageXofY(PdfDocument pdf) {
            placeholder =
                    new PdfFormXObject(new Rectangle(0, 0, side, side));
        }
        @Override
        public void handleEvent(Event event) {
            PdfDocumentEvent docEvent = (PdfDocumentEvent) event;
            PdfDocument pdf = docEvent.getDocument();
            PdfPage page = docEvent.getPage();
            int pageNumber = pdf.getPageNumber(page);
            Rectangle pageSize = page.getPageSize();
            PdfCanvas pdfCanvas = new PdfCanvas(
                    page.getLastContentStream(), page.getResources(), pdf);
            Canvas canvas = new Canvas(pdfCanvas, pdf, pageSize);
            Paragraph p = new Paragraph()
                    .add("Page ").add(String.valueOf(pageNumber)).add(" of");
            canvas.showTextAligned(p, x, y, TextAlignment.RIGHT);
            pdfCanvas.addXObject(placeholder, x + space, y - descent);
            pdfCanvas.release();
        }
        public void writeTotal(PdfDocument pdf) {
            Canvas canvas = new Canvas(placeholder, pdf);
            canvas.showTextAligned(String.valueOf(pdf.getNumberOfPages()),
                    0, descent, TextAlignment.LEFT);
        }

        
    }
 
     protected class VariableHeaderEventHandler implements IEventHandler {
        protected String header;
 
        public void setHeader(String header) {
            this.header = header;
        }
 
        @Override
        public void handleEvent(Event event) {
            PdfDocumentEvent documentEvent = (PdfDocumentEvent) event;
            try {
                new PdfCanvas(documentEvent.getPage())
                        .beginText()
                        .setFontAndSize(PdfFontFactory.createFont(FontConstants.HELVETICA), 12)
                        .moveText(450, 806)
                        .showText(header)
                        .endText()
                        .stroke();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
