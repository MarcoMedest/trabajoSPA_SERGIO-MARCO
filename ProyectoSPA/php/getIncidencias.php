<?php

// Configuración BASE DE DATOS MYSQL
$servidor  = "localhost";
$basedatos = "spa";
$usuario   = "root";
$password  = "";

// Creamos la conexión al servidor.
$conexion = mysqli_connect($servidor, $usuario, $password,$basedatos) or die(mysqli_error($conexion));
mysqli_set_charset($conexion,"utf8");
mysqli_query($conexion,"utf8");
$urgente = $_POST["param"];
// Consulta SQL para obtener los datos de los centros.
$sql = 'SELECT IdIncidencia,NifUsuario,Descripcion,Fecha FROM `incidencias` WHERE incidencias.Urgente="'.$urgente.'"';
$resultado = mysqli_query($conexion,$sql);

$datos = [];

while ($fila=$resultado->fetch_object()) {
    // Almacenamos en un array cada una de las filas que vamos leyendo del recordset.
    $datos[] = $fila;
}

// función de PHP que convierte a formato JSON el array.
echo json_encode($datos); 


mysqli_close($conexion);
?>