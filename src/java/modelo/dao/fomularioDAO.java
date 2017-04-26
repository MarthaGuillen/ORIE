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
    
    public List cargaPadresTutores(String us, String form) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaTutores('"+us+"', '"+form+"')";
     
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
    
    public List cargaHermanos(String form) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturahermanos('"+form+"')";
     
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
            String genero,String edad,String fechanac,String pais,String nacionalidad,String nIdentidad, String email, String nomEm, String telEm, 
            String idfo, String idu) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase1('"+pnombre+"','"+snombre+"','"+papellido+"','"+sapellido+"','"+direccion+"','"+ciudad+"','"+telefono+"','"+genero+"','"+
                edad+"','"+fechanac+"','"+pais+"','"+nacionalidad+"','"+nIdentidad+"','"+email+"','"+nomEm+"','"+telEm+"','"+idfo+"','"+idu+"')";
        
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
     
     
     public String insertaFase3(String estViveCon, String infAdmi, String respCompFin, String padFall, String madFall, String padDiv, String padSep, String segNupPad, String segNupMad, String padFhn, String madFhn, 
             String custLegal, String LengMat, String LengHogar, String idUsuario, String idFormulario) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase3('"+estViveCon+"','"+infAdmi+"','"+respCompFin+"','"+padFall+"','"+madFall+"','"+padDiv+"','"+padSep+"','"+segNupPad+"','"+segNupMad+"','"+
                padFhn+"','"+madFhn+"','"+custLegal+"','"+LengMat+"','"+LengHogar+"','"+idUsuario+"','"+idFormulario+"')";
        
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
     
     public String insertaFase4(String nombre, String edad, String escuela, String idUsuario, String idFormulario) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase4('"+nombre+"','"+edad+"','"+escuela+"','"+idUsuario+"','"+idFormulario+"')";
        
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
     
     
     public String insertaFase5(String PrimEsc, String NomEsc, String TipoEsc, String FecIng, String FecSalida, String DirEsc, String CiuEsc, String EstEsc,
             String idPaisEsc, String codPos, String NomDir, String tel, String correo, String idUsuario, String idFormulario) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase5('"+PrimEsc+"','"+NomEsc+"','"+TipoEsc+"','"+FecIng+"','"+FecSalida+"','"+DirEsc+"','"+CiuEsc+"','"+EstEsc+"','"
                +idPaisEsc+"','"+codPos+"','"+NomDir+"','"+tel+"','"+correo+"','"+idUsuario +"','"+idFormulario+"')";
        
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
     
     
     public String insertaFase6(String nombre,  String idPais, String ciudEscuela, String razonTras, String idUsuario, String idFormulario) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase6('"+nombre+"','"+ciudEscuela+"','"+idPais+"','"+razonTras+"','"+idUsuario+"','"+idFormulario+"')";
        
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
     
     
     public String insertaFase7(String ApPrevia, String PagWeb, String Pub, String PubDet, String Panf, String fam, String famNom, String emp, String empNom,
      String otros, String otrosDet, String idUsuario, String idFormulario) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_insertafase7('"+ApPrevia+"','"+PagWeb+"','"+Pub+"','"+PubDet+"','"+Panf+"','"+fam+"','"+famNom+"','"+emp+"','"
                +empNom+"','"+otros+"','"+otrosDet+"','"+idUsuario+"','"+idFormulario+"')";
        
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
     
     public String insertaAgregadosPad(String idRelacionados, String idEliminados, String idUsuario, String idFormulario) {
         
        Session session = HibernateUtil.getSessionFactory().openSession();                                                             
        String sql = "SELECT fn_relacionaPadTutor('"+idRelacionados+"','"+idEliminados+"','"+idUsuario+"','"+idFormulario+"')";
        
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
     
    public List cargaEscuelas(String form) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_capturaescuelas('"+form+"')";
     
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            return listaget;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }finally { 
          session.close();
        }
        return listaget;
    }
}
