<%-- 
    Document   : pgGradosAjax
    Created on : 21-abr-2017, 11:06:29
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

<div class="row">
<div class="radio-custom radio-success mb5">
  <c:set var="validapt" value="${fn:length(idg)}" />
  <c:if test="${validapt > 0}">
      <c:forEach var="i" begin="0" end="${fn:length(idg)-1}">
          
          <div class="col-md-4">
            <input type="radio" id="radg${idg[i]}" value="${idg[i]}"  name="rdGrado">
            <label for="radg${idg[i]}">${gra[i]}</label>
          </div>  
      </c:forEach>
  </c:if>  
  
</div></div>