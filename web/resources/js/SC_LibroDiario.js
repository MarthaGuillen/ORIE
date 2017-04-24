var est=0;
jQuery('form[data-toggle="validator"] select').on('change', function(event) {
    event.preventDefault();
    jQuery(this).find('option[disabled]').remove();
});
$( document ).ready(function() {
    
     $('#fecha').pickadate({
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

 $("#generarlibro").click(function(){
        
   var fecha=  $("#fecha").val();
 if(fecha===""){
     
     document.getElementById('fechaval').style.display = 'block'; 
 }else{
          var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) { 
                document.getElementById("datoslibrodiarios").innerHTML = xhttp.responseText;
                document.getElementById('fechaval').style.display = 'none'; 
                $('#tablalibro').DataTable({
      
                     "language": {
                    "lengthMenu": "Mostrar _MENU_ registros por página",
                    "zeroRecords": "No se encuentran registros disponibles.",
                    "info": "Mostrando página _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay registros que coincidan con su busqueda.",
                    "infoFiltered": "(Filtrado de _MAX_ registros.)",
                    "decimal": ".",
                    "thousands": ",",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando..",
                    "search": "Buscar",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    
                    }
                    
                }
    } );
   
            }
        
        }
        
      xhttp.open("POST", "librodiarioobtener.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("fecha="+fecha+"&datosauditoria="+est);  }
 });
 $("#camposau").change(function(){
   if(est==0){
       est=1;
           
   }else{
       est=0;
       
   }
 
 } );
});

        /* $('#infodatos').DataTable({
      
        "language": {
                    "lengthMenu": "Mostrar _MENU_ registros por página",
                    "zeroRecords": "No se encuentran registros disponibles.",
                    "info": "Mostrando página _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay registros que coincidan con su busqueda.",
                    "infoFiltered": "(Filtrado de _MAX_ registros.)",
                    "decimal": ".",
                    "thousands": ",",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando..",
                    "search": "Buscar",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    
                    }
                    
                }
    } );*/