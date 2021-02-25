$("#btnAceptarAgente").click(function() {
    var oAgente = {
        NifAgente: frmAltaAgente.txtNifAgente.value.trim(),
        Nombre: frmAltaAgente.txtNombre.value.trim(),
        Apellidos: frmAltaAgente.txtApellidos.value.trim(),
        Direccion: frmAltaAgente.txtDireccion.value.trim(),
		Puesto: frmAltaAgente.txtPuesto.value.trim()
    };
    //  IMPORTANTE: EL NOMBRE DE LOS PARAMETROS ENVIADOS DIFIERE EN EL CASO DEL OBJETO LITERAL

    var sParametros = "datos=" + JSON.stringify(oAgente);

    $.post("altaagente/altagente.php", sParametros, respuestaAltaAgente, 'json');

});

function respuestaAltaAgente(oDatos, sStatus, oXHR) {

    if (oDatos.error) {
        alert(oDatos.mensaje);
    } else {
        alert(oDatos.mensaje);
        frmAltaAgente.reset();
        $("#frmAltaAgente").parent().hide("normal");
    }
}