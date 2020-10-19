<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Proyecto.aspx.cs" Inherits="WebApplication2.Man_Proyecto" %>

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
                <i class="fas fa-project-diagram color-icono" aria-hidden="true"></i>&nbsp; Proyectos
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

                <select class="form-control select_selecionar_proyecto" id="select_proyect">
                    <option selected="" disabled="disabled">Seleccione el estado:</option>
                    <option value="Activo_Servicio">Activo</option>
                    <option value="Inactivo_Servicio">Inactivo</option>
                    <option value="Todos_Servicio">General</option>
                    <option>Proyectos en Curso</option>
                    <option>Proyectos Terminados</option>
                    <option>Proyectos Activos</option>
                    <option>Proyectos Inhabilitados</option>
                </select>
            </div>

            <% if (Permisos.CREAR == false)
                {

            %>

            <div style="display: none;" id="divvalida">
                <%  }%>

                <p>
                    <button class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseProyectos" aria-expanded="false" aria-controls="collapseProyectos">
                        Agregar Proyecto
                    </button>
                </p>

                <% if (Permisos.CREAR == false)
                    {

                %>
            </div>
            <%  }%>



            <div class="collapse" id="collapseProyectos">
                <div class="card card-body txt2">

                    <div id="div_agregar_proyecto">

                        <div style="display: none; text-align: center;" id="error_campos_vacios" class="alert alert-warning">
                            <strong>¡Cuidado!</strong> Campos sin completar.
                        </div>


                        <p id="parrafo_proyecto">Agregar nuevo proyecto</p>

                        <div id="consecutivo_proyecto_div" class="form-group" style="display: none">
                            <label>Consecutivo:</label>
                            <input id="consecutivo_proyecto" type="text" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Seleccionar cliente:</label>
                            <input onblur="Validar_Campo()" id="cliente_proyecto" class="form-control" list="lista_clientes">


                            <datalist id="lista_clientes">
                                <%
                                    Biblioteca_Clases.DAO.ClienteDAO cliente_dao = new Biblioteca_Clases.DAO.ClienteDAO();
                                    List<Biblioteca_Clases.Models.Cliente> list_clientes = cliente_dao.listaClientes();


                                    int autoincrement_cliente = 0;

                                    foreach (var dato in list_clientes)
                                    {
                                        autoincrement_cliente = autoincrement_cliente + 1;
                                %>
                                <option value="<%=dato.ID_CLIENTE%>"><%=dato.NOMBRE%></option>

                                <%}%>
                            </datalist>
                            <br>
                        </div>

                        <div class="form-group">
                            <label>Nombre del proyecto:</label>
                            <input onblur="Validar_Campo()" type="text" class="form-control" id="nombre_proyecto" name="nombre_proyecto">
                        </div>

                        <div class="form-group">
                            <label>Descripción:</label>
                            <textarea onblur="Validar_Campo()" id="desc_proyecto" class="md-textarea form-control" rows="3"></textarea>
                        </div>

                        <div class="form-group">
                            <label>Precio:</label>
                            <input onblur="Validar_Campo()" type="text" class="form-control" id="precio" name="precio">
                        </div>





                    </div>

                    <div style="display: block" id="div_fase_tiempo">

                        <div style="display: none; text-align: center;" id="error_campos_vacios2" class="alert alert-warning">
                            <strong>¡Cuidado!</strong> Campos sin completar.
                        </div>

                        <p>Fases del proyecto</p>


                        <div class="form-group">
                            <label>Descripción:</label>
                            <input type="text" class="form-control" id="descripcion_fase">
                        </div>

                        <div class="form-group">
                            <label>Tiempo:</label>
                            <input type="text" class="form-control" id="tiempo_proyecto">
                        </div>



                        <div style="text-align: center;">
                            <button onclick="Agregar_Fase()" type="button" class="popup-btn">Agregar Fase</button>
                        </div>




                        <hr class="mb-4 hr-estilo-linea">


                        <table id="t_fase" class="table table-striped table-bordered" style="width: 100%;">
                            <!--Tabla-->

                            <thead class="estilo-thead">
                                <tr>
                                    <th>Tiempo</th>
                                    <th>Descripción</th>
                                    <th>Inhabilitar</th>
                                </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                        <!--Fin Tabla-->

                    </div>


                    <div id="boton_agregar" style="text-align: center">

                        <button disabled id="boton_agregar_proyecto" onclick="Agregar_Proyecto()" type="button" class="popup-btn">Agregar</button>
                    </div>

                    <div id="botones" style="display: none; text-align: center;">
                        <button disabled onclick="Actualizar_Proyecto()" type="button" id="boton_modificar" class="popup-btn">Modificar</button>
                        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
                    </div>


                </div>
            </div>

            <br>


            <table id="tabla-mant" class="table table-striped table-bordered" style="width: 100%;">
                <!--Tabla-->

                <thead class="estilo-thead">
                    <tr>
                        <th>Consecutivo</th>
                        <th>Nombre de Proyecto</th>
                        <th>Ver Detalles</th>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <th>Fase Tiempo</th>
                        <th>Modificar</th>
                        <th>Inhabilitar</th>
                        <%}%>
                    </tr>
                </thead>

                <tbody>

                    <%
                        List<Biblioteca_Clases.Models.Proyecto> list = new List<Biblioteca_Clases.Models.Proyecto>();
                        string valor = Convert.ToString(Request.QueryString["Estado"]);
                        list = ListaProyectos(valor);
                        int autoincrement = 0;

                        foreach (var dato in list)
                        {
                            autoincrement = autoincrement + 1;
                    %>

                    <tr class="txt2">
                        <td><%=dato.ID_PROYECTO%></td>
                        <td><%=dato.NOMBRE%></td>
                        <td style="text-align: center;"><a data-toggle="modal" data-target="#detalles_proyecto" onclick="ver_detalles('<%=dato.ID_PROYECTO%>','<%=dato.NOMBRE%>','<%=dato.DESCRIPCION%>','<%=dato.PRECIO%>','<%=dato.FK_ID_CLIENTE%>');" href="#"><i class="fa fa-list color-icono" aria-hidden="true"></td>
                        <% if (Permisos.EDTIAR == true)
                            { %>
                        <td style="text-align: center;"><a data-toggle="collapse" data-target="#collapseProyectos" aria-expanded="false" aria-controls="collapseProyectos" onclick="fase_dato2('<%=dato.ID_PROYECTO%>');"><i class="fa fa-clock color-icono" aria-hidden="true"></td>
                        <td style="text-align: center;"><a data-toggle="collapse" data-target="#collapseProyectos" aria-expanded="false" aria-controls="collapseServicios" onclick="editar('<%=dato.ID_PROYECTO%>','<%=dato.NOMBRE%>','<%=dato.DESCRIPCION%>','<%=dato.PRECIO%>','<%=dato.FK_ID_CLIENTE%>');" href="#"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
                        <td style="text-align: center;"><a href="#">
                            <div class="custom-control custom-switch">
                                <% if (dato.ESTADO == 1)
                                    {


                                %>
                                <input onclick="estado(<%=dato.ID_PROYECTO%>)" type="checkbox" checked class="custom-control-input" id="<%=dato.ID_PROYECTO%>">
                                <%}

                                    else if (dato.ESTADO == 0)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_PROYECTO%>)" type="checkbox" class="custom-control-input" id="<%=dato.ID_PROYECTO%>">

                                <%}%>

                                <label class="custom-control-label" for="<%=dato.ID_PROYECTO%>" />

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
                        <%      if (Permisos.EDTIAR == true)
                            {%>
                        <th>Fase Tiempo</th>
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

    <!--Popup Detalles-->
    <div id="detalles_proyecto" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header popup-estilo-head">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body popup-estilo">

                    <p id="parrafo_servicio2">Detalles del proyecto</p>

                    <div class="form-group">
                        <label>Consecutivo:</label>
                        <input type="text" class="form-control" id="consecutivo_proyecto2" readonly>
                    </div>

                    <div class="form-group">
                        <label>Cliente:</label>
                        <input type="text" class="form-control" id="cliente_proyecto2" readonly>
                    </div>

                    <div class="form-group">
                        <label>Nombre del proyecto:</label>
                        <input type="text" class="form-control" id="nombre_proyecto2" readonly>
                    </div>

                    <div class="form-group">
                        <label>Descripción:</label>
                        <textarea readonly id="desc_proyecto2" class="md-textarea form-control" rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Precio:</label>
                        <input type="text" class="form-control" id="precio2" readonly>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--Fin Popup detalle-->



    <script type="text/javascript">

        var fases = [];
        var proyectos = [];



        /*Validaciones*/

        $('#precio').on('input', function (e) {
            if (!/^[ 0-9]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ 0-9]+/ig, "");
            }
        });

        $('#cliente_proyecto').on('input', function (e) {
            if (!/^[ 0-9]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ 0-9]+/ig, "");
            }
        });

        $('#nombre_proyecto').on('input', function (e) {
            if (!/^[ a-z0-9áéíóúüñ@._]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ a-z0-9áéíóúüñ@._]+/ig, "");
            }
        });

        $('#desc_proyecto').on('input', function (e) {
            if (!/^[ a-z0-9áéíóúüñ@._]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ a-z0-9áéíóúüñ@._]+/ig, "");
            }
        });

        $('#tiempo_proyecto').on('input', function (e) {
            if (!/^[ 0-9]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ 0-9]+/ig, "");
            }
        });
        $('#descripcion_fase').on('input', function (e) {
            if (!/^[ a-z0-9áéíóúüñ@._]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ a-z0-9áéíóúüñ@._]+/ig, "");
            }
        });

        $(document).ready(function () {
            $('#tabla-mant').DataTable();
        });

        $(document).ready(function () {
            $('#t_fase').DataTable();
        });
        var valor_id_fase;

        var servicios = [];

        function ver_detalles(id, nombre, descripcion, precio, cliente) {
            $("#consecutivo_proyecto2").val(id);
            $("#nombre_proyecto2").val(nombre);
            $("#desc_proyecto2").val(descripcion);
            $("#precio2").val(precio);
            $("#cliente_proyecto2").val(cliente);
        }

        function editar(id, nombre, descripcion, precio, cliente) {
            $("#consecutivo_proyecto").val(id);
            $("#nombre_proyecto").val(nombre);
            $("#desc_proyecto").val(descripcion);
            $("#precio").val(precio);
            $("#cliente_proyecto").val(cliente);

            $("#boton_agregar").css("display", "none");
            $("#botones").css("display", "block");
            $("#consecutivo_proyecto_div").css("display", "block");
            $("#consecutivo_proyecto").attr("readonly", "true");

            $('#boton_multiple').text("Modificar Proyecto");
            $('#parrafo_proyecto').text("Modificar proyecto actual");
        }

        function fase_dato2(id) {

            $.ajax({
                type: "get",
                url: "/Fase_Tiempo/obtener_id_fase",
                data: {
                    id: id,
                },
                success: function (result) {

                    setTimeout('location.reload()', 0);



                    if (result == "fail") {

                    }
                    else {

                        window.alert("exito");

                    }
                }
            })

            $("#id_proyecto").val(id);


        }
        function MostrarMensaje(id) {

            $("#id_proyecto").val(id);
        }



        function Agregar_Proyecto() {

            var proyecto = new Object();
            proyecto.nombre = $("#nombre_proyecto").val();
            proyecto.descripcion = $("#desc_proyecto").val();
            proyecto.precio = $("#precio").val();
            proyecto.fk_id_cliente = $("#cliente_proyecto").val();

            //proyectos.push(proyecto);

            swal({
                title: "\u00BFAgregar Proyecto?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#34495E",
                confirmButtonText: "Si, agregar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false
            },
                function (isConfirm) {


                    if (isConfirm) {

                        if (proyecto != null) {
                            $.ajax({
                                type: "POST",
                                url: "/Proyecto/agregar_proyecto",
                                data: JSON.stringify(proyecto),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {

                                    Prueba_Fase();


                                    swal({
                                        title: "Hecho",
                                        text: "Se ha agregado correctamente",
                                        type: "success",
                                        showConfirmButton: false
                                    })

                                    setTimeout('location.reload()', 2000);


                                },
                                failure: function (response) {
                                    alert(response.responseText);
                                },
                                error: function (response) {
                                    alert(response.responseText);
                                }
                            });
                        }
                    } else {


                        swal({
                            title: "Error",
                            text: "Se ha producido un problema",
                            type: "error",
                            showConfirmButton: false
                        })

                        setTimeout('location.reload()', 2000);
                    }
                })
        }


        function Prueba_Fase() {

            alert("hola");

            $.ajax({
                type: "POST",
                url: "/Proyecto/agregar_fases",
                data: JSON.stringify({ fases: fases }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Se pudo hp");
                }

            });
        }



        function Agregar_Fase() {



            var fase_proyecto = new Object();
            fase_proyecto.descripcion = $("#descripcion_fase").val();
            fase_proyecto.tiempo = $("#tiempo_proyecto").val();

            servicios.push($('#fase_tiempo').val());

            var htmlTags = '<tr id=' + $('#fase_tiempo').val() + '>' +
                '<td>' + $('#tiempo_proyecto').val() + '</td>' +
                '<td>' + $('#descripcion_fase').val() + '</td>' +
                '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
                '</tr>';

            $('#t_fase tbody').append(htmlTags);

            fases.push(fase_proyecto);

        }






        function Actualizar_Proyecto() {

            var proyecto = new Object();
            proyecto.id_proyecto = $("#consecutivo_proyecto").val();
            proyecto.nombre = $("#nombre_proyecto").val();
            proyecto.descripcion = $("#desc_proyecto").val();
            proyecto.precio = $("#precio").val();
            proyecto.fk_id_cliente = $("#cliente_proyecto").val();

            swal({
                title: "\u00BFEst\u00E1 seguro de realizar los cambios?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si, modificar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false
            },
                function (isConfirm) {
                    if (isConfirm) {

                        if (proyecto != null) {
                            $.ajax({
                                type: "POST",
                                url: "/Proyecto/actualizar_proyecto",
                                data: JSON.stringify(proyecto),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    swal({
                                        title: "Hecho",
                                        text: "Se ha modificado correctamente",
                                        type: "success",
                                        showConfirmButton: false
                                    })

                                    setTimeout('location.reload()', 2000);
                                },
                                failure: function (response) {
                                    alert(response.responseText);
                                },
                                error: function (response) {
                                    alert(response.responseText);
                                }
                            });
                        }
                    } else {
                        swal({
                            title: "Error",
                            text: "Se ha producido un problema",
                            type: "error",
                            showConfirmButton: false
                        })

                        setTimeout('location.reload()', 2000);
                    }
                })
        }

        function Deshabilitar(val) {

            alert(val);



            var fase_tiempo = new Object();
            fase_tiempo.id_fase = val;



            if (fase_tiempo != null) {
                $.ajax({
                    type: "POST",
                    url: "/Fase_Tiempo/actualizar_estado_deshabilitar_fase_tiempo",
                    data: JSON.stringify(fase_tiempo),
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

        function estado(dato_id) {


            var id_proyecto = dato_id;

            $("#" + id_proyecto).on('change', function () {
                if ($(this).is(':checked')) {

                    $.ajax({
                        type: "post",
                        url: "/Proyecto/actualizar_estado_Habilitar_proyecto",
                        data: {
                            id_proyecto: id_proyecto,
                        },
                        success: function (result) {
                            if (result == "fail") {



                            }
                            else {

                                swal({
                                    title: "Hecho",
                                    text: "Estado Habilitado",
                                    type: "success",
                                    showConfirmButton: true
                                })

                            }
                        }
                    })



                } else {

                    $.ajax({
                        type: "post",
                        url: "/Proyecto/actualizar_estado_deshabilitar_proyecto",
                        data: {
                            id_proyecto: id_proyecto,
                        },
                        success: function (result) {
                            if (result == "fail") {



                            }
                            else {

                                swal({
                                    title: "Hecho",
                                    text: "Estado Deshabilitado",
                                    type: "error",
                                    showConfirmButton: true
                                })

                            }
                        }
                    })

                }
            });
        };


        $(document).ready(function () {
            $('#select_proyect').change(function () {

                var val_select = $('#select_proyect').val();
                var url = window.location.href;
                var nuevaUrl = url.substring(0, url.indexOf('?'));
                window.location.href = nuevaUrl + "?Estado=" + val_select;

            });
        });

        var ShowPopup = function () {
            alert("No tiene permisos");

        }


        function Validar_Campo() {

            if (document.getElementById("cliente_proyecto").value.trim() == "" || document.getElementById("nombre_proyecto").value.trim() == "" || document.getElementById("precio").value.trim() == "" || document.getElementById("desc_proyecto").value.trim() == "") {

                document.getElementById("boton_agregar_proyecto").disabled = true;
                document.getElementById("boton_modificar").disabled = true;
                document.getElementById("error_campos_vacios").style.display = "block";
                return false;
            } else {
                document.getElementById("boton_agregar_proyecto").disabled = false;
                document.getElementById("boton_modificar").disabled = false;
                document.getElementById("error_campos_vacios").style.display = "none";
                return true;
            }
        }

//falta validar de fases de proyecto
    </script>



</asp:Content>
