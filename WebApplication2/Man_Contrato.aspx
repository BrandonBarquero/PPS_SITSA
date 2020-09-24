<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Contrato.aspx.cs" Inherits="WebApplication2.Man_Contrato" %>
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
           <i class="fas fa-file-alt color-icono" aria-hidden="true"></i>&nbsp; Contratos
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


                <!--Panel agregar contrato-->

            <p>
  <button  class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
    Agregar Contrato
  </button>
</p>
<div class="collapse" id="collapseServicios">
  <div class="card card-body txt2">

        <form role="form" method="post" id="form_contrato_agregar">

            <p>Ingresar un nuevo contrato</p>


            <div class="row"> 

              <div class="col-12 col-md-6">
                <label> Seleccionar cliente:</label>
                <input class="form-control" list="lista_clientes">

                
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

                 <div class="col-12 col-md-6">
                   <div class="form-group">
                    <label> Nombre del contrato:</label>
                    <input type="text" class="form-control" id="nombre_contrato" name="nombre_contrato">
                  </div>
                </div>

                <div class="col-12 col-md-6">

                  <div class="form-group">
                    <label> Descripción:</label>
                    <textarea id="desc_contrato" class="md-textarea form-control" rows="3"></textarea>
                  </div>
                </div>



                <div class="col-12 col-md-6">
                  <label> Seleccionar contacto:</label>
                  <input class="form-control" list="brow4">
                  <datalist id="brow4">
                   <option value="allan">
                     <option value="eduard">
                     </datalist> 
                     <br>
                   </div>


                   <div class="col-12 col-md-6">
                     <div class="form-group">
                      <label> Fecha de inicio:</label>
                      <input type="date" class="form-control" id="fecha_inicio" name="fecha_inicio">
                    </div>
                  </div>

                  <div class="col-12 col-md-6">

                    <div class="form-group">
                      <label> Fecha de vencimiento:</label>
                      <input type="date" class="form-control" id="fecha_vencimiento" name="fecha_vencimiento">
                    </div>
                  </div>

                  <div class="col-12 col-md-12">

                    <label> Seleccionar tipo de contrato:</label> <!--Dependiendo lo que se seleccione se agregar los campos de hora, rango, etc-->
                    <input class="form-control" list="brow3">
                    <datalist id="brow3">
                     <option value="Redes">
                       <option value="Soporte">
                       </datalist> 
                     </div>


                     <div class="col-12 col-md-6">

                      <br>
                      <label> Seleccionar servicio:</label>
                      <input class="form-control" list="lista_servicios">
                      <datalist id="lista_servicios">
                          <%
                       Biblioteca_Clases.DAO.ServicioDAO servicio_dao = new  Biblioteca_Clases.DAO.ServicioDAO();
              List<Biblioteca_Clases.Models.Servicio> list_servicios = servicio_dao.listaServicios();


             int autoincrement_servicio = 0;

             foreach(var dato in list_servicios)
             {
                 autoincrement_servicio = autoincrement_servicio + 1;
                         %>
                 <option value="<%=dato.ID_SERVICIO%>"><%=dato.DESCRIPCION%></option>
                  
                                   <%}%>
                              </datalist> 
                              <br>
                            </div>

                            <div class="col-12 col-md-6">
                              <br>
                              <div class="form-group">
                                <label> Descripción del servicio:</label>
                                <input type="text" class="form-control" id="desc_contrato" name="desc_contrato">
                              </div>
                            </div>

                          </div>

              <p>Servicios del contrato</p>
                             <table class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

                              <thead class="estilo-thead">
                                <tr>
                                  <th>ID</th>
                                  <th>Descripción</th>
                                  <th>Inhabilitar</th>
                                </tr>
                              </thead>

                              <tbody>

                                <tr class="txt2">
                                  <td>001</td>
                                  <td>Soporte</td>
                                  <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                                  </tr>

                                  <tr class="txt2">
                                    <td>002</td>
                                    <td>Desarrollo</td>
                                    <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                                    </tr>

                                  </tbody>

                                </table><!--Fin Tabla-->


    

         <div id="boton_enviar" style="display: block; text-align: center">

       <button onclick="Agregar_Servicio()"  type="submit" class="popup-btn">Agregar</button>
             </div>

      <div id="botones" style=" display: none; text-align: center;">
       
        <button onclick="Actualizar_Servicio()"  type="submit" id="boton_modificar" class="popup-btn">Modificar</button>
        <button onclick="estado_inhabilitar_boton()" id="boton_inhabilitar" type="submit" class="popup-btn">Inhabilitar</button>
        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
      </div>

      <br> 
  </div>
<
</div>

                      <br>


                            <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

                              <thead class="estilo-thead">
                                <tr>
                                  <th>Consecutivo</th>
                                  <th>Nombre de Contrato</th>
                                  <th>Modificar</th>
                                  <th>Ver Detalles</th>
                                  <th>Inhabilitar</th>
                                </tr>
                              </thead>

                              <tbody>


                                  <%

              Biblioteca_Clases.DAO.ContratoDAO dao = new  Biblioteca_Clases.DAO.ContratoDAO();

            List<Biblioteca_Clases.Models.Contrato> list = dao.listaContratos();


             int autoincrement = 0;

             foreach(var dato in list)
             {
                 autoincrement = autoincrement + 1;
                         %>


                                <tr class="txt2">
                                  <td><%=dato.ID_CONTRATO%></td>
                                  <td><%=dato.NOMBRE_CONTRATO%></td>
                                  <td style="text-align: center;"><a onclick="" href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
                                  <td style="text-align: center;"><a href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                                   <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                                   </tr>

                                   <%}
                  
                 %>

                                       </tbody>

                                       <tfoot class="estilo-thead">
                                        <tr>
                                         <th>Consecutivo</th>
                                         <th>Nombre de Proyecto</th>
                                         <th>Modificar</th>
                                         <th>Ver Detalles</th>
                                         <th>Inhabilitar</th>
                                       </tr>
                                     </tfoot>

                                   </table><!--Fin Tabla-->

                                 </div> <!--Container-->

                               </div>  <!--Container mant-->

                          


                            <!--Script Tabla-->
                            <script type="text/javascript">
                              $(document).ready(function() {
                                $('#tabla-mant').DataTable();
                              } );
                            </script>
</asp:Content>
