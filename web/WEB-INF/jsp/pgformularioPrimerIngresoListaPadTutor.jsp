<%-- any content can be specified here e.g.: --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" %>

<div class="row">
    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
    </div>
    <div class="col-md-10 col-sm-10 col-lg-10 col-xs-10">
        <c:set var="validapt" value="${fn:length(idpadreTutor)}" />
        <c:if test="${validapt > 0}">
            <table class="table">
                <thead>
                    <tr class="primary">
                        <th></th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>País</th>
                        <th>Identidad/Pasaporte</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="0" end="${fn:length(idpadreTutor)-1}">
                        <tr>
                            <c:if test="${esPadreTutor[i].toString() == '1'}">
                                <td><span class="label label-system">Padre</span></td>
                            </c:if>
                            <c:if test="${esPadreTutor[i].toString() == '0'}">
                                <td><span class="label label-warning">Tutor</span></td>
                            </c:if>
                            <td><b>${nombrePadreTutor[i]}</b></td>
                            <td>${telefonoPadreTutor[i]}</td>
                            <td>${correoPadreTutor[i]}</td>
                            <td>${paisPadreTutor[i]}</td>
                            <td>${idnPadreTutor[i]} / ${pasaPadreTutor[i]}</td>
                            <c:if test="${esteForm[i].toString() == '1'}">
                                <td class="text-right">
                                    <label class="checkbox-custom fill checkbox-system mb5">
                                        <input type="checkbox" class="selPad" name="padSel" value="${idpadreTutor[i]}" checked="checked">
                                        <span class="checkbox"></span>
                                    </label>
                                </td>
                            </c:if>
                            <c:if test="${esteForm[i].toString() == '0'}">
                                <td class="text-right">
                                    <label class="checkbox-custom fill checkbox-system mb5">
                                        <input type="checkbox" class="selPad" name="padSel" value="${idpadreTutor[i]}">
                                        <span class="checkbox"></span>
                                    </label>
                                </td>
                            </c:if>
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
    </div>
</div>
<div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
    <div class="form-group">
        <div class="col-md-8 col-sm-8 col-lg-8 col-xs-8">
            <input type="hidden" id="padOriginales" name="padOriginales" value="${padOriginales}"/>
        </div>
        <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
            <button type="button" class="btn btn-lg btn-primary btn-block" id="GuardarPadSel" name="GuardarPadSel" onclick="guardarPadTutoresSel()"><span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
        </div>
    </div>
    <div class="col-md-1 col-sm-1 col-lg-1 col-xs-1">
    </div>
</div> 

