<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Control_Visitas.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-home">

			<!-- Page Header -->
			<div class="#">
				<h3 class="text-left">
				<i class="fas fa-door-open color-icono"></i> &nbsp; Bienvenido
				</h3>
				<p class="text-justify txt5">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
				</p>
			</div>
			
			<!-- Contenido -->
			<div class="full-box tile-container" style="zoom: 80%;">

				<a href="#" class="tile">
					<div class="tile-tittle txt1">Clientes</div>
					<div class="tile-icon">
						<i class="fas fa-users fa-fw color-icono"></i>
						<p class="txt3">5 Registrados</p>
					</div>
				</a>

					<a href="#" class="tile">
					<div class="tile-tittle txt1">Usuarios</div>
					<div class="tile-icon">
				    <i class="fas fa-user-friends color-icono"></i>
						<p class="txt3">50 Registrados</p>
					</div>
				</a>

				<a href="#" class="tile">
					<div class="tile-tittle txt1">Contratos</div>
					<div class="tile-icon">
						<i class="fas fa-file-contract color-icono"></i>
						<p class="txt3">9 Registrados</p>
					</div>
				</a>

				<a href="#" class="tile">
					<div class="tile-tittle txt1">Servicios</div>
					<div class="tile-icon">
						<i class="fas fa-file-invoice-dollar fa-fw color-icono"></i>
						<p class="txt3">10 Registrados</p>
					</div>
				</a>

				<a href="#" class="tile">
					<div class="tile-tittle txt1">Proyectos</div>
					<div class="tile-icon">
					<i class="fas fa-drafting-compass color-icono"></i>
						<p class="txt3">1 Registrada</p>
					</div>
				</a>
				
				<a href="#" class="tile">
					<div class="tile-tittle txt1">Cierre de mes</div>
					<div class="tile-icon">
					<i class="fas fa-calendar-times color-icono"></i>
						<p class="txt3">1 Registrada</p>
					</div>
				</a>

			</div> <!--Fin Contenido-->
			
	</div> <!--Fin contenedor Home-->
</asp:Content>
