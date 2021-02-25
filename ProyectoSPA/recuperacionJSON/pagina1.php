<?php
header('Content-Type: text/txt; charset=ISO-8859-1');
$nombre='';
$apellido='';
$direccion='';
if ($_REQUEST['dni']=='1')
{
  $nombre='Manuel';
  $apellido='Rodriguez';
  $direccion='Calle encantada';
}
if ($_REQUEST['dni']=='2')
{
  $nombre='Jess';
  $apellido='Sanchez';
  $direccion='Calle 24';
}
if ($_REQUEST['dni']=='3')
{
  $nombre='Ro';
  $apellido='Castro';
  $direccion='Calle 4978';
}
 
echo "{
        'nombre':'$nombre',
        'apellido':'$apellido',
        'direccion':'$direccion'
      }";
?>
 