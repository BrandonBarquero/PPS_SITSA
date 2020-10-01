<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Proyecto.aspx.cs" Inherits="WebApplication2.Man_Proyecto" %>
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
       <i class="fas fa-project-diagram color-icono" aria-hidden="true"></i>&nbsp; Proyectos
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
                    <option selected="" disabled="disabled">Seleccione el estado:</option>
                    <option value="Activo_Servicio">Activo</option>
                    <option value="Inactivo_Servicio">Inactivo</option>
                    <option value="Todos_Servicio">General</option>
                    <option>Proyectos en Curso</option>
                    <option>Proyectos Terminados</option>
                    <option>Proyectos Activos</option>
                    <option>Proyectos Inhabilitados</option>
                </select>
            </div>

       <% if (Permisos.CREAR == false)
                {

            %>

            <div style="display: none;" id="divvalida">
                <%  }%>

                 <p>
                    <button class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseProyectos" aria-expanded="false" aria-controls="collapseProyectos">
                        Agregar Proyecto
                    </button>
                </p>

                  <% if (Permisos.CREAR == false)
                    {

                %>
            </div>
            <%  }%>



                <div class="collapse" id="collapseProyectos">
                <div class="card card-body txt2">


                    <p id="parrafo_proyecto">Agregar nuevo proyecto</p>

                    <div id="consecutivo_proyecto_div" class="form-group" style="display: none">
                <label> Consecutivo:</label>
                <input id="consecutivo_proyecto" type="text" class="form-control" >
              </div>

                     <div class="form-group">
                <label> Seleccionar cliente:</label>
                <input id="cliente_proyecto"  class="form-control" list="lista_clientes">

                
                <datalist id="lista_clientes">
                       <%
              Biblioteca_Clases.DAO.ClienteDAO cliente_dao = new  Biblioteca_Clases.DAO.ClienteDAO();
              List<Biblioteca_Clases.Models.Cliente> list_clientes = cliente_dao.listaClientes();


             int autoincrement_cliente = 0;

             foreach(var dato in list_clientes)
             {
                 autoincrement_cliente = autoincrement_cliente + 1;
                         %>
                 <option value="<%=dato.ID_CLIENTE%>"><%=dato.NOMBRE%></option>
                  
                                   <%}%>
                   </datalist> 
                   <br>
                 </div>

              <div class="form-group">
                <label> Nombre del proyecto:</label>
                <input type="text" class="form-control" id="nombre_proyecto" name="nombre_proyecto">
              </div>

              <div class="form-group">
                <label> Descripción:</label>
                <textarea id="desc_proyecto" class="md-textarea form-control" rows="3"></textarea>
              </div>

              <div class="form-group">
                <label> Precio:</label>
                <input type="text" class="form-control" id="precio" name="precio">
              </div>


              <div id="boton_agregar" style="text-align: center">

                        <button onclick="Agregar_Proyecto()" type="submit" class="popup-btn">Agregar</button>
                    </div>

                    <div id="botones" style="display: none; text-align: center;">
                        <button onclick="Actualizar_Proyecto()" type="submit" id="boton_modificar" class="popup-btn">Modificar</button>
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
            <th>Nombre de Proyecto</th>
            <th>Ver Detalles</th>
               <%if (Permisos.EDTIAR == true)
                            { %>
            <th>Fase Tiempo</th>
            <th>Modificar</th>
            <th>Inhabilitar</th>
               <%}%>
          </tr>
        </thead>

        <tbody>

            <%
                        List<Biblioteca_Clases.Models.Proyecto> list = new List<Biblioteca_Clases.Models.Proyecto>();
                        string valor = Convert.ToString(Request.QueryString["Estado"]);
                        list = ListaProyectos(valor);
                        int autoincrement = 0;

                        foreach (var dato in list)
                        {
                            autoincrement = autoincrement + 1;
                    %>

          <tr class="txt2">
            <td><%=dato.ID_PROYECTO%></td>
            <td><%=dato.NOMBRE%></td>
             <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_proyecto" onclick="ver_detalles('<%=dato.ID_PROYECTO%>','<%=dato.NOMBRE%>','<%=dato.DESCRIPCION%>','<%=dato.PRECIO%>','<%=dato.FK_ID_CLIENTE%>');"  href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
              <% if (Permisos.EDTIAR == true)
                            { %>
            <td style="text-align: center;"><a data-toggle="modal" data-target="#fase_tiempo_proyecto" href="#"><i class="fa fa-clock color-icono" aria-hidden="true"></td>
             <td style="text-align: center;"> <a data-toggle="collapse" data-target="#collapseProyectos" aria-expanded="false" aria-controls="collapseServicios" onclick="editar('<%=dato.ID_PROYECTO%>','<%=dato.NOMBRE%>','<%=dato.DESCRIPCION%>','<%=dato.PRECIO%>','<%=dato.FK_ID_CLIENTE%>');"  href="#"><i class="fa fa-edit color-icono" aria-hidden="true"> </td>
               <td style="text-align: center;"><a href="#">
                            <div class="custom-control custom-switch">
                                <% if (dato.ESTADO == 1)
                                    {


                                %>
                                <input onclick="estado(<%=dato.ID_PROYECTO%>)" type="checkbox" checked class="custom-control-input" id="<%=dato.ID_PROYECTO%>">
                                <%}

                                    else if (dato.ESTADO == 0)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_PROYECTO%>)" type="checkbox" class="custom-control-input" id="<%=dato.ID_PROYECTO%>">

                                <%}%>

                                <label class="custom-control-label" for="<%=dato.ID_PROYECTO%>" />

                            </div></td>
               <%}%>
               </tr>

            <%}

                    %>

                     </tbody>

                     <tfoot class="estilo-thead">
                      <tr>
                       <th>Consecutivo</th>
                       <th>Nombre de Proyecto</th>
                       <th>Ver Detalles</th>
                             <%      if (Permisos.EDTIAR == true)
                            {%>
                       <th>Fase Tiempo</th>
                       <th>Modificar</th>
                       <th>Inhabilitar</th>
                          <%}%>
                     </tr>
                   </tfoot>

                 </table><!--Fin Tabla-->

               </div> <!--Container-->

             </div>  <!--Container mant-->

     <!--Popup Detalles-->
      <div id="detalles_proyecto" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header popup-estilo-head">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body popup-estilo">

            <p id="parrafo_servicio2">Detalles del proyecto</p>

                <div class="form-group">
                <label> Consecutivo:</label>
                <input type="text" class="form-control" id="consecutivo_proyecto2" readonly>
              </div>

                     <div class="form-group">
                <label> Cliente:</label>
                <input type="text" class="form-control" id="cliente_proyecto2" readonly>
              </div>

              <div class="form-group">
                <label> Nombre del proyecto:</label>
                <input type="text" class="form-control" id="nombre_proyecto2" readonly>
              </div>

              <div class="form-group">
                <label> Descripción:</label>
                <textarea readonly id="desc_proyecto2" class="md-textarea form-control" rows="3"></textarea>
              </div>

              <div class="form-group">
                <label> Precio:</label>
                <input type="text" class="form-control" id="precio2" readonly>
              </div>

          </div>
        </div>
      </div>
    </div>
     <!--Fin Popup detalle-->


      <!--Popup Fase Tiempo-->
      <div id="fase_tiempo_proyecto" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header popup-estilo-head">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body popup-estilo">

           

               <p>Fases del proyecto</p>

                     <div class="form-group">
                  <label> Tiempo:</label>
                  <input type="text" class="form-control" id="tiempo_proyecto" name="tiempo_proyecto">
                </div>

                 <div class="form-group">
                <label> Descripción:</label>
                <input type="text" class="form-control" id="descripcion_proyecto" name="descripcion_proyecto">
              </div>

                <button type="submit" class="popup-btn">Agregar</button>


             <hr class="mb-4 hr-estilo-linea">


           <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>ID</th>
            <th>Tiempo</th>
            <th>Descripción</th>
            <th>Inhabilitar</th>
          </tr>
        </thead>

        <tbody>

          <tr class="txt2">
            <td>001</td>
            <td>1</td>
            <td>Fase Inicial</td>
               <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
               </tr>

               <tr class="txt2">
                <td>002</td>
                <td>2</td>
                <td>Fase Final</td>
                  <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                  </tr>

                     </tbody>

                 </table><!--Fin Tabla-->

          </div>
        </div>
      </div>
    </div>
     <!--Fin Popup Fase Tiempo-->

      <script type="text/javascript">
    $(document).ready(function() {
      $('#tabla-mant').DataTable();
    });

          function ver_detalles(id, nombre, descripcion, precio, cliente) {
              $("#consecutivo_proyecto2").val(id);
              $("#nombre_proyecto2").val(nombre);
              $("#desc_proyecto2").val(descripcion);
              $("#precio2").val(precio);
              $("#cliente_proyecto2").val(cliente);
          }

          function editar(id, nombre, descripcion, precio, cliente) {
              $("#consecutivo_proyecto").val(id);
              $("#nombre_proyecto").val(nombre);
              $("#desc_proyecto").val(descripcion);
              $("#precio").val(precio);
              $("#cliente_proyecto").val(cliente);

              $("#boton_agregar").css("display", "none");
              $("#botones").css("display", "block");
              $("#consecutivo_proyecto_div").css("display", "block");
              $("#consecutivo_proyecto").attr("readonly", "true");

              $('#boton_multiple').text("Modificar Proyecto");
              $('#parrafo_proyecto').text("Modificar proyecto actual");
          }

          function Agregar_Proyecto() {

              var proyecto = new Object();
              proyecto.nombre = $("#nombre_proyecto").val();
              proyecto.descripcion = $("#desc_proyecto").val();
              proyecto.precio = $("#precio").val();
              proyecto.fk_id_cliente = $("#cliente_proyecto").val();

              if (proyecto != null) {
                  $.ajax({
                      type: "POST",
                      url: "/Proyecto/agregar_proyecto",
                      data: JSON.stringify(proyecto),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                          if (response != null) {
                              alert("Name : " + response.Name + ", Designation : " + response.Designation + ", Location :" + response.Location);
                          } else {
                              alert("Something went wrong");
                          }
                      },
                      failure: function (response) {
                          alert(response.responseText);
                      },
                      error: function (response) {
                          alert(response.responseText);
                      }
                  });
              }
          }


          function Actualizar_Proyecto() {

              var proyecto = new Object();
              proyecto.id_proyecto = $("#consecutivo_proyecto").val();
              proyecto.nombre = $("#nombre_proyecto").val();
              proyecto.descripcion = $("#desc_proyecto").val();
              proyecto.precio = $("#precio").val();
              proyecto.fk_id_cliente = $("#cliente_proyecto").val();

              if (proyecto != null) {
                  $.ajax({
                      type: "POST",
                      url: "/Proyecto/actualizar_proyecto",
                      data: JSON.stringify(proyecto),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                          if (response != null) {
                              alert("Name : " + response.Name + ", Designation : " + response.Designation + ", Location :" + response.Location);
                          } else {
                              alert("Something went wrong");
                          }
                      },
                      failure: function (response) {
                          alert(response.responseText);
                      },
                      error: function (response) {
                          alert(response.responseText);
                      }
                  });
              }
          }

          function estado(dato_id) {


              var id_proyecto = dato_id;

              $("#" + id_proyecto).on('change', function () {
                  if ($(this).is(':checked')) {

                      alert("check");

                      $.ajax({
                          type: "post",
                          url: "/Proyecto/actualizar_estado_Habilitar_proyecto",
                          data: {
                              id_proyecto: id_proyecto,
                          },
                          success: function (result) {
                              if (result == "fail") {



                              }
                              else {

                                  window.alert("exito");

                              }
                          }
                      })



                  } else {
                      alert("no");


                      $.ajax({
                          type: "post",
                          url: "/Proyecto/actualizar_estado_deshabilitar_proyecto",
                          data: {
                              id_proyecto: id_proyecto,
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
              });
          };


          $(document).ready(function () {
              $('#select_proyect').change(function () {

                  var val_select = $('#select_proyect').val();
                  var url = window.location.href;
                  var nuevaUrl = url.substring(0, url.indexOf('?'));
                  window.location.href = nuevaUrl + "?Estado=" + val_select;

              });
          });

          var ShowPopup = function () {
              alert("No tiene permisos");

          }
      </script>



</asp:Content>
