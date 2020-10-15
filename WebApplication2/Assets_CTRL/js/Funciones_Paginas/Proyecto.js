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

function pruebba() {

    aler("Hola");
}

function Agregar_Proyecto() {

    var proyecto = new Object();
    proyecto.nombre = $("#nombre_proyecto").val();
    proyecto.descripcion = $("#desc_proyecto").val();
    proyecto.precio = $("#precio").val();
    proyecto.fk_id_cliente = $("#cliente_proyecto").val();

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


function Agregar_Fase() {

    var fase_proyecto = new Object();
    fase_proyecto.descripcion = $("#descripcion_fase").val();
    fase_proyecto.tiempo = $("#tiempo_proyecto").val();
    fase_proyecto.fk_id_proyecto = $("#id_proyecto").val();

    if (fase_proyecto != null) {
        $.ajax({
            type: "POST",
            url: "/Fase_Tiempo/agregar_fase",
            data: JSON.stringify(fase_proyecto),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#descripcion_fase").val("");
                $("#tiempo_proyecto").val("");

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

        servicios.push($('#fase_tiempo').val());

        var htmlTags = '<tr id=' + $('#fase_tiempo').val() + '>' +
            '<td>' + $('#tiempo_proyecto').val() + '</td>' +
            '<td>' + $('#descripcion_fase').val() + '</td>' +
            '<td style="text-align: center;"><a href="#"><i class="fas fa-ban color-icono" aria-hidden="true"></td>' +
            '</tr>';

        $('#t_fase tbody').append(htmlTags);
    }

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

//falta validar de fase 
