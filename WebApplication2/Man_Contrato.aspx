<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Contrato.aspx.cs" Inherits="WebApplication2.Man_Contrato" %>

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
                <i class="fas fa-file-alt color-icono" aria-hidden="true"></i>&nbsp; Contratos
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

            <!--Panel agregar contrato-->
            <% if (Permisos.CREAR == false)
                {

            %>

            <div style="display: none;" id="divvalida">
                <%  }%>
                <p>
                    <button class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
                        Agregar Contrato
                    </button>
                </p>
                <% if (Permisos.CREAR == false)
                    {

                %>
            </div>
            <%  }%>

            <div class="collapse" id="collapseServicios">
                <div class="card card-body txt2">

                    <p>Ingresar un nuevo contrato</p>

                    <div class="row">

                        <div class="form-group col-12 col-md-6" style="display: none" id="consecutivo">
                            <label>Consecutivo del contrato:</label>
                            <input type="text" class="form-control" id="consecutivo_contrato" name="consecutivo_contrato" readonly="">
                        </div>

                        <div class="form-group col-12 col-md-6" style="display: none;" id="aux">
                            
                        </div>

                        <div class="col-12 col-md-6">
                            <label>Seleccionar cliente:</label>
                            <input class="form-control" id="cliente_contrato" list="lista_clientes">

                            <datalist id="lista_clientes">
                                <%
                                    Biblioteca_Clases.DAO.ClienteDAO cliente_dao = new Biblioteca_Clases.DAO.ClienteDAO();
                                    List<Biblioteca_Clases.Models.Cliente> list_clientes = cliente_dao.listaClientes();

                                    foreach (var dato in list_clientes)
                                    {
                                %>
                                <option value="<%=dato.ID_CLIENTE%>"><%=dato.NOMBRE%></option>

                                <%}%>
                            </datalist>
                            <br>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Nombre del contrato:</label>
                                <input type="text" class="form-control" id="nombre_contrato" name="nombre_contrato">
                            </div>
                        </div>

                        <div class="col-12 col-md-6">

                            <div class="form-group">
                                <label>Descripción:</label>
                                <textarea id="descripcion_contrato" class="md-textarea form-control" rows="3"></textarea>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>Seleccionar contacto:</label>
                            <input class="form-control" id="contacto_contrato" list="lista_contactos">
                            <datalist id="lista_contactos">
                                <%
                                    Biblioteca_Clases.DAO.ContactoDAO contacto_dao = new Biblioteca_Clases.DAO.ContactoDAO();
                                    List<Biblioteca_Clases.Models.Contacto> list_contactos = contacto_dao.listaContactos();

                                    foreach (var contacto in list_contactos)
                                    {
                                %>
                                <option value="<%=contacto.ID_CONTACTO%>"><%=contacto.ENCARGADO%></option>

                                <%}%>
                            </datalist>

                            <br>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Fecha de inicio:</label>
                                <input type="date" class="form-control" id="fecha_inicio" name="fecha_inicio">
                            </div>
                        </div>

                        <div class="col-12 col-md-6">

                            <div class="form-group">
                                <label>Fecha de vencimiento:</label>
                                <input type="date" class="form-control" id="fecha_vencimiento" name="fecha_vencimiento">
                            </div>
                        </div>

                        <div class="col-12 col-md-6">

                            <label>Seleccionar tipo de contrato:</label>
                            <!--Dependiendo lo que se seleccione se agregar los campos de hora, rango, etc-->
                            <input class="form-control" id="tipo_contrato" list="lista_tipo_contrato">
                            <datalist id="lista_tipo_contrato">
                                <%
                                    Biblioteca_Clases.DAO.Tipo_ContratoDAO tipo_contrato_dao = new Biblioteca_Clases.DAO.Tipo_ContratoDAO();
                                    List<Biblioteca_Clases.Models.Tipo_Contrato> list_tipo_contrato = tipo_contrato_dao.listaTipoContratos();

                                    foreach (var tipo in list_tipo_contrato)
                                    {
                                %>
                                <option value="<%=tipo.ID_TIPO_CONTRATO%>,<%=tipo.HORAS%>,<%=tipo.RANGO_DOCUMENTOS%>,<%=tipo.MONTO%>"><%=tipo.NOMBRE%></option>

                                <%}%>
                            </datalist>
                        </div>

                        <div class="col-12 col-md-6" id="padre_horas">
                            <div class="form-group" id="div_horas" style="display: none">
                                <label>Horas: </label>
                                <input id="horas_contrato" type="text" class="form-control">
                            </div>
                        </div>

                        <div class="col-12 col-md-6" id="padre_monto" style="display: block">
                            <br>
                            <div class="form-group" id="div_monto" style="display: none">
                                <label>Monto: </label>
                                <input id="monto_contrato" type="text" class="form-control">
                            </div>
                        </div>

                        <div class="col-12 col-md-6" id="padre_rango" style="display: block">
                            <br>
                            <div class="form-group" id="div_rango" style="display: none">
                                <label>Rango: </label>
                                <input id="rango_contrato" type="text" class="form-control">
                            </div>
                        </div>

                        <div class="col-12 col-md-6">

                            <br>
                            <label>Seleccionar servicio:</label>
                            <input class="form-control" id="servicio_contrato" list="lista_servicios">
                            <datalist id="lista_servicios">
                                <%
                                    Biblioteca_Clases.DAO.ServicioDAO servicio_dao = new Biblioteca_Clases.DAO.ServicioDAO();
                                    List<Biblioteca_Clases.Models.Servicio> list_servicios = servicio_dao.listaServicios();

                                    foreach (var servicio in list_servicios)
                                    {
                                %>
                                <option value="<%=servicio.ID_SERVICIO%> <%=servicio.DESCRIPCION%>"><%=servicio.DESCRIPCION%></option>

                                <%}%>
                            </datalist>
                            <br>
                        </div>

                        <div class="col-12 col-md-6">
                            <br>
                            <div class="form-group">
                                <label>Descripción del servicio:</label>
                                <input type="text" class="form-control" id="descripcion_servicio" name="desc_contrato">
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <br>
                            <div class="form-group">
                                <button onclick="Agregar_Servicio()" type="button" class="popup-btn">Agregar servicio</button>
                            </div>
                        </div>

                    </div>

                    <p>Servicios del contrato</p>
                    <table id="t_servicios" class="table table-striped table-bordered" style="width: 100%;">
                        <!--Tabla-->

                        <thead class="estilo-thead">
                            <tr>
                                <th>ID</th>
                                <th>Descripción</th>
                                <th>Inhabilitar</th>
                            </tr>
                        </thead>

                        <tbody>

                            <%--<%
                                    List<Biblioteca_Clases.Models.Servicio> list = new List<Biblioteca_Clases.Models.Servicio>();
                                    Biblioteca_Clases.DAO.ServicioDAO servicioDao = new Biblioteca_Clases.DAO.ServicioDAO();
                                    list = servicioDao.listaServicios();

                                    int autoincrement = 0;
                                    foreach (var dato in list)
                                    {
                                        autoincrement = autoincrement + 1;
                                %>

                                <tr class="txt2">
                                    <td><%=dato.ID_SERVICIO%></td>
                                    <td><%=dato.DESCRIPCION%></td>
                                    <td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>
                                </tr>
                                <%}%>--%>
                        </tbody>

                    </table>
                    <!--Fin Tabla-->

                    <div id="boton_enviar" style="display: block; text-align: center">
                        <button onclick="Agregar_Contrato()" id="boton_agregar" type="submit" class="popup-btn">Agregar</button>
                    </div>

                    <div id="botones" style="display: none; text-align: center;">
                        <button onclick="Actualizar_Contrato();" type="submit" id="boton_modificar" class="popup-btn">Modificar</button>
                        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
                    </div>

                    <br>
                </div>
                <
            </div>

            <br>


            <table id="tabla-mant" class="table table-striped table-bordered" style="width: 100%;">
                <!--Tabla-->

                <thead class="estilo-thead">
                    <tr>
                        <th>Consecutivo</th>
                        <th>Nombre de Contrato</th>
                        <th>Ver Detalles</th>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <th>Modificar</th>
                        <th>Inhabilitar</th>
                        <%}%>
                    </tr>
                </thead>

                <tbody>


                    <%
                        List<Biblioteca_Clases.Models.Contrato> lista = new List<Biblioteca_Clases.Models.Contrato>();

                        string seleccion = Convert.ToString(Request.QueryString["Estado"]);
                        lista = Lista_Contrato(seleccion);

                        foreach (var dato in lista)
                        {
                    %>


                    <tr class="txt2">
                        <td><%=dato.ID_CONTRATO%></td>
                        <td><%=dato.NOMBRE_CONTRATO%></td>
                        <td style="text-align: center;"><a href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <td style="text-align: center;"><a onclick="editar(<%=dato.ID_CONTRATO%>,'<%=dato.CLIENTE%>','<%=dato.NOMBRE_CONTRATO%>','<%=dato.DESCRIPCION%>','<%=dato.CONTACTO%>','<%=dato.FECHA_INICIO%>','<%=dato.FECHA_VENCE%>','<%=dato.TIPO_CONTRATO%>');" href="#" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
                        <td style="text-align: center;"><a href="#">
                            <div class="custom-control custom-switch">
                                <% if (dato.ESTADO == 1)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_CONTRATO%>)" type="checkbox" checked class="custom-control-input" id="<%=dato.ID_CONTRATO%>">
                                <%}
                                    else if (dato.ESTADO == 0)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_CONTRATO%>)" type="checkbox" class="custom-control-input" id="<%=dato.ID_CONTRATO%>">
                                <%}%>
                                <label class="custom-control-label" for="<%=dato.ID_CONTRATO%>" />
                            </div></td>
                        <%}%>
                    </tr>

                    <%}

                    %>
                </tbody>

                <tfoot class="estilo-thead">
                    <tr>
                        <th>Consecutivo</th>
                        <th>Nombre de Proyecto</th>
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


    <!--Script Tabla-->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tabla-mant').DataTable();
        });

        var servicios = [];

        function estado(dato_id) {

            var id_contrato = dato_id;

            $("#" + id_contrato).on('change', function () {
                if ($(this).is(':checked')) {
                    $.ajax({
                        type: "post",
                        url: "/Contrato/actualizar_estado_Habilitar_Contrato",
                        data: {
                            id_contrato: id_contrato,
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
                    alert("Voy a desactivar " + id_contrato);
                    $.ajax({
                        type: "post",
                        url: "/Contrato/actualizar_estado_deshabilitar_Contrato",
                        data: {
                            id_contrato: id_contrato,
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

        function Agregar_Contrato() {

            var contrato = new Object();
            contrato.cliente = $("#cliente_contrato").val();
            contrato.nombre_contrato = $("#nombre_contrato").val();
            contrato.descripcion = $("#descripcion_contrato").val();
            contrato.contacto = $("#contacto_contrato").val();
            contrato.fecha_inicio = $("#fecha_inicio").val();
            contrato.fecha_vence = $("#fecha_vencimiento").val();
            contrato.tipo_contrato = $("#tipo_contrato").val();
            contrato.horas = $("#horas_contrato").val();
            contrato.monto = $("#monto_contrato").val();
            contrato.rango = $("#rango_contrato").val();

            if (contrato != null) {
                $.ajax({
                    type: "POST",
                    url: "/Contrato/agregar_contrato",
                    data: JSON.stringify({ contrato: contrato, servicios: servicios }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        Swal.fire(
                            'Actualizado!',
                            'El contrato ha sido agregado.',
                            'success'
                        )
                        servicios = [];
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

        function editar(id_contrato, cliente, nombre_contrato, descripcion, contacto, fecha_inicio, fecha_vence, tipo_contrato) {
            alert(cliente + "-" + contacto);
            $("#cliente_contrato").val(cliente);
            $("#nombre_contrato").val(nombre_contrato);
            $("#descripcion_contrato").val(descripcion);
            $("#contacto_contrato").val(contacto);
            $("#fecha_inicio").val(fecha_inicio);
            $("#fecha_vencimiento").val(fecha_vence);
            $("#tipo_contrato").val(tipo_contrato);

            var fecha_i = formatea_fecha(fecha_inicio);
            var fecha_v = formatea_fecha(fecha_vence);

            $('#fecha_inicio').val(fecha_i);
            $('#fecha_vencimiento').val(fecha_v);

            $("#boton_agregar").css("display", "none");
            $("#botones").css("display", "block");
            $("#consecutivo").css("display", "block");
            $("#aux").css("display", "block");
            $("#consecutivo_contrato").val(id_contrato);

            $('#boton_multiple').text("Modificar Contrato");
            $('#parrafo_servicio').text("Modificar contrato actual");

            $.ajax({
                type: "POST",
                url: "/Contrato/listar_servicios_contrato",
                data: JSON.stringify({
                    id: id_contrato,
                }),
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
                success: function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve
                    response.forEach(pinta);
                },
                failure: function (response) {
                    alert("failure");
                    alert(response.responseText);
                },
                error: function (response) {
                    alert("Error");
                    alert(response.responseText);
                }
            });

        }

        function Actualizar_Contrato() {
            var contrato = new Object();
            contrato.id_contrato = $("#consecutivo_contrato").val();
            contrato.cliente = $("#cliente_contrato").val();
            contrato.nombre_contrato = $("#nombre_contrato").val();
            contrato.descripcion = $("#descripcion_contrato").val();
            contrato.contacto = $("#contacto_contrato").val();
            contrato.fecha_inicio = $("#fecha_inicio").val();
            contrato.fecha_vence = $("#fecha_vencimiento").val();
            contrato.tipo_contrato = $("#tipo_contrato").val();
            contrato.horas = $("#horas_contrato").val();
            contrato.monto = $("#monto_contrato").val();
            contrato.rango = $("#rango_contrato").val();
            
            if (contrato != null) {
                $.ajax({
                    type: "POST",
                    url: "/Contrato/modificar_contrato",
                    data: JSON.stringify({ contrato: contrato, servicios: servicios }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        Swal.fire(
                            'Actualizado!',
                            'El contrato ha sido agregado.',
                            'success'
                        )
                        servicios = [];
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

        function pinta(data) {
            servicios.push(data.ID_SERVICIO);
            alert(data.ID_SERVICIO + ' - ' + data.DESCRIPCION);
            var htmlTags = '<tr id=' + data.ID_SERVICIO + '>' +
                '<td>' + data.ID_SERVICIO + '</td>' +
                '<td>' + data.DESCRIPCION + '</td>' +
                '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                '</tr>';

            $('#t_servicios tbody').append(htmlTags);
        }

        function formatea_fecha(fecha) {
            var arregloFecha = fecha.split("/");
            var anio = arregloFecha[2];
            var mes = arregloFecha[1];
            var dia = arregloFecha[0];

            if (dia < 10) {
                dia = "0" + dia;
            }
            if (mes < 10) {
                mes = "0" + mes
            }
            anio = anio.substr(0, 4);

            var today = anio + "-" + (mes) + "-" + (dia);

            return today;
        }

        $(document).ready(function () {
            $('#select_tipo').change(function () {
                var val_select = $('#select_tipo').val();
                var url = window.location.href;
                var nuevaUrl = url.substring(0, url.indexOf('?'));
                window.location.href = nuevaUrl + "?Estado=" + val_select;
            });
        });

        $(document).ready(function () {
            $('#servicio_contrato').change(function () {
                var descripcion = $('#servicio_contrato').val();
                var id = descripcion;
                let t = 0;
                for (let i = 0; i < id.length; i++) {
                    if (id.charAt(i) == ' ') {
                        t = i;
                    }
                }
                $('#servicio_contrato').val(id.substr(-length, t));
                $('#descripcion_servicio').val(descripcion.substr(2));
            });
        });

        $(document).ready(function () {            
            $('#tipo_contrato').change(function () {
                $("#div_rango").css("display", "none");
                $("#div_monto").css("display", "none");
                $("#div_horas").css("display", "none");

                var tipo = $('#tipo_contrato').val();
                var arreglo_tipo = tipo.split(",");

                $('#tipo_contrato').val(arreglo_tipo[0]);

                if (arreglo_tipo[1] == "True") {
                    $("#div_horas").css("display", "block");
                } 
                if (arreglo_tipo[2] == "True") {
                    $("#div_rango").css("display", "block");
                }
                if (arreglo_tipo[3] == "True") {
                    $("#div_monto").css("display", "block");
                } 

            });
        });

        function Agregar_Servicio() {

            servicios.push($('#servicio_contrato').val());

            var htmlTags = '<tr id=' + $('#servicio_contrato').val() + '>' +
                '<td>' + $('#servicio_contrato').val() + '</td>' +
                '<td>' + $('#descripcion_servicio').val() + '</td>' +
                '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                '</tr>';

            $('#t_servicios tbody').append(htmlTags);

        }

        var ShowPopup = function () {
            alert("No tiene permisos");
        }

    </script>
</asp:Content>
