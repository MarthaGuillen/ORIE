<%-- 
    Document   : pgfrnLogin
    Created on : 15-feb-2017, 11:49:16
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
<c:if test="${valida eq 'Activa'}">
    <c:redirect url="perfil.gdc"/>
</c:if>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Home - Del Campo International School</title>
        <!-- Archivos CSS -->
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/sweetalert2.min.css'/>">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/resources/cssIndex/style.css'/>">
        <link rel="shortcut icon" href="<c:url value='/resources/favicon/favicon.ico'/>">
        <!-- Archivos JavaScript -->
        <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/resources/js/jsValidaLoginBack.js'/>"></script>
        <script src="<c:url value='/resources/js/validCampo.js'/>"></script>
        <script src="<c:url value='/resources/js/cript.js'/>"></script>
        <script src="<c:url value='/resources/js/sweetalert2.min.js'/>"></script>
        <style>
          
    .form-signin input[type="text"] {
        margin-bottom: 5px;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    .form-signin .form-control {
        position: relative;
        font-size: 16px;
        font-family: 'Open Sans', Arial, Helvetica, sans-serif;
        height: auto;
        padding: 10px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    .vertical-offset-100 {
        padding-top: 100px;
    }
    .img-responsive {
    display: block;
    max-width: 100%;
    height: auto;
    margin: auto;
    }
    .panel {
    margin-bottom: 20px;
    background-color: rgba(255, 255, 255, 0.75);
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    }
    .modal {
        text-align: center;
        padding: 0!important;
    }

    .modal:before {
      content: '';
      display: inline-block;
      height: 100%;
      vertical-align: middle;
      margin-right: -4px;
    }

    .modal-dialog {
      display: inline-block;
      text-align: left;
      vertical-align: middle;
    }
        </style>
        
          
    </head>
    <script type="text/javascript">
            $(document).ready(function () {
                
                $('.carousel').carousel({interval: 7000});

            });

    </script>
    <body>
        <div id="myCarousel" class="carousel container slide" style="filter:alpha(opacity=50); opacity:0.9;">
            <div class="carousel-inner">
                <div class="active item one"></div>
                <div class="item two"></div>
                <div class="item three"></div>
            </div>
        </div>
        <div class="container">
                <div class="row vertical-offset-100">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">                                
                                <div class="row-fluid user-row">
                                    <img src="<c:url value='/resources/img/header.png'/>" class="img-responsive" alt="Grupo GDC"/>
                                </div>
                            </div>
                            <div class="panel-body">
                                <form class="form-signin" action="">
                                    
                                        <label class="panel-login">
                                            <div class="login_result"></div>
                                        </label>
                                        <input maxlength="120" class="form-control" id="xttus" placeholder="Usuario" id="username" type="text">
                                        
                                        <div class="input-group">
                                            <input maxlength="120"  class="form-control pwd" id="xtpas" placeholder="Contraseña" id="password" type="password">
                                            <span class="input-group-btn" style="position:relative;top: -5px;left:5px;">
                                              <button  class="btn btn-primary reveal" type="button"><i class="glyphicon glyphicon-eye-open"></i></button>
                                            </span>          
                                        </div>
                                        <br></br>
                                        <br></br>
                                        <a class="btn btn-lg btn-success btn-block" onclick="validaLogin();">Inciar sesion</a>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form role="form" id="form1" name="form1" action="perfil.gdc" method="post">             
              <input type="hidden" id="id" name="id">             
                        
            </form>
            <div id="conteedor"></div>
             <!-- Static Modal -->
            <div class="modal" id="processing-modal" role="dialog" aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content" style=" opacity: 0.9;">
                        <div class="modal-body">
                            <div class="text-center">
                                <img src="<c:url value='/resources/img/Loading.gif'/>" class="icon" />
                                <h2>Espere por favor...</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
