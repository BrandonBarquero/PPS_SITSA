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
  <button  class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
    Agregar Servicio
  </button>
</p>
<div class="collapse" id="collapseServicios">
  <div class="card card-body txt2">


    <p id="parrafo_servicio">Agregar nuevo servicio</p>

    

        <div class="row">

         <div  id="campo_consecutivo" style="display: none;" class="col-12 col-md-6">

          <div  class="form-group">
            <label> Consecutivo:</label>
            <input type="text" class="form-control" id="consecutivo_servicio" name="consecutivo_servicio">
          </div>

        </div>


        <div class="col-12 col-md-6">

          <div class="form-group">
            <label> Descripción del servicio:</label>
            <input type="text" class="form-control" id="desc_servicio" name="desc_servicio">
          </div>

        </div>

      </div>

         <div id="boton_enviar" style="display: block; text-align: center">

       <button onclick="Agregar_Servicio()"  type="submit" class="popup-btn">Agregar</button>
             </div>

      <div id="botones" style=" display: none; text-align: center;">
       
        <button onclick="Actualizar_Servicio()"  type="submit" id="boton_modificar" class="popup-btn">Modificar</button>
        <button id="boton_inhabilitar" type="submit" class="popup-btn">Inhabilitar</button>
        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
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

    <tbody>

         <%List<Biblioteca_Clases.Models.Servicio> list = lista1();


                 int autoincrement = 0;

                 foreach(var dato in list)
                 {
                     autoincrement = autoincrement + 1;
                         %>

      <tr class="txt2">
        <td><%=dato.ID_SERVICIO%></td>
        <td><%=dato.DESCRIPCION%></td>
        <td style="text-align: center;"><a onclick="Modificar_Servicio(<%=dato.ID_SERVICIO%>,'<%=dato.DESCRIPCION%>');" href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
         <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
         </tr>


        <%}
                  
                 %>


     

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


          var Agregar_Servicio= function () {

              var descripcion = $("#desc_servicio").val();

              $.ajax({
                  type: "post",
                  url: "/Default/agregar_servicio",
                  data: {
                      descripcion: descripcion,
                  
                  },
                  success: function (result) {
                      if (result == "fail") {



                      }
                      else {

                          window.alert("exito");

                      }
                  }
              })
          }


          var Actualizar_Servicio = function () {


              var id_servicio = $("#consecutivo_servicio").val();

              var descripcion = $("#desc_servicio").val();

              $.ajax({
                  type: "post",
                  url: "/Default/actualizar_servicio",
                  data: {
                      id_servicio: id_servicio,
                      descripcion: descripcion,

                  },
                  success: function (result) {
                      if (result == "fail") {



                      }
                      else {

                          window.alert("exito");

                      }
                  }
              })
          }

          function Modificar_Servicio(dato, dato2) {

              $("#consecutivo_servicio").val(dato);
              $("#desc_servicio").val(dato2);

              cedula_N = dato;

              $("#boton_enviar").css("display", "none");
              $("#campo_consecutivo").css("display", "block");
              $("#botones").css("display", "block");
           //   $("#campo_consecutivo").css("text-align", "");
              $("#consecutivo_servicio").attr("readonly", "true");
              $('#boton_multiple').text("Modificar Servicio");
              $('#parrafo_servicio').text("Modificar servicio actual");

             
          }

      </script>





</asp:Content>
