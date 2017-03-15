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
public class loginDAO {
    
    public String cargaRespuestas(String us, String pass) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fnvalidaUser('" + us + "','"+pass+"')";
        
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
    
   
    
}
