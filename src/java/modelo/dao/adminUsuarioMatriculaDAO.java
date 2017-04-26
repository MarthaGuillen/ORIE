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
     
     public List cargaUsuariospara(String nom) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_listausuariosfrontParametros('"+nom+"')";
     
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
    
    //Captura divisiones
     public List cargaDivisiones(int ids) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturadivisiones('"+ids+"')";
     
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
     
     //Captura grados
     public List cargaGrados(int ids) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturagrados('"+ids+"')";
     
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
     
     //Captura grados
     public List cargaEstudiantes(int id) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_ListaEstudiantesPadre('"+id+"')";
     
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
    public String insertaEstdudiante(int ids, int idd, int idg, int idua,int idu, String nom){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertaEstudianteTemp('"+ids+"','"+idd+"','"+idg+"','"+idua+"','"+idu+"','"+nom+"')";
        
        
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
    
     public String delstdudiante(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_eliminaEstudianteTemp('"+id+"')";
        
        
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
     
    //cambia estado de usuario
      public String estadoUsu(int id, int idus, String est){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_cambiaEstadoUsuario('"+id+"','"+idus+"','"+est+"')";
        
        
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
