<%-- 
    Document   : pgSC_tablacatalago
    Created on : 06-abr-2017, 10:53:22
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

         <div class="page-heading">
                <div class="media clearfix">
                                  
               <h1>Cuentas </h1>
                <table class="display" id="tablecuentas"  cellspacing="0" width="100%">
                    <thead>
                      <tr>
                       
                        <th> Cuenta Mayor </th>
                        <th> Sub-Cuenta Mayor </th>
                         <th>Cuenta Origen </th>
                        <th> Estado </th>
                      </tr>
                    </thead>
                    <tbody>
                     
                         <c:forEach var="i" begin="0" end="${fn:length(nombreorigen)-1}">
                        <c:set var="contador" value="${i+1}"/>
                        <tr>
                           
                            <td>${codigocuentabalance[i]}  ${nombrecuentabalance[i]}</td>
                           <td>${codigosubcuenta[i]}  ${nombresubcuenta[i]}</td>
                            <td>${nombreorigen[i]}</td>
                             <td>Vigente</td>
                        
                       </tr>
                        </c:forEach> 
               

                    </tbody>
                  </table>
                                            
                                          
                                      
                                      
                  
                </div>
            </div>
 