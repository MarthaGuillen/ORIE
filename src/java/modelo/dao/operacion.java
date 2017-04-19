/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

/**
 *
 * @author Jerson
 */
public class operacion {

    
private String codigo;
private String nombrec;
private String Concepto;
private float debe;
private float haber;
 public operacion(){}
 public operacion(String codigo,String nombre,String concepto,float debe,float haber){
     this.codigo=codigo;
     this.nombrec=nombre;
     this.Concepto=concepto;
     this.debe=debe;
     this.haber=haber;
 }
 
    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the nombrec
     */
    public String getNombrec() {
        return nombrec;
    }

    /**
     * @param nombrec the nombrec to set
     */
    public void setNombrec(String nombrec) {
        this.nombrec = nombrec;
    }

    /**
     * @return the Concepto
     */
    public String getConcepto() {
        return Concepto;
    }

    /**
     * @param Concepto the Concepto to set
     */
    public void setConcepto(String Concepto) {
        this.Concepto = Concepto;
    }

    /**
     * @return the debe
     */
    public float getDebe() {
        return debe;
    }

    /**
     * @param debe the debe to set
     */
    public void setDebe(float debe) {
        this.debe = debe;
    }

    /**
     * @return the haber
     */
    public float getHaber() {
        return haber;
    }

    /**
     * @param haber the haber to set
     */
    public void setHaber(float haber) {
        this.haber = haber;
    }


}
