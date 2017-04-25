<%-- 
    Document   : pgDivisionesAjax
    Created on : 21-abr-2017, 11:06:16
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


<div class="radio-custom radio-success mb5">
  <c:set var="validapt" value="${fn:length(idd)}" />
  <c:if test="${validapt > 0}">
      <c:forEach var="i" begin="0" end="${fn:length(idd)-1}">
            <input onclick="cargagrados('${idd[i]}');" type="radio" id="radd${idd[i]}" value="${idd[i]}" name="rdDivision">
            <label for="radd${idd[i]}">${soc[i]}</label>
      </c:forEach>
  </c:if>  
  
</div>