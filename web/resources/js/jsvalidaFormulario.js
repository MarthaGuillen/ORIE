/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
    
    
        $('#fechanac').pickadate({
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
    
        $("#nacionalidad").select2(
        {placeholder: "Nacionalidad",
                 allowClear: true
        });
        
        $("#pais").select2(
        {placeholder: "País de nacimiento",
                 allowClear: true
        });
        
     
        $('#defaultForm').bootstrapValidator().on('success.form.bv', function(e) {
            document.getElementById('genval').style.display = 'none';
            document.getElementById('paisval').style.display = 'none';
            document.getElementById('nacionval').style.display = 'none';
            var genero = $('input:radio[name=radioGenero]:checked').val();
            var nacion = $('#nacionalidad').val();
            var pais = $('#pais').val();
            alert(genero);
            alert(nacion);
            alert(pais);
            var et = 0;
            if(genero===""){
               document.getElementById('genval').style.display = 'block';et=1;
            }
            if(nacion===""){
               document.getElementById('paisval').style.display = 'block';et=1;
            }
            if(pais===""){
               document.getElementById('nacionval').style.display = 'block';et=1;
            }
            if(et==0){
                var pnestudiante = $("#pnestudiante").val();
                var snestudiante = $("#snestudiante").val();
                var paestudiante = $("#paestudiante").val();
                var saestudiante = $("#saestudiante").val();
                var direcestudiante = $("#direcestudiante").val();
                var ciudestudiante = $("#ciudestudiante").val();
                var telestudiante = $("#telestudiante").val();
                var radioGenero = $('input:radio[name=radioGenero]:checked').val();
                var edad = $("#edad").val();
                var fechanac = $("#fechanac").val();
                var pais = $("#pais").val();
                var nacionalidad = $("#nacionalidad").val();
                var nIdentidad = $("#nIdentidad").val();
                var email = $("#email").val();
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                         document.getElementById("ajaxtemp").innerHTML = xhttp.responseText;
                            

                    }
                }

                xhttp.open("POST", "formulariofase1.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("pnestudiante="+pnestudiante+"&snestudiante="+snestudiante+"&paestudiante="+paestudiante+"&saestudiante="+saestudiante
                         +"&direcestudiante="+direcestudiante+"&ciudestudiante="+ciudestudiante+"&telestudiante="+telestudiante
                         +"&radioGenero="+radioGenero+"&edad="+edad+"&fechanac="+fechanac
                         +"&pais="+pais+"&nacionalidad="+nacionalidad+"&nIdentidad="+nIdentidad
                         +"&email="+email);
            }
        });;
    
});

$(function(){
    $('#telestudiante').validCampoFranz('+-0123456789');   
    
});


function cargardatos(){
    
    swal(
        '',
        'Al usar esta opción por favor valide su dirección y completela con algunos detalles como: No. Casa, bloque, avenida etc.',
        'info'
    )
    $("#direcestudiante").val(direccion);
    $("#ciudestudiante").val(ciudad);

    
}

function renderMap(lat, long) {
        var point = new google.maps.LatLng(lat, long);
        var map = new google.maps.Map(document.getElementById('map'), {
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoom: 13,
            center: point
        });
        var marker = new google.maps.Marker({ position: point, map: map, icon: 'http://www.google.com/intl/en_us/mapfiles/ms/icons/red-dot.png' });
    }



function guardarfase1(){
    var pnestudiante = $("#pnestudiante").val();
    var snestudiante = $("#snestudiante").val();
    var paestudiante = $("#paestudiante").val();
    var saestudiante = $("#saestudiante").val();
    var direcestudiante = $("#direcestudiante").val();
    var ciudestudiante = $("#ciudestudiante").val();
    var telestudiante = $("#telestudiante").val();
    var radioGenero = $("#radioGenero").val();
    var edad = $("#edad").val();
    var fechanac = $("#fechanac").val();
    var pais = $("#pais").val();
    var nacionalidad = $("#nacionalidad").val();
    var nIdentidad = $("#nIdentidad").val();
    var email = $("#email").val();
    var et = 0;
    var cadena = "<h2 class='text-default'>Por favor verifique lo siguiente:</h2>";
    if (pnestudiante === "") {
        cadena += "<h3>Por favor ingrese su nombre de usuario.</h3>"
    }
    

    if (et === 1) {
        swal({
            type: 'info',
            title: '',
            html: cadena
        });

    }
    
    $("#modalcarg").modal('show');
    
}
