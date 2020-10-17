<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="WebApplication2.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-repo">

        <!-- Page Header -->
        <div class="#">
          <h3 class="text-left">
            <i class="far fa-file color-icono"></i> &nbsp; Generar Reporte
          </h3>
          <p class="text-justify txt5">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
          </p>
        </div>



        <!-- Contenido -->
        <div class="container txt2">

          <div class="row">
            <div class="col-md-4 order-md-2 mb-4">

             <h5 class="mb-3">Reporte:  ##### </h5> 

             <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="contrato" name="contrato">
              <label class="custom-control-label" for="contrato">Contrato</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="proyecto" name="proyecto">
              <label class="custom-control-label" for="proyecto">Proyecto</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="facturado" name="facturado">
              <label class="custom-control-label" for="facturado">Facturado</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="garantia" name="garantia">
              <label class="custom-control-label" for="garantia">Garantía</label>
            </div>
            <br>
            <select class="custom-select d-block w-100" id="tipo" name="tipo" required>
              <option value="">Seleccione</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
            </select>
       
                <hr class="mb-4 hr-estilo-linea">

                  <label for="zip">Total de Horas</label>
                  <input type="text" class="form-control" id="total_horas" name="total_horas" placeholder="" required>
                <br>
                  <label for="zip">Horas Consumidas</label>
                  <input type="text" class="form-control" id="horas_consumidas" name="horas_consumidas" placeholder="" required>
                <br>
                  <label for="zip">Horas Disponibles</label>
                  <input type="text" class="form-control" id="horas_disponibles" name="horas_disponibles" placeholder="" required>
                     

          </div>

          <div class="container">
            <div class="py-1 text-center">
        

            </div>
          </div>


          <div class="col-md-8 order-md-1">
            <h5 class="mb-3">Fecha: 27/08/2020 </h5> 
            <form class="needs-validation" novalidate>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="firstName">Cliente</label>
                  <form class="card p-2">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Cliente" id="cliente" name="cliente">
                      <div class="input-group-append">
                        <button type="submit" class="cliente-btn-search">Buscar</button>
                      </div>
                    </div>
                  </form>        
                </div>
              </div>
              <div class="mb-3">
                <label for="address">Encargado</label>
                <input type="text" class="form-control" id="encargado" name="encargado" placeholder="Encargado" required>
              </div>
              <div class="mb-3 ">
                <label for="email">Correo</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Correo Electrónico">
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="firstName">Cantidad Disponible</label>
                  <div class="input-group">
                    <input type="text" id="cantidad_disponible" name="cantidad_disponible" class="form-control" placeholder="###">
                  </div>      
                </div>
              </div>
              
            </form>
          </div><!--Primera Parte-->
        </div><!--Row Contenido-->

          <hr class="mb-4 hr-estilo-linea">


        <h5 class="mb-3">Artículos:</h5> 


        <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

          <thead class="estilo-thead">
            <tr>
              <th>Artículo</th>
              <th>Descripción</th>
              <th>Horas</th>
              <th>Horas convertidas</th>
              <th>Eliminar</th>
            </tr>
          </thead>

          <tbodys>

            <tr class="txt2">
              <td><input class="form-control" type="text" name="" value=""></td>
              <td><input class="form-control" type="text" name="" value=""></td>
              <td><input class="form-control" type="text" name="" value=""></td>
              <td><input class="form-control" type="text" name="" value=""></td>
               <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
               </tr>

                    <tr class="txt2">
              <td><input class="form-control" type="text" name="" value=""></td>
              <td><input class="form-control" type="text" name="" value=""></td>
              <td><input class="form-control" type="text" name="" value=""></td>
              <td><input class="form-control" type="text" name="" value=""></td>
               <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
               </tr>
                     </tbody>

                     <tfoot class="estilo-thead">
                      <tr>
                       <th>Artículo</th>
                       <th>Descripción</th>
                       <th>Horas</th>
                       <th>Horas convertidas</th>
                       <th>Eliminar</th>
                     </tr>
                   </tfoot>

                 </table><!--Fin Tabla-->

<br>
                   <div class="col text-center">
                <button type="button" class="guardar-btn-reporte">Guardar</button>
              </div>

              <br>
            <br>

               </div><!--Container-->
             </div><!--Container Repo-->



</asp:Content>
