/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.dao.adminUsuarioMatriculaDAO;
import modelo.dao.adminUsuariosDAO;
import modelo.dao.bitacoraDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sinergia14
 */
@Controller
public class adminUsuarioMatriculaController {
    bitacoraDAO opcBitacora = new bitacoraDAO();
    //Administra Usuarios
    @RequestMapping(value = "adminuserMatricula.gdc")
    public ModelAndView inicio(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgAdminMatriculaUser");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Envia usuarios
                String listaClinetes = "";
                List listaEN = opc.cargaUsuarios();
                ArrayList<String> iduse = new ArrayList<String>();
                ArrayList<String> usuario = new ArrayList<String>();
                ArrayList<String> correo = new ArrayList<String>();
                ArrayList<String> nombrec = new ArrayList<String>();
                ArrayList<String> estado = new ArrayList<String>();
                ArrayList<String> creador = new ArrayList<String>();
                ArrayList<String> idtc = new ArrayList<String>();
                ArrayList<String> tipocliente = new ArrayList<String>();
                ArrayList<String> cdcliente = new ArrayList<String>();
                ArrayList<String> ctcliente = new ArrayList<String>();
                List<Object[]> listDatosEN = listaEN;
                for (Object[] datos : listDatosEN) {
                    iduse.add((String) datos[0].toString()); 
                    usuario.add((String) datos[1].toString()); 
                    correo.add((String) datos[2].toString()); 
                    nombrec.add((String) datos[3].toString()); 
                    listaClinetes += "{name: '"+(String) datos[3].toString()+"'},";
                    estado.add((String) datos[4].toString()); 
                    creador.add((String) datos[5].toString()); 
                    idtc.add((String) datos[6].toString()); 
                    tipocliente.add((String) datos[7].toString()); 
                    cdcliente.add((String) datos[8].toString()); 
                    ctcliente.add((String) datos[9].toString()); 
                }
                mv.addObject("idusLista",iduse);
                mv.addObject("usuarioLista",usuario);
                mv.addObject("correoLista",correo);
                mv.addObject("nombrecLista",nombrec);
                mv.addObject("estadoLista",estado);
                mv.addObject("creadorLista",creador);
                mv.addObject("idtc",idtc);
                mv.addObject("tipocliente",tipocliente);
                mv.addObject("cdcliente",cdcliente);
                mv.addObject("ctcliente",ctcliente);
                listaClinetes = listaClinetes.substring(0, listaClinetes.length()-1);
                mv.addObject("listaClinetes",listaClinetes);
                //Carga Clientes
                
                List listaCL = opc.cargaClientes();
                ArrayList<String> idtipocl = new ArrayList<String>();
                ArrayList<String> tipocl = new ArrayList<String>();
                List<Object[]> listDatosCL = listaCL;
                for (Object[] datos : listDatosCL) {
                    idtipocl.add((String) datos[0].toString()); 
                    tipocl.add((String) datos[1].toString()); 
                }
                mv.addObject("idtipocl",idtipocl);
                mv.addObject("tipocl",tipocl);
            }
        
        
        }
       
        return mv;
    } 
    //Crear Usuarios
    @RequestMapping(value = "creaUsuariofront.gdc")
    public ModelAndView frntUSer(HttpServletRequest request,
                                   @RequestParam("usuario") String us,
                                   @RequestParam("correo") String corr,
                                   @RequestParam("nomc") String nomc,
                                   @RequestParam("contr") String contr,
                                   @RequestParam("idtpc") int idtpc,
                                   @RequestParam("dire") String dire,
                                   @RequestParam("numt") String numt) throws Exception {
        ModelAndView mv = new ModelAndView("pgInsertUsuarioAjax");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //crear usuarios
                String usu = new String(us.getBytes("ISO-8859-1"), "UTF-8");
                String cor = new String(corr.getBytes("ISO-8859-1"), "UTF-8");
                String nomco = new String(nomc.getBytes("ISO-8859-1"), "UTF-8");
                String con = new String(contr.getBytes("ISO-8859-1"), "UTF-8");
                String dir = new String(dire.getBytes("ISO-8859-1"), "UTF-8");
                String num = new String(numt.getBytes("ISO-8859-1"), "UTF-8");
                int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
                String insUsuario = opc.insertaUsuario(usu, cor, nomco, con, idusuario);
                //Bitacora
                String inst = opcBitacora.insertaBitacora(16, 2, idusuario, "Se genero el nuevo usuario: "+cor);
                if(!"N".equals(insUsuario)){
                //Inserta tipo cliente
                    String tpcliente = opc.insertaCLienteUsuario(Integer.parseInt(insUsuario),idtpc);
                    String insertacliente = opc.insertaCLiente(Integer.parseInt(insUsuario),num,dir);
                    //Bitacora
                    inst = opcBitacora.insertaBitacora(42, 2, idusuario, "Se genero el nuevo cliente: "+cor);
                    mv.addObject("resp","Exito");
                }else{
                    mv.addObject("resp","El usuario que esta ingresando, ya existe.");
                }
                
            }
        
        
        }
       
        return mv;
    } 
    
    //Carga divisones
    @RequestMapping(value = "cargadivisiones.gdc")
    public ModelAndView frndivis(HttpServletRequest request,@RequestParam("ids") int ids) throws Exception {
        ModelAndView mv = new ModelAndView("pgDivisionesAjax");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //carga divisiones
               
                int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
                List listaDivi = opc.cargaDivisiones(ids);
                ArrayList<String> idd = new ArrayList<String>();
                ArrayList<String> soc = new ArrayList<String>();
                List<Object[]> listDatosCL = listaDivi;
                for (Object[] datos : listDatosCL) {
                    idd.add((String) datos[0].toString()); 
                    soc.add((String) datos[1].toString()); 
                }
                mv.addObject("soc",soc);
                mv.addObject("idd",idd);
               
                
            }
        
        
        }
       
        return mv;
    } 
    
    //Carga divisones
    @RequestMapping(value = "cargagrados.gdc")
    public ModelAndView cargagrados(HttpServletRequest request,@RequestParam("idd") int idd) throws Exception {
        ModelAndView mv = new ModelAndView("pgGradosAjax");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //carga divisiones
               
                int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
                List listaGrad = opc.cargaGrados(idd);
                ArrayList<String> idg = new ArrayList<String>();
                ArrayList<String> gra = new ArrayList<String>();
                List<Object[]> listDatosCL = listaGrad;
                for (Object[] datos : listDatosCL) {
                    idg.add((String) datos[0].toString()); 
                    gra.add((String) datos[1].toString()); 
                }
                mv.addObject("gra",gra);
                mv.addObject("idg",idg);
               
                
            }
        
        
        }
       
        return mv;
    }
    
    
    //Carga divisones
    @RequestMapping(value = "asignaEstudiante.gdc")
    public ModelAndView cargaEst(HttpServletRequest request,@RequestParam("ids") int ids,@RequestParam("idd") int idd
                                ,@RequestParam("idg") int idg,@RequestParam("idua") int idua,@RequestParam("nom") String nom) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        //"ids="+soc+"&idd="+idd+"&idg="+idg+"&idua="+idua
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //carga divisiones
               
                int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));
                String est = new String(nom.getBytes("ISO-8859-1"), "UTF-8");
                String insEstu = opc.insertaEstdudiante(ids, idd, idg, idua, idusuario, est);
                //Bitacora
                String inst = opcBitacora.insertaBitacora(46, 2, idusuario, "Se Asignó el estudiante: "+est);
                mv.addObject("resp",insEstu);
            }
        
        
        }
       
        return mv;
    } 
    
    //Carga estduainetes
    @RequestMapping(value = "cargaListaEstudiante.gdc")
    public ModelAndView cargalis(HttpServletRequest request,@RequestParam("id") int ids) throws Exception {
        ModelAndView mv = new ModelAndView("pgVistaEstudiantesTemporales");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //carga divisiones
               
                
                List listaDivi = opc.cargaEstudiantes(ids);
                ArrayList<String> ides = new ArrayList<String>();
                ArrayList<String> nomes = new ArrayList<String>();
                ArrayList<String> socie = new ArrayList<String>();
                List<Object[]> listDatosCL = listaDivi;
                for (Object[] datos : listDatosCL) {
                    ides.add((String) datos[0].toString()); 
                    nomes.add((String) datos[1].toString()); 
                    socie.add((String) datos[2].toString()); 
                }
                mv.addObject("ides",ides);
                mv.addObject("nomes",nomes);
                mv.addObject("socie",socie);
               
                
            }
        
        
        }
       
        return mv;
    }
    
    //Carga estduainetes
    @RequestMapping(value = "deleteEstudiante.gdc")
    public ModelAndView eliminaestudiante(HttpServletRequest request,@RequestParam("id") int id,@RequestParam("nom") String nom) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //carga divisiones
               
            int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));   
            String elimEst = opc.delstdudiante(id);
            //Bitacora
            String est = new String(nom.getBytes("ISO-8859-1"), "UTF-8");
            String inst = opcBitacora.insertaBitacora(46, 3, idusuario, "Se eliminó el estudiante asignado: "+est);   
                
            }
        
        
        }
       
        return mv;
    }
    
    //Cambiar estado de usuario
    @RequestMapping(value = "estadoUsuario.gdc")
    public ModelAndView estadoUsuario(HttpServletRequest request,@RequestParam("id") int id,@RequestParam("nom") String nom,@RequestParam("estado") String estado) throws Exception {
        ModelAndView mv = new ModelAndView("pgContenedorAjax");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //carga divisiones
               
            int idusuario = Integer.parseInt((String) request.getSession().getAttribute("ses_idusuario"));   
            String actual = opc.estadoUsu(id, idusuario, estado);
            //Bitacora
            String est = new String(nom.getBytes("ISO-8859-1"), "UTF-8");
            String inst = opcBitacora.insertaBitacora(16, 8, idusuario, "Se actualizó el estado del usuario: "+est);   
                
            }
        
        
        }
       
        return mv;
    }
    
    //Administra lista de clientes
    @RequestMapping(value = "consultaCliente.gdc")
    public ModelAndView consulta(HttpServletRequest request,@RequestParam("nom") String nom) throws Exception {
        ModelAndView mv = new ModelAndView("pgVistaConsultaCliente");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Envia usuarios
                String est = new String(nom.getBytes("ISO-8859-1"), "UTF-8");
                List listaEN = opc.cargaUsuariospara(est);
                ArrayList<String> iduse = new ArrayList<String>();
                ArrayList<String> usuario = new ArrayList<String>();
                ArrayList<String> correo = new ArrayList<String>();
                ArrayList<String> nombrec = new ArrayList<String>();
                ArrayList<String> estado = new ArrayList<String>();
                ArrayList<String> creador = new ArrayList<String>();
                ArrayList<String> idtc = new ArrayList<String>();
                ArrayList<String> tipocliente = new ArrayList<String>();
                ArrayList<String> cdcliente = new ArrayList<String>();
                ArrayList<String> ctcliente = new ArrayList<String>();
                List<Object[]> listDatosEN = listaEN;
                for (Object[] datos : listDatosEN) {
                    iduse.add((String) datos[0].toString()); 
                    usuario.add((String) datos[1].toString()); 
                    correo.add((String) datos[2].toString()); 
                    nombrec.add((String) datos[3].toString()); 
                    estado.add((String) datos[4].toString()); 
                    creador.add((String) datos[5].toString()); 
                    idtc.add((String) datos[6].toString()); 
                    tipocliente.add((String) datos[7].toString()); 
                    cdcliente.add((String) datos[8].toString()); 
                    ctcliente.add((String) datos[9].toString()); 
                }
                mv.addObject("idusLista",iduse);
                mv.addObject("usuarioLista",usuario);
                mv.addObject("correoLista",correo);
                mv.addObject("nombrecLista",nombrec);
                mv.addObject("estadoLista",estado);
                mv.addObject("creadorLista",creador);
                mv.addObject("idtc",idtc);
                mv.addObject("tipocliente",tipocliente);
                mv.addObject("cdcliente",cdcliente);
                mv.addObject("ctcliente",ctcliente);
                
                
            }
        
        
        }
       
        return mv;
    } 
}
