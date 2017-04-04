<%-- 
    Document   : pgrep
    Created on : 12-mar-2017, 14:42:34
    Author     : Jerson
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
        <title>JSP Page</title>
    </head>
    <body>
        <div id="alerta"  >
            <input type="hidden" value="${id}" id="idt">
            <input type="hidden" value="${dato1}" id="dato1">
            <input type="hidden" value="${dato2}" id="dato2">
            <input type="hidden" value="${dato3}" id="dato3">
            <input type="hidden" value="${dato4}" id="dato4">
            <input type="hidden" value="${dato5}" id="dato5">
        </div>
    </body>
</html>
