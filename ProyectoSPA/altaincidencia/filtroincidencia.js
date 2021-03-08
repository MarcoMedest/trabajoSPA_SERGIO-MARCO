//# sourceURL=altaIndicencia.js;

$("#btnFiltroIncidencia").click(function()

    {
        let urgente = frmFiltroIncidencia.chkUrgente.checked ? "S" : "N";
       let params ="param="+urgente+"";
            $.post("php/getIncidencias.php", params, respuestaFiltroIncidencias, 'json');       

    });                                                      

function respuestaFiltroIncidencias(oDatos){

      var sTabla = '<table border="1">';

    sTabla += '<thead><tr><th>Id de Incidencia</th><th>NIF de Usuario</th><th>Descripcion</th><th>Fecha</th></thead>';

    sTabla += "<tbody>";
    for (var i = 0; i < oDatos.length; i++) {
        sTabla += "<tr>";
        sTabla += "<td>" + oDatos[i].IdIncidencia + "</td>";
        sTabla += "<td>" + oDatos[i].NifUsuario + "</td>";
        sTabla += "<td>" + oDatos[i].Descripcion + "</td>";
        sTabla += "<td>" + oDatos[i].Fecha + "</td>";
        sTabla += "</tr>";
    }
    sTabla += "</tbody></table>";

    var oVentana = window.open("", "_blank");

    oVentana.document.body.innerHTML = sTabla;
}