
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

<table class="table table-responsive" id="tablalibro" cellspacing="0" width="100%"  >
                                <thead>
                                    <tr class="primary">
                                       
                                        <th>FECHA</th>
                                        <th>PARTIDA</th>
                                        <th>CUENTA </th>
                                        <th style="font-size: 12px;">NOMBRE DE LA CUENTA</th>
                                        <th>CONCEPTO</th>
                                        <th>PARCIAL </th>
                                        <th>DEBE</th>
                                        <th>HABER</th>
                                        <c:if test="${datosauditoria == 1}">
                                        <th style="font-size: 12px;">ESTATUS DE PARTIDA</th>
                                        <th style="font-size: 12px;">FECHA DE ELABORACION</th>
                                        <th >USUARIO</th>
                                        </c:if>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 12px;">
                                    <c:set var="valida" value="${fn:length(fechap)}" />
                                    <c:if test="${valida > 0}">
                                            <c:forEach var="i" begin="0" end="${fn:length(fechap)-1}">
                                                <tr>
                                                    <td style="font-size: 10px;">${fechap[i]}</td>
                                                    <td>${codigopartida[i]}</td>
                                                    <td>${codigocuenta[i]}</td>
                                                    <td>${nombrecuenta[i]}</td>
                                                    <td>${concepto[i]}</td>
                                                    <td></td>
                                                    <td>${debe[i]}</td>
                                                    <td>${haber[i]}</td>
                                                    <c:if test="${datosauditoria == 1}">
                                                    <td name="datosauditoria">${estado[i]}</td>
                                                    <td name="datosauditoria">${usuario[i]}</td>
                                                    <td name="datosauditoria">${fechacreo[i]}</td>
                                                    </c:if>
                                                </tr>
                                                    
                                            </c:forEach>
                                    </c:if>
                                </tbody>
                                <tfoot>
                                  <th></th>
                                        <th></th>
                                        <th> </th>
                                        <th ></th>
                                        <th></th>
                                        <th> </th>
                                        <th style="color: green">${saldodebe}</th>                                     
                                        <th style="color: red">${saldohaber}</th>
                                        <c:if test="${datosauditoria == 1}">
                                        <th ></th>
                                        <th ></th>
                                        <th ></th>
                                        </c:if>  
                                </tfoot>
                            </table>
