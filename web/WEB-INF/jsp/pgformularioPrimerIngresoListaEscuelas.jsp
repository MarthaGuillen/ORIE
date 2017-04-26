<%-- any content can be specified here e.g.: --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" %>
<div class="row">
    <div class="content-header">
        <h2><b class="text-success">Escuelas previas:</b></h2>
    </div>
</div>
<c:set var="valida" value="${fn:length(nomEsc)}" />
<c:if test="${valida > 0}">    
<div class="row">
    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
    </div>
    <div class="col-md-10 col-sm-10 col-lg-10 col-xs-10">
        <table class="table" id="tablaEscuelas">
            <thead>
              <tr class="success">
                <th>Nombre</th>
                <th>País</th>
                <th>Ciudad</th>
                <th>Razon de Traslado</th>
              </tr>
            </thead>
            <tbody>
                <c:forEach var="i" begin="0" end="${fn:length(nomEsc)-1}">
                    <tr>
                        <td><b>${nomEsc[i]}</b></td>
                        <td>${paisEsc[i]}</td>
                        <td>${ciudEsc[i]}</td>  
                        <td>${trasEsc[i]}</td>                          
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
    </div>
</div>
<div>
    <div class="content-header">
        <h3><b>¿Desea agregar mas escuelas?</b></h3>
    </div>
    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-right: 1em;">
        <div class="form-group">
            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
            </div>
            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                <button type="button" class="btn btn-lg btn-system btn-block" id="GuardarEsc" name="GuardarEsc" onclick="cargarContenido('formEscuelas.gdc','divformEscuelas')"><span class="glyphicon glyphicon-plus-sign"></span> Escuela</button>
            </div>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
        </div>
    </div>
</div>    
</c:if>
<c:if test="${valida <= 0}">
    <div>
        <div class="content-header">
            <h3><b>¿Desea agregar una escuela?</b></h3>
        </div>
        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-right: 1em;">
            <div class="form-group">
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                    <button type="button" class="btn btn-lg btn-system btn-block" id="GuardarEsc" name="GuardarEsc" onclick="cargarContenido('formEscuelas.gdc','divformEscuelas')"><span class="glyphicon glyphicon-plus-sign"></span> Escuela</button>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
            </div>
        </div>
    </div>
</c:if>
