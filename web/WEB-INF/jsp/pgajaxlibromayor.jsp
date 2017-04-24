
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
                                        <th>SALDO INICIAL </th>
                                        <th>DEBE</th>
                                        <th>HABER</th>
                                        <th>SALDO</th>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 12px;">
                                    
                                    <c:set var="valida" value="${fn:length(fechap)}" />
                                    <c:if test="${valida > 0}">
                                            <c:forEach var="i" begin="0" end="${fn:length(Codigocuentam)-1}">
                                                <tr>
                                                    <td style="font-size: 10px;"></td>
                                                    <td></td>
                                                    <td>${Codigocuentam[i]}</td>
                                                    <td>${nombrecuentam[i]}</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <c:forEach var="J" begin="0" end="${fn:length(fechap)-1}">
                                                   
                                                    <c:if test="${Codigocuentam[i] == codigocuenta[J]}">
                                                    <tr>
                                                    <td style="font-size: 10px;">${fechap[J]}</td>
                                                    
                                                    <td>${codigopartida[J]}</td>
                                                    <td>${codigocuenta[J]}</td>
                                                    <td>${nombrecuenta[J]}</td>
                                                    <td>${concepto[J]}</td>
                                                    <td></td>
                                                    <td>${debe[J]}</td>
                                                    
                                                    <td>${haber[J]}</td>
                                                    <td>${Saldo[J]}</td>
                                                    </tr>
                                                    </c:if>
                                                </c:forEach>
                                                 <tr>
                                                    <td style="font-size: 10px;"></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>${nombrecuentam[i]}</td>
                                                    <td></td>
                                                    <td>0</td>
                                                    <td>${saldodebe2}</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                   
                                                </tr>
                                                    
                                            </c:forEach>
                                    </c:if>
                                </tbody>
                                
    </table>
