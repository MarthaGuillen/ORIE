<%-- 
    Document   : pgActivacion
    Created on : 11-mar-2017, 13:40:24
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

                $('#modalcarg').modal('show');
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
                   
                    
        
                        
        <div class="modal fade" id="modalcarg" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="container">
              
            <div class='row' > 
                    <div class="col-sm-12">
                    <c:if test="${resp eq 'Cuenta Activada'}">
                        <h1 class="text-left default" style="color:white;">Está cuenta ya esta activada.</h1> 
                        <h1 class="text-center default" style="color:white;">Muchas Gracias.</h1> 
                    </c:if> 
                    <c:if test="${resp eq 'Exito'}">
                       <h1 class="text-left default" style="color:white;">La cuenta se activo, con exito.</h1> 
                        <h1 class="text-center default" style="color:white;">Muchas Gracias.</h1> 
                    </c:if> 
                    <c:if test="${resp eq 'Cuenta inexistente'}">
                        <h1 class="text-left default" style="color:white;">La cuenta que esta tratando de activar no existe.</h1> 
                        <h1 class="text-center default" style="color:white;">Muchas Gracias.</h1>  
                    </c:if>     
                     
                    <legend></legend>
                    <div class="col-sm-6 col-sm-offset-5">    
                        <br>                        
                        <img src ="<c:url value='/resources/img/logowhite.png'/>" alt="Logo" class="img-responsive center-block">
                    </div>
                    <br><br>
                    <a href="Inicio.gdc"  class="btn btn-primary btn-lg hvr-pulse" style="cursor:pointer;color:white;">Inicio</a> 
                    </div>
                   
            </div>                 
            </div>
        </div>                 
                        
    </body>
</html>

