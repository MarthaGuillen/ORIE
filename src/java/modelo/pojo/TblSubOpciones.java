package modelo.pojo;
// Generated 15-mar-2017 16:17:44 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TblSubOpciones generated by hbm2java
 */
public class TblSubOpciones  implements java.io.Serializable {


     private int idsubOpcion;
     private TblOpciones tblOpciones;
     private String subopcion;
     private String url;
     private String pseudo;
     private Set tblPerfilSubopcioneses = new HashSet(0);

    public TblSubOpciones() {
    }

	
    public TblSubOpciones(int idsubOpcion, TblOpciones tblOpciones, String subopcion, String url, String pseudo) {
        this.idsubOpcion = idsubOpcion;
        this.tblOpciones = tblOpciones;
        this.subopcion = subopcion;
        this.url = url;
        this.pseudo = pseudo;
    }
    public TblSubOpciones(int idsubOpcion, TblOpciones tblOpciones, String subopcion, String url, String pseudo, Set tblPerfilSubopcioneses) {
       this.idsubOpcion = idsubOpcion;
       this.tblOpciones = tblOpciones;
       this.subopcion = subopcion;
       this.url = url;
       this.pseudo = pseudo;
       this.tblPerfilSubopcioneses = tblPerfilSubopcioneses;
    }
   
    public int getIdsubOpcion() {
        return this.idsubOpcion;
    }
    
    public void setIdsubOpcion(int idsubOpcion) {
        this.idsubOpcion = idsubOpcion;
    }
    public TblOpciones getTblOpciones() {
        return this.tblOpciones;
    }
    
    public void setTblOpciones(TblOpciones tblOpciones) {
        this.tblOpciones = tblOpciones;
    }
    public String getSubopcion() {
        return this.subopcion;
    }
    
    public void setSubopcion(String subopcion) {
        this.subopcion = subopcion;
    }
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    public String getPseudo() {
        return this.pseudo;
    }
    
    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }
    public Set getTblPerfilSubopcioneses() {
        return this.tblPerfilSubopcioneses;
    }
    
    public void setTblPerfilSubopcioneses(Set tblPerfilSubopcioneses) {
        this.tblPerfilSubopcioneses = tblPerfilSubopcioneses;
    }




}


