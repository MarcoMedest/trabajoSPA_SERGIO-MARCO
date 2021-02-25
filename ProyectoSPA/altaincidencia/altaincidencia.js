//# sourceURL=altaIndicencia.js;

cargarDesplegableUsuarios();

function cargarDesplegableUsuarios() {

    $.ajax({
        url: "altaincidencia/getUsuarios.php",
        dataType: 'json',
        cache: false,
        async: true, // por defecto
        method: "GET",
        success: procesarGetUsuarios
    });
}

function procesarGetUsuarios(oDatos) {
    var sOptions = "";

    for (var i = 0; i < oDatos.length; i++) {

        sOptions += '<option value="' + oDatos[i].NifUsuario + '">';
        sOptions += oDatos[i].Nombre + " " + oDatos[i].Apellidos;
        sOptions += '</option>';
    }

    $("#txtUsuario").html(sOptions);
}

$("#btnAltaIncidencia").click(function() {
    let incidencia = {
        IdIncidencia: frmAltaIncidencia.txtIdIncidencia.value.trim(),
        NifUsuario: frmAltaIncidencia.txtUsuario.value.trim(),
		Descripcion: frmAltaIncidencia.txtDescripcion.value.trim(),
        Urgente: frmAltaIncidencia.chkUrgente.checked ? "S" : "N",
        Fecha: frmAltaIncidencia.txtFecha.value.trim(),
        
    };
    $.ajax({
        url: "altaincidencia/altaincidencia.php",
        data: "datos=" + JSON.stringify(incidencia),
        cache: false,
        async: true, // por defecto
        method: "POST",
        success: respuestaAltaIncidencia
    });
});

function respuestaAltaIncidencia(resultado) {
    let datos = JSON.parse(resultado);
    if (datos["error"]) {
        alert(datos["mensaje"]);
    } else {
        alert(datos["mensaje"]);
        frmAltaIncidencia.reset();
        $("#frmAltaCasa").parent().hide("normal");
    }
}