$(document).ready(function () {
    $('#tabla-mant').DataTable();
});

var servicios = [];
var opc = 0;
var g_tipo_cambio = false;

var g_cliente = new Object();
g_cliente.ID_CLIENTE = '';
g_cliente.NOMBRE = "";

var g_tipo_contrato = new Object();

var g_tipo_contrato = new Object();
g_tipo_contrato.ID_TIPO_CONTRATO = '';
g_tipo_contrato.NOMBRE = '';
g_tipo_contrato.ESTADO = '';
g_tipo_contrato.HORAS = '';
g_tipo_contrato.RANGO_DOCUMENTOS = '';
g_tipo_contrato.MONTO = '';

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
                    swal({
                        title: "Hecho",
                        text: "Estado Habilitado",
                        type: "success",
                        showConfirmButton: true
                    })
                }
            })

        } else {
            $.ajax({
                type: "post",
                url: "/Contrato/actualizar_estado_deshabilitar_Contrato",
                data: {
                    id_contrato: id_contrato,
                },
                success: function (result) {
                    swal({
                        title: "Hecho",
                        text: "Estado Deshabilitado",
                        type: "error",
                        showConfirmButton: true
                    })
                }
            })

        }
    });
};

function Agregar_Contrato() {

    var contrato = new Object();
    //contrato.cliente = $("#cliente_contrato").val();
    var arreglo_cliente = $("#cliente_contrato").val();
    var client = arreglo_cliente.split("-");
    contrato.cliente = client[0];
    contrato.nombre_contrato = $("#nombre_contrato").val();
    contrato.descripcion = $("#descripcion_contrato").val();
    contrato.contacto = $("#contacto_contrato").val();
    contrato.fecha_inicio = $("#fecha_inicio").val();
    contrato.fecha_vence = $("#fecha_vencimiento").val();
    //contrato.tipo_contrato = $("#tipo_contrato").val();
    var arreglo_tipo = $("#tipo_contrato").val();
    var tipo = arreglo_tipo.split("-");
    contrato.tipo_contrato = tipo[0];
    contrato.horas = $("#horas_contrato").val();
    contrato.monto = $("#monto_contrato").val();
    contrato.rango = $("#rango_contrato").val();

    swal({
        title: "\u00BFAgregar Contrato?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#34495E",
        confirmButtonText: "Si, agregar",
        cancelButtonText: "Cancelar",
        closeOnConfirm: false
    },
        function (isConfirm) {


            if (isConfirm) {

    if (contrato != null) {
        $.ajax({
            type: "POST",
            url: "/Contrato/agregar_contrato",
            data: JSON.stringify({ contrato: contrato, servicios: servicios }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                swal({
                    title: "Hecho",
                    text: "Se ha agregado correctamente",
                    type: "success",
                    showConfirmButton: false
                })

                setTimeout('location.reload()', 2000);
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
function editar(id_contrato, cliente, nombre_contrato, descripcion, contacto, fecha_inicio, fecha_vence, tipo_contrato, horas, monto, rango) {
    devuelve_cliente(cliente);

    devuelve_tipo_contrato(tipo_contrato);

    //$("#cliente_contrato").val(g_cliente.ID_CLIENTE+"-"+g_cliente.NOMBRE);
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

    lista_tipo_contrato(tipo_contrato, horas, monto, rango, 1);

    $("#boton_agregar").css("display", "none");
    $("#boton_cancelar1").css("display", "none");
    $("#botones").css("display", "block");
    $("#consecutivo").css("display", "block");
    $("#aux").css("display", "block");
    $("#consecutivo_contrato").val(id_contrato);

    $('#boton_multiple').text("Modificar Contrato");
    $('#parrafo_servicio').text("Modificar contrato actual");

    opc = 1;

    //Vacea la tabla de servicios de detalles
    $('#t_servicios tbody').empty();

    Lista_servicios(id_contrato);

}

function lista_tipo_contrato(id_tipo_contrato, horas, monto, rango, opcion) {
    $.ajax({
        type: "POST",
        url: "/TipoContrato/listar_tipo_contrato",
        data: JSON.stringify({
            id: id_tipo_contrato,
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve

            g_tipo_contrato = response;

            if (opcion == 1) {
                if (g_tipo_contrato.HORAS == true) {
                    $("#div_horas").css("display", "block");
                    $("#horas_contrato").val(horas);
                }

                if (g_tipo_contrato.MONTO == true) {
                    $("#div_monto").css("display", "block");
                    $("#monto_contrato").val(monto);
                }

                if (g_tipo_contrato.RANGO_DOCUMENTOS == true) {
                    $("#div_rango").css("display", "block");
                    $("#rango_contrato").val(rango);
                }
            }
            else if (opcion == 2) {
                $("#d_div_horas").css("display", "none");
                $("#d_div_monto").css("display", "none");
                $("#d_div_rango").css("display", "none");

                if (g_tipo_contrato.HORAS == true) {
                    $('#d_horas_contrato').val(horas);
                    $("#d_div_horas").css("display", "block");
                }
                if (g_tipo_contrato.MONTO == true) {
                    $('#d_monto_contrato').val(monto);
                    $("#d_div_monto").css("display", "block");
                }
                if (g_tipo_contrato.RANGO_DOCUMENTOS == true) {
                    $('#d_rango_contrato').val(rango)
                    $("#d_div_rango").css("display", "block");
                }
            }
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

function devuelve_cliente(id) {
    $.ajax({
        type: "POST",
        url: "/Contrato/devuelve_cliente",
        data: JSON.stringify({
            id: id,
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve

            g_cliente = response;
           

            $("#cliente_contrato").val(g_cliente.ID_CLIENTE + "-" + g_cliente.NOMBRE);
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

function devuelve_tipo_contrato(id) {
    $.ajax({
        type: "POST",
        url: "/Contrato/devuelve_tipo_contrato",
        data: JSON.stringify({
            id: id,
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve

            g_tipo_contrato = response;
           

            $("#tipo_contrato").val(g_tipo_contrato.ID_TIPO_CONTRATO + " - " + g_tipo_contrato.NOMBRE);
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
    var arreglo_cliente = $("#cliente_contrato").val();
    var client = arreglo_cliente.split("-");
   
    contrato.cliente = client[0];
    //contrato.cliente = $("#cliente_contrato").val();
    contrato.nombre_contrato = $("#nombre_contrato").val();
    contrato.descripcion = $("#descripcion_contrato").val();
    contrato.contacto = $("#contacto_contrato").val();
    contrato.fecha_inicio = $("#fecha_inicio").val();
    contrato.fecha_vence = $("#fecha_vencimiento").val();
    //contrato.tipo_contrato = $("#tipo_contrato").val();
    var arreglo_tipo = $("#tipo_contrato").val();
   
    var tipo = arreglo_tipo.split("-");
    contrato.tipo_contrato = tipo[0];
    contrato.horas = $("#horas_contrato").val();
    contrato.monto = $("#monto_contrato").val();
    contrato.rango = $("#rango_contrato").val();

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

    if (contrato != null) {
        $.ajax({
            type: "POST",
            url: "/Contrato/modificar_contrato",
            data: JSON.stringify({ contrato: contrato, servicios: servicios }),
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

function pinta(data) {
    servicios.push(data.ID_SERVICIO);
    var htmlTags = '<tr id=' + data.ID_SERVICIO + '>' +
        '<td>' + data.ID_SERVICIO + '</td>' +
        '<td>' + data.DESCRIPCION + '</td>';
    if (opc == 1) {
        htmlTags = htmlTags + '<td style="text-align: center;"><a onclick="elimina(' + data.ID_SERVICIO + ');"><i class="fas fa-trash color-icono" aria-hidden="true"></td>' +
            '</tr>';
    } else if (opc == 2) {
        htmlTags = htmlTags + '</tr>';
    }

    if (opc == 1) {
        $('#t_servicios tbody').append(htmlTags);
    } else if (opc == 2) {
        $('#t_servicios_d tbody').append(htmlTags);
    }

}

function elimina(data) {
    $("#" + data).remove();
    for (let i = 0; i < servicios.length; i++) {
        if (servicios[i] == data) {
            if (i == 0) {
                servicios.shift();
            } else {
                servicios.splice(i, i);
            }
        }
    }
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
        var service = $('#servicio_contrato').val();
        var arrelgo_servicio = service.split("-");

        alert(arrelgo_servicio[0] + " , " + arrelgo_servicio[1]);

        $('#servicio_contrato').val(arrelgo_servicio[0]);
        $('#descripcion_servicio').val(arrelgo_servicio[1]);
    });
});

$(document).ready(function () {
    $('#tipo_contrato').change(function () {
        $("#div_rango").css("display", "none");
        $("#div_monto").css("display", "none");
        $("#div_horas").css("display", "none");

        var tipo = $('#tipo_contrato').val();
        var arreglo_tipo = tipo.split(",");

        alert(arreglo_tipo);

        if ($('#tipo_contrato').val() != "") {
            $('#tipo_contrato').val(arreglo_tipo[0] + " - " + arreglo_tipo[4]);
        }

        if (arreglo_tipo[1] == "Por horas") {
            $("#div_horas").css("display", "block");
            $("#horas_contrato").val("");

        }
        if (arreglo_tipo[2] == "Por rango de documentos") {
            $("#div_rango").css("display", "block");
            $("#rango_contrato").val("");
        }
        if (arreglo_tipo[3] == "Por monto") {
            $("#div_monto").css("display", "block");
            $("#monto_contrato").val("");
        }


    });
});

function Agregar_Servicio() {
    var ser = parseInt($('#servicio_contrato').val());
    if (servicios.includes(ser)) {
        alert("Ya existe el servicio");
        return;
    } else if ($('#servicio_contrato').val() != "") {
        servicios.push($('#servicio_contrato').val());

        var htmlTags = '<tr id=' + $('#servicio_contrato').val() + '>' +
            '<td>' + $('#servicio_contrato').val() + '</td>' +
            '<td>' + $('#descripcion_servicio').val() + '</td>' +
            '<td style="text-align: center;"><a onclick="elimina(' + $('#servicio_contrato').val() + ');"><i class="fas fa-trash color-icono" aria-hidden="true"></td>' +
            '</tr>';

        $('#t_servicios tbody').append(htmlTags);
    }
    $('#servicio_contrato').val("");
    $('#descripcion_servicio').val("");
}

function detalla(id_contrato, cliente, nombre_contrato, descripcion, contacto, fecha_inicio, fecha_vence, tipo_contrato, horas, monto, rango) {
    $('#d_consecutivo_contrato').val(id_contrato);
    $('#d_cliente_contrato').val(cliente);
    $('#d_nombre_contrato').val(nombre_contrato);
    $('#d_descripcion_contrato').val(descripcion);
    $('#d_contacto_contrato').val(contacto);
    $('#d_inicio_contrato').val(fecha_inicio);
    $('#d_fin_contrato').val(fecha_vence);
    $('#d_tipo_contrato').val(tipo_contrato);

    lista_tipo_contrato(tipo_contrato, horas, monto, rango, 2);

    //Vacea la tabla de servicios de detalles
    $('#t_servicios_d tbody').empty();

    opc = 2;

    Lista_servicios(id_contrato)
}

function Lista_servicios(id_contrato) {

    servicios = [];

    $.ajax({
        type: "POST",
        url: "/Contrato/listar_servicios_contrato",
        data: JSON.stringify({
            id: id_contrato,
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
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

var ShowPopup = function () {
    alert("No tiene permisos");
}

function Validar_Campo() {

    if (document.getElementById("cliente_contrato").value.trim() == "" || document.getElementById("nombre_contrato").value.trim() == "" || document.getElementById("descripcion_contrato").value.trim() == "" || document.getElementById("contacto_contrato").value.trim() == "" || document.getElementById("fecha_inicio").value.trim() == "" || document.getElementById("fecha_vencimiento").value.trim() == "" || document.getElementById("tipo_contrato").value.trim() == "") {

        document.getElementById("boton_agregar").disabled = true;
        document.getElementById("boton_modificar").disabled = true;
        document.getElementById("error_campos_vacios").style.display = "block";
        return false;
    } else {
        document.getElementById("boton_agregar").disabled = false;
        document.getElementById("boton_modificar").disabled = false;
        document.getElementById("error_campos_vacios").style.display = "none";
        return true;
    }
}

function Validar_Campo2() {

    if (document.getElementById("servicio_contrato").value.trim() == "" || document.getElementById("descripcion_servicio").value.trim() == "") {

        document.getElementById("boton_agrega_servicio").disabled = true;
        document.getElementById("error_campos_vacios2").style.display = "block";
        return false;
    } else {
        document.getElementById("boton_agrega_servicio").disabled = false;
        document.getElementById("error_campos_vacios2").style.display = "none";
        return true;
    }
}