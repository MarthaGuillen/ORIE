<%-- any content can be specified here e.g.: --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" %>
<div class="row">
    <div class="content-header">
        <h2><b class="text-success">Hermanos:</b></h2>
    </div>
</div>
<c:set var="validaher" value="${fn:length(nomhermano)}" />
<c:if test="${validaher > 0}">    
<div class="row">
    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
    </div>
    <div class="col-md-10 col-sm-10 col-lg-10 col-xs-10">
            <table class="table">
                <thead>
                    <tr class="primary">
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>Escuela</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="0" end="${fn:length(nomhermano)-1}">
                        <tr>
                            <td><b>${nomhermano[i]}</b></td>
                            <td>${edadhermano[i]}</td>
                            <td>${escuelahermano[i]}</td>                            
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
        <h3><b>¿Desea agregar mas hermanos?</b></h3>
    </div>
    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-right: 1em;">
        <div class="form-group">
            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
            </div>
            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                <button type="button" class="btn btn-lg btn-system btn-block" id="GuardarHer" name="GuardarHer" onclick="cargarContenido('formHermanos.gdc','divformHermanos')"><span class="glyphicon glyphicon-plus-sign"></span> Hermano(a)</button>
            </div>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
        </div>
    </div>
</div>    
</c:if>
<c:if test="${validaher <= 0}">
    <div>
        <div class="content-header">
            <h3><b>¿Desea agregar un hermano o hermana?</b></h3>
        </div>
        <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-right: 1em;">
            <div class="form-group">
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
                    <button type="button" class="btn btn-lg btn-system btn-block" id="GuardarHerm" name="GuardarHerm" onclick="cargarContenido('formHermanos.gdc','divformHermanos')"><span class="glyphicon glyphicon-plus-sign"></span> Hermano(a)</button>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
            </div>
        </div>
    </div>
</c:if>
