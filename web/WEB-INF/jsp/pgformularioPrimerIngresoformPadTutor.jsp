
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" %>
<form id="formTutor" action="#"
data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
data-bv-feedbackicons-validating="glyphicon glyphicon-refresh"> 
    <div class="row">
        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
            <h2><b class="text-success">Nuevo Padre o Tutor:</b></h2>
        </div>
    </div> 
    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-lg-9 col-xs-9">
                <div class="form-group">
                    <label for="nomPadTutor">*Nombre:</label>
                    <input maxlength="120" type="text" class="form-control gui-input" name="nomPadTutor" id="nomPadTutor" placeholder="Nombre Completo" data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" />
                </div>
            </div>  
            <div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
                <label for="TipoPadTutor">*Rol:</label>
                <select class="form-control" id ="TipoPadTutor" name="TipoPadTutor">                                                
                    <option value="1">Padre</option>
                    <option value="0">Tutor</option>
                </select>
            </div> 
        </div>
        <div class="row">                                           
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="telcelPadTutor">*Teléfono Celular:</label>
                    <input data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="gui-input form-control" maxlength="15" type="text" id ="telcelPadTutor" name="telcelPadTutor" placeholder="Teléfono Celular">
                </div>
            </div>   
           <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
               <div class="form-group">
                   <label for="correoPadTutor">Correo electrónico:</label>
                   <input class="gui-input form-control" maxlength="150" type="email" id ="correoPadTutor" name="correoPadTutor" placeholder="example@dominio.com">
               </div>
           </div>
        </div>
        <div class="row"> 
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                   <label for="nIdentidadPadTutor">Número de identidad:</label>
                   <input class="gui-input form-control" maxlength="13" type="text" data-bv-trigger="keyup" data-bv-notempty-message="Campo obligatorio" id ="nIdentidadPadTutor" name="nIdentidadPadTutor" placeholder="xxxxxxxxxxxxx">
               </div>           
           </div>
           <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
               <div class="form-group">
                   <label for="pasaportePadTutor">Pasaporte:</label>
                   <input class="gui-input form-control" maxlength="13" type="text" data-bv-trigger="keyup" data-bv-notempty-message="Campo obligatorio" id ="pasaportePadTutor" name="pasaportePadTutor" placeholder="xxxxxxxxxxxxx">
               </div>
           </div>
        </div>                                    
    </div>  
    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
        <h3 style="margin-left: 6px;"><b class="text-success">Domicilio:</b></h3>                                                                   
        <div class="row">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="telDomPadTutor">Teléfono: <small style="font-weight: normal;"><i>(Incluya Códigos de Área, Ciudad y País)</i></small></label>
                    <input class="gui-input form-control" maxlength="15" type="text" id ="telDomPadTutor" name="telDomPadTutor" placeholder="Teléfono">
                </div>
            </div> 
             <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label>*País:</label>
                    <label style="color:red;display:none;" id="paisPadTutorval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                    <select class="select2-single form-control"  id="paisPadTutor" name="paisPadTutor" style="width: 100%">
                        <option value=""></option>
                        <c:set var="valida" value="${fn:length(paisTemp)}" />
                        <c:if test="${valida > 0}">
                            <c:forEach var="i" begin="0" end="${fn:length(paisTemp)-1}">
                                <option value="${idpaisTemp[i]}">${paisTemp[i]}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>  
            </div> 
        </div>
        <div class="row">

            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="ciudPadTutor">*Ciudad:</label>
                    <input data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="gui-input form-control" type="text" maxlength="180" id ="ciudPadTutor" name="ciudPadTutor" placeholder="Ciudad">
                </div>  
            </div>    
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="direccionPadTutor">*Dirección:</label>
                    <textarea data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" class="form-control" id="direccionPadTutor" name="direccionPadTutor" rows="4"></textarea>
                </div> 
            </div>

        </div> 
    </div> 

    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
        <h3 style="margin-left: 6px;"><b class="text-success">Trabajo u Ocupación:</b></h3> 
        <div class="row">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="empresaPadTutor">Empresa:</label>
                    <input class="gui-input form-control" type="text" maxlength="180" id ="empresaPadTutor" name="empresaPadTutor" placeholder="Empresa">
                </div> 
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="ocupacionPadTutor">Ocupación:</label>
                    <select class="select2-single form-control"  id="ocupacionPadTutor" name="ocupacionPadTutor" style="width: 100%">
                        <option value=""></option>
                        <c:set var="valida" value="${fn:length(ocupacionesTemp)}" />
                        <c:if test="${valida > 0}">
                            <c:forEach var="i" begin="0" end="${fn:length(ocupacionesTemp)-1}">
                                <option value="${idocupacionesTemp[i]}">${ocupacionesTemp[i]}</option>
                            </c:forEach>
                        </c:if>
                    </select>

                </div> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="telTrabPadTutor">Teléfono:  <small style="font-weight: normal;"><i>(Incluya Códigos de Área, Ciudad y País)</i></small></label>
                    <input class="gui-input form-control" maxlength="15" type="text" id ="telTrabPadTutor" name="telTrabPadTutor" placeholder="Teléfono">
                </div>
            </div> 
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label>País:</label>
                    <label style="color:red;display:none;" id="paisTrabPadTutorval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                    <select class="select2-single form-control"  id="paisTrabPadTutor" name="paisTrabPadTutor" style="width: 100%">
                        <option value=""></option>
                        <c:set var="valida" value="${fn:length(paisTemp)}" />
                        <c:if test="${valida > 0}">
                            <c:forEach var="i" begin="0" end="${fn:length(paisTemp)-1}">
                                <option value="${idpaisTemp[i]}">${paisTemp[i]}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>  
            </div> 
        </div>
        <div class="row"> 
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="ciudTrabPadTutor">Ciudad:</label>
                    <input class="gui-input form-control" type="text" maxlength="180" id ="ciudTrabPadTutor" name="ciudTrabPadTutor" placeholder="Ciudad">
                </div>  
            </div>  
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                <div class="form-group">
                    <label for="direccionTrabPadTutor">Dirección:</label>
                    <textarea class="form-control" id="direccionTrabPadTutor" name="direccionTrabPadTutor" rows="4"></textarea>
                </div> 
            </div> 
        </div>                                
    </div>      


    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
        <div class="form-group">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                  <button type="button" class="btn btn-lg btn-danger btn-block" id="botonform2" onclick="cargarContenido('vacio.gdc','divformPadTutor')"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                  <button type="submit" class="btn btn-lg btn-primary btn-block" id="botonform2"><span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
            </div>
        </div>
    </div>      
</form>