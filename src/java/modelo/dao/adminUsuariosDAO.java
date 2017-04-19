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
public class adminUsuariosDAO {
    
    public List cargaUsuarios() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_Listausuarios()";
     
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            return listaget;

        } catch (Exception e) {
            e.printStackTrace();System.out.println(e);
        }finally { 
          session.close();
        }
        return listaget;
    }
    
    public List cargaPerfilLista() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_Seleccionperfil()";
     
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            return listaget;

        } catch (Exception e) {
            e.printStackTrace();System.out.println(e);
        }finally { 
          session.close();
        }
        return listaget;
    }
    
    public List cargaSociedades() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select *  from fn_capturaSociedades();";
     
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            return listaget;

        } catch (Exception e) {
            e.printStackTrace();System.out.println(e);
        }finally { 
          session.close();
        }
        return listaget;
    }
    
    //Insertausuario
    public String insertaUsuario(String us, String ema, String nomc, String pass,int idu){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fnInsertUser('"+us+"','"+ema+"','"+nomc+"','"+pass+"','1','"+idu+"');";
        
        
        List<String> filmList = new ArrayList<String>();
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
        return filmList.get(0).toString();
       
    }
    
       
    //Inserta perfil - usuario
    public String insertaPerfil(int idus, int idp, int idu){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fninsertperfilUser('"+idus+"','"+idp+"','"+idu+"');";
        
        
        List<String> filmList = new ArrayList<String>();
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
        return filmList.get(0).toString();
       
    }
    
    //Inserta sociedad - usuario
    public String insertasoc(int idus, int ids, int idu){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fninsertusersoc('"+idus+"','"+ids+"','"+idu+"');";
        
        
        List<String> filmList = new ArrayList<String>();
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
        return filmList.get(0).toString();
       
    }
    
}
