
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

                                <table class="table table-responsive" id="infodatos">
                                <thead>
                                  <tr class="primary">
                                    
                                      <th>Codigo de partida</th>                                    
                                      <th>Nombre de partida</th>                                    
                                    <th>Fecha</th>                                    
                                    <th>Usuario Que Creo</th>                                    
                                    <th>Crear contra partida</th>                                    
                                     
                                  </tr>
                                </thead>
                                <tbody id="datospartidabody">
                                    <c:set var="valida" value="${fn:length(idpartida)}" />
                                        <c:if test="${valida > 0}">
                                             <c:forEach var="i" begin="0" end="${fn:length(idpartida)-1}">
                                                 <tr>
                                             <td>${codigopartida[i]}</td> 
                                             <td>${nombrepartida[i]}</td> 
                                             <td>${fechap[i]}</td> 
                                             <td>${usuariopartida[i]}</td> 
                                             <td><c:if test="${estado[i] == '1'}">
                                                 <a><span class="fa fa-exchange" aria-hidden="true" onclick="crearcontrapartida(${idpartida[i]})"></span></a>
                                                 </c:if>
                                             </td> 
                                              </tr>
                                                </c:forEach>
                                        </c:if>
                                </tbody>
                               
                                </table>





