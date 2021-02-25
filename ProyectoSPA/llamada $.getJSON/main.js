"use strict";
	$("#cargaListadoServicios").click(function(){

		obtenerDatosJSON().then(function(data) {
		  let items = [];
		   var win = window.open("", '_blank');
		  $.each( data, function( key, val ) {
		    items.push("<li id='" + val.idServicio + "'>" + " " + val.idServicio + " " + val.denominacion + " " + val.precio + "</li>");
		  });
		  $("<ul/>", {
		    "class": "lista_ejemplo",
		    "html": items
		  })
		  win.document.body.innerHTML = items;
		   win.focus();
		}).catch(function(err) {
		  console.log("Hubo un error al cargar el JSON", err);		  
		});			
		 
		
	}); 

function obtenerDatosJSON(){

				
  return new Promise(function(resolve, reject) {
		$.getJSON("datos.json") 	    	
	    .then(function(res) {
	        resolve(res);
			
			
	    })
	    .catch(function(err) {
	        reject(err);
	    });  
  });
}
