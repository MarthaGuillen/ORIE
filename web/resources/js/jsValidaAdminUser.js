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