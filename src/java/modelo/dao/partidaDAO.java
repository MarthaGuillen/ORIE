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
      public List agregardatospartida(
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
    return r;
    }
      public List vercuentapartida(int cuenta,int idsociedad ){
          System.out.println("Estoy en el dao de sub cuenta");
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
      public List obteneroperacion(int operacion ){
          System.out.println("Estoy en el dao de obtener operacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scobteneroperacion("+operacion+")";
        
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
            public List actualizaroperacion(int operacion,String Descripcion,float debe,float haber,String movimiento,int usuario ){
          System.out.println("Estoy en el dao de Actualizar operacion modificacion");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_scmodificaroperaciones('"+ operacion+"','"+Descripcion+"','"+debe+"','"+haber
                +"','"+movimiento+"','"+ usuario+"' )";
        
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
            public List filtrolibrodiario( String fecha ){
         System.out.println("saliendo Obtener operacion libro");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select p.id_partida,p.fecha,p.nombrepartida, s.nombretp,s.codigo,  o.id_datospartida, o.descripcion, o.debe,o.haber, u.usuario from tbl_operaciones as o \n" +
"inner join tbl_partida as p on p.id_partida = o.id_partida\n" +
"inner join tbl_subcuentabalance as s on s.id_subcuentabalance =o.id_subcuentabalance \n" +
"inner join tbl_usuario as u on u.id_usuario = o.id_usuario_creo where p.fecha = '"+ fecha+"'";
        
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
          
       System.out.println("saliendo Obtener operacion libro" +listaget);
        return listaget;
    }

            public List cambiarestado(int transaccion,int idusuario){
                Session session = HibernateUtil.getSessionFactory().openSession();
        String sql ="Select fn_scmodificarestadooperaciones('"+transaccion+"','"+idusuario+"')";
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
          
       System.out.println("saliendo modificar estado: " +listaget);
        return listaget;
            }
}
