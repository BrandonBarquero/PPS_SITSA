<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Cierre_Mes.aspx.cs" Inherits="WebApplication2.Cierre_Mes" %>
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
            <i class="far fa-file color-icono"></i> &nbsp; Cierre de mes
          </h3>
          <p class="text-justify txt5">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
          </p>
        </div>

		<!-- Contenido -->
		<div class="container txt2">

          <div class="row">

                 <div class="col-md-3 mb-3">
                  <label for="firstName">Cliente</label>
                  <form class="p-2">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Cliente" id="cliente" name="cliente">
                      <div class="input-group-append">
                        <button type="submit" class="cliente-btn-search">Buscar</button>
                      </div>
                    </div>
                  </form>
                </div>

                   <div class="col-md-3 mb-3">
                  <label for="firstName">Reporte</label>
                  <form class="p-2">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Reporte" id="reporte" name="reporte">
                      <div class="input-group-append">
                        <button type="submit" class="cliente-btn-search">Buscar</button>
                      </div>
                    </div>
                  </form>
                </div>
				
				<div class="col-md-3 mb-3">
                  <label for="firstName">Fecha inicial</label>
                  <form class="p-2">
                    <div class="input-group">
                  <input type="date" class="form-control" id="horas_convertidas" name="horas_convertidas" placeholder="" required>
                    </div>
                  </form>
                </div>
				
				<div class="col-md-3 mb-3">
                  <label for="firstName">Fecha final</label>
                  <form class="p-2">
                    <div class="input-group">
                  <input type="date" class="form-control" id="horas_convertidas" name="horas_convertidas" placeholder="" required>
                    </div>
                  </form>
                </div>
                
            </div>
			
			<ul class="nav nav-tabs md-tabs" id="myTabMD" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab-md" data-toggle="tab" href="#home-md" role="tab" aria-controls="home-md"
					aria-selected="true">Contrato</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab-md" data-toggle="tab" href="#profile-md" role="tab" aria-controls="profile-md"
					aria-selected="false">Facturado</a>
				</li>
			</ul>
			
			<!-- Tabla -->
			<table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

				<thead class="estilo-thead">
				  <tr>
					<th>Doumento</th>
					<th>Cantidad horas</th>
					<th>Estado</th>
          <th>Aprobar</th>
					<th>Reenviar</th>
					<th>Detalle</th>
				  </tr>
				</thead>

				<tbody>

					<tr class="txt2">
						<td>001</td>
						<td>14</td>
						<td>Activo</td>
                  <td style="text-align: center;"><a href="#"><i class="fa fa-check-square color-icono" aria-hidden="true"> </td>
						<td style="text-align: center;"><a href="#"><i class="fa fa-file-import color-icono" aria-hidden="true"> </td>
						<td style="text-align: center;"><a data-toggle="modal" data-target="#modificar_contrato" href="#"><i class="fa fa-edit color-icono" aria-hidden="true">	</td>
					</tr>
					
					<tr class="txt2">
						<td>002</td>
						<td>12</td>
						<td>Activo</td>
              <td style="text-align: center;"><a href="#"><i class="fa fa-check-square color-icono" aria-hidden="true"> </td>
						<td style="text-align: center;"><a href="#"><i class="fa fa-file-import color-icono" aria-hidden="true"> </td>
						<td style="text-align: center;"><a data-toggle="modal" data-target="#modificar_contrato" href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
					</tr>
					
					<tr class="txt2">
						<td>003</td>
						<td>10</td>
						<td>Activo</td>
              <td style="text-align: center;"><a href="#"><i class="fa fa-check-square color-icono" aria-hidden="true"> </td>
						<td style="text-align: center;"><a href="#"><i class="fa fa-file-import color-icono" aria-hidden="true"> </td>
						<td style="text-align: center;"><a data-toggle="modal" data-target="#modificar_contrato" href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
					</tr>

				</tbody>

				<tfoot class="estilo-thead">
					<tr>
						<th>Documento</th>
						<th>Cantidad horas</th>
						<th>Estado</th>
            <th>Aprobar</th>
						<th>Reenviar</th>
						<th>Detalle</th>
					</tr>
				</tfoot>

            </table><!--Fin Tabla-->
			
			<div class="row">
				<div class="col-md-3 mb-3">
					<label for="firstName">Total de horas:</label>
					<form class="p-2">
						<div class="input-group">
							<input type="text" class="form-control" id="horas_total" name="horas_total" placeholder="" required>
						</div>
					</form>
                </div>
			</div>
			
			<div class="row">
				<div class="col clearfix">
					<span class="float-right">
						<div class="input-group-append">
							<button type="submit" class="guardar-btn-reporte">Aplicar</button>
              &nbsp &nbsp
							
							<button type="submit" class="guardar-btn-reporte">Facturar</button>
						</div>							
					</span>
				</div>
			</div>

		</div><!--Container-->
		
		<!--Popup Detalle-->
       <div id="modificar_contrato" class="modal fade" role="dialog">
        <div class="modal-dialog">
        <!-- Modal contenido-->
        <div class="modal-content" style="background-color:#EBEBEB;">

            <div class="modal-header popup-estilo-head">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body popup-estilo">

				<form role="form" method="post" id="form_contrato_modificar">

					<p>Detalle</p>

						<div class="form-group">
							<textarea id="desc_contrato" class="md-textarea form-control" rows="3"></textarea>
						</div>

					<button type="submit" class="popup-btn">Agregar</button>

				</form>
         
			</div>
        </div>
        </div>
      </div>
      <!--Fin Popup Detalle-->
	

        <!-- Contenido -->
       <div class="container txt2">

<!--
<ul class="nav nav-tabs md-tabs" id="myTabMD" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab-md" data-toggle="tab" href="#home-md" role="tab" aria-controls="home-md"
      aria-selected="true">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab-md" data-toggle="tab" href="#profile-md" role="tab" aria-controls="profile-md"
      aria-selected="false">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab-md" data-toggle="tab" href="#contact-md" role="tab" aria-controls="contact-md"
      aria-selected="false">Contact</a>
  </li>
</ul>
<div class="tab-content card pt-5" id="myTabContentMD">
  <div class="tab-pane fade show active" id="home-md" role="tabpanel" aria-labelledby="home-tab-md">
    <p>prueba.</p>
  </div>
  <div class="tab-pane fade" id="profile-md" role="tabpanel" aria-labelledby="profile-tab-md">
    <p>prueba 2</p>
  </div>
  <div class="tab-pane fade" id="contact-md" role="tabpanel" aria-labelledby="contact-tab-md">
    <p>Prueba 3</p>
  </div>
</div>-->


            </div><!--Container-->
    </div><!--Container Repo-->
</asp:Content>

