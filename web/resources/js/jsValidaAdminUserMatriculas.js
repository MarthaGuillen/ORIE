/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$.fn.pageMe = function(opts){
    var $this = this,
        defaults = {
            perPage: 7,
            showPrevNext: false,
            hidePageNumbers: false
        },
        settings = $.extend(defaults, opts);
    
    var listElement = $this;
    var perPage = settings.perPage; 
    var children = listElement.children();
    var pager = $('.pager');
    
    if (typeof settings.childSelector!="undefined") {
        children = listElement.find(settings.childSelector);
    }
    
    if (typeof settings.pagerSelector!="undefined") {
        pager = $(settings.pagerSelector);
    }
    
    var numItems = children.size();
    var numPages = Math.ceil(numItems/perPage);

    pager.data("curr",0);
    
    if (settings.showPrevNext){
        $('<li><a href="#" class="prev_link">«</a></li>').appendTo(pager);
    }
    
    var curr = 0;
    while(numPages > curr && (settings.hidePageNumbers==false)){
        $('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo(pager);
        curr++;
    }
    
    if (settings.showPrevNext){
        $('<li><a href="#" class="next_link">»</a></li>').appendTo(pager);
    }
    
    pager.find('.page_link:first').addClass('active');
    pager.find('.prev_link').hide();
    if (numPages<=1) {
        pager.find('.next_link').hide();
    }
      pager.children().eq(1).addClass("active");
    
    children.hide();
    children.slice(0, perPage).show();
    
    pager.find('li .page_link').click(function(){
        var clickedPage = $(this).html().valueOf()-1;
        goTo(clickedPage,perPage);
        return false;
    });
    pager.find('li .prev_link').click(function(){
        previous();
        return false;
    });
    pager.find('li .next_link').click(function(){
        next();
        return false;
    });
    
    function previous(){
        var goToPage = parseInt(pager.data("curr")) - 1;
        goTo(goToPage);
    }
     
    function next(){
        goToPage = parseInt(pager.data("curr")) + 1;
        goTo(goToPage);
    }
    
    function goTo(page){
        var startAt = page * perPage,
            endOn = startAt + perPage;
        
        children.css('display','none').slice(startAt, endOn).show();
        
        if (page>=1) {
            pager.find('.prev_link').show();
        }
        else {
            pager.find('.prev_link').hide();
        }
        
        if (page<(numPages-1)) {
            pager.find('.next_link').show();
        }
        else {
            pager.find('.next_link').hide();
        }
        
        pager.data("curr",page);
      	pager.children().removeClass("active");
        pager.children().eq(page+1).addClass("active");
    
    }
};


var ssi_modal="";

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


function neuvoUS(){
    $("#modalNuevoUs").modal('show');
    
    

   
    
}

$( document ).ready(function() {
 $('#numtel').validCampoFranz('1234567890');   
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
            var e=0;
            var tpc = $('input:radio[name=radiotipoc]:checked').val(); 
            if(tpc===undefined){
                   e=1; 
                   swal(
                    'Por favor seleccione el tipo de usuario.',
                    '',
                    'error'
                   );
            }    
            if(e===0){
                var us = $("#usuario").val();
                var cor = $("#correo").val();
                var nomc = $("#nombrec").val();
                var contr =  $("#contrasenia").val();
                var dire = $("#txtdireccion").val();
                var numt = $("#numtel").val();
                $("#processing-modal").modal('show');
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("creusuajax").innerHTML = xhttp.responseText;
                        var estado = $('#respCreaUSsu').val();
                        
                        $("#processing-modal").modal('hide');
                        $("#modalNuevoUs").modal('hide');
                        if(estado==="Exito"){
                            window.location="adminuserMatricula.gdc";
                        }else{
                            swal(
                                'Oops...',
                                estado,
                                'error'
                            )  
                        }
                    }
                }
                xhttp.open("POST", "creaUsuariofront.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("usuario="+us+"&correo="+cor+"&nomc="+nomc+"&contr="+contr+"&idtpc="+tpc+"&dire="+dire+"&numt="+numt); 
            }else{
                $('#defaultForm').data('bootstrapValidator').resetForm();
            }
            return  false;
        });   
  
        $('#tablaex').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:5});
    
});




function limpia(){
    $("#usuario").val("");
    $("#correo").val("");
    $("#nombrec").val("");
    $("#contrasenia").val("");
    $("#txtdireccion").val("");
    $("#numtel").val("");
    $('#defaultForm').data('bootstrapValidator').resetForm();
}