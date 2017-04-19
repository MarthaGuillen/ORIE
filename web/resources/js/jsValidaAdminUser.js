/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var ssi_modal="";

function cargaperfil(){
    ssi_modal.show({
            content:$('#tabPerfiles'),
            bodyElement:true,
            title:'Por favor seleccione una plantilla de perfil:',
            outSideClose: false,
            extendOriginalContent:true
    })
    
}

function cargaidperfil(id,nomp){
    ssi_modal.close();
    $("#processing-modal").modal('show');
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("contenedorresp").innerHTML = xhttp.responseText;
                        $("#processing-modal").modal('hide');
                        
                        document.getElementById("nomperf").innerHTML = nomp;
                        
                        $("#idperfilselec").val(id);
                    }
    }
    xhttp.open("POST", "cargaPerfilSel.gdc", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idpe="+id);
}

function nuevoUser(){  
    document.getElementById('secContenedor').style.display = 'none';
    document.getElementById('secNuevo').style.display = 'block';
}


function generpass(){
    var longitud = 5;
    var caracteres = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVW#$*";

    var cadena = "";
    var max = caracteres.length-1;
    for (var i = 0; i<longitud; i++) {
        cadena += caracteres[ Math.floor(Math.random() * (max+1)) ];
    }
    //return cadena;
    $("#contrasenia").val("GDC_"+cadena);
    
}

$( document ).ready(function() {
 
    $('#defaultForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            usuario: {
                validators: {
                        stringLength: {
                        min: 6,
                        max: 120,
			message:'El usuario debe tener como minimo 8 caracteres y maximo 120'
                    },
                        notEmpty: {
                        message: 'Por favor, ingrese el nombre del usuario'
                    }
                }
            },
            nombrec: {
                validators: {
                        stringLength: {
                        min: 2,
                        max: 120,
			message:'El nombre debe tener como maximo 200 caracteres.'
                    },
                        notEmpty: {
                        message: 'Por favor, ingrese el nombre completo del usuario'
                    }
                }
            },
            correo: {
                validators: {
                    notEmpty: {
                        message: 'Por favor ingrese el correo electrònico.'
                    },
                    emailAddress: {
                        message: 'Por favor ingrese un correo electrònico valido.'
                        
                    }
                }
            },
	    contrasenia: {
                validators: {
                        stringLength: {
                        min: 8,
                        max: 120,
			message:'La contraseña debe tener como minimo 8 caracteres y maximo 120'
                    },
                        notEmpty: {
                        message: 'Por favor, ingrese la contraseña del usuario'
                    }
                }
            }		
            
            }
        }).on('success.form.bv', function(e) {
            document.getElementById('alert-demo-1').style.display = 'none';
            document.getElementById('alert-demo-2').style.display = 'none';
            document.getElementById('alert-demo-3').style.display = 'none';
            //
            var soci = new Array();
            if( $('#soc1').is(':checked') ) {
                soci.push(1);
               
            }
            if( $('#soc2').is(':checked') ) {
                soci.push(2);
                
            }
            if( $('#soc3').is(':checked') ) {
                soci.push(3);
                
            }
            e.preventDefault();
            var e=0;
            var socdef = $('input:radio[name=socdefault]:checked').val(); 
            if(soci.length>0){
                
                if(socdef===undefined){
                   e=1; 
                   document.getElementById('alert-demo-2').style.display = 'block';
                }else{
                   
                   if(soci.indexOf(parseInt(socdef))===-1){
                       e=1;
                       document.getElementById('alert-demo-3').style.display = 'block';
                   } 
                   
                }
            }else{
                e=1;
                document.getElementById('alert-demo-1').style.display = 'block';
                
            }
            
            var idp = $("#idperfilselec").val();
            
            if(idp===""){
                swal(
                    'Por favor seleccione el perfil del usuario.',
                    '',
                    'error'
                  );
                e=1;
            }
            
            if(e===0){
                var us = $("#usuario").val();
                var cor = $("#correo").val();
                var nomc = $("#nombrec").val();
                var contr =  $("#contrasenia").val();
                $("#processing-modal").modal('show');
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("creusuajax").innerHTML = xhttp.responseText;
                        var estado = $('#respCreaUSsu').val();
                        
                        $("#processing-modal").modal('hide');
                        if(estado==="Exito"){
                            window.location="adminuser.gdc";
                        }else{
                            swal(
                                'Oops...',
                                estado,
                                'error'
                            )  
                        }
                    }
                }
                xhttp.open("POST", "creaUsuario.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("idperfil="+idp+"&usuario="+us+"&correo="+cor+"&nomc="+nomc+"&contr="+contr+"&sociedades="+soci.toString()+"&socdef="+socdef); 
            }else{
                $('#defaultForm').data('bootstrapValidator').resetForm();
            }
            
            return  false;
            
        });   
    
    
});


function crearus(){
    var e=0;
    var us = $("#usuario").val();
    var cor = $("#correo").val();
    var nomc = $("#nombrec").val();
    var contr =  $("#contrasenia").val();
    var cadena = "";
    
    /*if(us===""){
       e=1;
       cadena += "<p>Por favor ingrese el nombre de usuario.</p>";
    }
    if(cor===""){
       e=1; 
       cadena += "<p>Por favor ingrese un correo electrònico valido.</p>";
    }
    if(nomc===""){
       e=1;
       cadena += "<p>Por favor ingrese el nombre completo del usuario.</p>";
    }
    if(contr===""){
       e=1; 
       
    }*/
}
