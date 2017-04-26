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
    $("#idsociedad").val("");
    $("#nomest").val("");
    $("#iddivision").val("");
    $("#idgrado").val("");
    document.getElementById('socSeleccion').style.display = 'block';
    document.getElementById('socDelcampo').style.display = 'none';
    document.getElementById('socAcademy').style.display = 'none';
    document.getElementById("gradoCar").innerHTML = "";
    document.getElementById("divisionCar").innerHTML = "";
    document.getElementById("divse").innerHTML = "";
    document.getElementById("grase").innerHTML = "";
   
    
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
  
        $('#tablaex').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:10});
        
        /*$('input:radio[name=rdDivision]').change(function() {
        
            alert(this.value);
            cargagrados(this.value);
        });*/
        
        
    
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

function agregaHijo(id){
    document.getElementById('socSeleccion').style.display = 'block';
    document.getElementById('socDelcampo').style.display = 'none';
    document.getElementById('socAcademy').style.display = 'none';
    document.getElementById("gradoCar").innerHTML = "";
    document.getElementById("divisionCar").innerHTML = "";
    document.getElementById("divse").innerHTML = "";
    document.getElementById("grase").innerHTML = ""; 
   $("#idpadre").val(id);
   $("#modalNuevohijo").modal('show');
}

function limpiaest(){
    $("#nomest").val("");
    
}

function cargaDivisiones(id){
    document.getElementById('socSeleccion').style.display = 'block';
    document.getElementById('socDelcampo').style.display = 'none';
    document.getElementById('socAcademy').style.display = 'none';
    document.getElementById("gradoCar").innerHTML = "";
    document.getElementById("divisionCar").innerHTML = "";
    document.getElementById("divse").innerHTML = "";
    document.getElementById("grase").innerHTML = "";
    $("#processing-modal").modal('show');
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("divisionCar").innerHTML = xhttp.responseText;
                        $("#idsociedad").val(id);
                        $("#processing-modal").modal('hide');
                        $("#modaliDivisiones").modal('show');
                    }
    }
    xhttp.open("POST", "cargadivisiones.gdc", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("ids="+id); 
    
}

function cargagrados(idd){  
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
        document.getElementById("gradoCar").innerHTML = xhttp.responseText;
                        
                        
        }
    }
    xhttp.open("POST", "cargagrados.gdc", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("idd="+idd); 
    
}

function capturaDivgr(){
    var e=0;
    var division = $('input:radio[name=rdDivision]:checked').val();
    var grad = $('input:radio[name=rdGrado]:checked').val();
    if(division===undefined){
        e=1;
        ssi_modal.notify('error', {
            position: 'left top',
            backdrop:'shared',outSideClose:true,
            content: 'Por favor seleccione la división, en que estará el estudiante.'
        })
    }else{
       
        if(grad===undefined){
            ssi_modal.notify('error', {
                position: 'left top',
                backdrop:'shared',outSideClose:true,
                content: 'Por favor seleccione el grado, en que estará el estudiante.'
            })
            e=1;
        }  
        
    }
    
    if(e===0){
        
        $("#modaliDivisiones").modal('hide');
        $("#iddivision").val(division);
        $("#idgrado").val(grad);
        var soc = $("#idsociedad").val();
        
        document.getElementById('socSeleccion').style.display = 'none';
        if(parseInt(soc)===1){
            
            document.getElementById('socDelcampo').style.display = 'block';
        }
        if(parseInt(soc)===2){
            document.getElementById('socAcademy').style.display = 'block';
        }
        
               
        document.getElementById("divse").innerHTML = "División: "+ $("label[for='radd"+division+"']").text();
        document.getElementById("grase").innerHTML = "Grado: "+$("label[for='radg"+grad+"']").text();
       
        
        document.getElementById('bloque').style.display = 'block';
    }
}


function asignaEstudiante(){
    var nom = $("#nomest").val();
    var e=0;
    var soc = $("#idsociedad").val();
    var idd = $("#iddivision").val();
    var idg = $("#idgrado").val();
    var cadena = "";
    if(nom===""){
        ssi_modal.notify('error', {
                position: 'left top',
                backdrop:'byKindShared',outSideClose:true,
                content: "Por favor ingrese el nombre del estudiante."
        }) 
        
        e=1;
    }  
    if(soc===""){
        ssi_modal.notify('error', {
                position: 'left top',
                backdrop:'byKindShared',outSideClose:true,
                content: "Por favor seleccione la escuela del estudiante."
        }) 
        
        e=1;
    }
    if(idd===""){
        ssi_modal.notify('error', {
                position: 'left top',
                backdrop:'byKindShared',outSideClose:true,
                content: "Por favor seleccione la división del estudiante."
        }) 
       
        e=1;
    }
    if(idg===""){
        ssi_modal.notify('error', {
                position: 'left top',
                backdrop:'byKindShared',outSideClose:true,
                content: "Por favor seleccione el grado del estudiante."
        }) 
        
        e=1;
    }
    
    if(e===0){
        var idua = $("#idpadre").val();
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaeST").innerHTML = xhttp.responseText;
                        
                            window.location="adminuserMatricula.gdc";
                        
            }
        }
        xhttp.open("POST", "asignaEstudiante.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("ids="+soc+"&idd="+idd+"&idg="+idg+"&idua="+idua+"&nom="+nom); 
    
        
    }
 
        
      
}

function cargaHijos(id){
    
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaEstPadres").innerHTML = xhttp.responseText;
                ssi_modal.show({
                    content:$('#cargaEstPadres'),
                    bodyElement:true,
                    title:'Estudiantes asignados:',
                        extendOriginalContent:true
                });
            }
        }
        xhttp.open("POST", "cargaListaEstudiante.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id="+id); 
    
}

function eliminaestudiante(id,nom){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaEstPadres").innerHTML = xhttp.responseText;
                window.location="adminuserMatricula.gdc";
            }
        }
        xhttp.open("POST", "deleteEstudiante.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id="+id+"&nom="+nom); 
    
    
}

function cambiaestado(est,id,nom){
        $("#processing-modal").modal('show');
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("cargaEstPadres").innerHTML = xhttp.responseText;
                $("#processing-modal").modal('hide');
                window.location="adminuserMatricula.gdc";
            }
        }
        xhttp.open("POST", "estadoUsuario.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("id="+id+"&nom="+nom+"&estado="+est);
}

function busqeda(){
        var nom = $("#nombrecliente").val();
        $("#processing-modal").modal('show');
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("contenedorBusqueda").innerHTML = xhttp.responseText;
                $("#processing-modal").modal('hide');
                //$('#tablaex').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:10});
            }
        }
        xhttp.open("POST", "consultaCliente.gdc", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("nom="+nom);
    
    
}
