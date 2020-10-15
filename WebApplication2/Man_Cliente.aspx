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

   <div id="accordion">
        <div class="card">

<div class="collapse hide" id="collapseServicios" aria-expanded="false" aria-labelledby="headingOne" data-parent="#accordion">
  <div id="prueba11" class="card card-body txt2">


    <p id="parrafo_servicio">Asignar nuevo servicio</p>
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    

        <div class="row">

         <div  id="campo_consecutivo" style="" class="col-12 col-md-6">

          <div  class="form-group">
            <label> Seleccionar cliente:</label>

                
                 <input readonly="readonly" name="Cliente" id="Cliente" class="form-control">
              
          </div>

        </div>


        <div class="col-12 col-md-6">

          <div class="form-group">
              <label> Seleccionar servicio:</label>
                 
            <input id="Servicio" class="form-control" list="desc_servicio">
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
                 
            <input id="Tarifa" class="form-control">

          </div>

        </div>

      </div>

         <div id="boton_enviar" style="display: block; text-align: center">

       <button onclick="Agregar()"  type="button" class="popup-btn">Asignar</button>
             </div>


      <br> 


        <p>Servicios del cliente</p>
           <table id="tabla-mant1" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>ID</th>
            <th>Descripción</th>
            <th>Tarifa por hora</th>
            <th>Inhabilitar</th>
          </tr>
        </thead>



        <tbody>    
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

        <tbody> </tbody>

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

          

                     </tbody>

                 </table><!--Fin Tabla-->
  </div>
</div>
   

                </div>




      <!--Segundo collapse-->

      <div id="collapseTwo" aria-expanded="false" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div id="prueba112" class="card card-body txt2">


    <p id="parrafo_contacto">Asignar nuevo servicio</p>
    
        <div class="row">

         <div  id="a" style="" class="col-12 col-md-12">

          <div  class="form-group">
            <label> Seleccionar Contacto:</label>

                
                 <input class="form-control" list="consecutivo_servicio">
              <%
                    Biblioteca_Clases.DAO.ContactoDAO dao2 = new  Biblioteca_Clases.DAO.ContactoDAO();
                    List<Biblioteca_Clases.Models.Contacto> list2 = dao2.listaContactos();
                    int autoincrement2 = 0;
                    foreach (var dato in list2)
                    {
                        autoincrement2 = autoincrement2 + 1;
                 %>
                <datalist id="consecutivo_servicio">
                 <option value="<%=dato.ID_CONTACTO%>">
                        </datalist> 

              <%} %>
              
          </div>
             <p>Servicios del cliente</p>
           <table id="tabla-mant4" class="table table-striped table-bordered" style="width:100%;"><!--Tabla-->

        <thead class="estilo-thead">
          <tr>
            <th>ID</th>
            <th>Encargado</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>Tipo de Encargado</th>
            <th>Inhabilitar</th>
          </tr>
        </thead>

        <tbody>    
        </tbody>

                 </table><!--Fin Tabla-->

                 
        </div>


        </div>
  </div>
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
             <td onclick="Cliente(<%=dato.ID_CLIENTE%>)" style="text-align: center;"> <a  class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios"" href="#" /><i class="fa fa-plus-circle color-icono" aria-hidden="true"> </td>
            <td style="text-align: center;"><a data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" href="#"><i class="fa fa-id-badge color-icono" aria-hidden="true"></td>
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
          var servicios = [];
          var servicios2 = [];

          $(document).ready(function () {
              $('#tabla-mant').DataTable();

              $('#collapseServicios').collapse({
                  toggle: false
              })
          });


          function Agregar() {

              var Cliente_Servicio = new Object();
              Cliente_Servicio.fk_id_cliente = $("#Cliente").val();
              Cliente_Servicio.fk_id_servicio = $("#Servicio").val();
              Cliente_Servicio.tarifa_hora = $("#Tarifa").val();



              $.ajax({
                  type: "post",
                  url: "/Cliente/agrega",
                  data: JSON.stringify( Cliente_Servicio),
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  beforeSend: function () {
                      //alert("Procesando, espere por favor...");
                      Swal.fire({
                          icon: 'success',
                          title: 'Cargando...',
                          showConfirmButton: false,
                          timer: 1500
                      })
                  },
                  success: function (data) {
                      if (data == "fail") {
                          window.alert("fail");
                      }
                      else {
                          window.alert("exito");
                          var json_obj = $.parseJSON(data);


                          
                       
                          servicios.push($('#tabla-mant2').val());

                          var htmlTags = '<tr id=' + $('#tabla-mant2').val() + '>' +
                              '<td>' + $('#Cliente').val() + '</td>' +
                              '<td>' + $('#Servicio').val() + '</td>' +
                              '<td>' + $('#Tarifa').val() + '</td>' +
                              '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                              '</tr>';

                          $('#tabla-mant1 tbody').append(htmlTags);

                      }
                  }
              })
          }

        

       

          function Cliente(dato) {
            
            
              var dato1 = dato;
              $.ajax({
                  type: "post",
                  url: "/Cliente/SesionCLeinte",
                  data: {
                      dato1: dato1,
                  },
                  success: function (result) {
                      var json_obj = $.parseJSON(result);
                      var cantidadDeClaves = Object.keys(json_obj).length;
                      var currentValue = parseInt(cantidadDeClaves);
                   

                     
                  

                      $("#tabla-mant2 > tbody").empty();
           


                      for (var i = 0; i < currentValue ; i++) {
                          servicios.push($('#tabla-mant111').val());

                          var htmlTags = '<tr id=i' + i + '>' +
                              '<td>' + json_obj[i].ID_CONTRATO + '</td>' +
                              '<td>' + json_obj[i].DESCRIPCION + '</td>' +
                              '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                              '</tr>';

                          $('#tabla-mant2 tbody').append(htmlTags);
                      }
                      
                     
                  }
              })
              $("#Cliente").val(dato1);







              $.ajax({
                  type: "post",
                  url: "/Cliente/ServiciosCliente",
                  data: {
                      dato1: dato1,
                  },
                  success: function (result) {
                      var json_obj1 = $.parseJSON(result);
                      var cantidadDeClaves1 = Object.keys(json_obj1).length;
                      var currentValue1 = parseInt(cantidadDeClaves1);
                   

                     

                      $("#tabla-mant1 > tbody").empty();

                  

                    

                      for (var i = 0; i < currentValue1; i++) {
                          servicios2.push($('#tabla-mant1234').val());

                          var htmlTags1 = '<tr id=u' + i + '>' +
                              '<td>' + json_obj1[i].PK_CLIENTE_SERVICIO + '</td>' +
                              '<td>' + json_obj1[i].USAURIO_MODIFICACION + '</td>' +
                              '<td>' + json_obj1[i].TARIFA_HORA + '</td>' +
                              '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                              '</tr>';

                          $('#tabla-mant1 tbody').append(htmlTags1);
                      }
                  
                  
                  }
              })








              $.ajax({
                  type: "post",
                  url: "/Cliente/ProyectosCliente",
                  data: {
                      dato1: dato1,
                  },
                  success: function (result) {
                      var json_obj1 = $.parseJSON(result);
                      var cantidadDeClaves1 = Object.keys(json_obj1).length;
                      var currentValue1 = parseInt(cantidadDeClaves1);




                      $("#tabla-mant3 > tbody").empty();





                      for (var i = 0; i < currentValue1; i++) {
                          servicios2.push($('#tabla-mant1234').val());

                          var htmlTags1 = '<tr id=u' + i + '>' +
                              '<td>' + json_obj1[i].ID_PROYECTO + '</td>' +
                              '<td>' + json_obj1[i].NOMBRE + '</td>' +
                            
                              '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                              '</tr>';

                          $('#tabla-mant3 tbody').append(htmlTags1);
                      }


                  }
              })


          }



      </script>

</asp:Content>
