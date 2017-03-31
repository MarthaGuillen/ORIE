var saldodebe=0;
var saldohaber=0;
var total;
var idcrearpartida;
var fecha2;
var i;
var ii=0;
var tem;
jQuery('form[data-toggle="validator"] select').on('change', function(event) {
    event.preventDefault();
    jQuery(this).find('option[disabled]').remove();
});

$( document ).ready(function() {
    
        $("#activaTema").click(function() {  
            if($("#activaTema").is(':checked')) {  
                  document.getElementById('skin-toolbox').style.display = 'block';
            } else {  
                 document.getElementById('skin-toolbox').style.display = 'none';
            }  
        }); 
    
    
        $('#fecha').pickadate({
                    selectMonths: true,
                    selectYears: true,
                    format: 'dd/mm/yyyy',
                    formatSubmit: 'dd/mm/yyyy',
                    min: new Date(1950,1,1),
                    max: true,
                    onClose: function() {
                        $(document.activeElement).blur();
                    }
        });
    
        $("#cuenta").select2(
        {placeholder: "Seleccione la Cuenta",
                 allowClear: true
        });
        
        $("#origen").select2(
        {placeholder: "Seleccione Origen",
                 allowClear: true
        });
        $("#sociedad").select2(
        {placeholder: "Seleccione Sociedad",
                 allowClear: true
        });
        $("#subcuenta").select2(
        {placeholder: "Seleccione Sub-cuenta",
                 allowClear: true
        });
       
       $("#add").click(function(){
           
            var monto=$("#monto").val();
          var descripcion=$("#des").val();
           var subcuenta =$("#subcuenta").val();
           var movimiento=$('input:radio[name=movi]:checked').val();
           var debe=0;
           var haber=0;
           var e=0;
           var transaccion;
           if(descripcion==""){
               e=1;
              
              document.getElementById('descripcionval').style.display = 'block'; 
           }
           
          
           if(movimiento==""){
                e=1;
              document.getElementById('movival').style.display = 'block'; 
           }
           if(monto==""){
                e=1;
              document.getElementById('montoval').style.display = 'block'; 
           }
           
           if(e==0){
                   ii=1+ii;                  
             var  f =new Date();
             fecha2=f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear();
              if(movimiento=="D"){
                   debe=monto;
                      
                    }else if(movimiento=="H"){
                      haber=monto;
                      
                    }
          document.getElementById('descripcionval').style.display = 'none';
          
           document.getElementById('movival').style.display = 'none';
           document.getElementById('montoval').style.display = 'none';
         
            var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("alerta2").innerHTML = xhttp.responseText;
                        var id =$("#cuentar").val();
                        
                        transaccion=  id.substring(1, id.length-1);
                        
                         // Obtenemos el numero de filas (td) que tiene la primera columna
            // (tr) del id "tabla"
            var tds=$("#tpartida tr:first td").length;
            // Obtenemos el total de columnas (tr) del id "tabla"
            var trs=$("#tabla tr").length;
            var nuevaFila="<tr id='fila"+ii+"'>";
            
            if(trs==0){
                
                nuevaFila+="<td>"+transaccion+"</td>";
                nuevaFila+="<td>"+descripcion+"</td>";
                 if(movimiento=="D"){
                    nuevaFila +="<td>"+parseFloat(monto)+"</td>";
                    nuevaFila+="<td></td>";
                     saldodebe = parseFloat(saldodebe) + parseFloat(monto) ;
                    }else if(movimiento=="H"){
                      nuevaFila+="<td></td>";  
                      nuevaFila +="<td>"+monto+"</td>";
                      saldohaber = parseFloat(saldohaber) + parseFloat(monto);
                            }
                            nuevaFila+="<td><a href='#'onclick='modificar("+transaccion+","+ii+")'><span class='glyphicon glyphicon-pencil' ></a></td>";
    
                
            }
            else{
            for(var i=0;i<tds;i++){
                // añadimos las columnas
               
               
                nuevaFila+="<td>"+transaccion+"</td>";
                nuevaFila+="<td>"+descripcion+"</td>";
                 if(movimiento=="D"){
                    nuevaFila +="<td class='debe'>"+parseFloat(monto)+"</td>";
                    nuevaFila+="<td class='haber'></td>";
                    saldodebe = parseFloat(saldodebe) + parseFloat(monto) ;
                      
                    }else if(movimiento=="H"){
                      nuevaFila+="<td class='debe'></td>";  
                      nuevaFila +="<td class='haber'>"+monto+"</td>";
                      saldohaber = parseFloat(saldohaber) + parseFloat(monto);
                      }
                      nuevaFila+="<td><a href='#'onclick='modificar("+transaccion,ii+")'><span class='glyphicon glyphicon-pencil' ></a></td>";
            }}
            // Añadimos una columna con el numero total de columnas.
            // Añadimos uno al total, ya que cuando cargamos los valores para la
            // columna, todavia no esta añadida
            nuevaFila+="</tr>";
             var final="<td></td><td></td> <td></td>"
            $("#tpartida").append(nuevaFila);
           $("#monto").val("");
         $("#descripcion").val("");
           $("#transaccion").val("");
           
            var final="";
           if(saldodebe>saldohaber){
               
               total=saldodebe-saldohaber;
                final="<tr><td></td><td>Saldo</td><td>"+total.toFixed(2)+"</td> <td ></td></tr>";
           }
           if(saldodebe<saldohaber){
               total=saldohaber-saldodebe;
               final="<tr><td></td><td>Saldo</td><td ></td><td '>"+total.toFixed(2)+"</td></tr>";
           }
         
          $("#saldo").html(final);
        
                    }
                }
                 
              
                xhttp.open("POST", "agregarpartida.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("idcrearpartida="+idcrearpartida+"&subcuenta="+subcuenta+"&descripcion="+descripcion+"&debe="+debe+"&haber="+haber+"&movimiento="+movimiento);
                 $("#des").val("");
                 $("#monto").val("");
                  $("#Debito").attr('checked', false);
                  $("#Credito").attr('checked', false);
               
    }
        });
       $("#crearpart").click(function () {
        
           var e=0;
        var nombret= $("#nombret").val();
        var fecha= $("#fecha").val();
        var sociedad= $("#sociedad").val();
        fecha2=fecha;
         if(nombret==""){
             e=1;
             document.getElementById('nombreval').style.display = 'block';
             
         }
         if(fecha==""){
             e=1;
             document.getElementById('fechaval').style.display = 'block';
             
         }
         if(sociedad==""){
             e=1;
             document.getElementById('sociedadval').style.display = 'block';
             
         }
         if(cuenta==""){
             e=1;
             document.getElementById('cuentaval').style.display = 'block';
             
         }
       if(e==0){
              document.getElementById('sociedadval').style.display = 'none';
            document.getElementById('fechaval').style.display = 'none';
           document.getElementById('cuentaval').style.display = 'none';
           document.getElementById('nombreval').style.display = 'none';
           document.getElementById('btnagregar').style.display = 'none';
         
         
         $("#partida").css("display", "block");  
        
           var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("alerta2").innerHTML = xhttp.responseText;
                        var id =$("#idt").val();
                        idcrearpartida= id.substring(1, id.length-1);
                       
                        
                         
                    }
                }

                xhttp.open("POST", "crearpartida.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("nombret="+nombret+"&fecha="+fecha+"&sociedad="+sociedad);
        document.getElementById('btnt').style.display = 'block';
         
         
       }
       
       }); 
         
         $("#btncrearpartidas").click(function(){
              document.getElementById('crearpartidas').style.display = 'block';
               document.getElementById('partida').style.display = 'none';
               document.getElementById('partida').style.display = 'none';
               
         });
         $("#btnverpartidas").click(function(){
              document.getElementById('crearpartidas').style.display = 'none';
               document.getElementById('partida').style.display = 'none';
                document.getElementById('partida').style.display = 'block';
         });
         $("#modificar").click(function(){
              document.getElementById('btnt').style.display = 'block'; 
                document.getElementById('btnmodificar').style.display = 'none';
                $("#des").val("");
                 $("#monto").val("");
                  $("#Debito").attr('checked', false);
                  $("#Credito").attr('checked', false);
                   var monto=$("#monto").val();
                   $("#fila"+tem).remove();
          var descripcion=$("#des").val();
          
           var movimiento=$('input:radio[name=movi]:checked').val();
           var debe=0;
           var haber=0;
           var e=0;
           var transaccion;
           if(descripcion==""){
               e=1;
              
              document.getElementById('descripcionval').style.display = 'block'; 
           }
           
          
           if(movimiento==""){
                e=1;
              document.getElementById('movival').style.display = 'block'; 
           }
           if(monto==""){
                e=1;
              document.getElementById('montoval').style.display = 'block'; 
           }
           
           if(e==0){
                   ii=1+ii;                  
             var  f =new Date();
             fecha2=f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear();
              if(movimiento=="D"){
                   debe=monto;
                      
                    }else if(movimiento=="H"){
                      haber=monto;
                      
                    }
          document.getElementById('descripcionval').style.display = 'none';
          
           document.getElementById('movival').style.display = 'none';
           document.getElementById('montoval').style.display = 'none';
         
            var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("alerta2").innerHTML = xhttp.responseText;
                        var id =$("#cuentar").val();
                        
                        transaccion=  id.substring(1, id.length-1);
                        
                         // Obtenemos el numero de filas (td) que tiene la primera columna
            // (tr) del id "tabla"
            var tds=$("#tpartida tr:first td").length;
            // Obtenemos el total de columnas (tr) del id "tabla"
            var trs=$("#tabla tr").length;
            var nuevaFila="<tr id='fila'"+ii+">";
            
            if(trs==0){
                
                nuevaFila+="<td>"+transaccion+"</td>";
                nuevaFila+="<td>"+descripcion+"</td>";
                 if(movimiento=="D"){
                    nuevaFila +="<td>"+parseFloat(monto)+"</td>";
                    nuevaFila+="<td></td>";
                     saldodebe = parseFloat(saldodebe) + parseFloat(monto) ;
                    }else if(movimiento=="H"){
                      nuevaFila+="<td></td>";  
                      nuevaFila +="<td>"+monto+"</td>";
                      saldohaber = parseFloat(saldohaber) + parseFloat(monto);
                            }
                            nuevaFila+="<td><a href='#'onclick='modificar("+transaccion+","+ii+")'><span class='glyphicon glyphicon-pencil' ></a></td>";
    
                
            }
            else{
            for(var i=0;i<tds;i++){
                // añadimos las columnas
               
               
                nuevaFila+="<td>"+transaccion+"</td>";
                nuevaFila+="<td>"+descripcion+"</td>";
                 if(movimiento=="D"){
                    nuevaFila +="<td class='debe'>"+parseFloat(monto)+"</td>";
                    nuevaFila+="<td class='haber'></td>";
                    saldodebe = parseFloat(saldodebe) + parseFloat(monto) ;
                      
                    }else if(movimiento=="H"){
                      nuevaFila+="<td class='debe'></td>";  
                      nuevaFila +="<td class='haber'>"+monto+"</td>";
                      saldohaber = parseFloat(saldohaber) + parseFloat(monto);
                      }
                      nuevaFila+="<td><a href='#'onclick='modificar("+transaccion,ii+")'><span class='glyphicon glyphicon-pencil' ></a></td>";
            }}
            // Añadimos una columna con el numero total de columnas.
            // Añadimos uno al total, ya que cuando cargamos los valores para la
            // columna, todavia no esta añadida
            nuevaFila+="</tr>";
             var final="<td></td><td></td> <td></td>"
            $("#tpartida").append(nuevaFila);
           $("#monto").val("");
         $("#descripcion").val("");
           $("#transaccion").val("");
           
            var final="";
           if(saldodebe>saldohaber){
               
               total=saldodebe-saldohaber;
                final="<tr><td></td><td>Saldo</td><td>"+total.toFixed(2)+"</td> <td ></td></tr>";
           }
           if(saldodebe<saldohaber){
               total=saldohaber-saldodebe;
               final="<tr><td></td><td>Saldo</td><td ></td><td '>"+total.toFixed(2)+"</td></tr>";
           }
         
          $("#saldo").html(final);
        
                    }
                }
                 
              
                xhttp.open("POST", "modificarpartida.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("idcrearpartida="+idcrearpartida+"&descripcion="+descripcion+"&debe="+debe+"&haber="+haber+"&movimiento="+movimiento);
                 $("#des").val("");
                 $("#monto").val("");
                  $("#Debito").attr('checked', false);
                  $("#Credito").attr('checked', false);
               
    }
         });    
           
        
});
function llenarcombcuenta(){
       var origen=$("#origen").val().trim();
       var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta2").innerHTML = xhttp.responseText;
               var idcuenta=$("#prueba").val();
               var codigo=$("#codigocuenta").val();
               var nombre=$("#nombrecuenta").val();
              
                 var lid_tipo= idcuenta.substring(1, idcuenta.length-1);
           
                 var lcodigoarea= codigo.substring(1, codigo.length-1);
                
                 var lnombretipo= nombre.substring(1, nombre.length-1);
                
                 
                 var arrayid_tipo=lid_tipo.split(",");
                 var arraycodigoarea=lcodigoarea.split(",");               
                 var arraynombretip=lnombretipo.split(",");
              
                 var cadena="<option value=''>Seleccione El Area de la Cuenta</option>";
                 for (var i = 0; i < arraycodigoarea.length; i++) {
                 
               cadena+=" <option value='"+arrayid_tipo[i]+"'>"+arraycodigoarea[i]+"  "+arraynombretip[i]+"</option>";
            }
           
            
            $("#cuenta").html(cadena);
                         }
        
        }
       
      xhttp.open("POST", "llenarcombocuentat.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origen="+origen);  
    
    
}
function llenarcombosubcuenta(){
 var sociedad=$("#sociedad").val().trim();
 var cuenta=$("#cuenta").val().trim();
   
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta2").innerHTML = xhttp.responseText;
               var idcuenta=$("#subprueba").val();
               var codigo=$("#subcodigocuenta").val();
               var nombre=$("#subnombrecuenta").val();
              
                 var lid_tipo= idcuenta.substring(1, idcuenta.length-1);
           
                 var lcodigoarea= codigo.substring(1, codigo.length-1);
                
                 var lnombretipo= nombre.substring(1, nombre.length-1);
                
                 
                 var arrayid_tipo=lid_tipo.split(",");
                 var arraycodigoarea=lcodigoarea.split(",");               
                 var arraynombretip=lnombretipo.split(",");
              
                 var cadena="<option value=''>Seleccione El Area de la Cuenta</option>";
                 for (var i = 0; i < arraycodigoarea.length; i++) {
                 
               cadena+=" <option value='"+arrayid_tipo[i]+"'>"+arraycodigoarea[i]+"  "+arraynombretip[i]+"</option>";
            }
           
            
            $("#subcuenta").html(cadena);
                         }
        
        }
        
      xhttp.open("POST", "llenarsubcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("cuenta="+cuenta+"&sociedad="+sociedad);   
 
}
 function modificar(id,fila){
   var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                /* $("#des").val("");
                 $("#monto").value("");
                  $("#Debito").attr('checked', false);
                  $("#Credito").attr('checked', false);*/
                document.getElementById("alerta2").innerHTML = xhttp.responseText;
                document.getElementById('btnt').style.display = 'none';
                document.getElementById('btnmodificar').style.display = 'block';
               var idoperacion=$("#dato1").val();
               var descripcion=$("#dato2").val();
               var d=$("#dato3").val();
               var h=$("#dato4").val();
               var tm=$("#dato5").val();
               $("#fila" + fila).remove();
                 var transaccion= idoperacion.substring(1, idoperacion.length-1);
                 var descri= descripcion.substring(1, descripcion.length-1);
                 var debe= d.substring(1, d.length-1);
                 console.log(debe);var haber= h.substring(1, h.length-1);
                 var tipo= tm.substring(1, tm.length-1);
                tem=transaccion;
                $("#des").val(descri);
               console.log(tipo);
                  if(tipo==="D"){
                      
                      document.getElementById("Debito").checked=true;
                      total=total-parseFloat(debe);
                      console.log(parseFloat(debe));
                      $("#monto").val(debe);
                    
                  }else if(tipo==="H"){
                      document.getElementById("Credito").checked=true;
                                           
                      total=total-parseFloat(haber);
                      $("#monto").val(parseFloat(haber));
                     
                  }
                  
                }
        
        };
       
      xhttp.open("POST", "obteneroperacion.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("transaccion="+id);    
       
 }




