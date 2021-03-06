package modelo.pojo;
// Generated 15-mar-2017 16:17:44 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TblEstudianteMatricula generated by hbm2java
 */
public class TblEstudianteMatricula  implements java.io.Serializable {


     private int idAlumno;
     private String primerNombre;
     private String segundoNombre;
     private String primerApellido;
     private String segundoApellido;
     private String direccionCasa;
     private String ciudad;
     private String telefonoCelular;
     private String genero;
     private Date fechaNac;
     private Integer idPaisNac;
     private String ciudadania;
     private String noIdentidad;
     private String noPasaporte;
     private String correo;
     private Integer idUsuarioCreo;
     private Date fechaCreacion;
     private Integer idModificaCrea;
     private Date fechaModificacion;
     private Set tblEstudianteTutors = new HashSet(0);
     private Set tblInfoAdmisions = new HashSet(0);

    public TblEstudianteMatricula() {
    }

	
    public TblEstudianteMatricula(int idAlumno) {
        this.idAlumno = idAlumno;
    }
    public TblEstudianteMatricula(int idAlumno, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String direccionCasa, String ciudad, String telefonoCelular, String genero, Date fechaNac, Integer idPaisNac, String ciudadania, String noIdentidad, String noPasaporte, String correo, Integer idUsuarioCreo, Date fechaCreacion, Integer idModificaCrea, Date fechaModificacion, Set tblEstudianteTutors, Set tblInfoAdmisions) {
       this.idAlumno = idAlumno;
       this.primerNombre = primerNombre;
       this.segundoNombre = segundoNombre;
       this.primerApellido = primerApellido;
       this.segundoApellido = segundoApellido;
       this.direccionCasa = direccionCasa;
       this.ciudad = ciudad;
       this.telefonoCelular = telefonoCelular;
       this.genero = genero;
       this.fechaNac = fechaNac;
       this.idPaisNac = idPaisNac;
       this.ciudadania = ciudadania;
       this.noIdentidad = noIdentidad;
       this.noPasaporte = noPasaporte;
       this.correo = correo;
       this.idUsuarioCreo = idUsuarioCreo;
       this.fechaCreacion = fechaCreacion;
       this.idModificaCrea = idModificaCrea;
       this.fechaModificacion = fechaModificacion;
       this.tblEstudianteTutors = tblEstudianteTutors;
       this.tblInfoAdmisions = tblInfoAdmisions;
    }
   
    public int getIdAlumno() {
        return this.idAlumno;
    }
    
    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }
    public String getPrimerNombre() {
        return this.primerNombre;
    }
    
    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }
    public String getSegundoNombre() {
        return this.segundoNombre;
    }
    
    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }
    public String getPrimerApellido() {
        return this.primerApellido;
    }
    
    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }
    public String getSegundoApellido() {
        return this.segundoApellido;
    }
    
    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }
    public String getDireccionCasa() {
        return this.direccionCasa;
    }
    
    public void setDireccionCasa(String direccionCasa) {
        this.direccionCasa = direccionCasa;
    }
    public String getCiudad() {
        return this.ciudad;
    }
    
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    public String getTelefonoCelular() {
        return this.telefonoCelular;
    }
    
    public void setTelefonoCelular(String telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }
    public String getGenero() {
        return this.genero;
    }
    
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public Date getFechaNac() {
        return this.fechaNac;
    }
    
    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }
    public Integer getIdPaisNac() {
        return this.idPaisNac;
    }
    
    public void setIdPaisNac(Integer idPaisNac) {
        this.idPaisNac = idPaisNac;
    }
    public String getCiudadania() {
        return this.ciudadania;
    }
    
    public void setCiudadania(String ciudadania) {
        this.ciudadania = ciudadania;
    }
    public String getNoIdentidad() {
        return this.noIdentidad;
    }
    
    public void setNoIdentidad(String noIdentidad) {
        this.noIdentidad = noIdentidad;
    }
    public String getNoPasaporte() {
        return this.noPasaporte;
    }
    
    public void setNoPasaporte(String noPasaporte) {
        this.noPasaporte = noPasaporte;
    }
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
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
    public Set getTblEstudianteTutors() {
        return this.tblEstudianteTutors;
    }
    
    public void setTblEstudianteTutors(Set tblEstudianteTutors) {
        this.tblEstudianteTutors = tblEstudianteTutors;
    }
    public Set getTblInfoAdmisions() {
        return this.tblInfoAdmisions;
    }
    
    public void setTblInfoAdmisions(Set tblInfoAdmisions) {
        this.tblInfoAdmisions = tblInfoAdmisions;
    }




}


