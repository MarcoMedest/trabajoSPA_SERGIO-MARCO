"use strict";
// Carga dinámica de formularios
$("#mnuAltaCliente").click(abrirAltaCliente);
$("#mnuAltaAgente").click(abrirAltaAgente);
$("#mnuAltaIncidencia").click(abrirAltaIncidencia);
$("#mnuListadoCliente").click(listadoClientes);
$("#mnuListadoIncidencias").click(abrirFiltroIncidencias)
$("#mnuListadoAgente").click(pedirListado);
	

//$("#mnuRecuperacionJson").click(recuperarJson);


// PARA AGENTE
function abrirAltaAgente() {

    // Oculto todos los formularios menos este
    $("form:not('#frmAltaAgente')").parent("fieldset").hide("normal");

    // Verifico si ya he cargado el formulario antes
    if ($('#frmAltaAgente').size() == 0) {
        $("<div>").appendTo('#formularios').load("altaagente/altagente.html",
            function() {
                $.getScript("altaagente/altagente.js");
            });

    } else {
        // Lo muestro si está oculto
        $('#frmAltaAgente').parent().show("normal");
    }
}

// para CLIENTE

function abrirAltaCliente() {

    // Oculto todos los formularios menos este
    $("form:not('#frmAltaUsuario')").parent("fieldset").hide("normal");

    // Verifico si ya he cargado el formulario antes
    if ($('#frmAltaUsuario').size() == 0) {
        $("<div>").appendTo('#formularios').load("altausuario/altausuario.html",
            function() {
                $.getScript("altausuario/altausuario.js");
            });

    } else {
        // Lo muestro si está oculto
        $('#frmAltaUsuario').parent().show("normal");
    }
}


// para incidencia
function abrirAltaIncidencia() {

    // Oculto todos los formularios menos este
    $("form:not('#frmAltaIncidencia')").parent("fieldset").hide("normal");

    // Verifico si ya he cargado el formulario antes
    if ($('#frmAltaIncidencia').size() == 0) {
        $("<div>").appendTo('#formularios').load("altaincidencia/altaincidencia.html",
            function() {
                $.getScript("altaincidencia/altaincidencia.js");
            });

    } else {
        // Lo muestro si está oculto
        $('#frmAltaIncidencia').parent().show("normal");
        // Recarga de desplegable de propietarios
        cargarDesplegableUsuarios();
    }
}

function abrirFiltroIncidencias(){
        // Oculto todos los formularios menos este
    $("form:not('#frmFiltroIncidencia')").parent("fieldset").hide("normal");

    // Verifico si ya he cargado el formulario antes
    if ($('#frmFiltroIncidencia').size() == 0) {
          $("<div>").appendTo('#formularios').load("altaincidencia/filtroincidencia.html",
            function() {
                $.getScript("altaincidencia/filtroincidencia.js");
            });

    } else {
        // Lo muestro si está oculto
        $('#frmFiltroIncidencia').parent().show("normal");
        // Recarga de desplegable de propietarios
    }
}


// Listado cliente



function respuestaListadoClientes(oDatos) {

    var sTabla = '<table border="1">';

    sTabla += '<thead><tr><th>NifUsuario</th><th>Nombre</th><th>Apellidos</th><th>Direccion</th></thead>';

    sTabla += "<tbody>";
    for (var i = 0; i < oDatos.length; i++) {
        sTabla += "<tr>";
        sTabla += "<td>" + oDatos[i].NifUsuario + "</td>";
        sTabla += "<td>" + oDatos[i].Nombre + "</td>";
        sTabla += "<td>" + oDatos[i].Apellidos + "</td>";
        sTabla += "<td>" + oDatos[i].Direccion + "</td>";
        sTabla += "</tr>";
    }
    sTabla += "</tbody></table>";

    var oVentana = window.open("", "_blank");

    oVentana.document.body.innerHTML = sTabla;
}



function listadoClientes(){

   var ajax_url = "php/getClientes.php";

var ajax_request = new XMLHttpRequest();

ajax_request.onreadystatechange = function() {

    if (ajax_request.readyState == 4 && ajax_request.status == 200) {

        var jsonObj = JSON.parse(ajax_request.responseText);
        respuestaListadoClientes(jsonObj);
    }
}

ajax_request.open( "GET", ajax_url, true );

ajax_request.send();                                                              

}


// Pedir Listado Agente

function pedirListado() {
            // Instanciar objeto Ajax
            var oAjax = instanciarXHR();

            //Configurar la llamada --> Asincrono por defecto
            oAjax.open("GET", "php/listadoAgenteXML.php");

            //Asociar manejador de evento de la respuesta
            oAjax.addEventListener("readystatechange", procesoRespuestalistadoAgenteXML, false);

            //Hacer la llamada
            oAjax.send(null);
			
        }



		
		function procesoRespuestalistadoAgenteXML() {
            var oAjax = this;

            // Proceso la respuesta cuando llega
            if (oAjax.readyState == 4 && oAjax.status == 200) {
                console.log(oAjax.responseText);
                var oXML = oAjax.responseXML; // Recojo un objeto XML

                construirListado(oXML);
            }
        }
		
		    function construirListado(oXML) {
            // Crear tabla
            var oTabla = document.createElement("table");
            oTabla.border = "1";
            var oTHead = oTabla.createTHead();
            var oFila = oTHead.insertRow(-1);
            var oTH = document.createElement("TH");
			oTH.textContent = "nifAgente";
            oFila.appendChild(oTH);
			
			oTH = document.createElement("TH");
            oTH.textContent = "nombre";
            oFila.appendChild(oTH);

            oTH = document.createElement("TH");
            oTH.textContent = "apellidos";
            oFila.appendChild(oTH);

            oTH = document.createElement("TH");
            oTH.textContent = "direccion";
            oFila.appendChild(oTH);
			
            oTH = document.createElement("TH");
            oTH.textContent = "puesto";
            oFila.appendChild(oTH);


            var oTBody = oTabla.createTBody();


            var oPersonas = oXML.querySelectorAll("persona");
            for (var i = 0; i < oPersonas.length; i++) {
                oFila = oTBody.insertRow(-1);

                var oCelda = oFila.insertCell(-1);
                oCelda.textContent = oPersonas[i].querySelector("nifAgente").textContent;

                oCelda = oFila.insertCell(-1);
                oCelda.textContent = (oPersonas[i].querySelector("nombre").textContent);

                oCelda = oFila.insertCell(-1);
                oCelda.textContent = (oPersonas[i].querySelector("apellidos").textContent);
            
				oCelda = oFila.insertCell(-1);
                oCelda.textContent = (oPersonas[i].querySelector("direccion").textContent);

				oCelda = oFila.insertCell(-1);
                oCelda.textContent = (oPersonas[i].querySelector("puesto").textContent);

			}
            document.querySelector("#listado").innerHTML = "";
            document.querySelector("#listado").appendChild(oTabla);
        }
		
		
		function instanciarXHR() {
            var xhttp = null;

            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else // code for IE5 and IE6
            {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            return xhttp;
        }
		

/* // PARA RECUPERACION CON JSON
function recuperarJson() {

    // Oculto todos los formularios menos este
    $("form:not('#frmRecuperacionJson')").parent("fieldset").hide("normal");

    // Verifico si ya he cargado el formulario antes
    if ($('#frmRecuperacionJson').size() == 0) {
        $("<div>").appendTo('#formularios').load("recuperacionJSON/index.html",
            function() {
                $.getScript("recuperacionJSON/funciones.js");
            });

    } else {
        // Lo muestro si está oculto
        $('#frmRecuperacionJson').parent().show("normal");
    }
}*/