-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2021 a las 12:19:42
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

CREATE TABLE `agentes` (
  `NifAgente` varchar(9) NOT NULL DEFAULT '',
  `Nombre` varchar(45) NOT NULL DEFAULT '',
  `Apellidos` varchar(45) NOT NULL DEFAULT '',
  `Direccion` varchar(40) NOT NULL DEFAULT '',
  `Puesto` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`NifAgente`, `Nombre`, `Apellidos`, `Direccion`, `Puesto`) VALUES
('22222222Z', 'CARLOS', 'ALGECIRAS VILLEGAS', 'calle 1', 'cuidador'),
('30303030Z', 'LOLA', '\"LA PITONISA\"', 'calle 2', 'tratador'),
('33333333Z', 'SALVADOR', 'GALLEGO MONTERO', 'calle 3', 'cargador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversacion`
--

CREATE TABLE `conversacion` (
  `IdConversacion` int(11) NOT NULL DEFAULT '0',
  `NifUsuario` varchar(9) NOT NULL DEFAULT '',
  `PreguntaUser` varchar(100) NOT NULL DEFAULT '',
  `NifAgente` varchar(9) NOT NULL DEFAULT '',
  `RespuestaAgen` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conversacion`
--

INSERT INTO `conversacion` (`IdConversacion`, `NifUsuario`, `PreguntaUser`, `NifAgente`, `RespuestaAgen`) VALUES
(0, '11111111Z', 'caida en casa', '30303030Z', '2006-01-31'),
(1, '14141414Z', 'desmayo', '22222222Z', '2012-02-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `IdIncidencia` int(11) NOT NULL DEFAULT '0',
  `NifUsuario` varchar(9) NOT NULL DEFAULT '',
  `Descripcion` varchar(100) NOT NULL DEFAULT '',
  `Urgente` varchar(1) NOT NULL DEFAULT '',
  `Fecha` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`IdIncidencia`, `NifUsuario`, `Descripcion`, `Urgente`, `Fecha`) VALUES
(0, '11111111Z', 'caida en casa', 'N', '2006-01-31'),
(1, '14141414Z', 'desmayo', 'S', '2012-02-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `NifUsuario` varchar(9) NOT NULL DEFAULT '',
  `Nombre` varchar(45) NOT NULL DEFAULT '',
  `Apellidos` varchar(45) NOT NULL DEFAULT '',
  `Direccion` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`NifUsuario`, `Nombre`, `Apellidos`, `Direccion`) VALUES
('10101010Z', 'VICTOR', 'CARDENAS BERLANGA', 'Calle Betis'),
('11111111Z', 'EUGENIO', 'ROLDAN ROMASANTA', 'Calle Sevilla'),
('12121212Z', 'RUBEN', 'PEREZ CAÑAS', 'Calle real'),
('12341223Z', 'JUAN CARLOS', 'DE BORBON Y BORBON', 'calle falsa'),
('12345234Z', 'MARIO', 'VARGAS LLOSA', 'calle diagonal'),
('12456465Z', 'SHARON', 'STONE', 'avenida grande'),
('13131313Z', 'MARIPAZ', 'CALDERON BENJUMEA', 'avenida mediana'),
('14141414Z', 'TAMARA', 'LUMBRERAS SANCHEZ', 'avenida pequeña'),
('15151515Z', 'PABLO', 'IGLESIAS RODRIGUEZ', 'rotonda redonada'),
('16161616Z', 'DANIEL', 'DIAZ ROMERO', 'calle 1234'),
('17171717Z', 'FRANCISCO', 'MARTIN ROMERO', 'pasaje verde'),
('18181818Z', 'IRENE', 'NIETO RUIZ', 'ruta 96');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentes`
--
ALTER TABLE `agentes`
  ADD PRIMARY KEY (`NifAgente`);

--
-- Indices de la tabla `conversacion`
--
ALTER TABLE `conversacion`
  ADD PRIMARY KEY (`IdConversacion`),
  ADD KEY `FK_usuario_2` (`NifUsuario`),
  ADD KEY `FK_AGENTE` (`NifAgente`);

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`IdIncidencia`),
  ADD KEY `FK_usuario_1` (`NifUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`NifUsuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conversacion`
--
ALTER TABLE `conversacion`
  ADD CONSTRAINT `FK_AGENTE` FOREIGN KEY (`NifAgente`) REFERENCES `agentes` (`NifAgente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIO2` FOREIGN KEY (`NifUsuario`) REFERENCES `usuarios` (`NifUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`NifUsuario`) REFERENCES `usuarios` (`NifUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
