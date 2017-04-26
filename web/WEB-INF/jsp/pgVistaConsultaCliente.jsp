<%-- 
    Document   : pgVistaConsultaCliente
    Created on : 24-abr-2017, 14:24:16
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
                                            <p>Estudiantes asignados: <a style="cursor:pointer;" onclick="cargaHijos('${idusLista[i]}');"><span class="label label-info">${ctcliente[i]}</span></a></p>
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
                                           <button class="btn btn-default" onclick="cambiaestado('d','${idusLista[i]}','${correoLista[i]}');" type="button"><i class="fa fa-fw s fa-remove"></i>Deshabilitar</button>
                                        </c:if>
                                        <c:if test="${estadoLista[i].toString() == 'false'}">
                                            <button class="btn btn-default" onclick="cambiaestado('h','${idusLista[i]}','${correoLista[i]}');" type="button"><i class="fa fa-fw s fa-check"></i>Habilitar</button>
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