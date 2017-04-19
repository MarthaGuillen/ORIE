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
    
}
