<%-- 
    Document   : pgFroLogin
    Created on : 10-mar-2017, 8:41:05
    Author     : Sinergia14
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Home - Del Campo International School</title>
        <%--Archivos css --%>
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/font-awesome.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/hightop-font.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/isotope.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/hover-min.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/bootstrap-switch.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/bootstrap-editable.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/style.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/sweetalert2.min.css'/>">
        <link rel="shortcut icon" href="<c:url value='/resources/favicon/favicon.ico'/>">
        <!-- Archivos JavaScript -->
        <script src="<c:url value='/resources/jsOr/jquery-1.10.2.min.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/jquery-ui.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/jquery.bootstrap.wizard.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/jquery.isotope.min.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/modernizr.custom.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/jquery.fancybox.pack.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/jquery.nestable.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/main.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/respond.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/validarLogin.js'/>"></script>
        <script src="<c:url value='/resources/js/validCampo.js'/>"></script>
        <script src="<c:url value='/resources/jsOr/sweetalert2.min.js'/>"></script>
        <script src="<c:url value='/resources/js/cript.js'/>"></script>
        <style>
            body.modal-open #wrap{
                -webkit-filter: blur(7px);
                -moz-filter: blur(15px);
                -o-filter: blur(15px);
                -ms-filter: blur(15px);
                filter: blur(15px);
                
            }

            .modal-backdrop {background: #000;}
              
            .close {
                font-size: 50px;
                display:block;
               
            }
            
            .buttons {
                display: table;
                height: 100%;
                width: 100%;
              }

              

       
        
        
        //button styles


        //default button
        .btn {
          color: #white;
          cursor: pointer;
          display: block;
          font-size:16px;
          font-weight: 400;
          line-height: 45px;
          margin: 0 auto 2em;
          max-width: 160px; 
          position: relative;
          text-decoration: none;
          text-transform: uppercase;
          vertical-align: middle;
          width: 100%; 

          

          

          &:hover { text-decoration: none; }

        }

               ////////////////////////////
        //button two
        //////////////////////////
        .btn-2 {
            letter-spacing: 0;
        }

        .btn-2:hover,
        .btn-2:active {
          letter-spacing: 5px;
          color:white;
        }

        .btn-2:after,
        .btn-2:before {
          backface-visibility: hidden;
          border: 1px solid rgba(#fff, 0);
          bottom: 0px;
          content: "";
          color:white;
          display: block;
          margin: 0 auto;
          position: relative;
          transition: all 280ms ease-in-out;
          width: 0;
        }

        .btn-2:hover:after,
        .btn-2:hover:before {
          backface-visibility: hidden;
          border-color: blue;
          transition: width 350ms ease-in-out;
          width: 70%;
        }

        .btn-2:hover:before {
          bottom: auto;
          top: 0;
          color:white;
          width: 70%;
        }

        
        
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.carousel').carousel({interval: 7000});

                $('#password').bind("enterKey", function (e) {
                    validar();
                });
                $('#password').keyup(function (e) {
                    if (e.keyCode == 13)
                    {
                        $(this).trigger("enterKey");
                    }
                });
            });

        </script>
    </head>
    <body class="login2">
        <div id="myCarousel" class="carousel container slide" style="filter:alpha(opacity=50); opacity:0.9;">
            <div class="carousel-inner">
                <div class="active item one"></div>
                <div class="item two"></div>
                <div class="item three"></div>


            </div>
        </div> 
        <!-- Login Screen -->
        <div class = "pull-right">
            <div class="login-wrapper">
                <div class="container" style="margin-top: 2em;
                     margin-bottom: 2em;
                     margin-left: 2em;
                     margin-right: 2em;">
                    <h1>
                        <img src ="<c:url value='/resources/img/logowhite.png'/>" alt="Logo" class="img-responsive center-block">
                    </h1>
                    
                    <div class="form-group float-label-control">
                        <label for="xtus">Usuario:</label>
                        <input id="xtus" name="xtus" type="text" class="form-control" style="color:white;" placeholder="Usuario o correo electrónico" maxlength="120">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">Contraseña:</label>
                        <input type="password" class="form-control"  style="color:white;" placeholder="Contraseña" id="xtpas" name="xtpas" maxlength="16">
                    </div>
                   
                    <a  class="pull-left hvr-pulse" style="cursor:pointer;color:white;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> Crear cuenta</a>
                    <a class="pull-right hvr-pulse" style="cursor:pointer;color:white;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-repeat"></span> ¿Olvidó su contraseña?</a>
                    <br>
                    <br><br>
                    <button class="btn btn-lg btn-primary btn-block" onclick="validar();">Ingresar</button>
                    
                    <div id="valida"></div>



                </div>
            </div>
        </div>
         
        <form role="form" id="form1" name="form1" action="Principal.gdc" method="post">             
              <input type="hidden" id="id" name="id">             
                        
        </form>             
                    
        <!-- End Login Screen -->
        <!-- Static Modal -->
        <div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <img src="<c:url value='/resources/img/Loading.gif'/>" class="icon" />
                            <h4>Cargando...</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal Registro-->
        <div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="container">
              <div class="row" style="color:white;">
              <div class="col-sm-6 col-sm-offset-3">
                  <button id="btnCerrar" type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
                <br><br>
                <h1 class="text-center default">Registrarse</h1>
                <legend></legend>
                <div class="container" id="contenidoGuardar">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group" id="nombcompleto">
                            <label for="nombre" class="text-left">Nombre completo:</label>
                            <input type="text" id='nombre' name="nombre"  maxlength="250" class="form-control">
                        </div>
                        <div class="form-group" id="nombusuario">
                            <label for="usr" class="text-left">Nombre de usuario:</label>
                            <input type="text" id='usr' name="usr"  maxlength="250" class="form-control">
                        </div>
                        <div class="form-group" id="nombcorreo">
                            <label for="correo" class="text-left">Correo elctrónico:</label>
                            <input type="email" id='correo' name="correo"  maxlength="250" class="form-control">
                        </div>
                        <div class="form-group" id="nombpass">
                            <label for="pass" class="text-left">Contraseña:</label>
                            <input type="password" id='pass' name="pass"  maxlength="16" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-6">
                        <button class="btn btn-lg btn-primary hvr-sweep-to-top btn-block" onclick='crearUsuario();'><span class="glyphicon glyphicon-saved"></span> Crear cuenta</button>
                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-6">
                        <button class="btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                    </div>
                </div>
                
              </div>
                
                `
            </div>
            <div class='row' > 
                    <div class="col-sm-12" id="cargaCont" style="display:none;">
                    <h1 class="text-center default" style="color:white;">Registrando, espere por favor...</h1>   
                    <div class="col-sm-6 col-sm-offset-5">    
                        <br>                        
                        <img width="180px" heigth="180px" src='<c:url value='/resources/img/cargaGif.gif'/>' alt="carga" class='img-responsive center-block'>
                    </div>
                    </div>
                    <div class="col-sm-12" id="respuestaFinal" style="display:none;">
                        <div class="col-sm-3 col-md-3 col-lg-3"></div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                        <img src='<c:url value='/resources/img/like.png'/>' alt="carga" class='img-responsive block-center pull-left'>
                        <h3 class="text-default" style="color:white;">Usuario creado correctamente.</h3>
                    
                    
                        
                        <img src='<c:url value='/resources/img/mailing.png'/>' alt="carga" class='img-responsive block-center pull-right'>
                        <h3 class="text-default" style="color:white;">Por favor para activar su cuenta ingrese a su correo y verifique que le llego un correo y de clic en el enlace dentro del correo, para activar su cuenta.</h3>                
                        <br><br>
                        <a href="Inicio.gdc"  class="btn btn-primary btn-lg hvr-pulse" style="cursor:pointer;color:white;">Inicio</a>  
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3"></div>
                    </div>
                    <div class="col-sm-12" id="respuestaNo" style="display:none;">
                        <div class="col-sm-3 col-md-3 col-lg-3"></div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                        <img src='<c:url value='/resources/img/fracaso.png'/>' alt="carga" class='img-responsive block-center pull-left'>
                        <h3 class="media-heading" style="color:white;">Lo sentimos!, el correo que ingreso ya existe.</h3> 
                        <br><br>
                        <a onclick='volverIn();'  class="btn btn-primary btn-lg hvr-pulse" style="cursor:pointer;color:white;">Volver</a>                         
                        </div> 
                        <div class="col-sm-3 col-md-3 col-lg-3"></div>
                    </div>
                    </div>                 
            </div>
        </div>
                        
       <div class="modal fade" id="modalcarg" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="container">
              
            <div class='row' > 
                    <div class="col-sm-12">
                    <h1 class="text-center default" style="color:white;">Cargando, espere por favor...</h1>   
                    <div class="col-sm-6 col-sm-offset-5">    
                        <br>                        
                        <img width="180px" heigth="180px" src='<c:url value='/resources/img/cargaGif.gif'/>' alt="carga" class='img-responsive center-block'>
                    </div>
                    </div>
                   
            </div>                 
            </div>
        </div>                 
                        
    </body>
</html>
