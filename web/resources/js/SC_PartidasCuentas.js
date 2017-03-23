function fechaActual(){
    var hoy = new Date();
var dd = hoy.getDate();
var mm = hoy.getMonth()+1; //hoy es 0!
var yyyy = hoy.getFullYear();

if(dd<10) {
    dd='0'+dd
} 

if(mm<10) {
    mm='0'+mm
} 

hoy = mm+'/'+dd+'/'+yyyy;
 $("#fecha").write(Date());   
 
   $(function () {
        
       $("#fecha").datepicker(hoy);  
    });
}

function validar(){
    
    var e=0;
    var trasaccion=$("#transaccion").val();
    var cuenta=$("#cuenta").val();
    var tipo=$("#tipocuenta").val();
    var descripcion=$("#descripcion").val();
    var monto=$("#monto").val();
}