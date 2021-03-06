<?php

// Configuración BASE DE DATOS MYSQL
$servidor  = "localhost";
$basedatos = "spa";
$usuario   = "root";
$password  = "";

// Recojo los datos de entrada
$datosJSON = $_POST["datos"];
//Decodifico el objeto incidencia
$incidencia = json_decode($datosJSON);

// Creamos la conexión al servidor.
$conexion = mysqli_connect($servidor, $usuario, $password,$basedatos) or die(mysqli_error($conexion));
mysqli_set_charset($conexion,"utf8");
mysqli_query($conexion,"utf8");
$sql ="select max(IdIncidencia) + 1 as num from incidencias";
$resultado = mysqli_query($conexion,$sql);
$fila = $resultado->fetch_assoc();
$sql = "INSERT INTO incidencias VALUES (".$fila["num"].",'$incidencia->NifUsuario','$incidencia->Descripcion','$incidencia->Urgente','$incidencia->Fecha');";
$resultado = mysqli_query($conexion,$sql);

if ($resultado){
    $respuesta["error"] = 0;
    $respuesta["mensaje"] = "Alta realizada"; 
} else {
    $respuesta["error"] = 1;
    $respuesta["mensaje"] = "Error en el proceso de alta: ".mysqli_error($conexion);
}

echo json_encode($respuesta);

mysqli_close($conexion);
?>