var saldodebe=0;
var saldohaber=0;
var total;
var idcrearpartida;
var fecha2;
var i;
var ii=0;
var tem;
var  ip=0;
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
        $("#cuenta2").select2(
        {placeholder: "Seleccione la Cuenta",
                 allowClear: true
        });
        
        $("#origen2").select2(
        {placeholder: "Seleccione Origen",
                 allowClear: true
        });
        $("#sociedad2").select2(
        {placeholder: "Seleccione Sociedad",
                 allowClear: true
        });
        $("#subcuenta2").select2(
        {placeholder: "Seleccione Sub-cuenta",
                 allowClear: true
        });
       
       
       $("#add").click(function(){
           
            var monto=$("#monto").val();
          var descripcion=$("#des").val();
           var origen =$("#origen2").val();
           var sociedad =$("#sociedad2").val();
           var cuenta =$("#cuenta2").val();
           var subcuenta =$("#subcuenta2").val();
           var movimiento=$('input:radio[name=movi]:checked').val();
           var debe=0;
           var haber=0;
           var e=0;
           var transaccion;
           
           if(sociedad==""){
               e=1;
              
              document.getElementById('sociedadval2').style.display = 'block'; 
           }
           if(origen==""){
               e=1;
              
              document.getElementById('origenval2').style.display = 'block'; 
           }
          
           
           
           if(subcuenta==""){
               e=1;
              
              document.getElementById('subcuentaval2').style.display = 'block'; 
           }
            if(cuenta==""){
               e=1;
              
              document.getElementById('cuentaval2').style.display = 'block'; 
           }
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
           document.getElementById('sociedadval2').style.display = 'none'; 
           document.getElementById('origenval2').style.display = 'none'; 
            document.getElementById('cuentaval2').style.display = 'none'; 
             document.getElementById('subcuentaval2').style.display = 'none';
         
            var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("alerta3").innerHTML = xhttp.responseText;
                        var id =$("#cuentar").val();
                       
                        transaccion=  id;
                        alert(transaccion);
              creartabla(transaccion,descripcion,monto,movimiento) ;   
        
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
         var subcuenta =$("#subcuenta").val();
        var sociedad= $("#sociedad").val();
        var origen= $("#origen").val();
        fecha2=fecha;
        if(origen==""){
               e=1;
              
              document.getElementById('origenval').style.display = 'block'; 
           }
          
           
           
           if(subcuenta==""){
               e=1;
              
              document.getElementById('subcuentaval').style.display = 'block'; 
           }
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
         if(subcuenta==""){
             e=1;
             document.getElementById('cuentaval').style.display = 'block';
             
         }
       if(e==0){
              document.getElementById('sociedadval').style.display = 'none';
            document.getElementById('fechaval').style.display = 'none';
           document.getElementById('cuentaval').style.display = 'none';
           document.getElementById('nombreval').style.display = 'none';
           document.getElementById('btnagregar').style.display = 'none';
           document.getElementById('origenval').style.display = 'none';
           document.getElementById('subcuentaval').style.display = 'none';
         
         $("#partida").css("display", "block");  
        
           var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("alerta2").innerHTML = xhttp.responseText;
                        var id =$("#idt").val();
                        idcrearpartida= id.substring(1, id.length-1);
                        document.getElementById('sociedadval').style.disabled = true;
         
                        
                         
                    }
                }

                xhttp.open("POST", "crearpartida.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("subcuenta="+subcuenta+"&nombret="+nombret+"&fecha="+fecha+"&sociedad="+sociedad);
               document.getElementById('btnt').style.display = 'block';
         
         
       }
       
       }); 
         
         $("#btncrearpartidas").click(function(){
              document.getElementById('crearpartidas').style.display = 'block';
              document.getElementById('btnagregar').style.display = 'block';
               document.getElementById('partida').style.display = 'none';
               document.getElementById('verpartida').style.display = 'none';
            
                $("#nombret").val("");
         $("#fecha").val("");
    
               
         });
         $("#btnverpartidas").click(function(){
             var obtener=" ver";
              document.getElementById('crearpartidas').style.display = 'none';
               document.getElementById('partida').style.display = 'none';
                document.getElementById('verpartida').style.display = 'block';
           
         });
         $("#modificar").click(function(){
              document.getElementById('btnt').style.display = 'block'; 
                document.getElementById('btnmodificar').style.display = 'none';
          var monto=$("#monto").val();   
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
                         document.getElementById("alerta3").innerHTML = xhttp.responseText;
                        var id =$("#cuentar").val();
                        var res =id.substring(1, id.length-1);
                      
                            transaccion=tem;
                            tem=0;
                             creartabla(transaccion,descripcion,monto,movimiento) ;   
          
                        
                        
                   
                    }
                }
                 
              
                xhttp.open("POST", "modificarpartida.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("transaccion="+tem+"&descripcion="+descripcion+"&debe="+debe+"&haber="+haber+"&movimiento="+movimiento);
                console.log("Ingresando al ajax");
               
    }
         });    
           
        
});



function llenarcombcuenta2(){
       var origen=$("#origen2").val().trim();
       var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              limpiarcombo2();
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
           
            
            $("#cuenta2").html(cadena);
                         }
        
        }
       
      xhttp.open("POST", "llenarcombocuentat.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origen="+origen);  
    
    
}
function llenarcombosubcuenta2(){
 var sociedad=$("#sociedad2").val().trim();
 var cuenta=$("#cuenta2").val().trim();
   
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
           
            
            $("#subcuenta2").html(cadena);
                         }
        
        }
        
      xhttp.open("POST", "llenarsubcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("cuenta="+cuenta+"&sociedad="+sociedad);   
 
}
function llenarcombcuenta(){
    limpiarcombo();
       var origen=$("#origen").val().trim();
       var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              limpiarcombo();
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
 function crearcontrapartida(id){
   var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("alerta2").innerHTML = xhttp.responseText;
              
                          swal(
                                'Exito!!!...',
                                'Cuenta agregada .'
                            );
                    mostrarpartidas();
                            
        
        };
    }
       
      xhttp.open("POST", "Crearcontrapartida.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("transaccion="+id);    
       
 }

function creartabla(t,d,monto,movi){
    ii=ii+1;
                   // Obtenemos el numero de filas (td) que tiene la primera columna
            // (tr) del id "tabla"
            var tds=$("#tpartida tr:first td").length;
            // Obtenemos el total de columnas (tr) del id "tabla"
            var trs=$("#tabla tr").length;
            var nuevaFila="<tr id='fila"+ii+"'>";
                   
            if(trs==0){
                
                nuevaFila+="<td>"+t+"</td>";
                nuevaFila+="<td>"+d+"</td>";
                 if(movi=="D"){
                    nuevaFila +="<td>"+monto+"</td>";
                    nuevaFila+="<td></td>";
                     saldodebe = parseFloat(saldodebe) + parseFloat(monto) ;
                    }else if(movi=="H"){
                      nuevaFila+="<td></td>";  
                      nuevaFila +="<td>"+monto+"</td>";
                      saldohaber = parseFloat(saldohaber) + parseFloat(monto);
                            }
                       
                       
    
                
            }
            else{
            for(var i=0;i<tds;i++){
                // añadimos las columnas
               
               
                nuevaFila+="<td>"+t+"</td>";
                nuevaFila+="<td>"+d+"</td>";
                 if(movi=="D"){
                    nuevaFila +="<td >"+monto.toFixed(2)+"</td>";
                    nuevaFila+="<td ></td>";
                    saldodebe = parseFloat(saldodebe) + parseFloat(monto) ;
                      
                    }else if(movi=="H"){
                      nuevaFila+="<td ></td>";  
                      nuevaFila +="<td >"+monto.toFixed(2)+"</td>";
                      saldohaber = parseFloat(saldohaber) + parseFloat(monto);
                      }
                     
                     
            }}
            // Añadimos una columna con el numero total de columnas.
            // Añadimos uno al total, ya que cuando cargamos los valores para la
            // columna, todavia no esta añadida
            nuevaFila+="</tr>";
            
            $("#tpartida").append(nuevaFila);
           $("#monto").val("");
         $("#descripcion").val("");
           $("#transaccion").val("");
           
            var final="";
           if(saldodebe>saldohaber){
               
               total=saldodebe-saldohaber;
                final="<tr><td></td><td>Saldo</td><td style='color: green;' >"+total.toFixed(2)+"</td></tr>";
           }
           if(saldodebe<saldohaber){
               total=saldohaber-saldodebe;
               final="<tr><td></td><td>Saldo</td><td ></td><td style='color: red;' >"+total.toFixed(2)+"</td></tr>";
           }if(saldohaber==saldodebe)
           {total=saldohaber-saldodebe;
               final="<tr><td></td><td>Saldo</td><td style='color: green;' >"+total.toFixed(2)+"</td><td style='color: red;' >"+total.toFixed(2)+"</td></tr>";}
               
         
          $("#saldo").html(final);
                  $("#des").val("");
                 $("#monto").val("");
                  $("#Debito").attr('checked', false);
                  $("#Credito").attr('checked', false);
    
}
/*function cambiarestado(r){
    var estadooperacion=$("#estado"+r).text();
    alert(estadooperacion);
    alert(r);
    if(estadooperacion!="Cerrado"){
    var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("alerta2").innerHTML = xhttp.responseText;
                        var idrt =$("#dato1").val();
                       
                        
                            $("#estado"+r).text("Cerrado");
                            $("#estado"+r).css("color","red");
                            $("#crearcomp"+r).css("display", "none");
                        
                       
                        
                         
                    }
                }

                xhttp.open("POST", "modificarestadopartida.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("transaccion="+r);
            }else(swal("Operacion Cerrada"))
            
}*/
function llenarcombosub(){
 var sociedad=$("#idsociedad").val().trim();
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
function llenarcombosub2(){
 var sociedad=$("#idsociedad2").val().trim();
 var cuenta=$("#cuenta2").val().trim();
   
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
           
            
            $("#subcuenta2").html(cadena);
                         }
        
        }
        
      xhttp.open("POST", "llenarsubcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("cuenta="+cuenta+"&sociedad="+sociedad);   
 
}

/*function librodiario(){
 var fecha=$("#fecha").val().trim();

   
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta2").innerHTML = xhttp.responseText;
               var idpartida=$("#dato1").val();
               var fecha=$("#dato2").val();
               var nombrepartida=$("#dato3").val();
               var nombrecuenta=$("#dato4").val();
               var codigocuenta=$("#dato5").val();
               var transaccion=$("#dato6").val();
               var descripcion=$("#dato7").val();
               var debe=$("#dato8").val();
               var haber=$("#dato9").val();
               var usuario=$("#dato10").val();
               
              var l_idpartida = idpartida.substring(1,idpartida.length-1);
              var l_fecha = fecha.substring(1,fecha.length-1);
              var l_nombrepartida = nombrepartida.substring(1,nombrepartida.length-1);
              var l_nombrecuenta = nombrecuenta.substring(1,nombrecuenta.length-1);
              var l_codigocuenta = codigocuenta.substring(1,codigocuenta.length-1);
             var l_transaccion = transaccion.substring( 1 ,transaccion.length-1);
              var l_descripcion = descripcion.substring(1,descripcion.length-1);
              var l_debe = debe.substring(1,debe.length-1);
              var l_haber = haber.substring(1,haber.length-1);
              var l_usuario = usuario.substring(1,usuario.length-1);
              var array_idpartida = l_idpartida.split(",");
              var array_fecha=l_fecha.split(",");
              var array_nombrepartida=l_nombrepartida.split(",");
              var array_nombrecuenta=l_nombrecuenta.split(",");
              var array_codigocuenta=l_codigocuenta.split(",");
              var array_transaccion=l_transaccion.split(",");
              var array_descripcion=l_descripcion.split(",");
              var array_debe=l_debe.split(",");
              var array_haber=l_haber.split(",");
              var array_usuario=l_usuario.split(",");
              var temp3 ="uu";
              var fila="";
              for (var i = 0; i < array_idpartida.length-1; i++) {
                  
                    if (array_idpartida[i]!==temp3) {
                        console.log(temp3+"  "+array_idpartida[i]);
                         fila+="<tr>";
                    temp3=array_idpartida[i];
                    fila+="<td>"+array_nombrepartida[i]+"</td>";
                    
                    fila+="<tr>";
                }
                 
            }
              
              
              
            $("#tablalibro").append(fila);
            
           
                         }
        
        }
        
      xhttp.open("POST", "librodiarioobtener.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("fecha="+fecha);   
 
}*/

function mostrarpartidas(){
    var sociedad=$("#sociedadp").val();

   var partidas;
   var txt="";
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              document.getElementById("infopartida").innerHTML = xhttp.responseText;
               
             
           $('#infodatos').DataTable({
      
        "language": {
                    "lengthMenu": "Mostrar _MENU_ registros por página",
                    "zeroRecords": "No se encuentran registros disponibles.",
                    "info": "Mostrando página _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay registros que coincidan con su busqueda.",
                    "infoFiltered": "(Filtrado de _MAX_ registros.)",
                    "decimal": ".",
                    "thousands": ",",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando..",
                    "search": "Buscar",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    
                    }
                    
                }
    } );
            
            }
        
        }
        
      xhttp.open("POST", "partidast.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("sociedad="+sociedad);
    
}

function limpiarcombo(){
 
    $("#cuenta").select2("val", "");
    $("#sociedad").select2("val", "");
    $("#subcuenta").select2("val", "");
}
function limpiarcombo2(){
   
    $("#cuenta2").select2("val", "");
    $("#sociedad2").select2("val", "");
    $("#subcuenta2").select2("val", "");
}