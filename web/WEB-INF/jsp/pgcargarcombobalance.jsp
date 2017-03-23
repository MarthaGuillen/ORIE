<%-- 
    Document   : pgcargarcombobalance
    Created on : 21-mar-2017, 15:51:48
    Author     : Sinergia003
--%>

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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
         <script src="<c:url value='/resources/js/cuentabalance.js'/>"></script>
        <div id="info">
           
            
            <input type="hidden" value="${codigocuenta}" id="codigocuenta">
            <input type="hidden" value="${nombrecuenta}" id="nombrecuenta">
            <input type="hidden" value="${idcuenta}" id="prueba">
           
        </div>
    </body>
</html>
