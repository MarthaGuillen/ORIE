$( document ).ready(function() {
    
      
    
       
    
    
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