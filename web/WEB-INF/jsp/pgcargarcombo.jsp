<%-- 
    Document   : pgcargarcombo
    Created on : 14-mar-2017, 10:52:13
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
           
            <input type="hidden" value="${id_area}" id="cbid_area">
            <input type="hidden" value="${id_tipo}" id="cbid_tipoa">
            <input type="hidden" value="${codigo_area}" id="cbcodigoarea">
            <input type="hidden" value="${codigom_cr}" id="cbcodigomadrecr">
            <input type="hidden" value="${nombrem_cr}" id="nombremadrecr">
        </div>
    </body>
</html>
