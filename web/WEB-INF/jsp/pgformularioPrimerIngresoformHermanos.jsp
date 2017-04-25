
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" %>
<form id="formHermanos" action="#"
    data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
    data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">    
      <div class="row">
          <h3 style="margin-left: 6px;"><b class="text-success">Información de Hermanos:</b></h3>
          <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
              <div class="form-group">
                  <label for="NombreHerm">Nombre de Hermano/Hermana:</label>
                  <input class="gui-input form-control" type="text" maxlength="180" id ="NombreHerm" name="NombreHerm" placeholder="Nombre Completo">
              </div>  
          </div>
      </div>
      <div class="row">
          <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
              <div class="form-group">
                  <label for="EdadHerm">Edad:</label>
                  <input class="gui-input form-control" maxlength="15" type="number" data-bv-trigger="keyup" required data-bv-notempty-message="Campo obligatorio" id ="EdadHerm" name="EdadHerm" placeholder="Edad" max="120" min="1">
              </div>  
          </div>
          <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
              <div class="form-group">
                  <label for="EscuelaHerm">Escuela:</label>
                  <input class="gui-input form-control" type="text" maxlength="180" id ="EscuelaHerm" name="EscuelaHerm" placeholder="Escuela">
              </div>  
          </div>
    </div>
    <div class="row" style="margin-left: 1em;margin-bottom: 1em;margin-top: 1em;margin-right: 1em;">
        <div class="form-group">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                  <button type="button" class="btn btn-lg btn-danger btn-block" id="botonform2" onclick="cargarContenido('vacio.gdc','divformHermanos')"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
                  <button type="submit" class="btn btn-lg btn-primary btn-block" id="botonform2"><span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
            </div>
        </div>
    </div> 
  </form>