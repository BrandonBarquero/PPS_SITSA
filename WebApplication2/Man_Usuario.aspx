<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Usuario.aspx.cs" Inherits="WebApplication2.Man_Usuario" %>
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
       <i class="fas fa-user color-icono" aria-hidden="true"></i>&nbsp; Usuarios
     </h3>
     <p class="text-justify txt5">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
    </p>
  </div><!--Fin Cabecera-->

  <br>

<!-- Contenido -->
  <div class="container">

              <div class="form-group container">
    <select class="form-control select_selecionar_proyecto" id="select_usuario">
        <option selected="true" disabled="disabled">Seleccione el estado:</option>
           <option value="Activo_Usuario">Activo</option>
           <option value="Inactivo_Usuario">Inactivo</option>
           <option value="Todos_Usuario">General</option>
    </select>
  </div>

   <% if (Permisos.CREAR == false)
        {
           
               %>
      
      <div style="display: none;" id="divvalida">
                 <%  }%>
   <p>
  <button id="boton_multiple" class="btn btn-dark txt2" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
    Agregar usuario
  </button>
</p>
    
        <% if (Permisos.CREAR == false)
        {
           
               %>
      
      </div>
                 <%  }%>
      

<div class="collapse" id="collapseServicios">



  <div class="card card-body txt2">
 

                <p id="parrafo_servicio">Ingresar un nuevo usuario</p>


              <div class="form-group">
                <label> Cédula:</label>
                <input type="text" class="form-control" id="cedula">
              </div>
                <div style="display: none;" id="error_contrasenna" class="alert alert-danger">
              
                 <strong>¡Error!</strong> La cédula ya existe en el sistema.
                      </div>
               
              <div class="form-group">
                <label> Nombre:</label>
                <input type="text" class="form-control" id="nombre">
              </div>

              <div class="form-group">
                <label> Correo:</label>
                <input type="email" class="form-control" id="email">
              </div>
                <div style="display: none;" id="error_email" class="alert alert-danger">
              
                 <strong>¡Error!</strong>Correo ya utilizado.
                      </div>
            
                 <div  class="form-group">
            <label> Seleccionar Perfil:</label>

                
                 <input class="form-control" list="perfil_usuario" id="perfil">

                        <datalist id="perfil_usuario">
              <%
                   List<Biblioteca_Clases.Models.Perfil> list2 = lista_perfiles();

                    int autoincrement2 = 0;

                    foreach (var dato in list2)
                    {
                        autoincrement2 = autoincrement2 + 1;

                 %>   

                 <option value="<%=dato.Pk_ID_PERFIL%>"><%=dato.DESCRIPCION%>

              <%} %>

                      </datalist> 
          </div>

                         <div id="boton_enviar" style="text-align: center">

                        <button onclick="Agregar_Usuario()" type="submit" class="popup-btn">Agregar</button>
                    </div>

                    <div id="botones" style="display: none; text-align: center;">
                        <button onclick="Actualizar_Usuario()" type="submit" id="boton_modificar" class="popup-btn">Modificar</button>
                        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
                    </div>


        <br>
      </div>
    </div>
      <br>

       <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>Cédula</th>
            <th>Nombre</th>
            <th>Ver Detalles</th>
              <%if (Permisos.EDTIAR == true) { %>
            <th>Modificar</th>
            <th>Inhabilitar</th>
              <%}%>
          </tr>
        </thead>

        <tbody>
            
             <%List<Biblioteca_Clases.Models.Usuario> list = lista1();

                   string valor = Convert.ToString(Request.QueryString["Estado"]);
                        list = ListaUsuarios(valor);

                 int autoincrement = 0;

                 foreach(var dato in list)
                 {
                     autoincrement = autoincrement + 1;
                         %>
		    <tr class="txt2">
            <td><%=dato.CEDULA%></td>
            <td><%=dato.NOMBRE%></td>
            <td style="text-align: center;"><a  onclick="Funcion(<%=dato.CEDULA%>,'<%=dato.NOMBRE%>','<%=dato.CORREO%>','<%=dato.FK_PERFIL%>');" data-toggle="modal" data-target="#detalles_usuario" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
             <% if (Permisos.EDTIAR == true) { %>
              <td style="text-align: center;"><a data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios" onclick="Modificar_Usuario(<%=dato.CEDULA%>,'<%=dato.NOMBRE%>','<%=dato.CORREO%>','<%=dato.FK_PERFIL%>');" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios"><i class="fa fa-edit color-icono" aria-hidden="true"> </td
              <td style="text-align: center;">
              <input type="checkbox" class="custom-control-input" id="" >
             
                  </td>


                <td style="text-align: center;"><a href="#">
                            <div class="custom-control custom-switch">
                                <% if (dato.ESTADO == true)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_USUARIO%>, <%=dato.CEDULA%>)" type="checkbox" checked class="custom-control-input" id="<%=dato.CEDULA%>">
                                <%}
                                    else if (dato.ESTADO == false)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_USUARIO%>, <%=dato.CEDULA%> )" type="checkbox" class="custom-control-input" id="<%=dato.CEDULA%>">
                                <%}%>
                                <label class="custom-control-label" for="<%=dato.CEDULA%>" />
                            </div></td>
		    </tr>
            <%}%>
	<%}%>

                     </tbody>

                     <tfoot class="estilo-thead">
                      <tr>
                       <th>Cédula</th>
                       <th>Nombre</th>
                       <th>Ver Detalles</th>
                         <%      if (Permisos.EDTIAR == true){%>
                       <th>Modificar</th>
                       <th>Inhabilitar</th>
                         <%}%>
                     </tr>
                   </tfoot>

                 </table><!--Fin Tabla-->

               </div> <!--Container-->

             </div>  <!--Container mant-->


             <!--Popup Detalle-->
      <div id="detalles_usuario" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header popup-estilo-head">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body popup-estilo">

              <p>Información detallada</p>

                <div class="form-group">
                  <label> Cédula:</label>
                  <input readonly="" type="text" class="form-control" id="cedula2" name="cedula">
                </div>

                <div class="form-group">
                  <label> Nombre:</label>
                  <input readonly="" type="text" class="form-control" id="nombre2" name="nombre">
                </div>

                <div class="form-group">
                  <label> Correo:</label>
                  <input readonly="" type="text" class="form-control" id="correo2" name="correo">
                </div>

                 <div class="form-group">
                  <label> Perfil:</label>
                  <input readonly="" type="text" class="form-control" id="perfil2" name="correo">
                </div>
           

          </div>
        </div>
      </div>
    </div>
     <!--Fin Popup Detalle-->
    
  <script>


      function toggle(checked) {
          var x = document.getElementById("1").checked;
          if (x == true) {
              window.alert("true");
          }

          else if (x == false) {
              window.alert("false");
          }
      }

      var cedula_N;
      function Funcion(dato, dato2, dato3, dato4) {

          $("#cedula2").val(dato);
          $("#nombre2").val(dato2);
          $("#correo2").val(dato3);
          $("#perfil2").val(dato4);
      }
      function Modificar_Usuario(dato, dato2, dato3, dato4) {

          $("#cedula").val(dato);
          $("#nombre").val(dato2);
          $("#email").val(dato3);
          $("#perfil").val(dato4);


          $("#boton_enviar").css("display", "none");
          $("#botones").css("display", "block");
          $("#cedula").attr("readonly", "true");

          $('#boton_multiple').text("Modificar Usuario");
          $('#parrafo_servicio').text("Modificar usuario actual");
      }

      $(document).ready(function () {
          $('#cedula').change(function () {
              var cedula = $('#cedula').val();
              $.ajax({
                  type: 'post',
                  data: { cedula: cedula },
                  url: '/Default/verificacedula',
                  success: function (result) {
                      if (result == "fail") {
                          $("#error_contrasenna").css("display", "none");
                      }
                      else {
                          if (cedula != cedula_N) {
                              $("#error_contrasenna").css("display", "block");
                          }
                          if (cedula == cedula_N) {
                              $("#error_contrasenna").css("display", "none");
                          }
                      }
                  }
              });
          });
      });


      $(document).ready(function () {
          $('#email').change(function () {
              var email = $('#email').val();
              $.ajax({
                  type: 'post',
                  data: { email: email },
                  url: '/Default/verificaemail',
                  success: function (result) {
                      if (result == "fail") {
                          $("#error_email").css("display", "none");
                      }
                      else {
                          if (cedula != cedula_N) {
                              $("#error_email").css("display", "block");
                          }
                          if (cedula == cedula_N) {
                              $("#error_email").css("display", "none");
                          }
                      }
                  }
              });
          });
      });


      function Agregar_Usuario() {

          var usuario = new Object();
          usuario.cedula = $("#cedula").val();
          usuario.nombre = $("#nombre").val();
          usuario.correo = $("#email").val();
          usuario.fk_perfil = $("#perfil").val();
          

          if (usuario != null) {
              $.ajax({
                  type: "POST",
                  url: "/Usuario/agregar_usuario",
                  data: JSON.stringify(usuario),
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

      function Actualizar_Usuario() {

          var usuario = new Object();
          usuario.cedula = $("#cedula").val();
          usuario.nombre = $("#nombre").val();
          usuario.correo = $("#email").val();
          usuario.fk_perfil = $("#perfil").val();


          if (usuario != null) {
              $.ajax({
                  type: "POST",
                  url: "/Usuario/actualizar_usuario",
                  data: JSON.stringify(usuario),
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

      $(document).ready(function () {
          $('#select_usuario').change(function () {

              var val_select = $('#select_usuario').val();
              var url = window.location.href;
              var nuevaUrl = url.substring(0, url.indexOf('?'));
              window.location.href = nuevaUrl + "?Estado=" + val_select;

          });
      });

      function estado(dato_id, cedula) {

        

          var id_usuario = dato_id;
          var cedula_id = cedula;

          $("#" + cedula_id).on('change', function () {
              if ($(this).is(':checked')) {
                  $.ajax({
                      type: "post",
                      url: "/Usuario/actualizar_estado_Habilitar_Usuario",
                      data: {
                          id_usuario: id_usuario,

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
                  $.ajax({
                      type: "post",
                      url: "/Usuario/actualizar_estado_deshabilitar_Usuario",
                      data: {
                          id_usuario: id_usuario,
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

      var ShowPopup = function () {
          alert("No tiene permisos");

      }

  </script>
</asp:Content>

