<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Contacto.aspx.cs" Inherits="WebApplication2.Man_Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-mant">


        <div class="#">
            <!--Cabecera-->
            <h3 class="text-left">
                <i class="fas fa-id-card color-icono" aria-hidden="true"></i>&nbsp; Contactos
            </h3>
            <p class="text-justify txt5">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
            </p>
        </div>
        <!--Fin Cabecera-->

        <br>

        <!-- Contenido -->
        <div class="container">

         <% if (Permisos.CREAR == false)
             { 

            %>

            <div style="display: none;" id="divvalida">
                <%  }%>
            <p>

                <button class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
                    Agregar Contacto
                </button>
            </p>

                               <% if (Permisos.CREAR == false)
                                   {

                %>
            </div>
            <%  }%>
            <div class="collapse" id="collapseServicios">
                <div class="card card-body txt2">

                    <p id="parrafo_servicio">Ingresar un nuevo contacto</p>

                    <div id="id_contacto_input" style="display: none" class="form-group">
                        <label>ID Contacto:</label>
                        <input type="text" class="form-control" id="id_contacto" name="id_contacto" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Encargado:</label>
                        <input type="text" class="form-control" id="encargado" name="encargado" required pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]{1,100}" oninput="
        setCustomValidity('');
        checkValidity();
         console.log(validity);
        if (validity.patternMismatch) {
            setCustomValidity('Caracteres Inválidos');
        }
        else if (validity.valueMissing) {
            setCustomValidity('Campo en blanco');
        }">
                    </div>

                    <div class="form-group">
                        <label>Teléfono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono">
                    </div>

                    <div class="form-group">
                        <label>Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo">
                    </div>

                    <div class="form-group">
                        <label>Tipo de encargado:</label>
                        <input type="text" class="form-control" id="tipo_encargado" name="tipo_encargado">
                    </div>


                    <div id="boton_enviar" style="display: block; text-align: center">

                        <button type="submit" class="popup-btn" onsubmit="Agregar_Contacto()" id="boton_agregar">Agregar</button>
                    </div>

                    <div id="botones" style="display: none; text-align: center;">
                        <button type="submit" id="boton_modificar" onclick="Actualizar_Contacto()" class="popup-btn">Modificar</button>
                        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
                    </div>


                    <br>
                </div>
            </div>

            <br>

            <table id="tabla-mant" class="table table-striped table-bordered" style="width: 100%;">
                <!--Tabla-->

                <thead class="estilo-thead">
                    <tr>
                        <th>ID Contacto</th>
                        <th>Encargado</th>
                        <th>Ver Detalles</th>
                             <%if (Permisos.EDTIAR == true)
                                 { %>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        <%} %>
                    </tr>
                </thead>

                <tbody>

                    <%
                        List<Biblioteca_Clases.Models.Contacto> list = new List<Biblioteca_Clases.Models.Contacto>();
                        list = ListaContacto();

                        int autoincrement = 0;
                        foreach (var dato in list)
                        {
                            autoincrement = autoincrement + 1;
                    %>

                    <tr class="txt2">
                        <td><%=dato.ID_CONTACTO%></td>
                        <td><%=dato.ENCARGADO%></td>
                        <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_contacto" onclick="ver_detalles('<%=dato.ID_CONTACTO%>','<%=dato.ENCARGADO%>','<%=dato.TELEFONO%>','<%=dato.CORREO%>','<%=dato.TIPO_ENCARGADO%>');" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                             <%if (Permisos.EDTIAR == true)
                                 { %>
                        <td style="text-align: center;"><a data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios" onclick="editar('<%=dato.ID_CONTACTO%>','<%=dato.ENCARGADO%>','<%=dato.TELEFONO%>','<%=dato.CORREO%>','<%=dato.TIPO_ENCARGADO%>');" href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
                        <td style="text-align: center;"><a onclick="Eliminar_Contacto(<%=dato.ID_CONTACTO%>)" href="#"><i class="fas fa-trash color-icono" aria-hidden="true"></td>
                        <%} %>
                    </tr>

                    <%}%>
                </tbody>

                <tfoot class="estilo-thead">
                    <tr>
                        <th>ID Contacto</th>
                        <th>Encargado</th>
                        <th>Ver Detalles</th>
                             <%if (Permisos.EDTIAR == true)
                                 { %>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        <%} %>
                    </tr>
                </tfoot>

            </table>
            <!--Fin Tabla-->

    </div>
    <!--Container-->

    </div>
    <!--Container mant-->





    <!--Popup Detalle-->
    <div id="detalles_contacto" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header popup-estilo-head">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body popup-estilo">

                    <p>Detalles del contacto</p>

                    <div class="form-group">
                        <label>ID Contacto:</label>
                        <input type="text" class="form-control" id="id_contacto2" name="id_contacto2" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Encargado:</label>
                        <input type="text" class="form-control" id="encargado2" name="encargado2" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Teléfono:</label>
                        <input type="text" class="form-control" id="telefono2" name="telefono2" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Correo:</label>
                        <input type="email" class="form-control" id="email2" name="email2" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Tipo de encargado:</label>
                        <input type="text" class="form-control" id="tipo_encargado2" name="tipo_encargado2" readonly="">
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--Fin Popup Detalle-->




    <!--Script Tabla-->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tabla-mant').DataTable();
        });


        function Agregar_Contacto() {

            aler("Hola");

            var contacto = new Object();
            contacto.encargado = $("#encargado").val();
            contacto.telefono = $("#telefono").val();
            contacto.correo = $("#correo").val();
            contacto.tipo_encargado = $("#tipo_encargado").val();

            if (contacto != null) {
                $.ajax({
                    type: "POST",
                    url: "/Contacto/agregar_contacto",
                    data: JSON.stringify(contacto),
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
        contacto.encargado = $("#encargado").val();
        contacto.telefono = $("#telefono").val();
        contacto.correo = $("#correo").val();
        contacto.tipo_encargado = $("#tipo_encargado").val();


        function ver_detalles(id, encargado, telefono, correo, tipo_encargado) {
            $("#id_contacto2").val(id);
            $("#encargado2").val(encargado);
            $("#telefono2").val(telefono);
            $("#email2").val(correo);
            $("#tipo_encargado2").val(tipo_encargado);
        }

        function editar(id, encargado, telefono, correo, tipo_encargado) {
            $("#id_contacto").val(id);
            $("#encargado").val(encargado);
            $("#telefono").val(telefono);
            $("#correo").val(correo);
            $("#tipo_encargado").val(tipo_encargado);

            $("#boton_agregar").css("display", "none");
            $("#botones").css("display", "block");
            $("#id_contacto_input").css("display", "block");

            $('#boton_multiple').text("Modificar Contacto");
            $('#parrafo_servicio').text("Modificar contacto actual");
        }

        function Actualizar_Contacto() {
            var tipo_contrato = {
                'id_contacto': $("#id_contacto").val(),
                'encargado': $("#encargado").val(),
                'telefono': $("#telefono").val(),
                'correo': $("#correo").val(),
                'tipo_encargado': $("#tipo_encargado").val(),
            }

            $.ajax({
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                url: '/Contacto/modificar_contacto',
                data: JSON.stringify(tipo_contrato),
                success: function () {
                    confirm('"PassThings()" successfully called.');
                },
                failure: function (response) {
                    confirm(response);
                },
                error: function (result) {
                    confirm("ERROR " + result.status + ' ' + result.statusText);
                }
            })
        }

        function Eliminar_Contacto(id) {
            var tipo_contrato = {
                'id_contacto': id,
            }

            $.ajax({
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                url: '/Contacto/eliminar_contacto',
                data: JSON.stringify(tipo_contrato),
                success: function () {
                    confirm('"PassThings()" successfully called.');
                },
                failure: function (response) {
                    confirm(response);
                },
                error: function (result) {
                    confirm("ERROR " + result.status + ' ' + result.statusText);
                }
            })
        }

        var ShowPopup = function () {
            alert("No tiene permisos");

        }


    </script>
</asp:Content>
