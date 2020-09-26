<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Tipo_Contrato.aspx.cs" Inherits="WebApplication2.Man_Tipo_Contrato" %>

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
                <i class="fas fa-file-alt color-icono" aria-hidden="true"></i>&nbsp; Tipo de Contratos
            </h3>
            <p class="text-justify txt5">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
            </p>
        </div>
        <!--Fin Cabecera-->

        <br>

        <!-- Contenido -->
        <div class="container">

            <div class="form-group container">
                <select class="form-control select_selecionar_proyecto" id="select_tipo">
                    <option selected="true" disabled="disabled">Seleccione el estado:</option>
                    <option value="General">General</option>
                    <option value="Activo">Activo</option>
                    <option value="Inactivo">Inactivo</option>
                </select>
            </div>

            <% if (Permisos.CREAR == false)
                {

            %>

            <div style="display: none;" id="divvalida">
                <%  }%>

                <p>
                    <button id="boton_multiple" class="btn btn-dark txt2" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
                        Agregar tipo de contrato
                    </button>
                </p>

                <% if (Permisos.CREAR == false)
                    {

                %>
            </div>
            <%  }%>

            <div class="collapse" id="collapseServicios">
                <div class="card card-body txt2">

                    <p>Información</p>

                    <div class="form-group" style="display: none" id="consecutivo">
                        <label>Consecutivo:</label>
                        <input type="text" class="form-control" id="consecutivo_tipo_contrato" name="consecutivo_tipo_contrato" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Nombre del tipo de contrato:</label>
                        <input type="text" class="form-control" id="nombre_tipo_contrato" name="nombre_tipo_contrato">
                    </div>

                    <div class="form-group">
                        <label>Opciones del tipo de contrato:</label>

                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="horas" name="horas">
                            <label class="custom-control-label" for="horas">Horas</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="rango_documentos" name="rango_documentos">
                            <label class="custom-control-label" for="rango_documentos">Rango de documentos</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="monto" name="monto">
                            <label class="custom-control-label" for="monto">Monto</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="aceptacion" name="aceptacion">
                            <label class="custom-control-label" for="aceptacion">Aceptación</label>
                        </div>

                    </div>

                    <!--
                    <div id="botones" style="display: none; text-align: center;">
                        <button type="submit" class="popup-btn" onclick="Agregar_Tipo_Contrato()" id="boton_agregar">Agregar</button>
                        <button type="submit" class="popup-btn" onclick="Actualizar_Tipo_Contrato()" id="boton_modificar" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">Modificar</button>
                        <button type="submit" class="popup-btn" id="boton_inhabilitar">Inhabilitar</button>
                    </div>-->

                    <div id="boton_enviar" style="display: block; text-align: center">
                        <button type="submit" class="popup-btn" onclick="Agregar_Tipo_Contrato()" id="boton_agregar">Agregar</button>
                    </div>
                    <div id="botones" style="display: none; text-align: center;">
                        <button type="submit" class="popup-btn" onclick="Actualizar_Tipo_Contrato()" id="boton_modificar" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">Modificar</button>
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
                        <th>Consecutivo</th>
                        <th>Nombre del Tipo de Contrato</th>
                        <th>Ver Detalles</th>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <th>Modificar</th>
                        <th>Inhabilitar</th>
                        <%}%>
                    </tr>
                </thead>

                <tbody id="cuerpo">

                    <%
                        List<Biblioteca_Clases.Models.Tipo_Contrato> list = new List<Biblioteca_Clases.Models.Tipo_Contrato>();

                        string valor = Convert.ToString(Request.QueryString["Estado"]);
                        list = ListaTipo_Contrato(valor);

                        int autoincrement = 0;
                        foreach (var dato in list)
                        {
                            autoincrement = autoincrement + 1;
                    %>

                    <tr class="txt2">
                        <td><%=dato.ID_TIPO_CONTRATO%></td>
                        <td><%=dato.NOMBRE%></td>
                        <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_tipo_contrato" onclick="edita(<%=dato.ID_TIPO_CONTRATO%>,'<%=dato.NOMBRE%>','<%=dato.HORAS%>','<%=dato.RANGO_DOCUMENTOS%>','<%=dato.MONTO%>','<%=dato.ACEPTACION%>');"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <td style="text-align: center;"><a href="#" onclick="Modificar_Tipo_Contrato(<%=dato.ID_TIPO_CONTRATO%>,'<%=dato.NOMBRE%>','<%=dato.HORAS%>','<%=dato.RANGO_DOCUMENTOS%>','<%=dato.MONTO%>','<%=dato.ACEPTACION%>');" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-con><i class="fa fa-edit color-icono" aria-hidden="true"></td>
                        <td style="text-align: center;"><a href="#">
                            <div class="custom-control custom-switch">
                                <% if (dato.ESTADO == 1)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_TIPO_CONTRATO%>)" type="checkbox" checked class="custom-control-input" id="<%=dato.ID_TIPO_CONTRATO%>">
                                <%}
                                    else if (dato.ESTADO == 0)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_TIPO_CONTRATO%>)" type="checkbox" class="custom-control-input" id="<%=dato.ID_TIPO_CONTRATO%>">
                                <%}%>
                                <label class="custom-control-label" for="<%=dato.ID_TIPO_CONTRATO%>" />
                            </div></td>
                        <%}%>
                    </tr>

                    <%}%>
                </tbody>

                <tfoot class="estilo-thead">
                    <tr>
                        <th>Consecutivo</th>
                        <th>Nombre del Tipo de Contrato</th>
                        <th>Ver Detalles</th>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <th>Modificar</th>
                        <th>Inhabilitar</th>
                        <%}%>
                    </tr>
                </tfoot>

            </table>
            <!--Fin Tabla-->

        </div>
        <!--Container-->

    </div>
    <!--Container mant-->


    <!--Popup Detalle-->
    <div id="detalles_tipo_contrato" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header popup-estilo-head">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body popup-estilo">

                    <!-- <form role="form" method="post" id="form_tipo_proyecto_detalle">-->

                    <p>Información tipo de contrato</p>

                    <div class="form-group">
                        <label>Consecutivo:</label>
                        <input type="text" class="form-control" id="d_tipo_contrato" name="d_consecutivo_tipo_contrato" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Nombre del tipo de contrato:</label>
                        <input type="text" class="form-control" id="d_nombre_tipo_contrato" name="d_nombre_tipo_contrato" readonly="">
                    </div>

                    <div class="form-group">
                        <label>Tipo de contrato:</label>

                        <div class="custom-control custom-checkbox">
                            <input aria-readonly="true" type="checkbox" class="custom-control-input" id="d_horas" name="d_horas">
                            <label class="custom-control-label" for="horas">Horas</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input aria-readonly="true" type="checkbox" class="custom-control-input" id="d_rango_documentos" name="d_rango_documentos">
                            <label class="custom-control-label" for="rango_documentos">Rango de documentos</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input aria-readonly="true" type="checkbox" class="custom-control-input" id="d_monto" name="d_monto">
                            <label class="custom-control-label" for="monto">Monto</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input aria-readonly="true" type="checkbox" class="custom-control-input" id="d_aceptacion" name="d_aceptacion">
                            <label class="custom-control-label" for="aceptacion">Aceptación</label>
                        </div>

                    </div>

                    <!--</form>-->

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

        function estado(dato_id) {

            var id_tipo_contrato = dato_id;

            $("#" + id_tipo_contrato).on('change', function () {
                if ($(this).is(':checked')) {
                    $.ajax({
                        type: "post",
                        url: "/TipoContrato/actualizar_estado_Habilitar_Tipo_Contrato",
                        data: {
                            id_tipo_contrato: id_tipo_contrato,
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
                        url: "/TipoContrato/actualizar_estado_deshabilitar_Tipo_Contrato",
                        data: {
                            id_tipo_contrato: id_tipo_contrato,
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

        function edita(id, nombre, horas, rango_documentos, monto, aceptacion) {
            $("#d_tipo_contrato").val(id);
            $("#d_nombre_tipo_contrato").val(nombre);

            if (horas == "True") {
                $("#d_horas").prop('checked', true);
            }
            if (rango_documentos == "True") {
                $("#d_rango_documentos").prop('checked', true);
            }
            if (monto == "True") {
                $("#d_monto").prop('checked', true);
            }
            if (aceptacion == "True") {
                $("#d_aceptacion").prop('checked', true);
            }

        }

        function Agregar_Tipo_Contrato() {

            var tipo_contrato = new Object();
            tipo_contrato.nombre = $("#nombre_tipo_contrato").val();
            tipo_contrato.horas = $("#horas").is(":checked");
            tipo_contrato.rango_documentos = $("#rango_documentos").is(":checked");
            tipo_contrato.monto = $("#monto").is(":checked");
            tipo_contrato.aceptacion = $("#aceptacion").is(":checked");

            if (tipo_contrato != null) {
                $.ajax({
                    type: "POST",
                    url: "/TipoContrato/agregar_tipo_contrato",
                    data: JSON.stringify(tipo_contrato),
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

        function Modificar_Tipo_Contrato(id, nombre, horas, rango_documentos, monto, aceptacion) {

            $("#consecutivo_tipo_contrato").val(id);
            $("#nombre_tipo_contrato").val(nombre);

            if (horas == "True") {
                $("#horas").prop('checked', true);
            }
            if (rango_documentos == "True") {
                $("#rango_documentos").prop('checked', true);
            }
            if (monto == "True") {
                $("#monto").prop('checked', true);
            }
            if (aceptacion == "True") {
                $("#aceptacion").prop('checked', true);
            }

            $("#boton_agregar").css("display", "none");
            $("#botones").css("display", "block");
            $("#consecutivo").css("display", "block");

            $('#boton_multiple').text("Modificar Tipo de Contrato");
            $('#parrafo_servicio').text("Modificar tipo de contrato actual");
        }

        function Actualizar_Tipo_Contrato() {
            var tipo_contrato = {
                'id_tipo_contrato': $("#consecutivo_tipo_contrato").val(),
                'nombre': $("#nombre_tipo_contrato").val(),
                'horas': $("#horas").is(":checked"),
                'rango_documentos': $("#rango_documentos").is(":checked"),
                'monto': $("#monto").is(":checked"),
                'aceptacion': $("#aceptacion").is(":checked")
            }

            if (tipo_contrato != null) {
                $.ajax({
                    type: "POST",
                    url: "/TipoContrato/modificar_tipo_contrato",
                    data: JSON.stringify(tipo_contrato),
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
            $('#select_tipo').change(function () {
                alert("Cambie");
                var val_select = $('#select_tipo').val();
                var url = window.location.href;
                var nuevaUrl = url.substring(0, url.indexOf('?'));
                window.location.href = nuevaUrl + "?Estado=" + val_select;

            });
        });

        var ShowPopup = function () {
            alert("No tiene permisos");
        }

    </script>
</asp:Content>
