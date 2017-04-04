/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;

/**
 *
 * @author Sinergia003
 */
public class creartabla {
    public  String crearlibro(ArrayList<String> idpartida,
    ArrayList<String> fechapartida,ArrayList<String> nombrepartida,
    ArrayList<String> nombrecuenta,ArrayList<String> codigocuenta,
    ArrayList<String> iddatospartida,ArrayList<String> Descripcion,
    ArrayList<String> debe ,ArrayList<String> haber,ArrayList<String> usuario){
    String tabla="";
        String rowpartidad="";
        String rowd="";
        ArrayList<String> rowpartida = new ArrayList<String>(); 
        ArrayList<String> row = new ArrayList<String>(); 
        String temp="";
          for (int i = 0; i < idpartida.size()-1; i++) {
            if(idpartida.get(i)!=temp){
            rowpartidad+="<tr>";
            rowpartidad+="<td>"+nombrepartida.get(i)+"</td>";
            rowpartidad+="<td>";
        /*    for (int j = 0; j < idpartida.size()-1; j++) {
                   if(idpartida.get(i)==idpartida.get(j)){
                   rowd+="<tr>"+codigocuenta.get(j)+" "+nombrecuenta.get(j)+"</tr>";
                   }
                }
            
             rowpartidad+=rowd;
             rowpartidad+="</td>";
            rowd="";
             rowpartidad+="<td>";
            for (int k = 0; k < idpartida.size()-1; k++) {
                   if(idpartida.get(i)==idpartida.get(k)){
                   rowd+="<tr>"+Descripcion.get(k)+"</tr>";
                   }
                }
            rowpartidad+=rowd;
             rowpartidad+="</td>";
             rowpartidad+="<td>";
            for (int ii = 0; ii < idpartida.size()-1; ii++) {
                   if(idpartida.get(i)==idpartida.get(ii)){
                   rowd+="<tr>"+debe.get(ii)+"</tr>";
                        System.out.println(idpartida.get(ii));
                       System.out.println(debe.get(ii)+"<tr>"+debe.get(ii)+"</tr>");
                   }
                }
            rowpartidad+=rowd;
             rowpartidad+="</td>";
            rowd="";
             rowpartidad+="<td>";
            for (int jj = 0; jj < idpartida.size()-1; jj++) {
                   if(idpartida.get(i)==idpartida.get(jj)){
                   rowd+="<tr>"+haber.get(jj)+"</tr>";
                   }
                }*/
            rowpartidad+=rowd;
             rowpartidad+="</td>";
            rowd="";
            rowpartidad+="<td>"+usuario.get(i)+"</td>";
            rowpartidad+="</tr>\n";
            
            }
              
             
        }
          tabla=rowpartidad;
          System.out.println("controller.creartabla.crearlibro()");
          System.out.println(tabla);
        return tabla;
    }
}
