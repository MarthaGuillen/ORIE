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
                 int cuenta,int sociedad,
               String codigosub, String nombre,String observacion
               ,String depuracion,int user){
          
   
    String resp="";
    String sql = "SELECT fnscinsertsubcuenta('"+cuenta+"','"+sociedad+"','"+codigosub+"','"+nombre+
            "','"+observacion+"','"+depuracion+"','"+user+"')";
        List<String> r=new ArrayList<String>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
             r = query.list();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        System.out.println(resp+" "+r);
    return resp;
    }
        
        public String agregarcuentabalance(
       int origen,String codigosub, String nombre,String observacion,int user){
          
   
    String resp="";
    String sql = " SELECT fn_scinsertcuentamayor('"+origen+"','"+codigosub+"','"+nombre+"','"+observacion+"','"+user+"')";
        List<String> r=new ArrayList<String>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
             r= query.list();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        System.out.println(resp+"  ->"+r);
    return resp;
    }
        public String agregarcuentorigen(
       String codigoorigen,String nombreorigen,String observacionorigen , int user){
            System.out.println("modelo.dao.cuentabalanceDAO.agregarcuentorigen()");
   System.out.println(codigoorigen+" "+ nombreorigen+" "+  observacionorigen+" "+ user);
    String resp="";
    String sql = "SELECT  fnscinsertcuentaorigen('"+codigoorigen+"','"+nombreorigen+"','"+observacionorigen+"','"+user+"')";
        List<String> r=new ArrayList<String>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            r= query.list();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        
        System.out.println(resp+"---->"+r);
    return resp;
    }
            public List obtenercuentaorigen(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "  select * from  fn_scselectcuentabalanceorigen();";
        
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
            public List obtenersociedad(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select *from tbl_sociedad ;";
        
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
            public List obtenercuenta(int id){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select * from fn_scselectcuentabalance ('"+id+"')";
        
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
   
            public List ver (){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " Select id_subcuentabalance,codigo, nombretp from tbl_subcuentabalance ";
        
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
  public List vercuenta(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select * from fn_sccuentabalance ()";
        
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
  public List generarcatalagos(int sociedad){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "  select  * from fn_sccatalago('"+sociedad+"')";
        
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

       System.out.println("modelo.dao.cuentabalanceDAO.generarcatalagos()");
       System.out.println(listaget);
        return listaget;
    }

}
