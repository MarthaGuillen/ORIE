function validarcuentaBalance(){
     var e=0;
    var mjs="";
    var cuenta= $("#cuenta").val().trim();
    var sociedad=$("#sociedad").val().trim();
    var codigosub=$("#codigosub").val().trim();
    var nombre=$("#nombresub").val().trim();
    var observacion=$("#observacion").val().trim();
    var depuracion=$("#depuracion").val().trim();
    alert("nnn");
    if(cuenta==""){
     
         $("#cuenta").css("border", "5px solid red")
    }
    if(sociedad==""){
      
        $("#sociedad").css("border", "5px solid red")
    }
    if(codigosub==""){
         
         $("#codigosub").css("border", "5px solid red")
    }
    if(nombre==""){
      
         $("#nombresub").css("border", "5px solid red")
    
    if (e==1) {
        $('#myModal').on('shown.bs.modal', function () {
  $('#cuerpo').val( mjs);
})
    }else{
    
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
                document.getElementById("alerta").innerHTML = xhttp.responseText;
               
                         }
        
        }
       console.log(cuenta+"  "+sociedad+" "+" "+codigosub+" "+nombre)
      xhttp.open("POST", "agregarsubcuenta.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("cuenta="+cuenta+"&sociedad="+sociedad+"&codigosub="+codigosub+"&nombre="+nombre+"&observacion="+observacion
                +"&depuracion="+depuracion);   
 }
    
    

}}

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
 var origen=$("#origen").val().trim();
     
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
              
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
