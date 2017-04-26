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
    
    

       /*  $('#tablecuentas').DataTable({
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
                
            });*/
             
        
    // Order by the grouping
    var table = $('#tablecuentas').DataTable({
        "columnDefs": [
            { "visible": false, "targets": 2 }
        ],
        "order": [[ 2, 'asc' ]],
        "displayLength": 25,
        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(2, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="5">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        },
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
 
    // Order by the grouping
    $('#tablecuentas tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === 2 && currentOrder[1] === 'asc' ) {
            table.order( [ 2, 'desc' ] ).draw();
        }
        else {
            table.order( [ 2, 'asc' ] ).draw();
        }
    } );
  
        $("#origen").select2({placeholder: "Seleccione Origen",
                 allowClear: true
        });
        
        $("#origen2").select2( {placeholder: "Seleccione Origen",
                 allowClear: true
        });
        
       
        
        $("#cuenta").select2({placeholder: "Seleccione Cuenta",
                 allowClear: true
        });
        $("#grupo").select2({placeholder: "Seleccione Grupo corriente o no corriente",
                 allowClear: true
        });
        $("#sociedad").select2({placeholder: "Seleccione Sociedad",
                 allowClear: true
        });
      $("#codigoorigen").removeClass("camposvacios");
      $("#nombreorigen").removeClass("camposvacios");
       
       $("#agregarsubcuenta").click(function(){
          var e=0;
    var mjs="";
    var origen= $("#origen").val().trim();
    var cuenta= $("#cuenta").val().trim();
    var sociedad=$("#sociedad").val().trim();
 
    var nombre=$("#nombresub").val().trim();
    var observacion=$("#observacion").val().trim();
    var depuracion=$("#depuracion").val().trim();
   
    
    if(origen==""){
      e=1;
         
         document.getElementById('origenval').style.display = 'block'; 
    }
    if(cuenta==""){
      e=1;
         
         document.getElementById('cuentaval').style.display = 'block'; 
    }
    if(sociedad==""){
       e=1;
        document.getElementById('sociedadval').style.display = 'block'; 
    }
  /*  if(codigosub==""){
          e=1;
         $("#codigosub").addClass("camposvacios");
         document.getElementById('codigosubval').style.display = 'block'; 
    }*/
    if(nombre==""){
      e=1;
         $("#nombresub").addClass("camposvacios");
          document.getElementById('nombresubval').style.display = 'block'; 
     }
    
    if (e==1) {
      
       // $("#resp2").html("<h1>Ingrese los datos</h1>");
    }else{
    
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
                       var resp= $("#resp2").val();
                       alert(resp);
                       var re =resp;
                       swal(
                                
                                'Codigo de Sub-Cuenta Es:    '+
                                re.toString()  //preguntar      
                            ) ; 
                         document.getElementById('origenval').style.display = 'none'; 
                         document.getElementById('cuentaval').style.display = 'none'; 
                         document.getElementById('sociedadval').style.display = 'none';
                       /*  $("#codigosub").removeClass("camposvacios");
                         document.getElementById('codigosubval').style.display = 'none'; */
                         $("#nombresub").removeClass("camposvacios");
                         document.getElementById('nombresubval').style.display = 'none'; 
                         $("#origen").select2("val", "");
                         $("#cuenta").select2("val", "");
                         $("#sociedad").select2("val", "");
                        // $("#codigosub").val("");
                         $("#nombresub").val("");
                        $("#observacion").val("");
                        $("#depuracion").val("");
                         }
        
        }
            alert(cuenta+sociedad+nombre+observacion);
      xhttp.open("POST", "agregarSubcuenta.gdc", true);//uytyutyutyu
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("cuenta="+cuenta+"&sociedad="+sociedad+"&nombre="+nombre+"&observacion="+observacion
                +"&depuracion="+depuracion);   
 }
    
     
       });
       $("#agregarcuentamayor").click(function () {
           var e=0;
    var mjs="";
    var origenmayor= $("#origen2").val().trim();
    var codigomayor=$("#codigomayor").val().trim();
    var nombremayor=$("#nombremayor").val().trim();
    var obsevacionmayor=$("#obsevacionmayor").val().trim();
    var grupo=$("#grupo").val();
    if(origenmayor==""){
         e = 1;
       document.getElementById('origen2val').style.display = 'block'; 
    }
    if(codigomayor==""){
         e = 1;
      $("#codigomayor").addClass("camposvacios");
       document.getElementById('codigomayorval').style.display = 'block'; 
    }
    if(nombremayor==""){
         e = 1;
        $("#nombremayor").addClass("camposvacios");
        document.getElementById('nombremayorval').style.display = 'block'; 
    }
     if(origenmayor==1 || origenmayor==2){
               if(grupo==""){
                   e = 1;
                  document.getElementById('grupo2val').style.display = 'block';   
               }
                   
             
          }
   
    if(e==1){
      
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
                var resp= $("#resp2").val();
                console.log(resp);
                document.getElementById('pertenece').style.display = 'none'; 
                       $("#grupo").select2("val", "");
                       document.getElementById('grupo2val').style.display = 'none';
                       if(resp=='S'){ swal(
                                'Exito!!!...',
                                'Cuenta agregada .'
                            )}else{swal(
                                'Fallo!!!...',
                                'Cuenta  No agregada .'
                            )} ;
                       $("#origen2").select2("val", "");
                       document.getElementById('origen2val').style.display = 'none'; 
                       $("#codigomayor").removeClass("camposvacios");
                       $("#codigomayor").val("");
                       document.getElementById('codigomayorval').style.display = 'none'; 
                        $("#nombremayor").removeClass("camposvacios");
                        $("#nombremayor").val("");
                       document.getElementById('nombremayorval').style.display = 'none'; 
                         }
                         
        
        }
       
      xhttp.open("POST", "agregarcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origenmayor=" + origenmayor+"&grupo="+grupo + "&codigomayor="+codigomayor+"&nombremayor="+nombremayor+
                "&obsevacionmayor="+obsevacionmayor);   
 }
           
       }); 
         
       $("#agregar_origen").click(function(){
             
             var e=0;
    var mjs="";
    var codigoorigen= $("#codigoorigen").val().trim();
    var nombreorigen=$("#nombreorigen").val().trim();
    var observacionorigen=$("#observacionorigen").val().trim();
        
    if(codigoorigen===""){
         e = 1;
         document.getElementById('codigoorigenval').style.display = 'block'; 
       $("#codigoorigen").addClass("camposvacios");
    }
    if(nombreorigen===""){
         e = 1;
         document.getElementById('nombreorigenval').style.display = 'block'; 
        $("#nombreorigen").addClass("camposvacios");
    }
   
    
   
    if(e===1){
    
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
                 var resp= $("#resp").val();
                      swal(
                                'Exito!!!...',
                                'Cuenta Origen agregada .'
                            ) 
                    
                      $("#codigoorigen").removeClass("camposvacios");
                      $("#codigoorigen").val("");
                      $("#nombreorigen").removeClass("camposvacios");
                      $("#nombreorigen").val("");
                      $("#observacionorigen").val("");
                      
                         }
        
        }
       
      xhttp.open("POST", "agregarorigen.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("codigoorigen=" + codigoorigen + "&nombreorigen="+nombreorigen+
                "&observacionorigen="+observacionorigen);   
 }
    
         });
         $("#btnverpartidas").click(function(){});
         $("#modificar").click(function(){});    
      $("#origen2").change(function (){
          var origen2=$("#origen2").val();
          if(origen2==1 || origen2==2){
               $("#grupo").select2("val", "");
              document.getElementById('pertenece').style.display = 'block'; 
          }else{
               document.getElementById('pertenece').style.display = 'none'; 
          }
      });
        
});
function limpiar(){
                         
                       document.getElementById('origen2val').style.display = 'none'; 
                       $("#codigomayor").removeClass("camposvacios");
                       $("#codigomayor").val("");
                       document.getElementById('codigomayorval').style.display = 'none'; 
                        $("#nombremayor").removeClass("camposvacios");
                        $("#nombremayor").val("");
                       document.getElementById('nombremayorval').style.display = 'none'; 
                      $("#codigoorigen").addClass("camposvacios");
                      $("#codigoorigen").val("");
                      $("#nombreorigen").addClass("camposvacios");
                      $("#nombreorigen").val("");
                      $("#observacionorigen").val("");
                      $("#origen2").select2("val", "");
                       document.getElementById('origenval').style.display = 'none'; 
                         document.getElementById('cuentaval').style.display = 'none'; 
                         document.getElementById('sociedadval').style.display = 'none';
                        /* $("#codigosub").removeClass("camposvacios");
                         document.getElementById('codigosubval').style.display = 'none'; */
                         $("#nombresub").removeClass("camposvacios");
                         document.getElementById('nombresubval').style.display = 'none'; 
                         $("#origen").attr("selected",false);
                          $('#origen').select2("val", "");
                         $("#cuenta").select2("val", "");
                         $("#sociedad").select2("val", "");
                         //$("#codigosub").val("");
                         $("#nombresub").val("");
                        $("#observacion").val("");
                        $("#depuracion").val("");
    
}


function activarsubcuenta(){
    limpiar();
    document.getElementById('subcuentamayor').style.display = 'block';
    document.getElementById('cuentamayor').style.display = 'none';
    document.getElementById('cuentaorigen').style.display = 'none';  
    document.getElementById('catalagoscrea').style.display = 'none';
} 
function activarscuenta(){
    limpiar();
     document.getElementById('subcuentamayor').style.display ='none' ;
    document.getElementById('cuentamayor').style.display = 'block';
    document.getElementById('cuentaorigen').style.display = 'none';
     document.getElementById('catalagoscrea').style.display = 'none';
} 
function activarorigen(){
    limpiar();
     document.getElementById('subcuentamayor').style.display ='none' ;
    document.getElementById('cuentamayor').style.display ='none';
    document.getElementById('cuentaorigen').style.display =  'block';
     document.getElementById('catalagoscrea').style.display = 'none';
} 





function llenarcombobox(){
 var origen=$("#origen").val().trim();
     
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
             limpiarcombo();
                document.getElementById("alerta").innerHTML = xhttp.responseText;
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
      
      xhttp.open("POST", "combobalance.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origen="+origen);   
 
}
function crearcatalagos(sociedad ){
 
     limpiar();
     document.getElementById('subcuentamayor').style.display ='none' ;
    document.getElementById('cuentamayor').style.display ='none';
    document.getElementById('cuentaorigen').style.display =  'none';
     document.getElementById('catalagoscrea').style.display = 'block';
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("catalagoscrea").innerHTML = xhttp.responseText;
               // Order by the grouping
    var table = $('#tablecuentas').DataTable({
        "columnDefs": [
            { "visible": false, "targets": 2 }
        ],
        "order": [[ 2, 'asc' ]],
        "displayLength": 25,
        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(2, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="5">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        },
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
 
    // Order by the grouping
    $('#tablecuentas tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === 2 && currentOrder[1] === 'asc' ) {
            table.order( [ 2, 'desc' ] ).draw();
        }
        else {
            table.order( [ 2, 'asc' ] ).draw();
        }
    } );
            }
        
        }
       
      xhttp.open("POST", "crearcatalalagos.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("idSociedad="+sociedad);   
 
}
function limpiarcombo(){
 
    $("#cuenta").select2("val", "");
    $("#sociedad").select2("val", "");
   
}