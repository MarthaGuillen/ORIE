/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.org.apache.xalan.internal.xsltc.cmdline.getopt.GetOpt;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

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
public class cuentasbalanceController {
    @RequestMapping(value= "CuentasBalance.gdc")
      public ModelAndView funCuentabalance(){
    ModelAndView mv = new ModelAndView("pgSC_CuentaBalance");
    
    return mv;
    }
}
