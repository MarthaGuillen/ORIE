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
public class bitacoraDAO {
    
     //Insertausuario
    public String insertaBitacora(int idtabla, int idevento, int idusu, String descrip){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "select fn_insertaBitacora('"+descrip+"','"+idtabla+"','"+idevento+"','"+idusu+"')";
        
        
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
