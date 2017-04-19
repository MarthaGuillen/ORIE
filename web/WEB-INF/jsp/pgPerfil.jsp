<%-- 
    Document   : pgPerfil
    Created on : 22-feb-2017, 19:14:12
    Author     : Sinergia14
--%>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/imageBack.css'/>">
        <script>
            var sociedaddef = "${sessionScope.ses_sociedadDefault}";
            var tipoperf = "${sessionScope.ses_tipoperfil}";
        </script>
        <!-- Admin Forms CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/admin-forms.css'/>">
    </head>
    <body class="profile-page">
   
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
                    <c:if test="${sessionScope.ses_idmenlbl[j] == sessionScope.ses_idlbl[i]}">
                    <li>
                        <a href="${sessionScope.ses_urlmen[j]}">
                          <span class="${sessionScope.ses_iconosmenu[j]}"></span>
                          <span class="sidebar-title">${sessionScope.ses_menus[j]}</span>
                        </a>
                    </li>
                    </c:if>
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
    <section id="content_wrapper">
        
        <section id="content" class="animated fadeIn">
            <div class="page-heading">
            <div class="media clearfix">
              <div class="media-left pr30">
                <a href="#">
                  
                    <img class="media-object mw150 img-responsive"  src="<c:url value='/resources/img/${sessionScope.ses_logoSoc}'/>"   alt="...">
                </a>
              </div>                      
              <div class="media-body va-m">
                <h2 class="media-heading">${sessionScope.ses_usuario}
                  <small> - ${sessionScope.ses_tipoperfil}</small>
                </h2>
                <p class="lead">${descPerfil}</p>
                <p class="lead">Correo electrónico: ${sessionScope.ses_correo}</p>
                <p class="lead">Sociedad default: ${sessionScope.ses_sociedadDefault}</p>
              </div>
            </div>
        </div>
        <h3 class="text-center mb25 fw400">Sociedades a las que pertenece:</h3>
        <div class="row">
            <c:forEach var="i" begin="0" end="${fn:length(soc)-1}">
            <div class="col-md-4">
                <div class="panel">
                    
                </div>
            </div>
            </c:forEach>
            <div class="services">
                
                <div class="container">
                    <c:forEach var="i" begin="0" end="${fn:length(soc)-1}">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="hovereffect">
                            <img class="img-responsive" src="<c:url value='/resources/img/${log[i]}'/>"  alt="">
                            <div class="overlay">
                               <h2>${soc[i]}</h2>
                              
                               <button onclick="cargadefault('${idsoc[i]}')" class='btn btn-lg btn-primary'>Establecer como default</button>
                               
                            </div>
                        </div>
                    </div>
                    </c:forEach>           
                </div>    
                
                
            </div>
        </div>
        
        </section>
        
    </section>
    
         </div> 
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
              <div id="ajaxSociedad"></div>      
       <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/widgets.js'/>"></script>
       <script src="<c:url value='/resources/js/jsValidaPerfil.js'/>"></script>
       <script type="text/javascript">
        jQuery(document).ready(function() {

            "use strict";

            // Init Theme Core      
            Core.init();

            // Init Demo JS
            Demo.init();

            // Init Widget Demo JS
            // demoHighCharts.init();

            // Because we are using Admin Panels we use the OnFinish 
            // callback to activate the demoWidgets. It's smoother if
            // we let the panels be moved and organized before 
            // filling them with content from various plugins

            // Init plugins used on this page
            // HighCharts, JvectorMap, Admin Panels

            // Init Admin Panels on widgets inside the ".admin-panels" container
            $('.admin-panels').adminpanel({
              grid: '.admin-grid',
              draggable: true,
              preserveGrid: true,
              mobile: false,
              onStart: function() {
                // Do something before AdminPanels runs
              },
              onFinish: function() {
                $('.admin-panels').addClass('animated fadeIn').removeClass('fade-onload');

                // Init the rest of the plugins now that the panels
                // have had a chance to be moved and organized.
                // It's less taxing to organize empty panels
                demoHighCharts.init();
                runVectorMaps(); // function below
              },
              onSave: function() {
                $(window).trigger('resize');
              }
            });
        });
    </script>
    </body>
</html>
