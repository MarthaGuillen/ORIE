package modelo.pojo;
// Generated 15-mar-2017 16:17:44 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TblPermisosNavegacion generated by hbm2java
 */
public class TblPermisosNavegacion  implements java.io.Serializable {


     private int idnav;
     private TblMenu tblMenu;
     private String navegacion;
     private String url;
     private String pseudo;
     private Set tblPerfilNavegacions = new HashSet(0);

    public TblPermisosNavegacion() {
    }

	
    public TblPermisosNavegacion(int idnav, TblMenu tblMenu, String navegacion) {
        this.idnav = idnav;
        this.tblMenu = tblMenu;
        this.navegacion = navegacion;
    }
    public TblPermisosNavegacion(int idnav, TblMenu tblMenu, String navegacion, String url, String pseudo, Set tblPerfilNavegacions) {
       this.idnav = idnav;
       this.tblMenu = tblMenu;
       this.navegacion = navegacion;
       this.url = url;
       this.pseudo = pseudo;
       this.tblPerfilNavegacions = tblPerfilNavegacions;
    }
   
    public int getIdnav() {
        return this.idnav;
    }
    
    public void setIdnav(int idnav) {
        this.idnav = idnav;
    }
    public TblMenu getTblMenu() {
        return this.tblMenu;
    }
    
    public void setTblMenu(TblMenu tblMenu) {
        this.tblMenu = tblMenu;
    }
    public String getNavegacion() {
        return this.navegacion;
    }
    
    public void setNavegacion(String navegacion) {
        this.navegacion = navegacion;
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
    public Set getTblPerfilNavegacions() {
        return this.tblPerfilNavegacions;
    }
    
    public void setTblPerfilNavegacions(Set tblPerfilNavegacions) {
        this.tblPerfilNavegacions = tblPerfilNavegacions;
    }




}


