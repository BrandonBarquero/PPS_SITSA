<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Servicio.aspx.cs" Inherits="WebApplication2.Man_Servicio" %>
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
         <i class="fas fa-network-wired color-icono" aria-hidden="true"></i>&nbsp; Servicios
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
    Agregar Servicio
  </button>
</p>
<div class="collapse" id="collapseServicios">
  <div class="card card-body txt2">


    <p>Información</p>

    <form role="form" method="post" id="form_servicios"> 

        <div class="row">

         <div class="col-12 col-md-6">

          <div class="form-group">
            <label> Consecutivo:</label>
            <input type="text" class="form-control" id="consecutivo_servicio" name="consecutivo_servicio" readonly="">
          </div>

        </div>


        <div class="col-12 col-md-6">

          <div class="form-group">
            <label> Descripción del servicio:</label>
            <input type="text" class="form-control" id="desc_servicio" name="desc_servicio">
          </div>

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
        <th>Descripción de Servicio</th>
        <th>Modificar</th>
        <th>Inhabilitar</th>
      </tr>
    </thead>

    <tbodys>

      <tr class="txt2">
        <td>001</td>
        <td>Soporte técnico</td>
        <td style="text-align: center;"><a href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
         <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
         </tr>

         <tr class="txt2">
          <td>002</td>
          <td>Infraestructura de redes</td>
          <td style="text-align: center;"><a href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
            <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
            </tr>

            <tr class="txt2">
              <td>003</td>
              <td>Desarrollo de software</td>
              <td style="text-align: center;"><a href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
               <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
               </tr>

             </tbody>

             <tfoot class="estilo-thead">
              <tr>
               <th>Consecutivo</th>
               <th>Descripción de Servicio</th>
               <th>Modificar</th>
               <th>Inhabilitar</th>
             </tr>
           </tfoot>

         </table><!--Fin Tabla-->

       </div> <!--Container-->

     </div>  <!--Container mant-->

      <script type="text/javascript">
         $(document).ready(function () {
             $('#tabla-mant').DataTable();
         });
      </script>



</asp:Content>
