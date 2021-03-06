package modelo.pojo;
// Generated 15-mar-2017 16:17:44 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * TblPerfilMenus generated by hbm2java
 */
public class TblPerfilMenus  implements java.io.Serializable {


     private int id;
     private TblMenu tblMenu;
     private TblPerfil tblPerfil;
     private int idUsuarioCreo;
     private Date fechaCreacion;
     private int idUsuarioModifica;
     private Date fechaModificacion;

    public TblPerfilMenus() {
    }

	
    public TblPerfilMenus(int id, TblMenu tblMenu, TblPerfil tblPerfil, int idUsuarioCreo, int idUsuarioModifica) {
        this.id = id;
        this.tblMenu = tblMenu;
        this.tblPerfil = tblPerfil;
        this.idUsuarioCreo = idUsuarioCreo;
        this.idUsuarioModifica = idUsuarioModifica;
    }
    public TblPerfilMenus(int id, TblMenu tblMenu, TblPerfil tblPerfil, int idUsuarioCreo, Date fechaCreacion, int idUsuarioModifica, Date fechaModificacion) {
       this.id = id;
       this.tblMenu = tblMenu;
       this.tblPerfil = tblPerfil;
       this.idUsuarioCreo = idUsuarioCreo;
       this.fechaCreacion = fechaCreacion;
       this.idUsuarioModifica = idUsuarioModifica;
       this.fechaModificacion = fechaModificacion;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public TblMenu getTblMenu() {
        return this.tblMenu;
    }
    
    public void setTblMenu(TblMenu tblMenu) {
        this.tblMenu = tblMenu;
    }
    public TblPerfil getTblPerfil() {
        return this.tblPerfil;
    }
    
    public void setTblPerfil(TblPerfil tblPerfil) {
        this.tblPerfil = tblPerfil;
    }
    public int getIdUsuarioCreo() {
        return this.idUsuarioCreo;
    }
    
    public void setIdUsuarioCreo(int idUsuarioCreo) {
        this.idUsuarioCreo = idUsuarioCreo;
    }
    public Date getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    public int getIdUsuarioModifica() {
        return this.idUsuarioModifica;
    }
    
    public void setIdUsuarioModifica(int idUsuarioModifica) {
        this.idUsuarioModifica = idUsuarioModifica;
    }
    public Date getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }




}


