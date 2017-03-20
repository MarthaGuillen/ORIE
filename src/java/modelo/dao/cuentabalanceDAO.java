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
import org.hibernate.Transaction;

/**
 *
 * @author Sinergia003
 */
public class cuentabalanceDAO {
        public String agregarsubcuentabalance(
       int origen,int cuenta,int sociedad,
               String codigosub, String nombre,String descripcion,String observacion
                ,String depuracion,boolean estado){
          
   
    String resp="";
    String sql = "";
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        System.out.println(resp);
    return resp;
    }
        
        public String agregarcuentabalance(
       int origen,String codigosub, String nombre,String observacion){
          
   
    String resp="";
    String sql = "";
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        System.out.println(resp);
    return resp;
    }
        public String agregarcuentorigen(
       String codigoorigen,String nombreorigen,String observacionorigen){
          
   
    String resp="";
    String sql = "";
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        System.out.println(resp);
    return resp;
    }
            public List llenarcuentamadre(int codigo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " ="+ codigo+"";
        
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

       
        return listaget;
    }
    
}
