<%-- 
    Document   : pgfrnPrincipal
    Created on : 12-mar-2017, 8:32:53
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
    <c:redirect url="Inicio.gdc"/>
</c:if>


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
        <script>
            var sociedaddef = "";
            var tipoperf = "Administrador";
        </script>
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
            <div class="page-heading">
            <div class="media clearfix">
              <div class="media-left pr30">
                <a href="#">
                  
                    <img class="media-object mw150" height="150" width="270" src="<c:url value='/resources/img/principal.png'/>"   alt="...">
                </a>
              </div>                      
              <div class="media-body va-m">
                <h2 class="media-heading">${sessionScope.ses_usuario}
                  
                </h2>
                <p class="lead">${descPerfil}</p>
                <p class="lead">Correo electrónico: ${sessionScope.ses_correo}</p>
                
              </div>
            </div>
        </div>
        
        </section>
        <section id="content" class="table-layout animated fadeIn">

        <!-- begin: .tray-left -->
        <aside class="tray tray-left tray320">

          <div class="animated-delay" data-animate='["200","fadeIn"]'>

            <h4>REQUISITOS PARA MATRÍCULA</h4>
            <ul class="icon-list">
                <li>
                  <i class="fa fa-exclamation-circle text-warning fa-lg pr10"></i>
                  <b> 2016 - 2017</b> 
                </li>
               
            </ul>

            <div id="nav-spy">
              <ul class="nav tray-nav tray-nav-border" data-nav-animate="zoomIn" data-smoothscroll="-125" data-spy="affix" data-offset-top="240">
                <h4 class="micro-header">Del Campo International School</h4>
                <li class="active">
                  <a href="#p0">
                    <span class="fa fa-bars fa-lg"></span> Toddlers | Nursery | Pre-Kinder</a>
                </li>
                <li>
                  <a href="#p1">
                   <span class="fa fa-bars fa-lg"></span> Kinder</a>
                </li>
                <li>
                  <a href="#p2">
                    <span class="fa fa-bars fa-lg"></span> Primaria</a>
                </li>
                <li>
                  <a href="#p3">
                    <span class="fa fa-bars fa-lg"></span> High School | Middle School</a>
                </li>
                <legend></legend>
                <h4 class="micro-header">Del Campo Academy</h4>
                <li>
                  <a href="#p4">
                    <span class="fa fa-bars fa-lg"></span> Primaria</a>
                </li>
                <li>
                  <a href="#p5">
                    <span class="fa fa-bars fa-lg"></span> High School Middle School</a>
                </li>
                

              </ul>
            </div>

          </div>

        </aside>
        <!-- end: .tray-left -->

        <!-- begin: .tray-center -->
        <div class="tray tray-center">

          <!-- Begin: Admin Panel Wrapper -->
          <div class="admin-panels mw900 center-block" style="padding-bottom: 125px;">
 
              <!-- AdminPanel Row - General Options -->
              <div class="row mt20">

                <div class="col-md-12 admin-grid animated-delay" data-animate='["400","fadeIn"]'>

                  <!-- transparent panel - used for creating titles in admin grids -->
                  <div class="panel panel-transparent" id="pt0">
                    <h4 class="micro-header">REQUISITOS PARA MATRÍCULA DE PRIMER INGRESO</h4>
                    
                  </div>
                  
                  <div class="panel sort-disable mb50" id="p0" data-panel-color="false" data-panel-remove="false" data-panel-title="false" data-panel-collapse="false">
                    <div class="panel-heading">
                      <span class="panel-icon">
                        <i class="fa fa-exclamation-circle text-success fa-lg pr10"></i> Toddlers | Nursery | Pre-Kinder
                      </span>
                      
                    </div>
                    <div class="panel-body">
                      <img class="media-object mw150 pull-right" height="150" width="330" src="<c:url value='/resources/img/logoDelCampo.png'/>"   alt="...">

                      <hr class="short alt">
                      <p>Formulario de Solicitud para Admisión.</p>
                      <hr class="short alt">
                      <p>Partida de Nacimiento Original.</p>
                      <hr class="short alt">
                      <p>Dos Fotografías tamaño carnét.</p>
                      <hr class="short alt">
                      <p>Una copia de carné de Vacunas.</p>
                    </div>
                  </div>

                  

                  <!-- transparent panel - used for creating titles in admin grids -->
                <div class="panel panel-transparent" id="pt1">
                    <h4 class="micro-header">REQUISITOS PARA MATRÍCULA DE PRIMER INGRESO</h4>
                </div>

                 <div class="panel sort-disable mb50" id="p1" data-panel-color="false" data-panel-remove="false" data-panel-title="false" data-panel-collapse="false">
                    <div class="panel-heading">
                      <span class="panel-icon">
                       <i class="fa fa-exclamation-circle text-success fa-lg pr10"></i> Kinder
                      </span>
                      
                    </div>
                    <div class="panel-body">
                      <img class="media-object mw150 pull-right" height="150" width="330" src="<c:url value='/resources/img/logoDelCampo.png'/>"   alt="...">

                      <hr class="short alt">
                      <p>Formulario de Solicitud para Admisión.</p>
                      <hr class="short alt">
                      <p>Partida de Nacimiento Original.</p>
                      <hr class="short alt">
                      <p>Dos Fotografías tamaño carnét.</p>
                      <hr class="short alt">
                      <p>Una copia de carné de Vacunas.</p>
                       <hr class="short alt">
                      <p>Examen de Admisión.</p>
                    </div>
                  </div>

                  <!-- transparent panel - used for creating titles in admin grids -->
                  <div class="panel panel-transparent" id="pt2">
                    <h4 class="micro-header">REQUISITOS PARA MATRÍCULA DE PRIMER INGRESO</h4> 
                  </div>

                  <!-- Basic AdminPanel - All features disabled except "minimized" option -->
                  <div class="panel sort-disable mb50" id="p2" data-panel-color="false" data-panel-remove="false" data-panel-title="false" data-panel-collapse="false">
                    <div class="panel-heading">
                      <span class="panel-icon">
                        <i class="fa fa-exclamation-circle text-success fa-lg pr10"></i> Primaria
                      </span>
                      
                    </div>
                    <div class="panel-body">
                      <img class="media-object mw150 pull-right" height="150" width="330" src="<c:url value='/resources/img/logoDelCampo.png'/>"   alt="...">

                      <hr class="short alt">
                      <p>Formulario de Solicitud para Admisión.</p>
                      <hr class="short alt">
                      <p>Certificación de estudios de los últimos 3 años.</p>
                      <hr class="short alt">
                      <p>Dos cartas de recomendación de parte de sus maestros anteriores.</p>
                      <hr class="short alt">
                      <p>Partida de Nacimiento Original.</p>
                      <hr class="short alt">
                      <p>Dos Fotografías tamaño carnét.</p>
                      <hr class="short alt">
                      <p>Aprobación del examen de admisión.</p>
                      <hr class="short alt">
                      <p>Constancia de conducta y de solvencia.</p>
                      <hr class="short alt">
                      <p>* Estudiantes extranjeros:</p>
                      <ul>
                          <li>Presentar calificaciones autenticadas.</li> 
                          <li>Partida de nacimiento autenticada o apostillada.</li> 
                      </ul> 
                      <hr class="short alt">
                      <p>*Información en las cartas de recomendación:</p>
                      <ul>
                          <li>Desempeño académico.</li> 
                          <li>Desempeño social</li>
                          <li>Desempeño disciplinario</li>
                      </ul>
                    </div>
                  </div>

                  <!-- transparent panel - used for creating titles in admin grids -->
                  <div class="panel panel-transparent" id="pt3">
                    <h4 class="micro-header">REQUISITOS PARA MATRÍCULA DE PRIMER INGRESO</h4>
                  </div>

                  <div class="panel sort-disable mb50" id="p3" data-panel-color="false" data-panel-remove="false" data-panel-title="false" data-panel-collapse="false">
                    <div class="panel-heading">
                      <span class="panel-icon">
                         <i class="fa fa-exclamation-circle text-success fa-lg pr10"></i> High School | Middle School
                      </span>
                     
                    </div>
                    <div class="panel-body">
                      <img class="media-object mw150 pull-right" height="150" width="330" src="<c:url value='/resources/img/logoDelCampo.png'/>"   alt="...">

                      
                      <hr class="short alt">
                      <p>Partida de Nacimiento Original.</p>
                      <hr class="short alt">
                      <p>Dos Fotografías tamaño carnét.</p>
                      <hr class="short alt">
                      <p>Examen de admisión.</p>
                      <hr class="short alt">
                      <p>Constancia de conducta y de solvencia.</p>
                      <hr class="short alt">
                      <p>Certificación de estudios de los últimos 3 años.</p>
                      <hr class="short alt">
                      <p>Dos cartas de recomendación de parte de sus maestros anteriores.</p>
                      <hr class="short alt">
                      <p>*Alumnos fuera de la ciudad:</p>
                      <ul>
                          <li>Presentar certificado de estudio y copia de las actas.</li> 
                      </ul> 
                      <hr class="short alt">
                      <p>*Alumnos del extranjero:</p>
                      <ul>
                          <li>Presentar notas autenticada.</li> 
                      </ul>
                      <hr class="short alt">
                      <p>* Entrevista con lOs directores para todas las áreas según el grado que aplica.</p>
                      <hr class="short alt">
                      <p>*Información en las cartas de recomendación:</p>
                      <ul>
                          <li>Desempeño académico.</li> 
                          <li>Desempeño social</li>
                          <li>Desempeño disciplinario</li>
                      </ul>
                    </div>
                  </div>

                  <!-- transparent panel - used for creating titles in admin grids -->
                  <div class="panel panel-transparent" id="pt4">
                   <h4 class="micro-header">REQUISITOS PARA MATRÍCULA DE PRIMER INGRESO</h4>
                  </div>

                  <div class="panel sort-disable mb50" id="p4" data-panel-color="false" data-panel-remove="false" data-panel-title="false" data-panel-collapse="false">
                    <div class="panel-heading">
                      <span class="panel-icon">
                       <i class="fa fa-exclamation-circle text-success fa-lg pr10"></i> Primaria
                      </span>
                     
                    </div>
                    <div class="panel-body">
                      <img class="media-object mw150 pull-right" height="150" width="330" src="<c:url value='/resources/img/logoAcademy.png'/>"   alt="...">

                      <hr class="short alt">
                      <p>Formulario de Solicitud para Admisión.</p>
                      <hr class="short alt">
                      <p>Certificación de estudios de los últimos 3 años.</p>
                      <hr class="short alt">
                      <p>Dos cartas de recomendación de parte de sus maestros anteriores.</p>
                      <hr class="short alt">
                      <p>Partida de nacimiento original.</p>
                      <hr class="short alt">
                      <p>Dos fotografías tamaño carnét.</p>
                      <hr class="short alt">
                      <p>Evaluación psicopedagógica completa realizada en los últimos 2 años.</p>
                      <hr class="short alt">
                      <p>Constancia de conducta y de solvencia.</p>
                      <hr class="short alt">
                      <p>*Información en las cartas de recomendación:</p>
                      <ul>
                          <li>Desempeño académico.</li> 
                          <li>Desempeño social</li>
                          <li>Desempeño disciplinario</li>
                      </ul>
                    </div>
                  </div>

                  <!-- transparent panel - used for creating titles in admin grids -->
                  <div class="panel panel-transparent" id="pt5">
                    <h4 class="micro-header">REQUISITOS PARA MATRÍCULA DE PRIMER INGRESO</h4>
                  </div>

                  <!-- Basic AdminPanel - All features disabled except "Scroller" option -->
                  <div class="panel sort-disable mb50" id="p5" data-panel-color="false" data-panel-remove="false" data-panel-title="false" data-panel-collapse="false">
                    <div class="panel-heading">
                      <span class="panel-icon">
                        <i class="fa fa-exclamation-circle text-success fa-lg pr10"></i> High School | Middle School
                      </span>
                      
                    </div>
                    <div class="panel-body">
                      <img class="media-object mw150 pull-right" height="150" width="330" src="<c:url value='/resources/img/logoAcademy.png'/>"   alt="...">

                      <hr class="short alt">
                      <p>Formulario de Solicitud para Admisión.</p>
                      <hr class="short alt">
                      <p>Certificación de estudios de los últimos 3 años.</p>
                      <hr class="short alt">
                      <p>Dos cartas de recomendación de parte de sus maestros anteriores.</p>
                      <hr class="short alt">
                      <p>Partida de nacimiento original.</p>
                      <hr class="short alt">
                      <p>Dos fotografías tamaño carnét.</p>
                      <hr class="short alt">
                      <p>Evaluación psicopedagógica completa realizada en los últimos 2 años.</p>
                      <hr class="short alt">
                      <p>Constancia de conducta y de solvencia.</p>
                      <hr class="short alt">
                      <p>*Información en las cartas de recomendación:</p>
                      <ul>
                          <li>Desempeño académico.</li> 
                          <li>Desempeño social</li>
                          <li>Desempeño disciplinario</li>
                      </ul>
                    </div>
                  </div>

                  

                </div>

              </div>

              

          

          </div>
          <!-- End: Admin Panel Wrapper -->

        </div>
        <!-- end: .tray-center -->

      </section>
    </section>
    
         </div>  
       <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/widgets.js'/>"></script>
       <script src="<c:url value='/resources/js/jsValidaPrincipalFront.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
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
      mobile: false,
      callback: function() {
        bootbox.confirm('<h3>A Custom Callback!</h3>', function() {});
      },
      onFinish: function() {
        $('.admin-panels').addClass('animated fadeIn').removeClass('fade-onload');

        // Init Demo settings 
        $('#p0 .panel-control-color').click();

        // Init Demo settings 
        $('#p1 .panel-control-title').click();

        // Create an example admin panel filter
        $('#admin-panel-filter a').on('click', function() {
          var This = $(this);
          var Value = This.attr('data-filter');

          // Toggle any elements whos name matches
          // that of the buttons attr value
          $('.admin-filter-panels').find($(Value)).each(function(i, e) {
            if (This.hasClass('active')) {
              $(this).slideDown('fast').removeClass('panel-filtered');
            } else {
              $(this).slideUp().addClass('panel-filtered');
            }
          });
          This.toggleClass('active');
        });

      },
      onSave: function() {
        $(window).trigger('resize');
      }
    });
        });
    </script>
    </body>
</html>

