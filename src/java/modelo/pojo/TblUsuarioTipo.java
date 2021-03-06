package modelo.pojo;
// Generated 15-mar-2017 16:17:44 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TblUsuarioTipo generated by hbm2java
 */
public class TblUsuarioTipo  implements java.io.Serializable {


     private int idTipo;
     private String tipo;
     private Set tblUsuarios = new HashSet(0);

    public TblUsuarioTipo() {
    }

	
    public TblUsuarioTipo(int idTipo) {
        this.idTipo = idTipo;
    }
    public TblUsuarioTipo(int idTipo, String tipo, Set tblUsuarios) {
       this.idTipo = idTipo;
       this.tipo = tipo;
       this.tblUsuarios = tblUsuarios;
    }
   
    public int getIdTipo() {
        return this.idTipo;
    }
    
    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public Set getTblUsuarios() {
        return this.tblUsuarios;
    }
    
    public void setTblUsuarios(Set tblUsuarios) {
        this.tblUsuarios = tblUsuarios;
    }




}


