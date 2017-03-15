/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import modelo.dao.mailDAO;

/**
 *
 * @author Sinergia14
 */
public class emailController {
  
    
    public boolean enviarCorreo(mailDAO c){
    
    try{
        
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.setProperty("mail.smtp.starttls.enable", "true");
        p.setProperty("mail.smtp.port", "587");
        p.setProperty("mail.smtp.user", c.getUsuario());
        p.setProperty("mail.smtp.auth", "true");
        
        Session s = Session.getDefaultInstance(p,null);
        BodyPart texto = new MimeBodyPart();
        texto.setText(c.getMensaje());
        
        MimeMultipart m = new MimeMultipart(); 
        m.addBodyPart(texto);
        MimeMessage mensaje= new MimeMessage(s);
        mensaje.setFrom(new InternetAddress(c.getUsuario()));
        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(c.getDestino()));
        mensaje.setSubject(c.getAsunto());
        mensaje.setContent(c.getMensaje(), "text/html");
        
        Transport t = s.getTransport("smtp");
        t.connect(c.getUsuario(), c.getContrasenia());
        t.sendMessage(mensaje, mensaje.getAllRecipients());
        t.close();
        
        return true;
        
        
        
    }catch(Exception e){
       System.out.println(e.getMessage()); 
       System.out.println("Ocurrio un error");
       return false;
    }
    
    
    
    } 
    
    
}
