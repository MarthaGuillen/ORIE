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
public class cuentaresultadoDAO {
    public String agregarcuentaresultado(int id_madre_cr,String codigo_cr,String nombre_cr){
          
      System.out.println("_________________________________________dao");   
      System.out.println(id_madre_cr);   
        System.out.println(codigo_cr);   
        System.out.println(nombre_cr);
          String resp="";
    String sql = "INSERT INTO tbl_cuenta_hija_cr (id_madre_cr,codigo_cr,nombre_cr) VALUES ( '"+id_madre_cr+"','"+codigo_cr+"','"+nombre_cr+"');";
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction t = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            int result = query.executeUpdate();
            resp = "exito..";
            t.commit();
            session.close();
        } catch (Exception e) {
            resp = "Fallo";
            e.printStackTrace();
        }
        System.out.println(resp);
    return resp;
    }
      
    
    public List llenarcuentamadre(int codigo){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "Select tbl_area_cuenta.id_area,id_madre_cr ,tbl_area_cuenta.codigo_a,codigom_cr,nombre_crm from tbl_cuenta_madre_cr inner join tbl_area_cuenta on tbl_area_cuenta.id_area = tbl_cuenta_madre_cr.id_area \n" +
"where tbl_area_cuenta.id_area ="+ codigo+"";
        
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
    
     
     
    public String conteocuenta(int codigo) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fncuentas('" + codigo + "')";
        
        List<String> listaget = new ArrayList<String>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            listaget = q.list();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return listaget.get(0).toString();
    }
     
     public List areacr(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_SCselectcuentaArea();";
        
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
     public List tipocr(){
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_SCselectcuentamadre();";
        
        List<Object[]> listaget = new ArrayList<Object[]>();
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createSQLQuery(sql);
            System.out.println("***************************************");
            System.out.println("*****"+q.list());
            listaget = q.list();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally { 
          session.close();
        }

       
        return listaget;
    }
public List CuentasResultado(){
        //select cuentas hijas
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " select * from fn_SCselectcuentaresultado()";
        
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
