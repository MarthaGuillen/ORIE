<%-- 
    Document   : pgformularioPrimerIngreso
    Created on : 13-mar-2017, 18:00:07
    Author     : Sinergia14
--%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="valida" value="${sessionScope.ses_estado}" />
<c:if test="${valida != 'Activa'}">
    <c:redirect url="Inicio.gdc"/>
</c:if>


<html>
    <head>
        <meta charset="utf-8">
        <title>Grupo del campo</title>
        <meta name="keywords" content="Perfil GDC" />
        <meta name="description" content="Grupo del campo">
        <meta name="author" content="Sinergia">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        
        <link rel="shortcut icon" href="<c:url value='/resources/favicon/favicon.ico'/>">
        <!-- Font CSS (Via CDN) -->
        <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600'>
        <!-- Theme CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme2.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme3.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/magnific-popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/cssIndex/sweetalert2.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/core.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrapValidator.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/default.css'/>" id="theme_base">
        <link rel="stylesheet" href="<c:url value='/resources/css/default.date.css'/>" id="theme_date">
        <link rel="stylesheet" href="<c:url value='/resources/css/default.time.css'/>" id="theme_time">
        <!-- Admin Forms CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/admin-forms.min.css'/>">
    </head>
    <style>
        a:hover,a:focus{
            text-decoration: none;
            outline: none;
        }
        .tab .nav-tabs{
            border-bottom: 1px solid #0e6e15;
        }
        .tab .nav-tabs li{
            margin: 0 2px 0 0;
            position: relative;
        }
        /*.tab .nav-tabs li.active:before{
            content: "";
            position: absolute;
            bottom: -58px;
            left: 51px;
            border: 14px solid transparent;
            border-top-color: #0e6e15;
        }
        .tab .nav-tabs li.active:after{
            content: "";
            position: absolute;
            bottom: -30px;
            left: 53px;
            border: 12px solid transparent;
            border-top-color: #fff;
        }*/
        .tab .nav-tabs li a{
            border: none;
            padding: 13px 35px;
            font-size: 14px;
            color: #777;
            background: transparent;
            border-radius: 0;
        }
        .tab .nav-tabs li a:hover{
            color: #0e6e15;
        }
        .tab .nav-tabs li a i{
            display: block;
            text-align: center;
            margin-bottom: 5px;
        }
        .tab .nav-tabs li.active a,
        .tab .nav-tabs li.active a:focus,
        .tab .nav-tabs li.active a:hover{
            border: none;
            background: transparent;
            color: #0e6e15;
            transition: background 0.20s linear 0s;
        }
        .tab .tab-content{
            font-size: 14px;
            color: #777;
            background: #fff;
            line-height: 25px;
            padding: 10px;
        }
        .tab .tab-content h3{
            font-size: 26px;
        }
        @media only screen and (max-width: 479px) {
            .tab .nav-tabs li a{
                padding: 10px;
            }
            .tab .nav-tabs li.active:before{
                left: 28px;
                bottom: -24px;
                border-width: 12px;
            }
            .tab .nav-tabs li.active:after{
                left: 30px;
                bottom: -20px;
                border-width: 10px;
            }
        }
    </style>
    <style>
       html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 50%;
        width: 80%;
      }
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
    </style>
    <body class="admin-wizard-page">
        <!-------------------------------------------------------------+ 
            <body> Helper Classes: 
         ---------------------------------------------------------------+ 
            '.sb-l-o' - Sets Left Sidebar to "open"
            '.sb-l-m' - Sets Left Sidebar to "minified"
            '.sb-l-c' - Sets Left Sidebar to "closed"

            '.sb-r-o' - Sets Right Sidebar to "open"
            '.sb-r-c' - Sets Right Sidebar to "closed"
         ---------------------------------------------------------------+
           Example: <body class="example-page sb-l-o sb-r-c">
           Results: Sidebar left Open, Sidebar right Closed
         --------------------------------------------------------------->
        <div id="skin-toolbox" style="display:none;">
            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-icon">
                        <i class="fa fa-gear text-primary"></i>
                    </span>
                    <span class="panel-title"> Opciones visuales</span>
                </div>
                <div class="panel-body pn">
                    <ul class="nav nav-list nav-list-sm pl15 pt10" role="tablist">
                        <li class="active">
                            <a href="#toolbox-header" role="tab" data-toggle="tab">Color barra de título</a>
                        </li>
                        <li>
                            <a href="#toolbox-sidebar" role="tab" data-toggle="tab">Barra de navegación</a>
                        </li>
                        <li>
                            <a href="#toolbox-settings" role="tab" data-toggle="tab">Diseño de barra de titulo</a>
                        </li>
                    </ul>
                    <div class="tab-content p20 ptn pb15">
                        <div role="tabpanel" class="tab-pane active" id="toolbox-header">
                            <form id="toolbox-header-skin">
                                <h4 class="mv20">Colores</h4>
                                <div class="skin-toolbox-swatches">
                                    <div class="checkbox-custom checkbox-disabled fill mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin8" checked value="">
                                        <label for="headerSkin8">Light</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-primary mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin1" value="bg-primary">
                                        <label for="headerSkin1">Primario</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-info mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin3" value="bg-info">
                                        <label for="headerSkin3">Información</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-warning mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin4" value="bg-warning">
                                        <label for="headerSkin4">Advertencia</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-danger mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin5" value="bg-danger">
                                        <label for="headerSkin5">Peligro</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-alert mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin6" value="bg-alert">
                                        <label for="headerSkin6">Alerta</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-system mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin7" value="bg-system">
                                        <label for="headerSkin7">Sistema</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-success mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin2" value="bg-success">
                                        <label for="headerSkin2">Del Campo</label>
                                    </div>
                                    <div class="checkbox-custom fill mb5">
                                        <input type="radio" name="headerSkin" id="headerSkin9" value="bg-dark">
                                        <label for="headerSkin9">Oscuro</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="toolbox-sidebar">
                            <form id="toolbox-sidebar-skin">
                                <h4 class="mv20">Color menu lateral</h4>
                                <div class="skin-toolbox-swatches">
                                    <div class="checkbox-custom fill mb5">
                                        <input type="radio" name="sidebarSkin" checked id="sidebarSkin3" value="">
                                        <label for="sidebarSkin3">Dark</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-disabled mb5">
                                        <input type="radio" name="sidebarSkin" id="sidebarSkin1" value="sidebar-light">
                                        <label for="sidebarSkin1">Light</label>
                                    </div>
                                    <div class="checkbox-custom fill checkbox-light mb5">
                                        <input type="radio" name="sidebarSkin" id="sidebarSkin2" value="sidebar-light light">
                                        <label for="sidebarSkin2">Lighter</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="toolbox-settings">
                            <form id="toolbox-settings-misc">
                                <h4 class="mv20 mtn">Opciones de diseño</h4>
                                <div class="form-group">
                                    <div class="checkbox-custom fill mb5">
                                        <input type="checkbox" checked="" id="header-option">
                                        <label for="header-option">Cabecera fija</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox-custom fill mb5">
                                        <input type="checkbox" checked="" id="sidebar-option">
                                        <label for="sidebar-option">Menu fijo</label>
                                    </div>
                                </div>
                                <div class="form-group" style="display:none;">
                                    <div class="checkbox-custom fill mb5">
                                        <input type="checkbox" id="breadcrumb-option">
                                        <label for="breadcrumb-option">Fixed Breadcrumbs</label>
                                    </div>
                                </div>
                                <div class="form-group" style="display:none;">
                                    <div class="checkbox-custom fill mb5">
                                        <input type="checkbox" id="breadcrumb-hidden">
                                        <label for="breadcrumb-hidden">Hide Breadcrumbs</label>
                                    </div>
                                </div>
                                <h4 class="mv20">Opciones de diseño</h4>
                                <div class="form-group">
                                    <div class="radio-custom mb5">
                                        <input type="radio" id="fullwidth-option" checked name="layout-option">
                                        <label for="fullwidth-option">Fullwidth Layout</label>
                                    </div>
                                </div>
                                <div class="form-group mb20">
                                    <div class="radio-custom radio-disabled mb5">
                                        <input type="radio" id="boxed-option" name="layout-option" disabled>
                                        <label for="boxed-option">Boxed Layout
                                            <b class="text-muted">(Coming Soon)</b>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="form-group mn br-t p15">
                        <a href="#" id="clearLocalStorage" class="btn btn-primary btn-block pb10 pt10">Limpiar configuración</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: Theme Settings Pane -->
         <div id="main">
        <!-- Start: Header -->
    <header class="navbar navbar-fixed-top">
      <div class="navbar-branding">
        <a class="navbar-brand" href="#">
          <b>ORIE</b>
        </a>
        <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
      </div>
      <ul class="nav navbar-nav navbar-left">
        
        <li class="hidden-xs">
          <a class="request-fullscreen toggle-active" href="#">
            <span class="ad ad-screen-full fs18"></span>
          </a>
        </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="ad ad-radio-tower fs18"></span>
          </a>
          <ul class="dropdown-menu media-list w350 animated animated-shorter fadeIn" role="menu">
            <li class="dropdown-header">
              <span class="dropdown-title"> Notificaciones</span>
              <span class="label label-warning">12</span>
            </li>
            <li class="media">
                <p>Notificación 1</p>  
            </li>
            
          </ul>
        </li>
       
        <li class="dropdown">
          <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown"> <img  src="<c:url value='/resources/img/user.png'/>" alt="avatar" class="mw30 br64 mr15"> ${sessionScope.ses_usuario}
            <span class="caret caret-tp hidden-xs"></span>
          </a>
          <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
            <li class="dropdown-header clearfix">
              <div class="pull-left ml12">
                  <p>Activar/Desactivar Configuracion de tema</p>
                  <div class="pull-right">
                        <div class="switch switch-success round switch-inline">
                            <input id="activaTema" type="checkbox">
                            <label for="activaTema"></label>
                        </div>
                  </div>
                  
              </div>

              

            </li>  
            <li class="dropdown-footer">
              <a href="closeSesU.gdc" class="">
              <span class="fa fa-power-off pr5"></span> Cerrar sesion </a>
            </li>
          </ul>
        </li>
      </ul>

    </header>
    <!-- End: Header -->
    <!-- Start: Sidebar Left -->
    <aside id="sidebar_left" class="nano nano-primary affix">

      <!-- Start: Sidebar Left Content -->
      <div class="sidebar-left-content nano-content">

       

        <!-- Start: Sidebar Left Menu -->
        <ul class="nav sidebar-menu">
          <li class="sidebar-label pt20">Matrícula</li>
          <li>
            <a href="PrimerIngreso.gdc">
              <span class="glyphicon glyphicon-plus-sign"></span>
              <span class="sidebar-title">Primer ingreso</span>
            </a>
          </li>
          <li>
            <a href="Reingreso.gdc">
              <span class="glyphicon glyphicon-repeat"></span>
              <span class="sidebar-title">Reingreso</span>
            </a>
          </li>
          
        </ul>
        <!-- End: Sidebar Menu -->

	      <!-- Start: Sidebar Collapse Button -->
	      <div class="sidebar-toggle-mini">
	        <a href="#">
	          <span class="fa fa-sign-out"></span>
	        </a>
	      </div>
	      <!-- End: Sidebar Collapse Button -->

      </div>
      <!-- End: Sidebar Left Content -->

    </aside>
    <!-- End: Sidebar Left -->    
    <section id="content_wrapper">
        <section id="content" class="animated fadeIn">
                <div class="content-header">
                    <h2><b class="text-success">Formulario de Solicitud para Admisión 2016-2017</b></h2>
                    <p class="text-justify"><strong>Instrucciones:</strong> Este parte es del paquete de admisión usado en DelCampo International School
                     favor completar este formato cuidadosamente, teniendo la opcion que usted puede adjuntar directamente los documentos requeridos
                    para el grado que desea matricular.</p>
                </div>
                <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        
                        <a href="#Section1" aria-controls="informacion" role="tab" data-toggle="tab">
                            <img style="position: relative;top:15px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive">
                            <i class="fa fa-user"></i>Información sobre el estudiante
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#Section2" aria-controls="tutor" role="tab" data-toggle="tab">
                            <img style="position: relative;top:15px;left: -10px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive">
                            <i class="fa fa-group"></i>Tutor/Tutora
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#Section3" aria-controls="otra" role="tab" data-toggle="tab">
                             <img style="position: relative;top:15px;left: -10px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive">
                            <i class="fa fa-folder"></i>Otra Información
                        </a>
                    </li>
                    <li role="presentation"><a href="#Section4" aria-controls="educacion" role="tab" data-toggle="tab">
                             <img style="position: relative;top:15px;left: -10px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive">
                            <i class="fa fa-dedent"></i>Educación</a>
                    </li>
                    <li role="presentation"><a href="#Section5" aria-controls="otros" role="tab" data-toggle="tab">
                            <img style="position: relative;top:15px;left: -25px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive">
                            <i class="fa fa-list-alt"></i>Otros</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!--Div datos 1--> 
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                        <div class="admin-form theme-primary mw1000 center-block" id="contenedor1">
                        <form id="defaultForm" action="#"
                              data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                              data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                              data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">    
                        <div class="content-header">
                          <h2><b class="text-success">Información sobre el estudiante</b></h2>
                        </div>
                        
                        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
                        <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                            <div class="form-group">
                                <label for="pnestudiante">*Primer Nombre:</label>
                                <input maxlength="120" type="text" class="form-control gui-input" name="pnestudiante" id="pnestudiante" placeholder="Primer nombre" data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" />
                        
                            </div>
                        </div>    
                        <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                          
                            <div class="form-group">
                                <label for="snestudiante">Segundo Nombre:</label>
                                <input  class="gui-input form-control" maxlength="120" type="text" id="snestudiante" name="" placeholder="Segundo Nombre">
                            </div> 
                        </div>
                        <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                          
                            <div class="form-group">
                                <label for="paestudiante">*Primer Apellido:</label>
                                <input class="form-control gui-input" type="text" maxlength="120"  id="paestudiante" name="paestudiante" placeholder="Primer Apellido" data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio">
                            </div>  
                        </div>
                        <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                            <div class="form-group">
                                <label for="saestudiante">Segundo Apellido:</label>
                                <input class="gui-input form-control" type="text" maxlength="120" id ="saestudiante" name="" placeholder="Segundo Apellido">
                            </div>
                        
                        </div>    
                        </div>  
                        
                        <div class="row" id="capturaDire" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
                            <h3 style="margin-left: 6px;"><b class="text-success">Mi ubicación actual:</b></h3> 
                            <div class="col-md-4">
                                <div id="map" style="position: relative;width: 100%;height: 250px;border-radius: 10px 10px 10px 10px;
                                    -moz-border-radius: 10px 10px 10px 10px;
                                    -webkit-border-radius: 10px 10px 10px 10px;
                                    border: 5px solid #0e6e15;"></div>
                            </div>  
                            <div class="col-md-5">
                                <button type="button" class="btn btn-lg btn-rounded btn-success btn-block" onclick="cargardatos();"><span class="glyphicon glyphicon-map-marker"></span> Usar datos de  mi ubicación para la dirección</button>
                            </div>
                            
                        </div>
                        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
                            <br><br>    
                            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label for="direcestudiante">*Dirección de casa:</label>
                                    <textarea data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="form-control" id="direcestudiante" name="direcestudiante" rows="4"></textarea>
                                </div> 
                            </div>
                            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label for="ciudestudiante">*Ciudad:</label>
                                    <input data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="gui-input form-control" type="text" maxlength="180" id ="ciudestudiante" name="ciudestudiante" placeholder="Ciudad">
                                </div>  
                            </div>    
                            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label for="telestudiante">Teléfono Celular:</label>
                                    <input class="gui-input form-control" maxlength="15" type="text" id ="telestudiante" name="" placeholder="Teléfono Celular">
                                </div>  
                            </div>  
                        </div> 
                        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
                            <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                                <label class="control-label mb15">*Género:</label>
                                <label style="color:red;display:none;" id="genval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                <div class="radio-custom radio-success mb5">
                                    <input type="radio" id="mascu" value="M"  name="radioGenero">
                                    <label for="mascu">Masculino</label>
                                </div>
                                <div class="radio-custom radio-success mb5">
                                    <input type="radio" id="feme" value="F"  name="radioGenero">
                                    <label for="feme">Femenino</label>
                                </div>
                            </div> 
                            <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                                <div class="form-group">
                                    <label for="edad">*Edad:</label>
                                    <input class="gui-input form-control" maxlength="15" type="number" data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" id ="edad" name="edad" placeholder="Edad" max="120" min="1">
                                </div>
                            </div> 
                            <div class="col-md-3 col-sm-3 col-lg-3">
                                <div class="form-group">
                                    <label for="edad">*Fecha de Nacimiento:</label>
                                    <input type="text" data-bv-trigger="change" required data-bv-notempty-message="Campo obligatorio" style="cursor:pointer;" id="fechanac" name="fechanac" class="form-control" />
                                </div>
                            
                            </div> 
                            <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                                <div class="form-group">
                                    <label>*País de nacimiento:</label>
                                    <label style="color:red;display:none;" id="paisval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                    <select class="select2-single form-control"  id="pais" name="pais">
                                        <option value=""></option>
                                        <c:set var="valida" value="${fn:length(paisTemp)}" />
                                        <c:if test="${valida > 0}">
                                            <c:forEach var="i" begin="0" end="${fn:length(paisTemp)-1}">
                                                <option value="${idpaisTemp[i]}">${paisTemp[i]}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    
                                </div>
                            </div> 
                            
                        </div>
                        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
                            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label>*Nacionalidad:</label>
                                    <label style="color:red;display:none;" id="nacionval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                    <select class="select2-single form-control" id="nacionalidad" name="nacionalidad" data-bv-trigger="keyup" required="required" data-bv-notempty-message="Campo obligatorio">
                                        <option value=""></option>
                                        <c:set var="valida" value="${fn:length(nacionTemp)}" />
                                        <c:if test="${valida > 0}">
                                            <c:forEach var="i" begin="0" end="${fn:length(nacionTemp)-1}">
                                                <option value="${nacionTemp[i]}">${nacionTemp[i]}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    
                                </div>
                            </div> 
                            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                                 <div class="form-group">
                                    <label for="nIdentidad">*Número de identidad:</label>
                                    <input class="gui-input form-control" nacionalidad maxlength="13" type="text" data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" id ="nIdentidad" name="nIdentidad" placeholder="xxxxxxxxxxxxx">
                                </div>           
                            </div>
                            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label for="correo">Correo electrónico:</label>
                                    <input class="gui-input form-control" maxlength="150" type="email" id ="correo" name="correo" placeholder="example@dominio.com">
                                </div>
                            </div>
                        </div> 
                        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
                            <div class="form-group">
                            <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                                <button type="submit" class="btn btn-lg btn-primary btn-block"><span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
                            </div>
                            </div>
                        </div>  
                          
                        </form>                
                    </div>
                    </div>                    
                    <!--Div datos 2-->      
                    <div role="tabpanel" class="tab-pane fade" id="Section2">
                        <h3>Section 2</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pretium, metus et scelerisque dignissim, ligula est imperdiet nisl, sit amet malesuada nunc felis in nisi. Nullam dapibus ligula dui, in rhoncus purus euismod nec. Duis in lacinia neque. Etiam tellus.
                        </p>
                    </div>
 
                    <div role="tabpanel" class="tab-pane fade" id="Section3">
                        <h3>Section 3</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pretium, metus et scelerisque dignissim, ligula est imperdiet nisl, sit amet malesuada nunc felis in nisi. Nullam dapibus ligula dui, in rhoncus purus euismod nec. Duis in lacinia neque. Etiam tellus.
                        </p>
                    </div>
                    
                    <div role="tabpanel" class="tab-pane fade" id="Section4">
                        <h3>Section 4</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pretium, metus et scelerisque dignissim, ligula est imperdiet nisl, sit amet malesuada nunc felis in nisi. Nullam dapibus ligula dui, in rhoncus purus euismod nec. Duis in lacinia neque. Etiam tellus.
                        </p>
                    </div>
                    
                    <div role="tabpanel" class="tab-pane fade" id="Section5">
                        <h3>Section 5</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pretium, metus et scelerisque dignissim, ligula est imperdiet nisl, sit amet malesuada nunc felis in nisi. Nullam dapibus ligula dui, in rhoncus purus euismod nec. Duis in lacinia neque. Etiam tellus.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <div id="ajaxtemp"></div>        
        </section>
    </section>
                            
       <!-- Modal -->
        <div class="modal" id="modalcarg" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="container">
              
            <div class='row' > 
                   <div class="col-sm-12">
                    <div class="col-sm-6 col-sm-offset-3">
                        <button id="btnCerrar" type="button" class="close" data-dismiss="modal" style="color:white;">×</button>  
                        <br>                        
                        <div id="errores">
                            <div class="panel">
                                      <div class="panel-body p10">
                                        <blockquote class="mbn ml10">
                                          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat Lorem ipsum dolor sit amet, dolor sit amet lorem adpiz. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean felis sapien, vestibulum in dignissim vitae, condimentum eu nibh. </p>
                                          <small>Someone famous</small>
                                        </blockquote>
                                      </div>
                            </div>
                                                        
                        </div>
                    </div>
                    </div>
                   
            </div>                 
            </div>
        </div>                  
    
         </div>  
       <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.magnific-popup.js'/>"></script>
       <script src="<c:url value='/resources/js/bootstrapValidator.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.steps.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jsvalidaFormulario.js'/>"></script>
       <script src="<c:url value='/resources/js/validCampo.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
       <script src="<c:url value='/resources/jsOr/sweetalert2.min.js'/>"></script>
       <script src="<c:url value='/resources/js/picker.js'/>"></script>
       <script src="<c:url value='/resources/js/picker.date.js'/>"></script>
       <script src="<c:url value='/resources/js/globalize.min.js'/>"></script>
       <script src="<c:url value='/resources/js/select2.min.js'/>"></script>
       <script src="<c:url value='/resources/js/typeahead.bundle.min.js'/>"></script>
       <script type="text/javascript">
        jQuery(document).ready(function() {

            "use strict";

            // Init Theme Core      
            Core.init();

            // Init Demo JS
            Demo.init();

            
            });
        
           
    </script>
   <script>
        var lt = 0;
        var lg = 0;
        var activaMapa="n";
        var direccion = "";
        var ciudad = "";
        var departament = "";
        var pais = "";
        function initMap() {
  var myLatLng = {lat: -25.363, lng: 131.044};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: myLatLng
  });
  
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      lt = position.coords.latitude;
      lg = position.coords.longitude;
      
      map.setCenter(pos);
      
      var marker = new google.maps.Marker({
            position: pos,
            map: map,
            title: 'Mi ubicacion.'
        });
        
        loadJSON(lt,lg);
    }, function() {
     alert("Ocurrio un error");
    });
  } else {
    // Browser doesn't support Geolocation
    alert("Ocurrio un error");
  }

  
  }
  
        function loadJSON(lt,lg){
            var data_file = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+lt+","+lg+"&sensor=true";
            
            var http_request = new XMLHttpRequest();
            try{
               // Opera 8.0+, Firefox, Chrome, Safari
               http_request = new XMLHttpRequest();
            }catch (e){
               // Internet Explorer Browsers
               try{
                  http_request = new ActiveXObject("Msxml2.XMLHTTP");
					
               }catch (e) {
				
                  try{
                     http_request = new ActiveXObject("Microsoft.XMLHTTP");
                  }catch (e){
                     // Something went wrong
                     alert("Your browser broke!");
                     return false;
                  }
					
               }
            }
			
            http_request.onreadystatechange = function(){
			
               if (http_request.readyState == 4  ){
                  // Javascript function JSON.parse to parse JSON data
                  var jsonObj = JSON.parse(http_request.responseText);
                       
                  direccion = jsonObj.results[0].formatted_address;
                  ciudad = jsonObj.results[0].address_components[2].long_name;
                  departament = jsonObj.results[0].address_components[3].long_name;
                  pais = jsonObj.results[0].address_components[4].long_name;
                  
               }
            }
			
            http_request.open("GET", data_file, true);
            http_request.send();
         }
  




    </script>
      
        <script async defer
         src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMXZ20Y3ubvTYHaQ_QiO3BYZCoYhWfGZ8&libraries=places&callback=initMap">
        </script> 
      
       <style>
  /*page demo styles*/
  .wizard .steps .fa,
  .wizard .steps .glyphicon,
  .wizard .steps .glyphicon {
    display: none;
  }
  </style>
    </body>
</html>

