

function validar() {
    var user = $('#xtus').val().trim();
    var pass = $('#xtpas').val().trim();
    var e = 0;
    var cadena = "";
    if (user == "") {
        e = 1;
        cadena += "<h3>Por favor ingrese su nombre de usuario.</h3>"
    }
    if (pass == "") {
        e = 1;
        cadena += "<h3>Por favor ingrese su contraseña.</h3>"
    }

    if (e == 1) {
        swal({
            title: '',
            html: cadena
        });

    } else {
         $('#modalcarg').modal('show');
        document.getElementById('cargaCont').style.display = 'block';
        document.getElementById('contenidoGuardar').style.display = 'none';
        document.getElementById('btnCerrar').style.display = 'none';
        var xusrten = Base64.encode(user);
        var ptpr = Base64.encode(pass); 
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
               if (xhttp.readyState == 4 && xhttp.status == 200) {
                    document.getElementById("valida").innerHTML = xhttp.responseText;
                    if($('#respLog').val()==="Acceso"){
                        aceptarIngreso(); 
                       
                                                
                    }else{
                         $('#modalcarg').modal('hide');
                        swal(
                          'Oops...',
                          'Lo sentimos su cuenta actualmente, no esta activa.',
                          'error'
                        )
                       
                    }
                   
               }
        }
        xhttp.open("POST", "validaUsuario.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("xtp="+xusrten+"&ptp="+ptpr);    
        

    }
    
    


}


function aceptarIngreso(id){
    $("#id").val(id);
    document.form1.submit();
    
}

$(function(){
    //Para escribir solo letras
    $('#nombre').validCampoFranz(' abcdefghijklmnñopqrstuvwxyzáéíóúñ');
    $('#usr').validCampoFranz('abcdefghijklmnñopqrstuvwxyz123456789');
    $('#correo').validCampoFranz('abcdefghijklmnñopqrstuvwxyz@123456789$%^@!&*()._');
    $('#password').validCampoFranz('abcdefghijklmnñopqrstuvwxyz@12345678$%^@!&*');
    $('#xtus').validCampoFranz('abcdefghijklmnñopqrstuvwxyz@123456789$%^@!&*()._');
    $('#xtpas').validCampoFranz('abcdefghijklmnñopqrstuvwxyz@12345678$%^@!&*');
   
});


function crearUsuario(){
    $("#nombusuario").removeClass("has-error");
    $("#nombpass").removeClass("has-error");
    $("#nombcompleto").removeClass("has-error");
    $("#nombcorreo").removeClass("has-error");
    document.getElementById('cargaCont').style.display = 'block';
    document.getElementById('contenidoGuardar').style.display = 'none';
    document.getElementById('btnCerrar').style.display = 'none';
    var et=0;
    var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
    var cadena ="";            
    if (regex.test($('#correo').val().trim())) {}
    else {
        $("#nombcorreo").addClass("has-error");
        cadena ='<p>La dirección de correo no es valida.</p>';
        et = 1;
    }
    var xusrt = $('#usr').val().trim();
    var xpasr = $('#pass').val().trim();
    var correo = $('#correo').val().trim();
    var nombre = $('#nombre').val().trim();
    
    if(xusrt===""){
        $("#nombusuario").addClass("has-error");
        cadena +='<p>Ingrese el nombre de su usuario por favor.</p>';et = 1;
    }
    if(xpasr===""){
        $("#nombpass").addClass("has-error");
        cadena +='<p>Ingrese la contraseña, por favor.</p>';et = 1;
    }
     if(correo===""){
         $("#nombcorreo").addClass("has-error");
        cadena +='<p>Ingrese su correo, por favor.</p>';et = 1;
    }
     if(nombre===""){
         $("#nombcompleto").addClass("has-error");
        cadena +='<p>Ingrese su nombre, por favor.</p>';et = 1;
    }
    
    if(et==1){
        swal({
            title: '<h3 class="text-center">Opppss..</h3>',
            type: 'error',
            html:
              cadena,
            showCloseButton: true
          });
          document.getElementById('cargaCont').style.display = 'none';
          document.getElementById('contenidoGuardar').style.display = 'block';
    }else{
        var xusrten = Base64.encode(xusrt);
        var ptpr = Base64.encode(xpasr); 
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
               if (xhttp.readyState == 4 && xhttp.status == 200) {
                    document.getElementById("valida").innerHTML = xhttp.responseText;
                    if($('#respLog').val()==="N"){
                        
                        document.getElementById('respuestaNo').style.display = 'block';
                        document.getElementById('cargaCont').style.display = 'none';
                        document.getElementById('respuestaFinal').style.display = 'none';
                        document.getElementById('contenidoGuardar').style.display = 'none';
                                                
                    }else{
                        document.getElementById('respuestaFinal').style.display = 'block';
                        document.getElementById('cargaCont').style.display = 'none';
                        document.getElementById('respuestaNo').style.display = 'none';
                        document.getElementById('contenidoGuardar').style.display = 'none';
                       
                    }
                   
               }
        }
        xhttp.open("POST", "userget.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("xusrten="+xusrten+"&ptpr="+ptpr+"&nombre="+nombre+"&correo="+correo);
        
        
    }
}


function volverIn(){
    
    document.getElementById('respuestaNo').style.display = 'none';
    document.getElementById('cargaCont').style.display = 'none';
    document.getElementById('respuestaFinal').style.display = 'none';
    document.getElementById('contenidoGuardar').style.display = 'block';
    
}

