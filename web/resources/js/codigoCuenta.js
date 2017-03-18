
function generarcodigocuentasresultado(){

  var codigotipo=$("#tipocr option:selected").text();
    
   var codigo =codigotipo;
    var arraycodigo=codigo.split(" ");
    var array2codigo=arraycodigo[0].split("");
    var arrayfinal=[];
    var n=0;
    for (var i = 0; i < array2codigo.length-1; i++) {
        if(array2codigo[i]!=" " && n<5){
            n++;
        arrayfinal.push(array2codigo[i]);}
    }
    var idcuenta=arrayfinal[3];
  
    var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {               
                document.getElementById("numerocuentas").innerHTML = xhttp.responseText;
               var codigoarea=$("#cuentar").val();
               var numero =parseInt(codigoarea)+1;
               var codigo=arraycodigo[0];
               $("#codigo").val(codigo.substring( 0,codigo.length-1)+numero.toString());
            }
        
        }
       
      xhttp.open("POST", "obtenercodigo.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("idcuenta="+ idcuenta); 
       
  //$("#codigo").val(arraycodigo[0]);
}

function llenarcombocuentasResultados(){
    var idcodigo = $("#areacr").val();
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
               
                document.getElementById("temp").innerHTML = xhttp.responseText;
                var id_tipo=$("#cbid_tipoa").val();
                var codigoarea=$("#cbcodigoarea").val();
                 var codigotipo=$("#cbcodigomadrecr").val();
                 var nombretipo=$("#nombremadrecr").val();
                 
                 var lid_tipo= id_tipo.substring(1, id_tipo.length-1);
              
                 
                 var lcodigoarea= codigoarea.substring(1, codigoarea.length-1);
                 var lcodigotipo= codigotipo.substring(1, codigotipo.length-1);
                 var lnombretipo= nombretipo.substring(1, nombretipo.length-1);
                 
                 var arrayid_tipo=lid_tipo.split(",");
                 var arraycodigoarea=lcodigoarea.split(",");
                 var arraycodigotipo=lcodigotipo.split(",");
                 var arraynombretip=lnombretipo.split(",");
                
                 var cadena="<option value=''>Seleccione El Area de la Cuenta</option>";
                 for (var i = 0; i < arraycodigoarea.length; i++) {
                     var cadcodigo=arraycodigoarea[i].trim()+arraycodigotipo[i].trim();
                     var codigo=cadcodigo+"000"; 
                     
                     
               cadena+=" <option value='"+arrayid_tipo[i]+"'>"+codigo+" "+arraynombretip[i]+"</option>";
            }
           
            $("#tipocr").html(cadena);
            
            
            }
        
        }
       
      xhttp.open("POST", "xddxfdg.gdc", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=ISO-8859-1");
        xhttp.send("codigocr=" + idcodigo );   
     
  

}
function generarcr(){
   $("#codigo").val($("#tipocr").val());
}
