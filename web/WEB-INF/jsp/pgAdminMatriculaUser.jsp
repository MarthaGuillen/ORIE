<%-- 
    Document   : pgAdminMatriculaUser
    Created on : 19-abr-2017, 15:13:05
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
<c:set var="creaUsuario" value="no" />
<c:forEach var="i" begin="0" end="${fn:length(sessionScope.ses_urlmen)-1}">
    <c:if test="${acceso == sessionScope.ses_urlmen[i]}">
        <c:set var="sigueAcceso" value="Si" />
    </c:if>
</c:forEach>
<c:if test="${sigueAcceso eq 'no'}">
    <c:redirect url="perfil.gdc"/>
</c:if>
<c:forEach var="j" begin="0" end="${fn:length(sessionScope.ses_navegacion)-1}">
    <c:if test="${sessionScope.ses_navegacion[j] == 'Crear usuario'}">
        <c:set var="creaUsuario" value="Si" />
    </c:if>
</c:forEach>

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
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sweetalert2.min.css'/>">
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        
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
        <div class="content-header">
            <h2 class="text-center text-primary"><strong>Administración de usuarios</strong></h2>
        </div>
        <section id="content" class="animated fadeIn">
            
            <div class="row">
            <div class="admin-form theme-primary">
          
            <div class="panel panel-success heading-border">

            
              <div class="panel-body">

                <div class="section-divider mt20 mb40">
                  <span> Usuarios registrados </span>
                </div>
                <div class="section row">
                    <c:if test="${creaUsuario eq 'Si'}">
                        <div class="pull-right">
                        <button type="button" class="btn btn-lg btn-primary" onclick="neuvoUS();"><span class="glyphicons glyphicons-user_add"></span> Nuevo usuario</button>
                        </div>
                    </c:if>
                    
                    <div class="col-md-12">
                        <table class="table table-striped" >
                        <c:set var="validapt" value="${fn:length(idusLista)}" />
                        <c:if test="${validapt > 0}">
                        <br><br>    
                        
                            <tbody id="tablaex">
                                <c:forEach var="i" begin="0" end="${fn:length(idusLista)-1}">
                                <c:set var="contador" value="${i+1}" />    
                                <tr>
                                    <td>
                                        <h3><span class="label label-primary">${contador}</span></h3>
                                    </td>
                                    <td>
                                        <h4>
                                            <b>${nombrecLista[i]}</b>
                                        </h4>
                                        <a href="#">${correoLista[i]}</a>
                                    </td>
                                    <td>
                                        <c:if test="${estadoLista[i].toString() == 'true'}">
                                            <span class="label label-success">Habilitado</span>
                                        </c:if>
                                        <c:if test="${estadoLista[i].toString() == 'false'}">
                                            <span class="label label-default">Deshabilitado</span>
                                        </c:if>
                                        <p>Estudiantes asignados: </p>
                                    </td>
                                    
                                    <td>
                                        <h4>
                                            <b>${tipocliente[i]}</b>
                                        </h4>
                                        <p>Cod. Cliente: ${cdcliente[i]}</p>
                                        <p>Creado por: ${creadorLista[i]}</p>
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
                                            
                                            <button onclick="agregaHijo('${idusLista[i]}');" class="btn btn-default" type="button">
                                                <span class="glyphicons glyphicons-user_add"></span> Asignar estudiante</button>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                            </c:if>
                        </table>
                        
                        
                        <div class="col-md-12 text-center">
                            <ul class="pagination pagination-lg pager" id="myPager"></ul>
                        </div>
                    </div>
                    <!--Perfiles-->
                    
                                <!--FIn Perfiles-->     
                </div>  
              </div>
            </div>
            </div>    
            </div> 
                         
        </section>
       
    
       
    </section>
    </div> 
    <!-- Modal -->
        <div id="modalNuevoUs" class="modal fade" role="dialog" aria-hidden="true" data-backdrop="static">
          <div class="modal-dialog modal-lg">
             <form id="defaultForm" action="#"
                              data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                              data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                              data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-light">
                <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
                <h4 class="modal-title" style="color:white;">Nuevo Usuario</h4>
              </div>
              <div class="modal-body" style="max-height: calc(100vh - 210px);
    overflow-y: auto;">
                <div id="newUSer">
                                       
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
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                  <div class="form-group">
                                    <label class="control-label">(Opcional) Numero de tel/cel:</label>
                                    <div class="inputGroupContainer">
                                       <input  name="numtel" id="numtel" placeholder="Numero de tel/cel" class="form-control"  type="text">
                                    </div>
                                  </div>  
                                  
                                </div>
                                    <div class="col-md-6">
                                  <div class="form-group">
                                    <label class="control-label">(Opcional) Dirección:</label>
                                    <div class="inputGroupContainer">
                                       <textarea class="form-control" id="txtdireccion" rows="2" style="margin-top: 0px; margin-bottom: 0px; height: 150px;"></textarea>
                                    </div>
                                  </div>  
                                  
                                </div>
                                </div>
                                        <div class="row">
                                            <div class="content-header">
                                                <h2 class="text-center text-primary"><strong>Tipo de Cliente</strong></h2>
                                            </div>
                                            <div class="col-md-12">
                                                
                                                    
                                                    <c:forEach var="i" begin="0" end="${fn:length(idtipocl)-1}">     
                                                        <div class="radio-custom radio-success mb5">
                                                            <input type="radio" id="radio${idtipocl[i]}" name="radiotipoc" value="${idtipocl[i]}">
                                                            <label for="radio${idtipocl[i]}">${tipocl[i]}</label>
                                                        </div>
                                                       
                                                    </c:forEach>
                                                    
                                                
                                                    
                                                
                                                
                                            </div>
                                                

                                            </div>  
                                        </div>  
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-lg btn-success"><span class="glyphicon glyphicon-floppy-disk"></span> Crear usuario</button>
                <button type="button" class="btn btn-danger" onclick="limpia();" data-dismiss="modal">Cancelar</button>
              </div>
            </div>
            </form>
          </div>
        </div>    
                                          
                                        
                                
                                </div> 
        <div id="creusuajax" style="display:none;"></div>                                               
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
       <script src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
       <script src="<c:url value='/resources/js/utility.js'/>"></script>
       <script src="<c:url value='/resources/js/jsValidaAdminUserMatriculas.js'/>"></script>
       <script src="<c:url value='/resources/js/demo.js'/>"></script>
       <script src="<c:url value='/resources/js/main.js'/>"></script>
       <script src="<c:url value='/resources/js/widgets.js'/>"></script>
       <script src="<c:url value='/resources/js/jquery.magnific-popup.js'/>"></script>
       <script src="<c:url value='/resources/js/ssi-modal.js'/>"></script>
       <script src="<c:url value='/resources/js/bootstrapValidator.js'/>"></script>
       <script src="<c:url value='/resources/js/sweetalert2.min.js'/>"></script> 
       <script src="<c:url value='/resources/js/validCampo.js'/>"></script> 
       
       
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

