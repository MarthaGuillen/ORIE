function cuentabanco(){
    
    var elemento = document.getElementById("contentcuenta");
 elemento.style.display = 'none';
 var elemento = document.getElementById("contentbanco");
 elemento.style.display = 'block';
}
function cuentanormal(){
   var elemento = document.getElementById("contentbanco");
 elemento.style.display = 'none';
 var elemento = document.getElementById("contentcuenta");
 elemento.style.display = 'block';
}
function validarcentrocostodcia(){
    var e=0;
    var mjs="";
    
    var area= $("#area").val().trim();
    var departamento=$("#departamento").val().trim();
    var codigo=$("#codigo").val().trim();
    var nombre=$("#nombre").val().trim();
    if(area==""){
         e = 1;
        mjs += "<h5>Seleccione el Area de la Cuenta.</h5>"
    }
    if(departamento==""){
         e = 1;
        mjs += "<h5>Seleccione el Departamento de la Cuenta.</h5>"
    }
    if(codigo==""){
         e = 1;
        mjs += "<h5>Error codigo.</h5>"
    }
    if(nombre==""){
         e = 1;
        mjs += "<h5>Ingrese El nombre del codigo .</h5>"
    }
    if(e==1){
      $("#alerta").css("display" ,"block" );
      $("#mensaje").html(mjs);
     // $("#t").attr('disabled', true);
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                $("#alerta").css("display" ,"block" );
                document.getElementById("alerta").innerHTML = xhttp.responseText;
                alert(xhttp.responseText);
                         }
        
        }
       
      xhttp.open("POST", "CuentaCentroCostoDCIA.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("area=" + area + "&departamento=" + departamento + "&codigo="+codigo+"&nombre= "+nombre);   
     
  

}

}
function validarcentrocosto(){
    var e=0;
    var mjs="";
    
    var area= $("#area").val().trim();
    var departamento=$("#departamento").val().trim();
    var codigo=$("#codigo").val().trim();
    var nombre=$("#nombre").val().trim();
    if(area==""){
         e = 1;
        mjs += "<h5>Seleccione el Area de la Cuenta.</h5>"
    }
    if(departamento==""){
         e = 1;
        mjs += "<h5>Seleccione el Departamento de la Cuenta.</h5>"
    }
    if(codigo==""){
         e = 1;
        mjs += "<h5>Error codigo.</h5>"
    }
    if(nombre==""){
         e = 1;
        mjs += "<h5>Ingrese El nombre del codigo .</h5>"
    }
    if(e==1){
      $("#alerta").css("display" ,"block" );
      $("#mensaje").html(mjs);
     $("#t").attr('disabled', true);
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                $("#alerta").css("display" ,"block" );
                document.getElementById("alerta").innerHTML = xhttp.responseText;
                alert(xhttp.responseText);
                         }
        
        }
       
      xhttp.open("POST", "CuentaCentroCosto.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("area=" + area + "&departamento=" + departamento + "&codigo="+codigo+"&nombre= "+nombre);   
     
  

}

}

function validarcuentaresultado(){
    var e=0;
    var mjs="";
    var areacr= $("#areacr").val().trim();
    var tipocr=$("#tipocr").val().trim();
    var codigo=$("#codigo").val().trim();
    var nombre=$("#nombre").val().trim();
    if(areacr==""){
         e = 1;
        mjs += "<h5>Seleccione el Area de la Cuenta.</h5>"
    }
    if(tipocr==""){
         e = 1;
        mjs += "<h5>Seleccione el Departamento de la Cuenta.</h5>"
    }
    if(codigo==""){
         e = 1;
        mjs += "<h5>Error codigo.</h5>"
    }
    if(nombre==""){
         e = 1;
        mjs += "<h5>Ingrese El nombre del codigo .</h5>"
    }
    if(e==1){
      $("#alerta").css("display" ,"block" );
      $("#mensaje").html(mjs);
     $("#t").attr('disabled', true);
  }else{
       
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                //$("#alerta").css("display" ,"block" );
                document.getElementById("alerta").innerHTML = xhttp.responseText;
               
                         }
        
        }
       
      xhttp.open("POST", "CuentaResultado.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("tipocr=" + tipocr + "&codigo="+codigo+"&nombre= "+nombre);   
     
  

}

}

function habilitar(){
 $("#alerta").css("display" ,"none" );
    $("#t").attr('disabled', false);
   
}

