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
        <button class="accordion txt2">Agregar contrato</button>
        <div class="panel txt2">
          <br>

          <form role="form" method="post" id="form_contrato_agregar">

            <p>Ingresar un nuevo contrato</p>


            <div class="row"> 

              <div class="col-12 col-md-6">
                <label> Seleccionar cliente:</label>
                <input class="form-control" list="brow2">
                <datalist id="brow2">
                 <option value="allan">
                   <option value="eduard">
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
                      <input class="form-control" list="brow2">
                      <datalist id="brow2">
                       <option value="2344234234">
                         <option value="234234">
                           <option value="2342352335">
                            <option value="2354242">
                              <option value="123123">
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

                          <div style="text-align: center">


                            <button type="submit" class="popup-btn">Agregar</button>

                          </div>


                        </form>


                        <br>
                      </div>

                      <br>

                      <!--Panel detalles-->

                      <button class="accordion txt2">Consultar detalles</button>
                      <div class="panel txt2">
                        <br>



                        <form role="form" method="post" id="form_contrato_modificar">

                          <p>Información detallada</p>


                          <div class="row">

                           <div class="col-12 col-md-6">
                             <div class="form-group">
                              <label> Consecutivo de contrato:</label>
                              <input type="text" class="form-control" id="consecutivo_contrato" name="consecutivo_proyecto">
                            </div>
                          </div>

                          <div class="col-12 col-md-6">
                           <label>Cliente:</label>
                           <input class="form-control" list="brow2">
                           <datalist id="brow2">
                             <option value="allan">
                               <option value="eduard">
                               </datalist> 
                             </div>

                             <br>
                             <div class="col-12 col-md-6">
                              <div class="form-group">
                                <label> Nombre de contrato:</label>
                                <input type="text" class="form-control" id="nombre_proyecto" name="nombre_proyecto">
                              </div>
                            </div>

                            <div class="col-12 col-md-6">
                             <div class="form-group">
                              <label> Descripción:</label>
                              <textarea id="desc_contrato" class="md-textarea form-control" rows="3"></textarea>
                            </div>
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

                        <div class="col-12 col-md-6">


                         <label>Contacto:</label>
                         <input class="form-control" list="brow4">
                         <datalist id="brow4">
                           <option value="allan">
                             <option value="eduard">
                             </datalist> 
                             <br>
                           </div>

                           <div class="col-12 col-md-6">


                             <label>Tipo de contrato:</label> <!--Dependiendo lo que se seleccione se agregar los campos de hora, rango, etc-->
                             <input class="form-control" list="brow3">
                             <datalist id="brow3">
                               <option value="Redes">
                                 <option value="Soporte">
                                 </datalist> 


                               </div>

                             </div>

                             <br>


                             <p>Servicios del contrato</p>
                             <table class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

                              <thead class="estilo-thead">
                                <tr>
                                  <th>ID</th>
                                  <th>Descripción</th>
                                  <th>Inhabilitar</th>
                                </tr>
                              </thead>

                              <tbodys>

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
                                <br>


                                <div style="text-align: center">
                                  <button type="submit" class="popup-btn">Modificar</button>
                                  <button type="submit" class="popup-btn">Inhabilitar</button>
                                </div>
                              </form>


                              <br>
                            </div>

                            <br>

                            <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

                              <thead class="estilo-thead">
                                <tr>
                                  <th>Consecutivo</th>
                                  <th>Nombre de Contrato</th>
                                  <th>Cliente</th>
                                  <th>Ver Detalles</th>
                                  <th>Inhabilitar</th>
                                </tr>
                              </thead>

                              <tbodys>

                                <tr class="txt2">
                                  <td>001</td>
                                  <td>Proyecto 01</td>
                                  <td>Eduard Aráuz</td>
                                  <td style="text-align: center;"><a href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                                   <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                                   </tr>

                                   <tr class="txt2">
                                    <td>002</td>
                                    <td>Proyecto 02</td>
                                    <td>Allan Oviedo</td>
                                    <td style="text-align: center;"><a href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                                      <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                                      </tr>

                                      <tr class="txt2">
                                        <td>003</td>
                                        <td>Proyecto 03</td>
                                        <td>Brandon Barquero</td>
                                        <td style="text-align: center;"><a href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                                         <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                                         </tr>

                                       </tbody>

                                       <tfoot class="estilo-thead">
                                        <tr>
                                         <th>Consecutivo</th>
                                         <th>Nombre de Proyecto</th>
                                         <th>Cliente</th>
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

                              var acc = document.getElementsByClassName("accordion");
                              var i;

                              for (i = 0; i < acc.length; i++) {
                                acc[i].onclick = function(){
                                  this.classList.toggle("active");
                                  this.nextElementSibling.classList.toggle("show");
                                }
                              }
                            </script>
</asp:Content>
