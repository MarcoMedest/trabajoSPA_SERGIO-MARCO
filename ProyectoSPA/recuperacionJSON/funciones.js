addEvent(window,'load',inicializarEventos,false);
 
function inicializarEventos()
{
  var ob=document.getElementById('boton1');
  addEvent(ob,'click',presionBoton,false);
}
 
function presionBoton(e)
{
  var ob=document.getElementById('dni');
  recuperarDatos(ob.value);
}
 
 
var conexion1;
function recuperarDatos(dni) 
{
  conexion1=crearXMLHttpRequest();
  conexion1.onreadystatechange = procesarEventos;
  conexion1.open('GET','pagina1.php?dni='+dni, true);
  conexion1.send(null);
}
 
function procesarEventos()
{
  var resultados = document.getElementById("resultados");
  if(conexion1.readyState == 4)
  {
    var datos=eval("(" + conexion1.responseText + ")");
    var salida = "Apellido:"+datos.apellido+"   ";
    salida=salida+"Nombre:"+datos.nombre+"   ";
    salida=salida+"Direccion:"+datos.direccion;
    resultados.innerHTML = alert(salida);
  } 
  else 
  {
    resultados.innerHTML = "Cargando...";
  }
}

function addEvent(elemento,nomevento,funcion,captura)
{
  if (elemento.attachEvent)
  {
    elemento.attachEvent('on'+nomevento,funcion);
    return true;
  }
  else  
    if (elemento.addEventListener)
    {
      elemento.addEventListener(nomevento,funcion,captura);
      return true;
    }
    else
      return false;
}
 
function crearXMLHttpRequest() 
{
  var xmlHttp=null;
  if (window.ActiveXObject) 
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  else 
    if (window.XMLHttpRequest) 
      xmlHttp = new XMLHttpRequest();
  return xmlHttp;
}