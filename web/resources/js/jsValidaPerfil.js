/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$( document ).ready(function() {
      
    
})

function cargadefault(id){
                $("#processing-modal").modal('show');
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("ajaxSociedad").innerHTML = xhttp.responseText;
                        var estado = $('#respLog').val();
                        $("#processing-modal").modal('hide');
                        if(estado==="Exito"){
                            window.location="perfil.gdc";
                        }else{
                            swal(
                                'Oops...',
                                'Ocurrio un error, al seleccionar la sociedad.',
                                'error'
                            )  
                        }
                    }
                }
                xhttp.open("POST", "activaSoc.gdc", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("idsoc="+id); 
    
    
    
}