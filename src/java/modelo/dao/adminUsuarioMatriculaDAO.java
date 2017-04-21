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
public class adminUsuarioMatriculaDAO {
    
     public List cargaUsuarios() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_listausuariosFront()";
     
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
     
     //tipod de clientes
     public List cargaClientes() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaTiposClientes()";
     
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
        String sql = "select fninsertuserfront('"+us+"','"+ema+"','"+pass+"','"+nomc+"','"+idu+"');";
        
        
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
    
     //Inserta tipo cliente usuario
    public String insertaCLienteUsuario(int idus, int idtc){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertaTipoClienteUsuario('"+idus+"','"+idtc+"');";
        
        
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
    
    //Inserta tipo cliente usuario
    public String insertaCLiente(int idus, String num, String dir){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertCliente('"+idus+"','"+num+"','"+dir+"')";
        
        
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
