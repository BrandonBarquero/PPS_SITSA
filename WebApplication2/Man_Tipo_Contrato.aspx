<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Tipo_Contrato.aspx.cs" Inherits="WebApplication2.Man_Tipo_Contrato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-mant">


      <div class="#"> <!--Cabecera-->
        <h3 class="text-left">
         <i class="fas fa-file-alt color-icono" aria-hidden="true"></i>&nbsp; Tipo de Contratos
       </h3>
       <p class="text-justify txt5">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
      </p>
    </div><!--Fin Cabecera-->

    <br>

    <!-- Contenido -->
    <div class="container">

      <div class="form-group container">
        <select class="form-control select_selecionar_proyecto" id="select_proyect">
          <option selected="true" disabled="disabled">Seleccione el estado:</option>
          <option>Activo</option>
          <option>Inactivo</option>
        </select>
      </div>

          <p>
  <button class="btn btn-dark txt2" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
    Agregar tipo de contrato
  </button>
</p>
<div class="collapse" id="collapseServicios">
  <div class="card card-body txt2">

    <p>Información</p>

          <div class="form-group">
            <label> Consecutivo:</label>
            <input type="text" class="form-control" id="consecutivo_tipo_contrato" name="consecutivo_tipo_contrato" readonly="">
          </div>

          <div class="form-group">
            <label> Nombre del tipo de contrato:</label>
            <input type="text" class="form-control" id="nombre_tipo_contrato" name="nombre_tipo_contrato">
          </div>

          <div class="form-group">
            <label>Opciones del tipo de contrato:</label>

            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="horas" name="horas">
              <label class="custom-control-label" for="horas">Horas</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="rango_documentos" name="rango_documentos">
              <label class="custom-control-label" for="rango_documentos">Rango de documentos</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="monto" name="monto">
              <label class="custom-control-label" for="monto">Monto</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="aceptacion" name="aceptacion">
              <label class="custom-control-label" for="aceptacion">Aceptación</label>
            </div>

          </div>

        </form>

      <div style="text-align: center">
        <button type="submit" class="popup-btn">Agregar</button>
        <button type="submit" class="popup-btn">Modificar</button>
        <button type="submit" class="popup-btn">Inhabilitar</button>
      </div>

      <br> 
  </div>
</div>

      <br>

      <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>Consecutivo</th>
            <th>Nombre del Tipo de Contrato</th>
             <th>Ver Detalles</th>
             <th>Modificar</th>
            <th>Inhabilitar</th>
          </tr>
        </thead>

        <tbodys>

          <tr class="txt2">
            <td>001</td>
            <td>Tipo 01</td>
            <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_tipo_contrato" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
            <td style="text-align: center;"><a href="#"><i class="fa fa-edit color-icono" aria-hidden="true"> </td>
            <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
            </tr>

            <tr class="txt2">
              <td>002</td>
              <td>Tipo 02</td>
              <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_tipo_contrato" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                <td style="text-align: center;"><a href="#"><i class="fa fa-edit color-icono" aria-hidden="true"> </td>
              <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
              </tr>

              <tr class="txt2">
                <td>003</td>
                <td>Tipo 03</td>
                <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_tipo_contrato" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                  <td style="text-align: center;"><a href="#"><i class="fa fa-edit color-icono" aria-hidden="true"> </td>
                <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                </tr>

              </tbody>

              <tfoot class="estilo-thead">
                <tr>
                 <th>Consecutivo</th>
                 <th>Nombre del Tipo de Contrato</th>
                  <th>Ver Detalles</th>
                 <th>Modificar</th>
                 <th>Inhabilitar</th>
               </tr>
             </tfoot>

           </table><!--Fin Tabla-->

         </div> <!--Container-->

       </div>  <!--Container mant-->


      <!--Popup Detalle-->
      <div id="detalles_tipo_contrato" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header popup-estilo-head">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body popup-estilo">

              <form role="form" method="post" id="form_tipo_proyecto_detalle">

           <p>Información tipo de contrato</p>

          <div class="form-group">
            <label> Consecutivo:</label>
            <input type="text" class="form-control" id="consecutivo_tipo_contrato" name="consecutivo_tipo_contrato" readonly="">
          </div>

          <div class="form-group">
            <label> Nombre del tipo de contrato:</label>
            <input type="text" class="form-control" id="nombre_tipo_contrato" name="nombre_tipo_contrato" readonly="">
          </div>

          <div class="form-group">
            <label>Tipo de contrato:</label>

            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="horas" name="horas">
              <label class="custom-control-label" for="horas">Horas</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="rango_documentos" name="rango_documentos">
              <label class="custom-control-label" for="rango_documentos">Rango de documentos</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="monto" name="monto">
              <label class="custom-control-label" for="monto">Monto</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="aceptacion" name="aceptacion">
              <label class="custom-control-label" for="aceptacion">Aceptación</label>
            </div>

          </div>
      
            </form>

          </div>
        </div>
      </div>
    </div>
     <!--Fin Popup Detalle-->


      <!--Script Tabla-->
    <script type="text/javascript">
      $(document).ready(function() {
        $('#tabla-mant').DataTable();
      } );
    </script>
</asp:Content>
