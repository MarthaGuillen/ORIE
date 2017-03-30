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
    
                 public List agregarpartida(
                 int sociedad,
               String nombre,String fecha,int idusuario
               ){
          
    System.out.println(" "+sociedad+" "+fecha+" "+idusuario);
    String resp="";
    String sql = "SELECT fn_SCinsertpartida('"+sociedad+"','"+nombre+
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
}
