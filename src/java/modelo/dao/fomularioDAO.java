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
public class fomularioDAO {
    
    public List cargaNacionalidades() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturanacionalidades()";
     
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
    
    public List cargaPaises() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturapaises()";
     
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
    
     public String insertaFormulario(String us) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertaFormulario('" + us + "')";
        
        List<String> listaget = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return listaget.get(0).toString();
    }
     
     public String insertaFase1(String pnombre,String snombre, String papellido,String sapellido,String direccion,String ciudad,String telefono,
            String genero,String edad,String fechanac,String pais,String nacionalidad,String nIdentidad, String email, String idfo, String idu) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase1('"+pnombre+"','"+snombre+"','"+papellido+"','"+sapellido+"','"+direccion+"','"+ciudad+"','"+telefono+"','"+genero+"','"+edad+"','"+fechanac+"','"+pais+"','"+nacionalidad+"','"+nIdentidad+"','"+email+"','"+idfo+"','"+idu+"')";
        
        List<String> listaget = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return listaget.get(0).toString();
    } 
     
     
     public List cargaOcupaciones() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaocupaciones()";
     
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
     
     public String insertaFase2(String NomprePadre,String EsPadre, String CelPadre,String idpadre,String correoPadre,String teldompadre,String paisdompadre,
            String ciudompadre,String dirdompadre,String emptrapad,String ocuptrapad,String teltrapad,String paistrapad, String ciutrapad, String dirtrapad,
            String idUsuario, String idFormulario, String pasaporte) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase2('"+NomprePadre+"','"+EsPadre+"','"+CelPadre+"','"+idpadre+"','"+pasaporte+"','"+correoPadre+"','"+teldompadre+"','"+paisdompadre+"','"
                +ciudompadre+"','"+dirdompadre+"','"+emptrapad+"','"+ocuptrapad+"','"+teltrapad+"','"+paistrapad+"','"+ciutrapad+"','"+dirtrapad+"','"+idUsuario
                +"','"+idFormulario+"')";
        
        List<String> listaget = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return listaget.get(0).toString();
    } 
    
}
