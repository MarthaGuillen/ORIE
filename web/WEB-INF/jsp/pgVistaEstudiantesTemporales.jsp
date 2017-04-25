<%-- 
    Document   : pgVistaEstudiantesTemporales
    Created on : 23-abr-2017, 11:40:16
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

<c:set var="validapt" value="${fn:length(ides)}" />
  <c:if test="${validapt > 0}">
     <table class="table">
  <thead>
    <tr class="primary">
      <th>#</th>
      <th>Nombre</th>
      <th>Sociedad</th>
      <th>Eliminar</th>
    </tr>
  </thead>
  <tbody>
    
      <c:forEach var="i" begin="0" end="${fn:length(ides)-1}">
          <tr>
          <c:set var="contador" value="${i+1}" />  
          <td>${contador}</td>
          <td>${nomes[i]}</td>
          <td>${socie[i]}</td>
          <td>
            <a style="cursor:pointer;color:red;font-size:14px;" onclick="eliminaestudiante('${ides[i]}','${nomes[i]}');"><span class="glyphicon glyphicon-remove"></span></a>
          </td>  
          </tr>
      </c:forEach>
    
    
  </tbody>
</table> 
  </c:if>  
            
            
            