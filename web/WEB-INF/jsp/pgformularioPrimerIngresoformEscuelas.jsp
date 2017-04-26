
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" %>
<form id="formOtrasEscuelas" action="#"
    data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">    
      <div class="row">
          <h3 style="margin-left: 6px;"><b class="text-success">Otras escuelas a las que ha asistido desde preescolar:</b></h3>
          <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
              <div class="form-group">
                  <label for="NombreOtraEsc">Nombre de Escuela:</label>
                  <input class="gui-input form-control" type="text" maxlength="180" id ="NombreOtraEsc" name="NombreOtraEsc" placeholder="Escuela">
              </div>  
          </div>
      </div>
      <div class="row">
          <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
              <div class="form-group">
                  <label for="CiudadOtraEsc">Ciudad:</label>
                  <input class="gui-input form-control" type="text" maxlength="180" id ="CiudadOtraEsc" name="CiudadOtraEsc" placeholder="Ciudad">
              </div>  
          </div>
          <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
              <div class="form-group">
                  <label>País:</label>
                  <label style="color:red;display:none;" id="paisOtraEscval"> <span class="glyphicon glyphicon-remove"></span> Campo obligatorio</label>
                  <select class="select2-single form-control"  id="paisOtraEsc" name="paisOtraEsc" style="width: 100%">
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
          <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
              <div class="form-group">
                  <label for="trasOtraEsc">Razon de Traslado:</label>
                  <textarea class="form-control" id="trasOtraEsc" name="trasOtraEsc" rows="4"></textarea>
              </div> 
          </div>
      </div>
      <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
          <div class="form-group">
              <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
                  <button type="submit" class="btn btn-lg btn-primary btn-block" id="botonform5OtrasEsc"><span class="glyphicon glyphicon-plus"></span> Agregar </button>
              </div>
          </div>
      </div> 
  </form>