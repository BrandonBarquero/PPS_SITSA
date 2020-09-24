<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Cliente.aspx.cs" Inherits="WebApplication2.Man_Cliente" %>
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
       <i class="fas fa-user-check color-icono" aria-hidden="true"></i>&nbsp; Clientes
     </h3>
     <p class="text-justify txt5">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
    </p>
  </div><!--Fin Cabecera-->

  <br>

<!-- Contenido -->
  <div class="container">

    <p>
  <button  class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
    Asignar Servicio
  </button>
</p>
<div class="collapse" id="collapseServicios">
  <div class="card card-body txt2">


    <p id="parrafo_servicio">Asignar nuevo servicio</p>

    

        <div class="row">

         <div  id="campo_consecutivo" style="" class="col-12 col-md-6">

          <div  class="form-group">
            <label> Seleccionar cliente:</label>

                
                 <input class="form-control" list="consecutivo_servicio">
              <%

                    Biblioteca_Clases.DAO.ClienteDAO dao2 = new  Biblioteca_Clases.DAO.ClienteDAO();

                    List<Biblioteca_Clases.Models.Cliente> list2 = dao2.listaClientes();

                    int autoincrement2 = 0;

                    foreach (var dato in list2)
                    {
                        autoincrement2 = autoincrement2 + 1;

                 %>
                <datalist id="consecutivo_servicio">
                 <option value="<%=dato.NOMBRE%>">
                        </datalist> 

              <%} %>
          </div>

        </div>


        <div class="col-12 col-md-6">

          <div class="form-group">
              <label> Seleccionar servicio:</label>
                 
            <input class="form-control" list="desc_servicio">
               <%

                    Biblioteca_Clases.DAO.ServicioDAO dao3 = new  Biblioteca_Clases.DAO.ServicioDAO();

                    List<Biblioteca_Clases.Models.Servicio> list3 = dao3.listaServicios();

                    int autoincrement3 = 0;

                    foreach (var dato in list3)
                    {
                        autoincrement3 = autoincrement3 + 1;

                 %>
                <datalist id="desc_servicio">
                 <option value="<%=dato.DESCRIPCION%>">
                        </datalist> 
              <%} %>
          </div>

        </div>

             <div class="col-12 col-md-12">

          <div class="form-group">
              <label> Agregar tarifa:</label>
                 
            <input class="form-control">

          </div>

        </div>

      </div>

         <div id="boton_enviar" style="display: block; text-align: center">

       <button onclick="Agregar_Servicio()"  type="submit" class="popup-btn">Asignar</button>
             </div>


      <br> 


        <p>Servicios del cliente</p>
           <table id="tabla-mant1" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

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

                  <p>Contratos del cliente</p>

                  <table id="tabla-mant2" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>Consecutivo</th>
            <th>Nombre de contrato</th>
            <th>Inhabilitar</th>
          </tr>
        </thead>

        <tbody>

          <tr class="txt2">
            <td>001</td>
            <td>Contato 1</td>
               <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
               </tr>

               <tr class="txt2">
                <td>002</td>
                <td>Contrato 2</td>
                  <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                  </tr>

                     </tbody>

                 </table><!--Fin Tabla-->


               <p>Proyectos del cliente</p>
           <table id="tabla-mant3" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>Consecutivo</th>
            <th>Nombre del proyecto</th>
            <th>Inhabilitar</th>
          </tr>
        </thead>

        <tbody>

          <tr class="txt2">
            <td>001</td>
            <td>Proyecto 1</td>
               <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
               </tr>

               <tr class="txt2">
                <td>002</td>
                <td>Proyecto 2</td>
                  <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"> </td>
                  </tr>

                     </tbody>

                 </table><!--Fin Tabla-->
  </div>
</div>
   
  <br>

       <table id="tabla-mant" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>ID cliente</th>
            <th>Nombre de Cliente</th>
            <th>Asignar Servicio</th>
            <th>Asignar Contacto</th>
            <th>Detalles</th>
          </tr>
        </thead>

        <tbody>

             <%

              Biblioteca_Clases.DAO.ClienteDAO dao = new  Biblioteca_Clases.DAO.ClienteDAO();

            List<Biblioteca_Clases.Models.Cliente> list = dao.listaClientes();

                  int autoincrement = 0;

             foreach(var dato in list)
             {
                 autoincrement = autoincrement + 1;

                 %>

          <tr class="txt2">
            <td><%=dato.ID_CLIENTE%></td>
            <td><%=dato.NOMBRE%></td>
             <td style="text-align: center;"> <a href="#"><i class="fa fa-plus-circle color-icono" aria-hidden="true"> </td>
            <td style="text-align: center;"><a href="#"><i class="fa fa-id-badge color-icono" aria-hidden="true"></td>
             <td style="text-align: center;"><a href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
              </tr>  

               <%}%>

                     </tbody>

                     <tfoot class="estilo-thead">
                      <tr>
                       <th>ID cliente</th>
                       <th>Nombre de Cliente</th>
                       <th>Asignar Servicio</th>
                       <th>Asignar Contacto</th>
                       <th>Detalles</th>
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
