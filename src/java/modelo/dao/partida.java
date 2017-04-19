/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;

public class partida {
  private String nombrepartida;
    private String Codigopartida;
    private List<operacion> operaciones;
    private float parcial;
    private String estado;
    private String Fecha;
    private String usuario;
    private String fechacreo;
    
    public partida(){}
    public partida(String Fecha,String nombrep,String codigop,List<operacion> operaciones, float parcial
    ,String estado,String usuario,String fechacreo){
   this.nombrepartida=nombrep;
    this.Codigopartida=codigop;
    this.operaciones=operaciones;
    this.parcial=parcial;
   this.estado=estado;
    this.Fecha=Fecha;
    this.usuario=usuario;
    this.fechacreo=fechacreo;
    
    }
    /**
     * @return the nombrepartida
     */
    public String getNombrepartida() {
        return nombrepartida;
    }

    /**
     * @param nombrepartida the nombrepartida to set
     */
    public void setNombrepartida(String nombrepartida) {
        this.nombrepartida = nombrepartida;
    }

    /**
     * @return the Codigopartida
     */
    public String getCodigopartida() {
        return Codigopartida;
    }

    /**
     * @param Codigopartida the Codigopartida to set
     */
    public void setCodigopartida(String Codigopartida) {
        this.Codigopartida = Codigopartida;
    }

    /**
     * @return the operaciones
     */
    public List<operacion> getOperaciones() {
        return operaciones;
    }

    /**
     * @param operaciones the operaciones to set
     */
    public void setOperaciones(List<operacion> operaciones) {
        this.operaciones = operaciones;
    }

    /**
     * @return the parcial
     */
    public float getParcial() {
        return parcial;
    }

    /**
     * @param parcial the parcial to set
     */
    public void setParcial(float parcial) {
        this.parcial = parcial;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the Fecha
     */
    public String getFecha() {
        return Fecha;
    }

    /**
     * @param Fecha the Fecha to set
     */
    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the fechacreo
     */
    public String getFechacreo() {
        return fechacreo;
    }

    /**
     * @param fechacreo the fechacreo to set
     */
    public void setFechacreo(String fechacreo) {
        this.fechacreo = fechacreo;
    }
  
    
            
    
    
}
