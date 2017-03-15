/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$( document ).ready(function() {
    $(".reveal").mousedown(function() {
        $(".pwd").replaceWith($('.pwd').clone().attr('type', 'text'));
    })
    .mouseup(function() {
            $(".pwd").replaceWith($('.pwd').clone().attr('type', 'password'));
    })
    .mouseout(function() {
            $(".pwd").replaceWith($('.pwd').clone().attr('type', 'password'));
    });
});

$(function(){
    $('#xttus').validCampoFranz(' abcdefghijklmnñopqrstuvwxyzáéíóúñ$#%&*0123456789');   
    $('#xtpas').validCampoFranz(' abcdefghijklmnñopqrstuvwxyzáéíóúñ$#%&*0123456789');
});

function validaLogin(){
    var user = $("#xttus").val();
    var pass = $("#xtpas").val();
    var e = 0;
    var cadena = "";
    if (user === "") {
        e = 1;
        cadena += "<h3>Por favor ingrese su nombre de usuario.</h3>"
    }
    if (pass === "") {
        e = 1;
        cadena += "<h3>Por favor ingrese su contraseña.</h3>"
    }

    if (e === 1) {
        swal({
            type: 'info',
            title: '',
            html: cadena
        });

    }else{
        $('#processing-modal').modal('show');
        var xtp = Base64.encode(user);
        var ptp = Base64.encode(pass); 
        var xhttp = new XMLHttpRequest();
           xhttp.onreadystatechange = function() {
               if (xhttp.readyState == 4 && xhttp.status == 200) {
                    document.getElementById("conteedor").innerHTML = xhttp.responseText;
                    if($('#respLog').val()==="Denegado"){
                           swal({
                                type: 'error',
                                title: 'Error, inicio de sesion',
                                html: '<h4>Por favor verique lo siguiente:</h4><ul style="list-style-type: circle"><li >Verique, el usuario y la contraseña que ingreso.</li><li>Verique con el administrador, que su usuario no esta deshabilitado.</li><li>Si olvido su contraseña, por favor de clic en recuperar contraseña.</li></ul>'
                            });
                                                
                    }else{
                        aceptarIngreso();
                       
                    }
                    $('#processing-modal').modal('hide');
               }
           }
           xhttp.open("POST", "validaUs.gdc", true);
           xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
           xhttp.send("xtp="+xtp+"&ptp="+ptp);
        
    }
        
}

function aceptarIngreso(){
    
    document.form1.submit();
    
}
