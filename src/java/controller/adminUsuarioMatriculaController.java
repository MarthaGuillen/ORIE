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
    
    //Administra Usuarios
    @RequestMapping(value = "adminuserMatricula.gdc")
    public ModelAndView inicio(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("pgAdminMatriculaUser");
        
        adminUsuarioMatriculaDAO opc = new adminUsuarioMatriculaDAO();
        
        if((String) request.getSession().getAttribute("ses_idusuario") != null){
            if("Activa".equals((String) request.getSession().getAttribute("ses_estado"))){
                //Envia usuarios
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
                if(!"N".equals(insUsuario)){
                //Inserta tipo cliente
                    String tpcliente = opc.insertaCLienteUsuario(Integer.parseInt(insUsuario),idtpc);
                    String insertacliente = opc.insertaCLiente(Integer.parseInt(insUsuario),num,dir);
                    mv.addObject("resp","Exito");
                }else{
                    mv.addObject("resp","El usuario que esta ingresando, ya existe.");
                }
                
            }
        
        
        }
       
        return mv;
    } 
}
