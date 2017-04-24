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
public class partidaDAO {
    
                 public List agregarpartida(int subcuenta,
                 int sociedad,
               String nombre,String fecha,int idusuario
               ){
          
    System.out.println(" "+sociedad+" "+fecha+" "+idusuario);
    String resp="";
    String sql = "SELECT fn_SCinsertpartida('"+subcuenta+"','"+sociedad+"','"+nombre+
            "','"+fecha+"','"+idusuario+"')";
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
    return r;
    }
      public String agregardatospartida(
                int idcrearpartida,int cuenta,String descripcion, float 
                        debe, float haber,String movimiento,int idusuario
               ){
          
    System.out.println(idcrearpartida+" "+descripcion+" "+debe+" "+haber +"estoy en el Dao");
    String resp="";
    String sql = "SELECT fn_SCinsertoperaciones('"+idcrearpartida+"','"+cuenta+"','"+descripcion+"','"+debe+"','"+haber+"','"+movimiento+"','"+idusuario+"')";
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
    return r.get(0);
    }
      public List vercuentapartida(int cuenta,int idsociedad ){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scpartidacuenta("+cuenta+","+idsociedad+")ORDER BY codigocuenta";
        
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
      public List obteneroperacion(int transaccion ){
          System.out.println("Estoy en el dao de obtener operacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scobteneroperacion("+transaccion+")";
        
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

       System.out.println("saliendo actualizaroperacion" +listaget);
        return listaget;
    }
      public List obtenerdatospartida(int transaccion ){
          System.out.println("Estoy en el dao de obtener operacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select * from fn_scobtenerdatopartida("+transaccion+")";
        
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

       System.out.println("saliendo actualizaroperacion" +listaget);
        return listaget;
    }
      public List crearcontrapartida(int cuenta, int idsociedad,String nombre, int idusucreo){
          System.out.println("Estoy en el dao de obtener operacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select   fn_SCinsertpartidacontra('"+cuenta+"','"+idsociedad+"','"+ nombre+"','"+idusucreo+"') as contra_p";
        
        List<String> listaget = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }finally { 
          session.close();
        }

       System.out.println("saliendo contrapartida" +listaget.get(0));
        return listaget;
    }
      
      public List modificarpartida(int transaccion ){
          System.out.println("Estoy en el dao de obtener operacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select  fn_scmodificarestadopartida("+transaccion+")";
        
        List<String> listaget = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }finally { 
          session.close();
        }

       System.out.println("saliendo actualizaroperacion " +listaget.get(0));
        return listaget;
    }
      

            public List mostrarpartidas(int sociedad){
          System.out.println("Estoy en el dao de Actualizar operacion modificacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scobtenerpartida('"+sociedad+"')";
        
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
          
       System.out.println("saliendo Obtener operacion" +listaget);
        return listaget;
    }
            


}
