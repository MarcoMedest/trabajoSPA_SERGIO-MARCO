$("#btnAceptarUsuario").click(function() {
    var oUsuario = {
        NifUsuario: frmAltaUsuario.txtNifUsuario.value.trim(),
        Nombre: frmAltaUsuario.txtNombre.value.trim(),
        Apellidos: frmAltaUsuario.txtApellidos.value.trim(),
        Direccion: frmAltaUsuario.txtDireccion.value.trim()
    };
    //  IMPORTANTE: EL NOMBRE DE LOS PARAMETROS ENVIADOS DIFIERE EN EL CASO DEL OBJETO LITERAL

    var sParametros = "datos=" + JSON.stringify(oUsuario);

    $.post("altausuario/altausuario.php", sParametros, respuestaAltaUsuario, 'json');

});

function respuestaAltaUsuario(oDatos, sStatus, oXHR) {

    if (oDatos.error) {
        alert(oDatos.mensaje);
    } else {
        alert(oDatos.mensaje);
        frmAltaUsuario.reset();
        $("#frmAltaUsuario").parent().hide("normal");
    }
}