<%-- 
    Document   : pgobtenerinfoL
    Created on : 04-abr-2017, 7:50:42
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
         <script src="<c:url value='/resources/js/codigoCuenta.js'/>"></script>
        <div id="info">
           
            <input type="hidden" value="${dato1}" id="dato1">
            <input type="hidden" value="${dato2}" id="dato2">
            <input type="hidden" value="${dato3}" id="dato3">
            <input type="hidden" value="${dato4}" id="dato4">
            <input type="hidden" value="${dato5}" id="dato5">
            <input type="hidden" value="${dato6}" id="dato6">
            <input type="hidden" value="${dato7}" id="dato7">
            <input type="hidden" value="${dato8}" id="dato8">
            <input type="hidden" value="${dato9}" id="dato9">
            <input type="hidden" value="${dato10}" id="dato10">
            
        </div>
    </body>
</html>
