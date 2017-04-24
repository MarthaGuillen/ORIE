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
 * @author Jerson
 */
public class librodiarioDAO {
    public List filtrolibrodiario(int sociedad, String fecha ){
         System.out.println("saliendo Obtener operacion libro");
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select * from fn_scobtenerdatoslibrodiario('"+sociedad+"','"+fecha+"')";
        
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
}
