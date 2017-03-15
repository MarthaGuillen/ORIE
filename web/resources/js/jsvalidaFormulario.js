/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


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
});

$(function(){
    $('#telestudiante').validCampoFranz('+-0123456789');   
    
});


function cargardatos(){
    swal(
        '',
        'Al usar esta opción por favor valide su dirección y completela con algunos detalles como No. Casa, bloque, avenida etc.',
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

