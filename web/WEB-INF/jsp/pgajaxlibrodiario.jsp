
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
<h1>  Estoy   </h1>
                            <table class="table table-responsive" id="tablalibro">
                                <thead>
                                    <tr class="primary">
                                       
                                        <th>nombre Partida</th>
                                        <th>cuenta</th>
                                        <th>Descripcion</th>
                                        <th>debe</th>
                                        <th>Haber</th>
                                        <th>usuario</th>
                                        <th>Descripcion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="valida" value="${fn:length(list)}" />
                                    <c:if test="${valida > 0}">
                                            <c:forEach var="i" begin="0" end="${fn:length(list)-1}">
                                                <tr>
                                                    <td colspan="${list.get(i).getOperaciones()}">${list.get(i).getNombrepartida()}colspan</td>                                                     
                                                    <td colspan="${list.get(i).getOperaciones()}">${list.get(i).getCodigopartida()}colspan</td>  
                                                    <c:forEach var="j" begin="0" end="${fn:length(list.get(i).getOperaciones())-1}">
                                                        <td> list.get(i).getOperaciones().get(j).getCodigo()</td>
                                                        <td> list.get(i).getOperaciones().get(j).getNombrec()</td>
                                                        <td> list.get(i).getOperaciones().get(j).getConcepto()</td>
                                                        <td> list.get(i).getOperaciones().get(j).getDebe()</td>
                                                        <td> list.get(i).getOperaciones().get(j).getHaber()/td>
                                                       
                                                    </c:forEach>
                                                    <td colspan="${list.get(i).getOperaciones().size()}">${list.get(i).getParcial()}</td>                                                     
                                                    <td colspan="${list.get(i).getOperaciones()}">${list.get(i).getEstado()}</td>                                                     
                                                    <td colspan="${list.get(i).getOperaciones()}">${list.get(i).getFecha()}</td>                                                     
                                                    <td colspan="${list.get(i).getOperaciones()}">${list.get(i).getUsuario()}</td>                                                     
                                                    <td colspan="${list.get(i).getOperaciones()}">${list.get(i).getFechacreo()}</td>                                                     
                                                    
                                                </tr>
                                            </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
