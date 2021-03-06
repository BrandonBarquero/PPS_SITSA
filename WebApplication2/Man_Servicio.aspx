﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_Maestra.Master" AutoEventWireup="true" CodeBehind="Man_Servicio.aspx.cs" Inherits="WebApplication2.Man_Servicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Assets_CTRL/js/Funciones_Paginas/Servicio.js"></script>

    <div class="container-mant">


        <div class="#">
            <!--Cabecera-->
            <h3 class="text-left">
                <i class="fas fa-network-wired color-icono" aria-hidden="true"></i>&nbsp; Servicios
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
                </select>
            </div>


            <% if (Permisos.CREAR == false)
                {

            %>

            <div style="display: none;" id="divvalida">
                <%  }%>


                <p>
                    <button class="btn btn-dark txt2" id="boton_multiple" value="" type="button" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios">
                        Agregar Servicio
                    </button>
                </p>


                <% if (Permisos.CREAR == false)
                    {

                %>
            </div>
            <%  }%>





            <div class="collapse" id="collapseServicios">
                <div class="card card-body txt2">

                            <div style="display: none; text-align: center;" id="error_campos_vacios" class="alert alert-warning">
                 <strong>¡Cuidado!</strong> Campos sin completar.
                      </div>


                    <p id="parrafo_servicio">Agregar nuevo servicio</p>



                    <div class="row">

                        <div id="campo_consecutivo" style="display: none;" class="col-12 col-md-12">

                            <div class="form-group">
                                <label>Consecutivo:</label>
                                <input type="text" class="form-control" id="consecutivo_servicio" name="consecutivo_servicio">
                            </div>

                        </div>


                        <div class="col-12 col-md-12">

                            <div class="form-group">
                                <label>Descripción del servicio:</label>
                                <input maxlength="100" onblur="Validar_Campo()" type="text" class="form-control" id="desc_servicio" name="desc_servicio">
                            </div>

                        </div>

                    </div>

                    <div id="boton_enviar" style="display: block; text-align: center">

                        <button disabled onclick="Agregar_Servicio()" type="button" id="boton_agregar" class="popup-btn">Agregar</button>
                    </div>

                    <div id="botones" style="display: none; text-align: center;">
                        <button disabled onclick="Actualizar_Servicio()" type="button" id="boton_modificar" class="popup-btn">Modificar</button>
                        <button id="boton_cancelar" type="submit" class="popup-btn">Cancelar</button>
                    </div>


                    <br>
                </div>
            </div>
            <div id="cand">
            </div>

            <br>

            <table id="tabla-mant" class="table table-striped table-bordered" style="width: 100%;">
                <!--Tabla-->


                <thead class="estilo-thead">
                    <tr>
                        <th>Consecutivo</th>
                        <th>Descripción de Servicio</th>
                        <%if (Permisos.EDTIAR == true)
                            { %>
                        <th>Modificar</th>
                        <th>Inhabilitar</th>
                        <%}%>
                    </tr>
                </thead>

                <tbody id="tablatr">

                    <%
                        List<Biblioteca_Clases.Models.Servicio> list = new List<Biblioteca_Clases.Models.Servicio>();
                        string valor = Convert.ToString(Request.QueryString["Estado"]);
                        list = ListaServicios(valor);
                        int autoincrement = 0;

                        foreach (var dato in list)
                        {
                            autoincrement = autoincrement + 1;
                    %>

                    <tr class="txt2">
                        <td><%=dato.ID_SERVICIO%></td>
                        <td><%=dato.DESCRIPCION%></td>
                        <% if (Permisos.EDTIAR == true)
                            { %>
                        <td style="text-align: center;"><a onclick="Modificar_Servicio(<%=dato.ID_SERVICIO%>,'<%=dato.DESCRIPCION%>',<%=dato.ESTADO%>);" data-toggle="collapse" data-target="#collapseServicios" aria-expanded="false" aria-controls="collapseServicios"><i class="fa fa-edit color-icono" aria-hidden="true"></td>
                        <td style="text-align: center;"><a href="#">
                            <div class="custom-control custom-switch">
                                <% if (dato.ESTADO == 1)
                                    {


                                %>
                                <input onclick="estado(<%=dato.ID_SERVICIO%>)" type="checkbox" checked class="custom-control-input" id="<%=dato.ID_SERVICIO%>">
                                <%}

                                    else if (dato.ESTADO == 0)
                                    {
                                %>
                                <input onclick="estado(<%=dato.ID_SERVICIO%>)" type="checkbox" class="custom-control-input" id="<%=dato.ID_SERVICIO%>">

                                <%}%>

                                <label class="custom-control-label" for="<%=dato.ID_SERVICIO%>" />

                            </div></td>
                        <%}%>
                    </tr>


                    <%}

                    %>
                </tbody>

                <tfoot class="estilo-thead">
                    <tr>
                        <th>Consecutivo</th>
                        <th>Descripción de Servicio</th>
                        <%      if (Permisos.EDTIAR == true)
                            {%>
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

    <script type="text/javascript">

        $('#desc_servicio').on('input', function (e) {
            if (!/^[ a-záéíóúüñ]*$/i.test(this.value)) {
                this.value = this.value.replace(/[^ a-záéíóúüñ]+/ig, "");
            }
        });

    </script>





</asp:Content>
