package modelo.pojo;
// Generated 15-mar-2017 16:17:44 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * TblPaises generated by hbm2java
 */
public class TblPaises  implements java.io.Serializable {


     private int idPais;
     private String pais;
     private Integer idUsuarioCreo;
     private Date fechaCreacion;
     private Integer idModificaCrea;
     private Date fechaModificacion;

    public TblPaises() {
    }

	
    public TblPaises(int idPais) {
        this.idPais = idPais;
    }
    public TblPaises(int idPais, String pais, Integer idUsuarioCreo, Date fechaCreacion, Integer idModificaCrea, Date fechaModificacion) {
       this.idPais = idPais;
       this.pais = pais;
       this.idUsuarioCreo = idUsuarioCreo;
       this.fechaCreacion = fechaCreacion;
       this.idModificaCrea = idModificaCrea;
       this.fechaModificacion = fechaModificacion;
    }
   
    public int getIdPais() {
        return this.idPais;
    }
    
    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }
    public String getPais() {
        return this.pais;
    }
    
    public void setPais(String pais) {
        this.pais = pais;
    }
    public Integer getIdUsuarioCreo() {
        return this.idUsuarioCreo;
    }
    
    public void setIdUsuarioCreo(Integer idUsuarioCreo) {
        this.idUsuarioCreo = idUsuarioCreo;
    }
    public Date getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    public Integer getIdModificaCrea() {
        return this.idModificaCrea;
    }
    
    public void setIdModificaCrea(Integer idModificaCrea) {
        this.idModificaCrea = idModificaCrea;
    }
    public Date getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }




}


