<%-- 
    Document   : pgAdminUser
    Created on : 04-abr-2017, 17:39:40
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

<c:set var="acceso" value="adminuser.gdc" />
<c:set var="sigueAcceso" value="no" />
<c:forEach var="i" begin="0" end="${fn:length(sessionScope.ses_urlmen)-1}">
    <c:if test="${acceso == sessionScope.ses_urlmen[i]}">
        <c:set var="sigueAcceso" value="Si" />
    </c:if>
</c:forEach>
<c:if test="${sigueAcceso eq 'no'}">
    <c:redirect url="perfil.gdc"/>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/imageBack.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/magnific-popup.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ssi-modal.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/sweetalert2.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/fonts/glyphicons-pro/glyphicons-pro.css'/>">
         <!-- Admin Forms CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/admin-forms.min.css'/>">
        <script>
            var sociedaddef = "${sessionScope.ses_sociedadDefault}";
            var tipoperf = "${sessionScope.ses_tipoperfil}";
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
        
        <div id="secContenedor">    
        <section id="content" class="animated fadeIn">
            <div class="content-header">
            <div class="col-md-4">
                <a class="btn active btn-primary btn-block" onclick="nuevoUser();"><img src="<c:url value='/resources/img/new-user.png'/>" class="icon" /> Nuevo Usuario</a>
            </div>
            <br><br>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <c:set var="validapt" value="${fn:length(idusLista)}" />
                        <c:if test="${validapt > 0}">
                        <table class="table table-striped">
                            <tbody>
                                <c:forEach var="i" begin="0" end="${fn:length(idusLista)-1}">
                                <c:set var="contador" value="${i+1}" />    
                                <tr>
                                    <td>
                                        <h3><span class="label label-primary">${contador}</span></h3>
                                    </td>
                                    <td>
                                        <h4>
                                            <b>${perfilLista[i]}</b>
                                        </h4>
                                        <p>@${usuarioLista[i]}</p>
                                        <p>Creado por: ${creadorLista[i]}</p>
                                    </td>
                                    <td>
                                        <c:if test="${estadoLista[i].toString() == 'true'}">
                                            <span class="label label-success">Habilitado</span>
                                        </c:if>
                                        <c:if test="${estadoLista[i].toString() == 'false'}">
                                            <span class="label label-default">Deshabilitado</span>
                                        </c:if>
                                        
                                    </td>
                                    <td>
                                        <h4>
                                            <b>${nombrecLista[i]}</b>
                                        </h4>
                                        <a href="#">${correoLista[i]}</a>
                                    </td>
                                    <td>
                                        <c:if test="${estadoLista[i].toString() == 'true'}">
                                           <button class="btn btn-default" onclick="cambiaestado('d','${idusLista[i]}');" type="button"><i class="fa fa-fw s fa-remove"></i>Deshabilitar</button>
                                        </c:if>
                                        <c:if test="${estadoLista[i].toString() == 'false'}">
                                            <button class="btn btn-default" onclick="cambiaestado('h','${idusLista[i]}');" type="button"><i class="fa fa-fw s fa-check"></i>Habilitar</button>
                                        </c:if>
                                    </td>            
                                    <td>
                                        <div class="btn-group">
                                            
                                            <button onclick="configurar('${idusLista[i]}','${idpLista[i]}');" class="btn btn-default" type="button">
                                                <i class="fa fa-fw fa-cog"></i>Configurar perfil</button>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
        </div>
    
        <div id="secNuevo" style="display:none;">
        <section id="content" class="animated fadeIn">
            
            <div class="container">
                <div class="row">
                    <div class="content-header">
                        
                            <h2 class="text-center"><b class="text-primary">Nuevo Usuario</b></h2>
                        
                    </div> 
                    <div class="row">
                        <div class="panel heading-border">
                            
                            <div class="panel-body bg-light1">
                            
                            <form id="defaultForm" action="#"
                              data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                              data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                              data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                                
   
                                <div class="row">
                                    
                                <div class="col-md-4">
                                  <div class="form-group">
                                    <label class="control-label">Nombre de usuario:</label>
                                    <div class="inputGroupContainer">

                                        <input  name="usuario" id="usuario" placeholder="Usuario..." class="form-control"  type="text">

                                    </div>
                                  </div>  

                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label class="control-label">Correo electrónico:</label>
                                    <div class="inputGroupContainer">
                                       <input  name="correo" id="correo" placeholder="Correo electrónico..." class="form-control"  type="email">
                                    </div>
                                  </div>
                                  
                                </div>
                                <div class="col-md-4">
                                  <div class="form-group">
                                    <label class="control-label">Nombre completo:</label>
                                    <div class="inputGroupContainer">
                                       <input  name="nombrec" id="nombrec" placeholder="Nombre completo..." class="form-control"  type="text">
                                    </div>
                                  </div>  
                                  
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label class="control-label">Contraseña:</label>
                                    <a style="cursor:pointer;" onclick="generpass();"><span class="glyphicon glyphicon-refresh"></span> Generar Contraseña</a>
                                    <div class="inputGroupContainer">
                                        
                                       <input  name="contrasenia" id="contrasenia" placeholder="Contraseña..." class="form-control"  type="text">
                                    </div>
                                    
                                  </div>
                                 
                                </div>
                                </div>
                                   
                                <div class="row">
                                    <button type="button" class="btn btn-rounded btn-success" onclick="cargaperfil();"><span class="glyphicon glyphicon-indent-left"></span> Asignar perfil</button>
                                    <input type="hidden" id="idperfilselec">
                                    <h1 class="title text-center" id="nomperf"></h1>
                                    <div id="contenedorresp"></div>
                                </div>  
                                <!--Perfiles-->
                                <div style="display:none;">
                                    <div id="tabPerfiles">
                                        <br>
                                        <table class="table">
                                            <thead>
                                                <tr class="success">
                                                    <th>#</th>
                                                    <th>Nombre</th>
                                                    <th>Descripción</th>
                                                    <th>Seleccionar</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:set var="valilis" value="${fn:length(idper)}" />
                                                <c:if test="${valilis > 0}">
                                                    <c:forEach var="i" begin="0" end="${fn:length(idper)-1}">
                                                        <c:set var="contador" value="${i+1}" />   
                                                        <tr>
                                                            <td>${contador}</td>
                                                            <td>${nomper[i]}</td>
                                                            <td>${desc[i]}</td>
                                                            <td><button type="button" class="btn btn-rounded btn-success btn-block" onclick="cargaidperfil('${idper[i]}','${nomper[i]}');">Cargar</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if> 



                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                                <!--FIn Perfiles--> 
                                <!--Sociedades-->               
                                                <h4><b class="text-primary">Seleccione las sociedades a las que pertenecerà el usuario:</b></h4>
                                                <div class="alert alert-danger" style="display:none;" id="alert-demo-1">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    <i class="fa fa-frown-o pr10"></i>
                                                    Por favor seleccione por lo menos una sociedad para el usuario.
                                                </div>
                                                <div class="alert alert-danger" style="display:none;" id="alert-demo-2">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    <i class="fa fa-frown-o pr10"></i>
                                                    Por favor seleccione la sociedad default del usuario.
                                                </div>
                                                <div class="alert alert-danger" style="display:none;" id="alert-demo-3">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    <i class="fa fa-frown-o pr10"></i>
                                                    Recuerde que la sociedad default debe estar seleccionada.
                                                </div>
                                                <table class="table">
                                                    <thead>
                                                        <tr class="success">
                                                            <th>#</th>
                                                            <th>Nombre</th>
                                                            <th>Seleccionar</th>
                                                            <th>Default</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <c:set var="valilis" value="${fn:length(idsoci)}" />
                                                        <c:if test="${valilis > 0}">
                                                            <c:forEach var="i" begin="0" end="${fn:length(idsoci)-1}">
                                                                <c:set var="contador" value="${i+1}" />   
                                                                <tr>
                                                                    <td>${contador}</td>
                                                                    <td>${nomsoc[i]}</td>
                                                                    <td>
                                                                        <div class="checkbox-custom fill checkbox-success mb5">
                                                                            <input type="checkbox" id="soc${idsoci[i]}" value="${nomsoc[i]}">
                                                                            <label for="soc${idsoci[i]}"></label>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="radio-custom radio-success mb5">
                                                                            <input type="radio" id="rdsoci${idsoci[i]}" value="${idsoci[i]}" name="socdefault">
                                                                            <label for="rdsoci${idsoci[i]}"></label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if> 



                                                    </tbody>
                                                </table>             

                                                <!--fin sociedades--> 
                                                <div class="form-group">
                                                    <br><br>
                                                    <button type="submit" class="btn btn-lg btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
                                                </div>
                            </form>                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </section>
        </div>               
    </section>
    </div> 
        <div id="creusuajax"></div>                                               
         <div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <img src="<c:url value='/resources/img/Loading.gif'/>" />
                            <h4>Cargando...</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
       <div id="ajaxSociedad" style="display:none;"></div>      
       <script src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/widgets.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.magnific-popup.js'/>"></script>
       <script src="<c:url value='/resources/js/jsValidaAdminUser.js'/>"></script>
       <script src="<c:url value='/resources/js/ssi-modal.js'/>"></script>
       <script src="<c:url value='/resources/js/bootstrapValidator.js'/>"></script>
       <script src="<c:url value='/resources/js/sweetalert2.min.js'/>"></script> 
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
            
        });
    </script>
    </body>
</html>

