<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Usuario.aspx.cs" Inherits="WebApplication2.Man_Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        Biblioteca_Clases.DAO.ServicioDAO dao = new Biblioteca_Clases.DAO.ServicioDAO();
        Biblioteca_Clases.DAO.LoginDAO dao2 = new Biblioteca_Clases.DAO.LoginDAO();
        string user = (string)(Session["User"]);
        int user_perfil = dao2.consultausuarioperfil(user);
        Biblioteca_Clases.Models.Permiso_e service= dao.ControlPaginas("Usuarios", user_perfil.ToString());

        if (service.VER == false) {
           ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);

        }
       %>



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
    <select class="form-control select_selecionar_proyecto" id="select_proyect">
        <option selected="true" disabled="disabled">Seleccione el estado:</option>
      <option>Activo</option>
      <option>Inactivo</option>
    </select>
  </div>

   <% if (service.CREAR == false)
        {
           
               %>
      
      <div style="display: none;" id="divvalida">
                 <%  }%>
   <p>
  <button class="btn btn-dark txt2" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
    Agregar usuario
  </button>
</p>
    
        <% if (service.CREAR == false)
        {
           
               %>
      
      </div>
                 <%  }%>
      

<div class="collapse" id="collapseServicios">



  <div class="card card-body txt2">
 

                <p>Ingresar un nuevo usuario</p>


              <div class="form-group">
                <label> Cédula:</label>
                <input type="text" class="form-control" id="cedula" name="cedula">
              </div>
                <div style="display: none;" id="error_contrasenna" class="alert alert-danger">
              
                 <strong>¡Error!</strong> La cédula ya existe en el sistema.
                      </div>
               
              <div class="form-group">
                <label> Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre">
              </div>

              <div class="form-group">
                <label> Correo:</label>
                <input type="email" class="form-control" id="email" name="email">
              </div>
                <div style="display: none;" id="error_email" class="alert alert-danger">
              
                 <strong>¡Error!</strong>Correo ya utilizado.
                      </div>
            
             <div class="form-group">
                <label> Perfil:</label>
                 <select id="perfil" class="browser-default custom-select">
                   <option selected>Perfil</option>
                   <option value="1">Adm</option>
                   <option value="2">User</option>
                 </select>
              </div>


       

             <div id="boton_enviar" style="text-align: center">
              <button   type="submit" class="popup-btn">Enviar correo</button>
            </div>
            <br>

                 <div id="botones" style="text-align: center;display :none">
        <button onclick="Actualiza_Usuario()" id="boton_modificar" type="submit" class="popup-btn">Modificar</button>
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
            <th>Cédula</th>
            <th>Nombre</th>
            <th>Ver Detalles</th>
              <%if (service.EDTIAR == true) { %>
            <th>Modificar</th>
            <th>Inhabilitar</th>
              <%}%>
          </tr>
        </thead>

        <tbody>
            
             <%List<Biblioteca_Clases.Models.Usuario> list = lista1();


                 int autoincrement = 0;

                 foreach(var dato in list)
                 {
                     autoincrement = autoincrement + 1;
                         %>
		    <tr class="txt2">
            <td><%=dato.CEDULA%></td>
            <td><%=dato.NOMBRE%></td>
            <td style="text-align: center;"><a  onclick="Funcion(<%=dato.CEDULA%>,'<%=dato.NOMBRE%>','<%=dato.CORREO%>','<%=dato.FK_PERFIL%>');" data-toggle="modal" data-target="#detalles_usuario" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
             <% if (service.EDTIAR == true) { %>
              <td style="text-align: center;"><a onclick="Modificar_Usuario(<%=dato.CEDULA%>,'<%=dato.NOMBRE%>','<%=dato.CORREO%>','<%=dato.FK_PERFIL%>');" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios"><i class="fa fa-edit color-icono" aria-hidden="true"> </td
              <td style="text-align: center;">
              <input type="checkbox" class="custom-control-input" id="" >
             
                  </td>
		    </tr>
            <%}%>
	<%}%>

                     </tbody>

                     <tfoot class="estilo-thead">
                      <tr>
                       <th>Cédula</th>
                       <th>Nombre</th>
                       <th>Ver Detalles</th>
                         <%      if (service.EDTIAR == true){%>
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

          cedula_N= dato;
          
          $("#boton_enviar").css("display", "none");
          $("#botones").css("display", "block");
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
      var Actualiza_Usuario = function () {

          var cedula = $("#cedula").val();
          var nombre = $("#nombre").val();
          var email = $("#email").val();
          var perfil = $("#perfil").val();
          $.ajax({
              type: "post",
              url: "/Default/actualiza_usuario",
              data: {
                  cedula: cedula,
                  nombre: nombre,
                  email: email,
                  perfil: perfil
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

      var ShowPopup = function () {
          alert("no tiene permisos");
          window.location = "Home.aspx";
      }
   
  </script>
</asp:Content>
