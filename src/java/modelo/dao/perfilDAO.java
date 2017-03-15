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
 * @author Sinergia14
 */
public class perfilDAO {
    
     public List cargaDatosusr(String usr) {

             
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        String sql = "select * from fn_datosusuario('" + usr + "')";
       
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
     
    public List cargaDatosper(int usr) {

             
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        String sql = "select * from fn_capturaInfoPerfil('" + usr + "')";
       
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
    
    public List cargaMeuperfil(int idp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaMenusPerfil('"+idp+"') ";
        
        
        List<Object> filmList = new ArrayList<Object>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList;
       
    }
    
    public List cargaOpperfil(int idp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaOpcionesPerfil('"+idp+"') ";
        
        
        List<Object> filmList = new ArrayList<Object>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList;
       
    }
    
    public List cargaSubperfil(int idp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaSubopPerfil('"+idp+"') ";
        
        
        List<Object> filmList = new ArrayList<Object>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList;
       
    }
    
    public List cargaNavperfil(int idp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaNavPerfil('"+idp+"') ";
        
        
        List<Object> filmList = new ArrayList<Object>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList;
       
    }
    
    public List cargaMeuLabel(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaLabels()";
        
        
        List<Object> filmList = new ArrayList<Object>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList;
       
    }
    
     public List cargaSociedad(int idu){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturasociedadUsuario('"+idu+"') ";
        
        
        List<Object> filmList = new ArrayList<Object>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            //int result = q.executeUpdate();
            filmList = q.list();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return filmList;
       
    }
    
}
