<%-- 
    Document   : pgCuentaBalance
    Created on : 08-mar-2017, 8:13:29
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="<c:url value='/resources/favicon/favicon.ico'/>">
        <!-- Font CSS (Via CDN) -->
        <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600'>
        <!-- Theme CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme2.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/theme3.css'/>">

        <!-- Admin Forms CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/admin-forms.css'/>">
        <style type="text/css">
            #contentbanco{
                display :none ;
            }
        </style>
   </head>
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

        <!-- begin: .tray-center -->
        <div class="tray tray-center">

        

         
        
       
            <div class="page-heading" id="subcuentamayor">
            <div class="media clearfix">
                <div class="admin-form">
                    <div class="panel heading-border">
                        <div class="panel-body bg-light">
                            <form  id="form-ui">
                                <div class="section-divider mb40" id="spy1">
                                    <span>Sub-Cuenta </span>
                                </div>
                                <div class="row">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="section">
                                            <label class="field " for="areacr">
                                                <h3>Cuenta Origén:</h3>  
                                            </label>
                                        </div>
                                    
                                     
                                        <div class="section">
                                          <label class="field select">
                                              <select class="form-control" name="CATALOGO" id="origen" onchange="#">
				                <option value="">Seleccione la Cuenta de Origen</option>
				                
				            </select>
                                             
                                            <i class="arrow"></i>
                                          </label>
                                        
                                      </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="section">
                                            <label class="field " for="areacr">
                                                <h3>Cuenta :</h3>  
                                            </label>
                                        </div>
                                   
                                        <div class="section">
                                          <label class="field select">
                                              <select class="form-control" name="CATALOGO" id="cuenta" onchange="#">
				                <option value="">Seleccione  la Cuenta </option>
				                
				            </select>
                                             
                                            <i class="arrow"></i>
                                          </label>
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Sociedad:</h3>  
                                            </label>
                                        </div>
                                    
                                        <div class="section">
                                          <label class="field select">
                                              <select class="form-control" name="CATALOGO" id="sociedad" onchange="llenarcombocuentasResultados()">
				                <option value="">Seleccione  la Sociedad</option>
				                
				            </select>
                                             
                                            <i class="arrow"></i>
                                          </label>
                                        </div>
                                      </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Codigo De Cuenta:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                            <input class="form-control" type="text" name="" id ="codigocuenta"placeholder="Codigo Generado " value="">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Nombre de la Sub-Cuenta:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="nombre"placeholder="Ingrese el Nombre de la Cuenta">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Descripción del Estado :</h3>  
                                            </label> 
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="descripcion"placeholder="Descripcion">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Observación de la Cuenta  :</h3>  
                                            </label> 
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="observacion"placeholder="Observación">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Depuración  :</h3>  
                                            </label> 
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="depuracion"placeholder="Depuración">
                                        </div>
                                      </div>
                                </div>
                                   <label class="switch block mt15">
                                        <input type="checkbox" name="features" id="idestadoV" value="popups" checked>
                                        <label for="f4" data-on="ON" data-off="OFF"></label>
                                        <span>Estado de la Cuenta </span>
                                      </label>
                                <div class="panel-footer text-right">
                                    <button type="button" class="button btn-primary"onclick="validarcuentaresultado()"> Validate Form </button>
                                    <button type="reset" class="button"> Cancel </button>
                                  </div>
                            </form>
                        </div> 

                    </div>
                </div>
                
                
            </div>
        </div>
           
            </div>
             <div class="page-heading" id="cuentamayor">
            <div class="media clearfix">
                <div class="admin-form">
                    <div class="panel heading-border">
                        <div class="panel-body bg-light">
                            <form  id="form-ui">
                                <div class="section-divider mb40" id="spy1">
                                    <span>Cuenta Mayor</span>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Cuenta Origen :</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <label class="field select">
                                              <select class="form-control" name="CATALOGO" id="origenmayor" onchange="llenarcombocuentasResultados()">
				                <option value="">Seleccione la Cuenta Origen</option>
				                
				            </select>
                                             
                                            <i class="arrow"></i>
                                          </label>
                                        </div>
                                      </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Codigo De Cuenta:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                            <input class="form-control" type="text" name="" id ="codigomayor"placeholder="Codigo Generado por los Seleccione de area y Tipo" value="">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Nombre de la Cuenta:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="nombremayor"placeholder="Ingrese el Nombre de la Cuenta">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Observación:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="obsevacionmayor"placeholder="Ingrese el Nombre de la Cuenta">
                                        </div>
                                      </div>
                                      </div>
                                
                                <div class="panel-footer text-right">
                                    <button type="button" class="button btn-primary"onclick="validarcuentaresultado()"> Validate Form </button>
                                    <button type="reset" class="button"> Cancel </button>
                                  </div>
                            </form>
                        </div> 
                    </div>
                        

                    
                </div>
                </div>
                
                
            </div>
            <div class="page-heading" id="cuentaorigen">
            <div class="media clearfix">
                <div class="admin-form">
                    <div class="panel heading-border">
                        <div class="panel-body bg-light">
                            <form  id="form-ui">
                                <div class="section-divider mb40" id="spy1">
                                    <span>Cuenta Origén</span>
                                </div>
                               
                               
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Codigo De Cuenta:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                            <input class="form-control" type="text" name="" id ="codigoorigen"placeholder="Codigo Generado por los Seleccione de area y Tipo" value="">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Nombre de la Cuenta:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="nombreorigen"placeholder="Ingrese el Nombre de la Cuenta">
                                        </div>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field ">
                                                <h3>Observación:</h3>  
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="section">
                                          <input class="form-control" type="text" name="" id ="observacionorigen"placeholder="Ingrese el Nombre de la Cuenta">
                                        </div>
                                      </div>
                                </div>
                                <div class="panel-footer text-right">
                                    <button type="button" class="button btn-primary"onclick="validarcuentaresultado()"> Validate Form </button>
                                    <button type="reset" class="button"> Cancel </button>
                                  </div>
                            </form>
                        </div> 

                    </div>
                </div>
                
                
            </div>
        </div>
        
       
       
     <%--  <section id="content" class="animated fadeIn">
            <div class="page-heading">
                <div class="media clearfix">
                    <div class="admin-form">
                        <div class="panel heading-border">
                            <div class="panel-body bg-light">
                                <div class="col-sm-12">
                                        <div class="panel">
                                          <div class="panel-body pn">
                                            <div class="bs-component">
                                              <table class="table">
                                                <thead>
                                                  <tr class="danger">
                                                    <th>#</th>
                                                    <th>First Name</th>
                                                    <th>
                                                      
                                                    </th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                     <c:forEach var="j" begin="0" end="${fn:length(codigoarea)-1}">
                                                    <c:set var="contador" value="${j+1}"/>
                                                    <option value=""></option>
                                                          <tr>
                                                    <td>${codigoarea[j]}</td>
                                                    <td>${nombrearea[j]}</td>
                                                    <td>${codigomadre[j]}</td>
                                                    <td>${nombremadre[j]}</td>
                                                    <td>${codigohija[j]}</td>
                                                    <td>${nombrehija[j]}</td>
                                                                                                       
                                                  </tr>
                                                    </c:forEach> 
                                                 
                                                 
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
              
 

        </div>
        <!-- end: .tray-center -->
        </section>
        </section>
        
              
    </section>
    
    <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/widgets.js'/>"></script>
       <script src="<c:url value='/resources/js/jsValidaPerfil.js'/>"></script>
       <script src="<c:url value='/resources/js/Cuen_contabilidad.js'/>"></script>
       
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
