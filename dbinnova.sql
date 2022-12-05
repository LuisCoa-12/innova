-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2022 a las 16:27:38
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbinnova`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `pendiente` int(1) NOT NULL,
  `tipo_equipo` varchar(50) NOT NULL,
  `marca_equipo` varchar(50) NOT NULL,
  `modelo_equipo` varchar(50) NOT NULL,
  `fech_fabricacion_equipo` int(4) DEFAULT NULL,
  `problema_equipo` varchar(1000) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_tipo_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `pendiente`, `tipo_equipo`, `marca_equipo`, `modelo_equipo`, `fech_fabricacion_equipo`, `problema_equipo`, `id_persona`, `id_tipo_servicio`) VALUES
(4, 0, 'Celular', 'Xiaomi', 'Mi Pad 5', 2022, 'La bateria no dura nada', 22, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `fech_compra` date NOT NULL,
  `total` double NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `fech_compra`, `total`, `id_persona`) VALUES
(1, '2022-12-05', 260, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_producto`
--

CREATE TABLE `compra_producto` (
  `id_detalle_compra` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id_cotizaciones` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `monto` double NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id_distrito` int(11) NOT NULL,
  `nombre_distrito` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id_distrito`, `nombre_distrito`) VALUES
(3, 'Alto Selva Alegre'),
(4, 'Arequipa'),
(5, 'Cayma'),
(6, 'Cerro Colorado'),
(7, 'Characato'),
(8, 'Chiguata'),
(9, 'Jacobo Hunter'),
(10, 'José Luis Bustamante y Rivero'),
(11, 'La Joya'),
(12, 'Mariano Melgar'),
(13, 'Miraflores'),
(14, 'Mollebaya'),
(15, 'Paucarpata'),
(16, 'Pocsi'),
(17, 'Polobaya'),
(18, 'Quequeña'),
(19, 'Sabandia'),
(20, 'Sachaca'),
(21, 'San Juan de Siguas'),
(22, 'San Juan de Tarucani'),
(23, 'Santa Isabel de Siguas'),
(24, 'Santa Rita de Siguas'),
(25, 'Socabaya'),
(26, 'Tiabaya'),
(27, 'Uchumayo'),
(28, 'Vitor'),
(29, 'Yanahuara'),
(30, 'Yarabamba'),
(31, 'Yura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombre_especialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombre_especialidad`) VALUES
(1, 'General'),
(2, 'Mantenimiento'),
(3, 'Reparacion de software'),
(4, 'Reemplazo de piezas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoja_servicio`
--

CREATE TABLE `hoja_servicio` (
  `id_hoja_servicio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion_hoja_servicio` varchar(500) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `id_cita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `tipo_horario` varchar(30) NOT NULL,
  `fecha_horario` date NOT NULL,
  `hora_horario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre_persona` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `dni` char(8) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `fech_nacimiento` date NOT NULL,
  `experiencia` longtext NOT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `id_horario` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `id_distrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_persona`, `apellidos`, `dni`, `telefono`, `direccion`, `correo`, `contrasena`, `imagen`, `fech_nacimiento`, `experiencia`, `id_especialidad`, `id_horario`, `id_rol`, `id_distrito`) VALUES
(1, 'Luis', 'Coa', '12345678', '987654321', 'direccion', 'coaapazaluisenrique@gmail.com', '123456', 'empty-photo.png', '2017-09-21', '', NULL, NULL, 1, 9),
(6, 'Juan', 'Pérez', '65847214', '456789123', 'Calle de VelÃ¡zquez, 80 Madrid', 'juan123@gmail.com', 'juan123', 'empty-photo.png', '2000-08-06', '', NULL, NULL, 3, 28),
(7, 'Martí­n Elí­as', 'de los Ríos', '67954498', '560717696', 'Calle 1234', 'martin.elias@gmail.com', 'martin123', 'empty-photo.png', '2002-07-30', '', NULL, NULL, 3, 19),
(11, 'Miguel', 'Guzman', '97474070', '324036256', 'Avenida ÃÂlvaro ObregÃÂ³n', 'miguel@gmail.com', '12331313', 'empty-photo.png', '2001-07-22', '', NULL, NULL, 3, 5),
(14, 'Ulises', 'Carbajo', '98765412', '123456987', 'Calle 123', 'ulises.guerra@gmail.com', 'asd', 'empty-photo.png', '2022-10-14', '', NULL, NULL, 3, 22),
(15, 'Eugenia', 'Gibert', '85974758', '458914319', 'Calle 456789', 'eugenia.gilbert@gmail.com', 'eu123', 'empty-photo.png', '1999-07-30', '', NULL, NULL, 3, 17),
(16, 'Flavia', 'Amoros', '41433681', '594632954', 'Calle 123', 'flavia@gmail.com', '12456', 'empty-photo.png', '2022-09-29', '', NULL, NULL, 3, 19),
(17, 'Ildefonso', 'Varela', '45623948', '12456321', 'Calle 123', 'idelfonso@gmail.com', '123', 'empty-photo.png', '2022-10-12', '', NULL, NULL, 3, 30),
(18, 'Pancho', 'Noguera', '45613948', '987654321', 'distrito 2', 'pancho.noguera@gmail.com', '123123', 'empty-photo.png', '2022-09-28', '', NULL, NULL, 3, 4),
(19, 'Lucila', 'Fernandez', '32657945', '154796328', 'Calle 456789', 'lucila@gmail.com', '44455', 'empty-photo.png', '2022-10-06', '', NULL, NULL, 3, 18),
(21, 'Eugenia', 'Verdejo', '79054720', '289221588', 'Calle 456789', 'eugenia.verdejo@gmail.com', '132165', 'empty-photo.png', '2003-12-27', '', NULL, NULL, 3, 6),
(22, 'Jacobo', 'Pujadas', '21398159', '469423263', 'Calle 123', 'jacobo@gmail.com', 'asd', 'empty-photo.png', '2022-10-05', '', NULL, NULL, 3, 8),
(23, 'Alex', 'Agullo', '71824593', '712238708', 'Calle 456789', 'alex.agullo@gmail.com', '1234', 'empty-photo.png', '2022-02-28', 'Reparacion de celulares por mas de 3 años', 1, NULL, 2, 3),
(24, 'Marisela', 'Quesada', '12873584', '12456321', 'Calle 456789', 'marisela.quesada@gmail.com', 'marisela1234556', 'usuario-2.jpg', '2001-12-10', '', NULL, NULL, 3, 9),
(25, 'Noe', 'Dueñas', '90261867', '688031899', 'Calle ejemplo N2', 'noe.duenas@gmail.com', 'noe123', 'usuario-2.jpg', '1993-08-25', 'Experto en mantenimiento de dispositivos moviles.\n3 aÃÂ±os de experiencia en el mercado', 2, NULL, 2, 20),
(30, 'Rosaura', 'DÃ­az Fernandez', '71834593', '987654321', 'Calle 456789', 'rosaura.diaz@gmail.com', '123456', 'imegn-usuario3.jpg', '2000-01-01', '', NULL, NULL, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `peso` double NOT NULL,
  `marca` varchar(25) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `precio` double NOT NULL,
  `fech_fabricacion` date NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `peso`, `marca`, `tipo`, `descripcion`, `precio`, `fech_fabricacion`, `imagen`) VALUES
(1, 'Cargador samsung 25W USB-C Super Fast Charger S10 S20 Note10', 160, 'Samsung', 'Cargador', 'Recargue rapidamente sus dispositivos moviles con el cargador de pared de carga rapida USB tipo C de 25W de Samsung. Este cargador de un solo puerto utiliza la tecnologiÂ­a Power Delivery (PD) para proporcionar la carga mas eficiente posible a su dispositivo conectado. Este cargador de pared Samsung proporciona hasta 25 W de potencia mediante tecnologiÂ­a PD.', 100, '2017-08-02', 'cargador-samsung-usb-c-super-fast-charger.jpg'),
(2, 'Soporte para cargar celular', 100, 'Generico', 'Soporte', 'Soporte para cargador de teléfono. base de carga sin daÃ±os. caja de almacenamiento de control remoto para dormitorio. cocina. baÃ±o. oficina y mÃ¡s.', 10, '2018-03-20', 'soporte-celular-generico.jpg'),
(3, 'Cargador Inalámbrico 10w Qi Carga Rápida', 59, 'GY-68', 'Cargador InalÃ¡mbrico', 'Moderno cargador fabricado en material de alta calidad. fuerte y duradero. Compatible con todos los modelos con tecnologí­a Qi. Cargador ultrafino. que puede guardar en su bolsillo. es muy cómodo de llevar. Coloque su teléfono directamente en la base para cargarlo. no se requiere ningún otro adaptador o cable. Identificación inteligente de la pérdida de conversión de energÃía. mejora la tasa de conversión de carga y. acelera la velocidad de carga. Cuenta con protección múltiple. para proporcionar protección contra sobrecarga de su teléfono móvil. protección contra sobrecalentamiento. protección contra cortocircuitos. protección de campo electromagnético. ', 35, '2020-02-27', 'cargador-inalambrico-qi-carga-rapida.jpg'),
(4, 'Cable para iPhone Lightning USB', 10, 'INSPIRA', 'Cable', 'Permite cargar y sincronizar correctamente tu iPhone/iPad, solo conecta este cable con tu iPhone/iPad en tu computador o cargador Apple y listo. Características: Cable USB de alta velocidad permite la carga de celular y transmisión de datos simultánea. T', 15, '2017-03-23', 'cable-iphone-lightning-usb.jpg'),
(5, 'XIAOMI REDMI 18W FAST CHARGE POWER BANK 20K -MAH BLACK', 400, 'Xiaomi', 'Accesorio para telefono', 'Puerto de entrada: Micro-USB/USB-C/ Puerto de Salida: 2X USB-A', 125.5, '2017-06-15', 'xiaomi-redmi-fast-charge-power-bank-mah-black.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id_repuesto` int(11) NOT NULL,
  `nombre_repuesto` varchar(50) NOT NULL,
  `tipo_repuesto` varchar(50) NOT NULL,
  `marca_repuesto` varchar(50) NOT NULL,
  `stock_repuesto` int(11) NOT NULL,
  `costo_repuesto` double NOT NULL,
  `imagen_repuesto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id_repuesto`, `nombre_repuesto`, `tipo_repuesto`, `marca_repuesto`, `stock_repuesto`, `costo_repuesto`, `imagen_repuesto`) VALUES
(1, 'Pantalla LCD Huawei Y5 2019', 'Pantalla LCD', 'Huawei Y5 2019', 100, 80, 'Pantalla LCD Huawei Y5 2019.jpg'),
(2, 'Pantalla LCD Motorola Moto C XT1750', 'Pantalla LCD', 'Motorola Moto C XT1750', 100, 65, 'Pantalla LCD Motorola Moto C XT1750.jpg'),
(3, 'Bandeja Sim Huawei P20 Pro', 'Bandeja SIM', 'Huawei P20 Pro', 100, 15, 'Bandeja Sim Huawei P20 Pro.png'),
(4, 'Bandeja Sim Samsung J5 Pro', 'Bandeja SIM', 'Samsung J5 Pro', 150, 15, 'Bandeja Sim Samsung J5 Pro.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'encargado'),
(2, 'tecnico'),
(3, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `fecha_servicio` date NOT NULL,
  `hora_servicio` time NOT NULL,
  `descripcion_servicio` varchar(500) NOT NULL,
  `pago_servicio` double NOT NULL,
  `id_hoja_servicio` int(11) NOT NULL,
  `id_tipo_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `nombre_tipo_servicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`id_tipo_servicio`, `nombre_tipo_servicio`) VALUES
(1, 'Diagnostico general'),
(2, 'Mantenimiento preventivo'),
(3, 'Cambio de pantalla'),
(4, 'Cambio de bateria'),
(5, 'Reparacion del software'),
(6, 'Reparacion de problemas de conectividad'),
(7, 'Reparacion de celular mojado'),
(8, 'Reemplazo de botones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `id_visita` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_visita` time NOT NULL,
  `costo_visita` double NOT NULL,
  `id_cita` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`id_visita`, `fecha`, `hora_visita`, `costo_visita`, `id_cita`, `id_tecnico`) VALUES
(8, '2022-12-05', '10:31:00', 10, 4, 23);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_persona` (`id_persona`) USING BTREE,
  ADD KEY `id_tipo_servicio` (`id_tipo_servicio`) USING BTREE;

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_persona_compra` (`id_persona`);

--
-- Indices de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `fk_cprod_producto` (`id_producto`),
  ADD KEY `fk_cprod_compra` (`id_compra`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id_cotizaciones`),
  ADD KEY `fk_perso` (`id_persona`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_distrito`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `hoja_servicio`
--
ALTER TABLE `hoja_servicio`
  ADD PRIMARY KEY (`id_hoja_servicio`),
  ADD KEY `fk_cita` (`id_cita`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`) USING BTREE,
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `fk_especialidad` (`id_especialidad`),
  ADD KEY `fk_horario` (`id_horario`),
  ADD KEY `fk_rol` (`id_rol`),
  ADD KEY `fk_distrito` (`id_distrito`),
  ADD KEY `dni` (`dni`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id_repuesto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_hoja_servici` (`id_hoja_servicio`),
  ADD KEY `fk_tipo_servicio` (`id_tipo_servicio`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`id_visita`),
  ADD KEY `id_cita` (`id_cita`) USING BTREE,
  ADD KEY `id_tecnico` (`id_tecnico`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id_cotizaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id_distrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `hoja_servicio`
--
ALTER TABLE `hoja_servicio`
  MODIFY `id_hoja_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_persona_compra` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD CONSTRAINT `fk_cprod_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cprod_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `fk_perso` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `hoja_servicio`
--
ALTER TABLE `hoja_servicio`
  ADD CONSTRAINT `fk_cita` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_distrito` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`),
  ADD CONSTRAINT `fk_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  ADD CONSTRAINT `fk_horario` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id_horario`),
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_hoja_servici` FOREIGN KEY (`id_hoja_servicio`) REFERENCES `hoja_servicio` (`id_hoja_servicio`),
  ADD CONSTRAINT `fk_tipo_servicio` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
