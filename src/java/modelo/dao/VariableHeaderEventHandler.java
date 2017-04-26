/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import java.io.IOException;

/**
 *
 * @author Sinergia003
 */
public class VariableHeaderEventHandler implements IEventHandler{
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

