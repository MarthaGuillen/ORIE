function validarcuentaBalance(){
     var e=0;
    var mjs="";
    var origen= $("#origen").val().trim();
    var cuenta=$("#cuenta").val().trim();
    var sociedad=$("#sociedad").val().trim();
    var codigosub=$("#codigocuenta").val().trim();
    var nombre=$("#nombre").val().trim();
    var descripcion=$("#descripcion").val().trim();
    var observacion=$("#observacion").val().trim();
    var depuracion=$("#depuracion").val().trim();
    var estado=$("#idestadoV").val();
    if(origen==""){
         e = 1;
        mjs += "<h5>Seleccione el origen de la Cuenta.</h5>"
    }
    if(cuenta==""){
         e = 1;
        mjs += "<h5>Seleccione la Cuenta.</h5>"
    }
    if(sociedad==""){
         e = 1;
        mjs += "<h5>Seleccione la sociedad que pertenece.</h5>"
    }
    if(codigosub==""){
         e = 1;
        mjs += "<h5>error en el codigo.</h5>"
    }
   
    if(e==1){
      $("#alerta").css("display" ,"block" );
      $("#mensaje").html(mjs);
     $("#t").attr('disabled', true);
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
               
                         }
        
        }
       
      xhttp.open("POST", "agregarsubcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origen=" + origen + "&cuenta="+cuenta+"&sociedad="+sociedad+
                "&codigosub="+codigosub+"&nombre="+nombre+"&descripcion="+descripcion+"&observacion="+observacion
                +"&depuracion="+depuracion+"&estado="+estado);   
 }
    
    
}


function validarcuentaBalancemayor(){
     var e=0;
    var mjs="";
    var origenmayor= $("#origenmayor").val().trim();
    var codigomayor=$("#codigomayor").val().trim();
    var nombremayor=$("#nombremayor").val().trim();
    var obsevacionmayor=$("#obsevacionmayor").val().trim();
    
    if(origenmayor==""){
         e = 1;
        mjs += "<h5>Seleccione el origen de la Cuenta.</h5>"
    }
    if(codigomayor==""){
         e = 1;
        mjs += "<h5>Codigo Generado.</h5>"
    }
    if(nombremayor==""){
         e = 1;
        mjs += "<h5>Ingrese el Nombre.</h5>"
    }
    
   
    if(e==1){
      $("#alerta").css("display" ,"block" );
      $("#mensaje").html(mjs);
     $("#t").attr('disabled', true);
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
               
                         }
        
        }
       
      xhttp.open("POST", "agregarcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origenmayor=" + origenmayor + "&codigomayor="+codigomayor+"&nombremayor="+nombremayor+
                "&obsevacionmayor="+obsevacionmayor);   
 }
    
    
}
function validarcuentaBalanceorigen(){
     var e=0;
    var mjs="";
    var codigoorigen= $("#codigoorigen").val().trim();
    var nombreorigen=$("#nombreorigen").val().trim();
    var observacionorigen=$("#observacionorigen").val().trim();
        
    if(codigoorigen==""){
         e = 1;
        mjs += "<h5>Seleccione el origen de la Cuenta.</h5>"
    }
    if(nombreorigen==""){
         e = 1;
        mjs += "<h5>Codigo Generado.</h5>"
    }
    if(observacionorigen==""){
         e = 1;
        mjs += "<h5>Ingrese el Nombre.</h5>"
    }
    
   
    if(e==1){
      $("#alerta").css("display" ,"block" );
      $("#mensaje").html(mjs);
     $("#t").attr('disabled', true);
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
                alert(xhttp.responseText);
                         }
        
        }
       
      xhttp.open("POST", "agregarorigen.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("codigoorigen=" + codigoorigen + "&nombreorigen="+nombreorigen+
                "&observacionorigen="+observacionorigen);   
 }
    
    
}

function llenarcombobox(){
 var origen=$("#origenmayor").val();
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
               var id=$("#id").val();
               var codigo=$("#codigocuenta").val();
               var nombre=$("#nombrecuenta").val()
                var cadena="<option value=''>Seleccione El Area de la Cuenta</option>";
                 for (var i = 0; i < id.length; i++) {                
               cadena+=" <option value='"+id[i]+"'>"+codigo[i]+" "+nombre[i]+"</option>";
            }
           
            $("#cuenta").html(cadena);
                         }
        
        }
       
      xhttp.open("POST", "xddxfdg.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("origen="+origen);   
 
}