<%-- 
    Document   : pgSC_partidasContables
    Created on : 22-mar-2017, 14:39:27
    Author     : Sinergia003
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="valida" value="${sessionScope.ses_estado}" />
<c:if test="${valida != 'Activa'}">
<c:redirect url="login.gdc"/>
</c:if>
<c:set var="validaLista" value="${fn:length(sessionScope.ses_menus)}" />
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
        <style type="text/css">
            #contentbanco{
                display :none ;
            }
        </style>
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
    <body class="profile-page">
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
        <a class="navbar-brand" href="perfil.gdc">
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
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-user"></span> Perfil
                
              </a>
            </li>
               
            <li class="dropdown-footer">
              <a href="closeSes.gdc" class="">
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
              <c:if test="${validaLista > 0}">
                <c:forEach var="i" begin="0" end="${fn:length(sessionScope.ses_labels)-1}">
                    <li class="sidebar-label pt20">${sessionScope.ses_labels[i]}</li>
                    <c:forEach var="j" begin="0" end="${fn:length(sessionScope.ses_urlmen)-1}">
                    <li>
                        <a href="${sessionScope.ses_urlmen[j]}">
                          <span class="${sessionScope.ses_iconosmenu[j]}"></span>
                          <span class="sidebar-title">${sessionScope.ses_menus[j]}</span>
                        </a>
                    </li>
                    </c:forEach>
                </c:forEach>
            </c:if>
          
          
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
    <section id="content_wrapper" >
        
        <section id="content" class="animated fadeIn">
            
             <!-- begin: .tray-left -->
        <section id="content" class="table-layout animated fadeIn">
            <%--
        <!-- begin: .tray-left -->
             <aside class="tray tray-left tray290">

          <h4> Admin Widgets -
            <small>A Theme Exclusive</small>
          </h4>
          <ul class="icon-list">
            <li>
              <i class="fa fa-exclamation-circle text-warning fa-lg pr10"></i>
              <b> Author:</b> Admin Designs
            </li>
            <li>
              <i class="fa fa-exclamation-circle text-warning fa-lg pr10"></i>
              <b> License:</b> CC - Commercial 3.0
            </li>
            <li>
              <i class="fa fa-exclamation-circle text-warning fa-lg pr10"></i>
              <b> Info:</b>
              <a href="http://www.themeforest.net/user/AdminDesigns"> www.admindesigns.com </a>
            </li>
          </ul>

          <div id="nav-spy">
            <ul class="nav tray-nav tray-nav-border" data-smoothscroll="-145" data-spy="affix" data-offset-top="200">
              <li class="active">
                <a href="#subcuentamayor">
                 Crear  Sub-Cuenta Mayor</a>
              </li>
              <li>
                <a href="#cuentamayor">
                  Crear  Cuenta Mayor</a>
              </li>
              <li>
                <a href="#cuentaorigen">
                  Crear cuenta Origen</a>
              </li>
              
            </ul>
          </div>

        </aside>
        <!-- end: .tray-left -->
--%>
        <!-- begin: .tray-center -->
        <div class="tray tray-center">

        

            <div id="alerta2" ></div>
              
       
            <div class="page-heading" >
            <div class="media clearfix">
         <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active" id="btncrearpartidas">
                        
                        <a href="#crearpartidas" aria-controls="informacion" role="tab" data-toggle="tab">
                            <img style="position: relative;top:15px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive"><br>
                            <i class="fa fa-user"></i>Crear Partida
                        </a>
                    </li>
                    <li role="presentation" id="btnverpartidas">
                        <a href="#Section2" aria-controls="tutor" role="tab" data-toggle="tab">
                            <img style="position: relative;top:15px;left: -10px;"  src="<c:url value='/resources/img/done.png'/>" alt="check" class="img-responsive"><br>
                            <i class="fa fa-group"></i>Ver partidas
                        </a>
                    </li>
                    
                    
                    
                </ul> 
                            <br><br>
            <div class="page-heading"id="crearpartidas" >
              
            <div class="media clearfix">
                   
                <div class="admin-form">
            
                    <div class="panel heading-border">
                        
                     
                        <div class="panel-body bg-light" >
                            <form  id="form-ui"action="#"
                              data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                              data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                              data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                                <div class="section-divider mb40" id="spy1">
                                    <span> </span>
                                </div>
                                <div class="row">
                                    <div class="row">
                                       <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
                                            <div class="form-group">
                                                <label for="nombret">*Nombre :</label><label style="color:red;display:none;" id="nombreval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                                <textarea data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="form-control" id="nombret" name="nombret" rows="2"></textarea>
                                            </div> 
                                        </div> 
                                    </div>
                                       <div class="row">
                                   <div class="col-md-3 col-sm-3 col-lg-3">
                                <div class="form-group">
                                    <label for="fecha">*Fecha :<label style="color:red;display:none;" id="fechaval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label></label>
                                    <input type="text" data-bv-trigger="change" required data-bv-notempty-message="Campo obligatorio" style="cursor:pointer;" id="fecha" name="fecha" class="form-control" />
                                </div>
                                 </div> 
                                  
                                  
                                  <div class="col-md-5 col-sm-5 col-lg-5 col-xs-5">
                                <div class="form-group">
                                    <label>Origen:</label>
                                    <label style="color:red;display:none;" id="origenval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                    <select class="select2-single form-control"  id="origen" name="origen"onchange="llenarcombcuenta()">
                                        <option value=""></option>
                                        <c:set var="valida" value="${fn:length(idorigen)}" />
                                        <c:if test="${valida > 0}">
                                             <c:forEach var="i" begin="0" end="${fn:length(idorigen)-1}">
                                                    <option value="${idorigen[i]}">${nombreorigen[i]}</option>
                                                </c:forEach>
                                        </c:if>
                                    </select>
                                    
                                          </div>
                                    </div> 
                                        <div class="col-md-4 col-sm-4col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label>Cuenta:</label>
                                    <label style="color:red;display:none;" id="cuentaval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                    <select class="select2-single form-control"  id="cuenta" name="cuenta" >
                                        <option value=""></option>
                                       
                                    </select>
                                    
                                          </div>
                                    </div> 
                              
                             </div>
                                        <div class="row">
                               <div class="col-md-5 col-sm-5 col-lg-5 col-xs-5">
                                <div class="form-group">
                                    <label>Sociedad:</label>
                                    <label style="color:red;display:none;" id="sociedadval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                    <select class="select2-single form-control"  id="sociedad" name="sociedad"onchange="llenarcombosubcuenta()">
                                        <option value=""></option>
                                        <c:set var="valida" value="${fn:length(idsociedad)}" />
                                        <c:if test="${valida > 0}">
                                             <c:forEach var="i" begin="0" end="${fn:length(idsociedad)-1}">
                                                 <c:if test="${idsociedad[i] != '4'}">
                                                    <option value="${idsociedad[i]}">${sociedadnombre[i]}</option>
                                                    </c:if>
                                                </c:forEach>
                                        </c:if>
                                    </select>
                                    
                                          </div>
                                    </div> 
                                     
                                <div class="col-md-4 col-sm-4col-lg-4 col-xs-4">
                                <div class="form-group">
                                    <label>Sub-Cuenta:</label>
                                    <label style="color:red;display:none;" id="subcuentaval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                    <select class="select2-single form-control"  id="subcuenta" name="cuenta" >
                                        <option value=""></option>
                                       
                                    </select>
                                    
                                          </div>
                                    </div>
                                    </div>     
                                        
                         
                                        <div class="panel-footer text-right" id="btnagregar">
                                    <button type="button" class="button btn-primary"id="crearpart" > Agregar a la Partida </button>
                                    <button type="reset" class="button"> Cancelar </button>
                                  </div>
                        </div> 
                        </form>

              
                    </div>
                </div>
                
               
            </div>
                                       
        </div>
          
            </div>
              <div class="page-heading"id="partida" style="display:none;">
                
                          <div class="media clearfix" >
                <div class="admin-form">
                    <div class="panel heading-border">
                        <div class="panel-body bg-light">
                             <div class="section-divider mb40" id="spy1">
                                    <span>Partida Contable</span>
                                </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
                                            <div class="form-group">
                                                <label for="Descripcion">*Descripción:</label><label style="color:red;display:none;" id="descripcionval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                                <textarea data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="form-control" name="des" rows="2"id="des"></textarea>
                                            </div> 
                                </div>
                             
                            </div>
                             <div class="row">
                               
                                  <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                                <label class="control-label mb15">*Seleccione el movimiento:</label><label style="color:red;display:none;" id="movival"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                <label style="color:red;display:none;" id="movival"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                <div class="radio-custom radio-success mb5">
                                    <input type="radio" id="Debito" value="D"  name="movi">
                                    <label for="Debito">DEBE</label>
                                </div>
                                <div class="radio-custom radio-success mb5">
                                    <input type="radio" id="Credito" value="H"  name="movi">
                                    <label for="Credito">HABER</label>
                                </div>
                            </div>
                             <div class="col-md-5 col-sm-5 col-lg-5 col-xs-5">
                                            <div class="form-group">
                                                <label for="monto">*Monto:</label><label style="color:red;display:none;" id="montoval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                                                <input data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio"onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                       class="gui-input form-control" type="text" maxlength="180" id ="monto" name="monto" placeholder="Lps. 0000.00">
                                            </div>  
                             </div>
                                 
                         
                                </div>
                            <div class="row">
                                
                                   <div class="panel-footer text-right" id="btnt"style="display:none;">
                                   
                                    <button type="button" class="button btn-primary"id="add" > Agregar a la Partida </button>
                                    <button type="reset" class="button"> Cancelar </button>
                                  </div>
                                   <div class="panel-footer text-right" id="btnmodificar"style="display:none;">
                                   
                                    <button type="button" class="button btn-primary"id="modificar">   Modificar   </button>
                                    <button type="reset" class="button"> Cancelar </button>
                                  </div>
                            </div>
                            
                                
                            <div class="row">
                                <table class="table table-responsive" id="tpartida">
                                <thead>
                                  <tr class="primary">
                                    
                                      <th >N.Transaccion</th>                                    
                                    <th>Descripcion</th>                                    
                                    <th> Debe</th>                                    
                                    <th> Haber</th>                                    
                                    <th> </th>  
                                  </tr>
                                </thead>
                                <tbody >
                               
                                </tbody>
                                <tfoot id="saldo" >
                                    
                                    <tr<%-- class="primary"--%>>
                                        
                                        <td></td>
                                        <td>Saldo</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                                </table>
                            </div>
                          </div>

                    </div>
                </div>
                
                
            </div>
        </div>
           
            </div>
        
       
       
     
 

        </div> 
       
        <!-- end: .tray-center -->
        </section>
        </section>
        
              
    </section>
    
    
     </div>
                                            
        
                                              
                                            
     
    <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.magnific-popup.js'/>"></script>
       <script src="<c:url value='/resources/js/bootstrapValidator.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.steps.min.js'/>"></script>
      
       <script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
       <script src="<c:url value='/resources/jsOr/sweetalert2.min.js'/>"></script>
       <script src="<c:url value='/resources/js/picker.js'/>"></script>
       <script src="<c:url value='/resources/js/picker.date.js'/>"></script>
       <script src="<c:url value='/resources/js/globalize.min.js'/>"></script>
       <script src="<c:url value='/resources/js/select2.min.js'/>"></script>
       <script src="<c:url value='/resources/js/typeahead.bundle.min.js'/>"></script>
       
       
                                        
    <script src="<c:url value='/resources/js/SC_PartidasCuentas.js'/>"></script>
  
    <script type="text/javascript">
  jQuery(document).ready(function() {

    "use strict";

    // Init Theme Core    
    Core.init();

    // Init Demo JS  
    Demo.init();


    // Form Switcher
    $('#form-switcher > button').on('click', function() {
      var btnData = $(this).data('form-layout');
      var btnActive = $('#form-elements-pane .admin-form.active');

      // Remove any existing animations and then fade current form out
      btnActive.removeClass('slideInUp').addClass('animated fadeOutRight animated-shorter');
      // When above exit animation ends remove leftover classes and animate the new form in
      btnActive.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
        btnActive.removeClass('active fadeOutRight animated-shorter');
        $('#' + btnData).addClass('active animated slideInUp animated-shorter')
      });
    });

    // Cache several DOM elements
    var pageHeader = $('.content-header').find('b');
    var adminForm = $('.admin-form');
    var options = adminForm.find('.option');
    var switches = adminForm.find('.switch');
    var buttons = adminForm.find('.button');
    var Panel = adminForm.find('.panel');

    // Form Skin Switcher
    $('#skin-switcher a').on('click', function() {
      var btnData = $(this).data('form-skin');

      $('#skin-switcher a').removeClass('item-active');
      $(this).addClass('item-active')

      adminForm.each(function(i, e) {
        var skins = 'theme-primary theme-info theme-success theme-warning theme-danger theme-alert theme-system theme-dark';
        var panelSkins = 'panel-primary panel-info panel-success panel-warning panel-danger panel-alert panel-system panel-dark';
        $(e).removeClass(skins).addClass('theme-' + btnData);
        Panel.removeClass(panelSkins).addClass('panel-' + btnData);
        pageHeader.removeClass().addClass('text-' + btnData);
      });

      $(options).each(function(i, e) {
        if ($(e).hasClass('block')) {
          $(e).removeClass().addClass('block mt15 option option-' + btnData);
        } else {
          $(e).removeClass().addClass('option option-' + btnData);
        }
      });
      $(switches).each(function(i, ele) {
        if ($(ele).hasClass('switch-round')) {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-round switch-' + btnData);
          } else {
            $(ele).removeClass().addClass('switch switch-round switch-' + btnData);
          }
        } else {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-' + btnData);
          } else {
            $(ele).removeClass().addClass('switch switch-' + btnData);
          }
        }

      });
      buttons.removeClass().addClass('button btn-' + btnData);
    });

    setTimeout(function() {
      adminForm.addClass('theme-primary');
      Panel.addClass('panel-primary');
      pageHeader.addClass('text-primary');

      $(options).each(function(i, e) {
        if ($(e).hasClass('block')) {
          $(e).removeClass().addClass('block mt15 option option-primary');
        } else {
          $(e).removeClass().addClass('option option-primary');
        }
      });
      $(switches).each(function(i, ele) {

        if ($(ele).hasClass('switch-round')) {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-round switch-primary');
          } else {
            $(ele).removeClass().addClass('switch switch-round switch-primary');
          }
        } else {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-primary');
          } else {
            $(ele).removeClass().addClass('switch switch-primary');
          }
        }
      });
      buttons.removeClass().addClass('button btn-primary');
    }, 800);

  });
  </script>
 
    </body>
</html>
