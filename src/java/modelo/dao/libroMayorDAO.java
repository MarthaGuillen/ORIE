/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.ArrayList;
import java.util.List;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Sinergia003
 */
public class libroMayorDAO {
     public List filtrolibroMayor( String fecha,String fecha2,int sociedad  ){
         System.out.println("saliendo Obtener operacion libro");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scobtenerdatosLibromayor('"+fecha+"','"+fecha2+"','"+sociedad+"')";
        
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }finally { 
          session.close();
        }
          
       System.out.println("saliendo Obtener operacion libro" +listaget);
        return listaget;
    }
     public List cuentaslibroMayor( String fecha,String fecha2,int sociedad  ){
         System.out.println("saliendo Obtener operacion libro");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scobtenercuentaslibromayor('"+fecha+"','"+fecha2+"','"+sociedad+"')";
        
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }finally { 
          session.close();
        }
          
       System.out.println("saliendo Obtener operacion libro" +listaget);
        return listaget;
    }
}
