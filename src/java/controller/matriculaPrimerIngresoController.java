/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.fomularioDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class matriculaPrimerIngresoController {
    
    
            
    @RequestMapping(value = "PrimerIngreso.gdc")
    public ModelAndView PrimerIngreso(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgFroMatriculaPrimerIngreso");
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){            
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "formulario.gdc")
    public ModelAndView PrimerIngresoform(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgformularioPrimerIngreso");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Inserta formulario admision
                String idu = (String) request.getSession().getAttribute("ses_idusuario");
                String form = opc.insertaFormulario(idu);
                request.getSession().setAttribute("ses_formulario", form);
                
                //Envia Nacionalidades
                List listaEN = opc.cargaNacionalidades();
                ArrayList<String> nompN = new ArrayList<String>();
                
                List<Object[]> listDatosEN = listaEN;
                for (Object[] datos : listDatosEN) {
                    nompN.add((String) datos[1].toString());  
                    

                }
                mv.addObject("nacionTemp",nompN);
                
                List listaPA = opc.cargaPaises();
                ArrayList<String> nompPa = new ArrayList<String>();
                ArrayList<String> idPa = new ArrayList<String>();
                List<Object[]> listDatosPA = listaPA;
                for (Object[] datos : listDatosPA) {
                    idPa.add((String) datos[0].toString());
                    nompPa.add((String) datos[1].toString()); 
                }
                mv.addObject("paisTemp",nompPa);
                mv.addObject("idpaisTemp",idPa);                
            }        
        }
        return mv;
    }
    
    @RequestMapping(value = "PadTutores.gdc")
    public ModelAndView ListadoPadresTutores(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgformularioPrimerIngresoListaPadTutor");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){    
                String idu = (String) request.getSession().getAttribute("ses_idusuario");               
                
                String idf = (String) request.getSession().getAttribute("ses_formulario");
                
                List listaPadTutores = opc.cargaPadresTutores(idu, idf);
                ArrayList<String> idPadTut = new ArrayList<String>();
                ArrayList<String> nompPadTut = new ArrayList<String>();
                ArrayList<String> telPadTut = new ArrayList<String>();
                ArrayList<String> paisPatTut = new ArrayList<String>();
                ArrayList<String> idnPadTut = new ArrayList<String>();
                ArrayList<String> pasaPadTut = new ArrayList<String>();
                ArrayList<String> correoPadTut = new ArrayList<String>();
                ArrayList<String> esPatTut = new ArrayList<String>();                
                ArrayList<String> esteForm = new ArrayList<String>();
                List<Object[]> listDatPadTut = listaPadTutores;
                
                String padOriginales = "";
                
                for (Object[] datos : listDatPadTut) {
                    idPadTut.add((String) datos[0].toString());
                    nompPadTut.add((String) datos[1].toString()); 
                    telPadTut.add((String) datos[2].toString());
                    paisPatTut.add((String) datos[3].toString()); 
                    idnPadTut.add((String) datos[4].toString());
                    pasaPadTut.add((String) datos[5].toString()); 
                    correoPadTut.add((String) datos[6].toString());
                    esPatTut.add((String) datos[7].toString()); 
                    if(((String) datos[8].toString()).equals(idf)){
                        esteForm.add("1"); 
                        if(padOriginales.equals("")){
                            padOriginales = ((String) datos[0].toString());
                        }else{
                            padOriginales = padOriginales + "," +((String) datos[0].toString());
                        }
                    }else{
                        esteForm.add("0"); 
                    }
                }
                mv.addObject("idpadreTutor",idPadTut);
                mv.addObject("nombrePadreTutor",nompPadTut);
                mv.addObject("telefonoPadreTutor",telPadTut);
                mv.addObject("paisPadreTutor",paisPatTut);
                mv.addObject("idnPadreTutor",idnPadTut);
                mv.addObject("pasaPadreTutor",pasaPadTut);
                mv.addObject("correoPadreTutor",correoPadTut);
                mv.addObject("esPadreTutor",esPatTut);
                mv.addObject("esteForm",esteForm);
                mv.addObject("padOriginales",padOriginales);
            }        
        }
        return mv;
    }
    
    @RequestMapping(value = "formPadTutor.gdc")
    public ModelAndView PadreOTutorform(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgformularioPrimerIngresoformPadTutor");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Inserta formulario admision                
                List listaPA = opc.cargaPaises();
                ArrayList<String> nompPa = new ArrayList<String>();
                ArrayList<String> idPa = new ArrayList<String>();
                List<Object[]> listDatosPA = listaPA;
                for (Object[] datos : listDatosPA) {
                    idPa.add((String) datos[0].toString());
                    nompPa.add((String) datos[1].toString());  
                    

                }
                mv.addObject("paisTemp",nompPa);
                mv.addObject("idpaisTemp",idPa);
            
                
                
                
                //Para info de Padre o tutor
                List listaOcp = opc.cargaOcupaciones();
                ArrayList<String> nompOcp = new ArrayList<String>();
                ArrayList<String> idOcp = new ArrayList<String>();
                List<Object[]> listDatosOcp = listaOcp;
                for (Object[] datos : listDatosOcp) {
                    idOcp.add((String) datos[0].toString());
                    nompOcp.add((String) datos[1].toString()); 
                }
                mv.addObject("ocupacionesTemp",nompOcp);
                mv.addObject("idocupacionesTemp",idOcp);
            }        
        }
        return mv;
    }
    
    @RequestMapping(value = "AgregarPadTutores.gdc", method = RequestMethod.POST)
    public ModelAndView AddTutores(HttpServletRequest request,
            @RequestParam("valSel") String padTut,
            @RequestParam("del") String delPadTut) throws Exception {
        ModelAndView mv = new ModelAndView("pgFormularioAjax");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                
                String idu = (String) request.getSession().getAttribute("ses_idusuario");
                String idf = (String) request.getSession().getAttribute("ses_formulario");
                
                String tut = new String(padTut.getBytes("ISO-8859-1"), "UTF-8");
                String del = new String(delPadTut.getBytes("ISO-8859-1"), "UTF-8");
                
                String r = opc.insertaAgregadosPad(tut, del, idu, idf);
            }
        }
                
        return mv;
    }
    
    @RequestMapping(value = "vacio.gdc")
    public ModelAndView vacio(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgvacio");
        return mv;
    }
    
    @RequestMapping(value = "formulariofase1.gdc", method = RequestMethod.POST)
    public ModelAndView guarda1form(HttpServletRequest request,
            @RequestParam("pnestudiante") String pnombre, 
            @RequestParam("snestudiante") String snombre,
            @RequestParam("paestudiante") String papellido,
            @RequestParam("saestudiante") String sapellido,
            @RequestParam("direcestudiante") String direccion,
            @RequestParam("ciudestudiante") String ciudad,
            @RequestParam("telestudiante") String telefono,
            @RequestParam("radioGenero") String genero,
            @RequestParam("edad") String edad,
            @RequestParam("fechanac") String fechanac,
            @RequestParam("pais") String pais,
            @RequestParam("nacionalidad") String nacionalidad,
            @RequestParam("nIdentidad") String nIdentidad,
            @RequestParam("email") String email,
            @RequestParam("nombreem") String NomEmergencia,
            @RequestParam("telem") String TelEmergencia
    ) throws Exception {
      
        ModelAndView mv = new ModelAndView("pgFormularioAjax");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Manda a insertar usuario
                String idu = (String) request.getSession().getAttribute("ses_idusuario");
                String idf = (String) request.getSession().getAttribute("ses_formulario");
                       
                String pn = new String(pnombre.getBytes("ISO-8859-1"), "UTF-8");
                String sn = new String(snombre.getBytes("ISO-8859-1"), "UTF-8");
                String pa = new String(papellido.getBytes("ISO-8859-1"), "UTF-8");
                String sa = new String(sapellido.getBytes("ISO-8859-1"), "UTF-8");
                String dir = new String(direccion.getBytes("ISO-8859-1"), "UTF-8");
                String ciu = new String(ciudad.getBytes("ISO-8859-1"), "UTF-8");
                String gen = new String(genero.getBytes("ISO-8859-1"), "UTF-8");
                String nac = new String(nacionalidad.getBytes("ISO-8859-1"), "UTF-8");
                String ema = new String(email.getBytes("ISO-8859-1"), "UTF-8");
                String nomem = new String(NomEmergencia.getBytes("ISO-8859-1"), "UTF-8");
                //inserta forma 1 
                String resp = opc.insertaFase1(pn,sn, pa,sa,dir,ciu,telefono,gen,edad,fechanac,pais,nac,nIdentidad, ema, nomem, TelEmergencia,idf,idu);
                
            
            }
        
        
        }
        
        
        return mv;
    }
    
    
    @RequestMapping(value = "formulariofase2.gdc", method = RequestMethod.POST)
    public ModelAndView guarda2form(HttpServletRequest request,
            @RequestParam("nompadre") String NombrePadre, 
            @RequestParam("espadre") String esPadre,
            @RequestParam("celpadre") String CelPadre,
            @RequestParam("idpadre") String idpadre,
            @RequestParam("correopadre") String correopadre,
            @RequestParam("teldompadre") String teldompadre,
            @RequestParam("paisdompadre") String paisdompadre,
            @RequestParam("ciudompadre") String ciudompadre,
            @RequestParam("dirdompadre") String dirdompadre,
            @RequestParam("emptrapad") String emptrapad,
            @RequestParam("ocuptrapad") String ocuptrapad,
            @RequestParam("teltrapad") String teltrapad,
            @RequestParam("paistrapad") String paistrapad,
            @RequestParam("ciutrapad") String ciutrapad,
            @RequestParam("dirtrapad") String dirtrapad,
            @RequestParam("pasaporte") String pasaporte
    ) throws Exception {
      
        ModelAndView mv = new ModelAndView("pgFormularioAjax");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Manda a insertar padre o tutor
                String idu = (String) request.getSession().getAttribute("ses_idusuario");
                String idf = (String) request.getSession().getAttribute("ses_formulario");
                       
                String np = new String(NombrePadre.getBytes("ISO-8859-1"), "UTF-8");
                String cp = new String(correopadre.getBytes("ISO-8859-1"), "UTF-8");
                String cdp = new String(ciudompadre.getBytes("ISO-8859-1"), "UTF-8");
                String ddp = new String(dirdompadre.getBytes("ISO-8859-1"), "UTF-8");
                String etp = new String(emptrapad.getBytes("ISO-8859-1"), "UTF-8");
                String otp = new String(ocuptrapad.getBytes("ISO-8859-1"), "UTF-8");
                String ctp = new String(ciutrapad.getBytes("ISO-8859-1"), "UTF-8");
                String dtp = new String(dirtrapad.getBytes("ISO-8859-1"), "UTF-8");
                
                //inserta forma 2 
                String resp = opc.insertaFase2(np,esPadre, CelPadre,idpadre,cp,teldompadre,paisdompadre,cdp,ddp,etp,otp,teltrapad,paistrapad, ctp,dtp, idu, idf, pasaporte);
                
                mv.addObject("idPadTutor",resp);
            }
        
        
        }
        
        
        return mv;
    }
    
    
    @RequestMapping(value = "formulariofase3.gdc", method = RequestMethod.POST)
    public ModelAndView guarda3form(HttpServletRequest request,
            @RequestParam("vivecon") String vivecon, 
            @RequestParam("infadmi") String infadmi,
            @RequestParam("compfin") String compfin,
            @RequestParam("padfall") String padfall,
            @RequestParam("madfall") String madfall,
            @RequestParam("paddiv") String paddiv,
            @RequestParam("padsep") String padsep,
            @RequestParam("segnuppad") String segnuppad,
            @RequestParam("segnupmad") String segnupmad,
            @RequestParam("padhn") String padhn,
            @RequestParam("madhn") String madhn,
            @RequestParam("custlegal") String custlegal,
            @RequestParam("lengmat") String lengmat,
            @RequestParam("lenghg") String lenghg
    ) throws Exception {
      
        ModelAndView mv = new ModelAndView("pgFormularioAjax");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Manda a insertar padre o tutor
                String idu = (String) request.getSession().getAttribute("ses_idusuario");
                String idf = (String) request.getSession().getAttribute("ses_formulario");
                       
                String vvc = new String(vivecon.getBytes("ISO-8859-1"), "UTF-8");
                String ifa = new String(infadmi.getBytes("ISO-8859-1"), "UTF-8");
                String cpf = new String(compfin.getBytes("ISO-8859-1"), "UTF-8");
                String cstl = new String(custlegal.getBytes("ISO-8859-1"), "UTF-8");
                String lm = new String(lengmat.getBytes("ISO-8859-1"), "UTF-8");
                String lh = new String(lenghg.getBytes("ISO-8859-1"), "UTF-8");
                
                //inserta forma 2 
                String resp = opc.insertaFase3(vvc,ifa, cpf,padfall,madfall,paddiv,padsep,segnuppad,segnupmad,padhn,madhn,cstl,lm, lh, idu, idf);
                
            }
        }
        return mv;
    }
    
    
    @RequestMapping(value = "formulariofase4.gdc", method = RequestMethod.POST)
    public ModelAndView guarda4form(HttpServletRequest request,
            @RequestParam("nom") String nombre, 
            @RequestParam("edad") String edad,
            @RequestParam("escuela") String escuela
    ) throws Exception {
      
        ModelAndView mv = new ModelAndView("pgFormularioAjax");
        fomularioDAO opc = new fomularioDAO();
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Manda a insertar padre o tutor
                String idu = (String) request.getSession().getAttribute("ses_idusuario");
                String idf = (String) request.getSession().getAttribute("ses_formulario");
                       
                String nom = new String(nombre.getBytes("ISO-8859-1"), "UTF-8");
                String esc = new String(escuela.getBytes("ISO-8859-1"), "UTF-8");
                
                //inserta forma 2 
                String resp = opc.insertaFase4(nom, edad, esc, idu, idf);
                
            }
        }
        return mv;
    }
    
}
