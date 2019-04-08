-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2019 a las 16:07:22
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ntc-proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_carreras`
--

CREATE TABLE `tbl_carreras` (
  `codigo_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_carreras`
--

INSERT INTO `tbl_carreras` (`codigo_carrera`, `nombre_carrera`) VALUES
(1, 'Ingenieria en Sistemas'),
(2, 'Ingenieria Eléctrica Industrial'),
(3, 'Licenciatura en Pedagogía'),
(4, 'Licenciatura en Psicología'),
(5, 'Ingeniería Civil'),
(6, 'Ingeniería Mecánica Industrial'),
(7, 'Ingeniería Industrial'),
(8, 'Ingeniería Agronómica'),
(9, 'Ingeniería Forestal'),
(10, 'Ingeniería en Ciencias Acuicolas y Recursos Marinos Costeros'),
(11, 'Licenciatura en Derecho'),
(12, 'Licenciatura en Periodismo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_carreras_x_tbl_clases`
--

CREATE TABLE `tbl_carreras_x_tbl_clases` (
  `codigo_carrera` int(11) NOT NULL,
  `codigo_clase` int(11) NOT NULL,
  `codigo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clases`
--

CREATE TABLE `tbl_clases` (
  `codigo_clase` int(11) NOT NULL,
  `nombre_clase` varchar(100) NOT NULL,
  `codigo_abreviatura` varchar(45) NOT NULL,
  `unidades_valorativas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clases_x_tbl_clase_requisitos`
--

CREATE TABLE `tbl_clases_x_tbl_clase_requisitos` (
  `codigo_clase` int(11) NOT NULL,
  `codigo_requisito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clase_requisitos`
--

CREATE TABLE `tbl_clase_requisitos` (
  `codigo_requisito` int(11) NOT NULL,
  `nombre_clase_requisito` varchar(100) NOT NULL,
  `codigo_abreviatura` varchar(45) NOT NULL,
  `unidades_valorativas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_creditos`
--

CREATE TABLE `tbl_creditos` (
  `codigo_credito` int(11) NOT NULL,
  `nombre_tarjeta` varchar(45) NOT NULL,
  `numero_tarjeta` varchar(100) NOT NULL,
  `vencimiento` varchar(45) NOT NULL,
  `codigo_seguridad` varchar(10) NOT NULL,
  `codigo_plan` int(11) NOT NULL,
  `tipo_pago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `codigo_departamento` int(11) NOT NULL,
  `Nombre_departamento` varchar(100) NOT NULL,
  `codigo_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`codigo_departamento`, `Nombre_departamento`, `codigo_clase`) VALUES
(1, 'Antropología', 0),
(2, 'Arqueastronomía y Astronomía', 0),
(3, 'Arte', 0),
(4, 'Astronomía y Astrofísica', 0),
(5, 'Biología', 0),
(6, 'Ciencia y Tecnologías de la Información', 0),
(7, 'Ciencias Fisiologicas', 0),
(8, 'Ciencias políticas y derechos humanos', 0),
(9, 'Cultura Física y Deportes', 0),
(10, 'Filosofía', 0),
(11, 'Física', 0),
(12, 'Historia', 0),
(13, 'Lenguas extranjeras', 0),
(14, 'Letras', 0),
(15, 'Matemáticas', 0),
(16, 'Ingeniería en Sistemas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dificultades`
--

CREATE TABLE `tbl_dificultades` (
  `codigo_dificultad` int(11) NOT NULL,
  `nombre_dificultad` varchar(45) NOT NULL,
  `codigo_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_dificultades`
--

INSERT INTO `tbl_dificultades` (`codigo_dificultad`, `nombre_dificultad`, `codigo_clase`) VALUES
(1, 'Alto (Dificil)', 0),
(2, 'Medio', 0),
(3, 'Bajo (Fácil)', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facebook`
--

CREATE TABLE `tbl_facebook` (
  `codigo_facebook` int(11) NOT NULL,
  `url_facebook` varchar(100) DEFAULT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_linkedin`
--

CREATE TABLE `tbl_linkedin` (
  `codigo_linkedin` int(11) NOT NULL,
  `url_linkedin` varchar(100) DEFAULT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mensajes`
--

CREATE TABLE `tbl_mensajes` (
  `codigo_mensaje` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_mensajes`
--

INSERT INTO `tbl_mensajes` (`codigo_mensaje`, `titulo`, `descripcion`, `codigo_usuario`) VALUES
(1, 'ME ENCANTA NTC', 'Al fin algo que necesitaba para guiarme en la carrera de mis estudios. wow maravilloso, amo NTC por lo que hace. lo recomiendo.', 2),
(2, 'ES INCREIBLE COMO HICIERON ESTA APLICACION', 'Como presidente de la republica de Honduras estoy orgulloso de saber que hay jovenes talentosos y Felicito a este grupo que se ha encargado de hacer esta aplicacion para los estudiantes de las Universidades, yo les digo que todo se puede cuando se quiere. en Honduras tenemos talento. ', 3),
(3, 'Una Excelente ayuda en cuestion de tiempo!!.', 'Muy útil para seguir correctamente el plan de estudios... lograrás terminar tu carrera en el menor tiempo posible!!!.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_paises`
--

CREATE TABLE `tbl_paises` (
  `codigo_pais` int(11) NOT NULL,
  `nombre_pais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_paises`
--

INSERT INTO `tbl_paises` (`codigo_pais`, `nombre_pais`) VALUES
(1, 'Honduras'),
(2, 'Guatemala'),
(3, 'El Salvador'),
(4, 'Nicaragua'),
(5, 'Costa Rica'),
(6, 'Panamá'),
(7, 'Mexico'),
(8, 'Estados Unidos'),
(9, 'Colombia'),
(10, 'Venezuela'),
(11, 'Peru'),
(12, 'Ecuador'),
(13, 'Brasil'),
(14, 'Argentina'),
(15, 'Uruguay'),
(16, 'Paraguay'),
(17, 'Bolivia'),
(18, 'Chile'),
(19, 'Puerto Rico'),
(20, 'Republica Dominicana'),
(21, 'España'),
(22, 'Canadá'),
(23, 'Jamaica'),
(24, 'Haití');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_planes`
--

CREATE TABLE `tbl_planes` (
  `codigo_plan` int(11) NOT NULL,
  `nombre_plan` varchar(45) NOT NULL,
  `precio_plan` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_planes`
--

INSERT INTO `tbl_planes` (`codigo_plan`, `nombre_plan`, `precio_plan`) VALUES
(1, 'Gratuito', '0'),
(2, 'Suscripción', '120');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_usuario`
--

CREATE TABLE `tbl_tipo_usuario` (
  `codigo_tipo_usuario` int(11) NOT NULL,
  `nombre_tipo_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_tipo_usuario`
--

INSERT INTO `tbl_tipo_usuario` (`codigo_tipo_usuario`, `nombre_tipo_usuario`) VALUES
(1, 'Administrador'),
(2, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_twitter`
--

CREATE TABLE `tbl_twitter` (
  `codigo_twitter` int(11) NOT NULL,
  `url_twitter` varchar(100) DEFAULT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_universidades`
--

CREATE TABLE `tbl_universidades` (
  `codigo_universidad` int(11) NOT NULL,
  `nombre_universidad` varchar(100) NOT NULL,
  `logo_universidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_universidades`
--

INSERT INTO `tbl_universidades` (`codigo_universidad`, `nombre_universidad`, `logo_universidad`) VALUES
(1, 'UNAH', 'img/usuarios/UNAH.png'),
(2, 'METROPOLITANA', 'img/usuarios/METROPOLITANA.png'),
(3, 'UNITEC', 'img/usuarios/UNITEC.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_universidades_x_tbl_carreras`
--

CREATE TABLE `tbl_universidades_x_tbl_carreras` (
  `codigo_universidad` int(11) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  `codigo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_universidades_x_tbl_carreras`
--

INSERT INTO `tbl_universidades_x_tbl_carreras` (`codigo_universidad`, `codigo_carrera`, `codigo_usuario`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(1, 8, NULL),
(1, 9, NULL),
(1, 10, NULL),
(1, 11, NULL),
(1, 12, NULL),
(2, 1, NULL),
(2, 3, NULL),
(2, 4, NULL),
(2, 5, NULL),
(3, 1, NULL),
(3, 5, NULL),
(3, 10, NULL),
(3, 11, NULL),
(1, 4, 2),
(1, 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `codigo_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `contrasenia` varchar(200) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `foto` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_plan` int(11) NOT NULL,
  `codigo_pais` int(11) NOT NULL,
  `codigo_tipo_usuario` int(11) NOT NULL,
  `codigo_universidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`codigo_usuario`, `nombre_completo`, `correo`, `username`, `contrasenia`, `genero`, `telefono`, `descripcion`, `direccion`, `foto`, `fecha_nacimiento`, `codigo_plan`, `codigo_pais`, `codigo_tipo_usuario`, `codigo_universidad`) VALUES
(1, 'Leo Misael Chacon Canales', 'misaelchacon17@yahoo.es', 'misaelchacon', '0801198109176', 'Masculino', '99062425', 'SOY INGENIERO EN SISTEMAS', 'COLONIA: VILLANUEVA SECTOR 7A', 'img/usuarios/Leo.jpg', '1981-12-17', 1, 1, 1, 1),
(2, 'Loida Rebeca Estrada Aguirre', 'loidarebeca17@yahoo.com', 'loidaestrada', 'loidaestrada', 'Femenino', NULL, NULL, NULL, 'img/usuarios/loida.jpeg', NULL, 1, 1, 2, 1),
(3, 'Juan Orlando Hernandez', 'juanhernandez@gmail.com', 'juanfogon', 'juanhernandez', 'Masculino', NULL, NULL, NULL, 'img/usuarios/juanorlando.jpg', NULL, 1, 1, 2, 1),
(4, 'Moises Nuñez ', 'moyonuez1@gmail.com', 'Moyo_nuez', '20131006363', 'Masculino', NULL, NULL, NULL, 'img/usuarios/moyo.jpg\r\n', NULL, 1, 1, 2, 1),
(5, 'Manuel Zelaya', 'melito@gmail.com', 'Mel ', 'melzelaya', 'Masculino', NULL, NULL, NULL, 'img/usuarios/mel.png\r\n', NULL, 1, 1, 2, 1),
(6, 'Josias Miasel Chacon Estrada', 'josiasmisaelchacon@gmail.com', 'JosiasChacon', 'josiaschacon', 'Masculino', NULL, NULL, NULL, 'img/usuarios/avatar.jpg', NULL, 1, 8, 2, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_carreras`
--
ALTER TABLE `tbl_carreras`
  ADD PRIMARY KEY (`codigo_carrera`);

--
-- Indices de la tabla `tbl_carreras_x_tbl_clases`
--
ALTER TABLE `tbl_carreras_x_tbl_clases`
  ADD KEY `fk_tbl_carreras_has_tbl_clases_tbl_clases1_idx` (`codigo_clase`),
  ADD KEY `fk_tbl_carreras_has_tbl_clases_tbl_carreras1_idx` (`codigo_carrera`),
  ADD KEY `fk_tbl_carreras_x_tbl_clases_tbl_usuarios1_idx` (`codigo_usuario`);

--
-- Indices de la tabla `tbl_clases`
--
ALTER TABLE `tbl_clases`
  ADD PRIMARY KEY (`codigo_clase`);

--
-- Indices de la tabla `tbl_clases_x_tbl_clase_requisitos`
--
ALTER TABLE `tbl_clases_x_tbl_clase_requisitos`
  ADD PRIMARY KEY (`codigo_clase`,`codigo_requisito`),
  ADD KEY `fk_tbl_clases_has_tbl_requisitos_tbl_requisitos1_idx` (`codigo_requisito`),
  ADD KEY `fk_tbl_clases_has_tbl_requisitos_tbl_clases1_idx` (`codigo_clase`);

--
-- Indices de la tabla `tbl_clase_requisitos`
--
ALTER TABLE `tbl_clase_requisitos`
  ADD PRIMARY KEY (`codigo_requisito`);

--
-- Indices de la tabla `tbl_creditos`
--
ALTER TABLE `tbl_creditos`
  ADD PRIMARY KEY (`codigo_credito`),
  ADD KEY `fk_tbl_credito_tbl_plan1_idx` (`codigo_plan`);

--
-- Indices de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`codigo_departamento`),
  ADD KEY `fk_tbl_departamentos_tbl_clases1_idx` (`codigo_clase`);

--
-- Indices de la tabla `tbl_dificultades`
--
ALTER TABLE `tbl_dificultades`
  ADD PRIMARY KEY (`codigo_dificultad`),
  ADD KEY `fk_tbl_dificultades_tbl_clases1_idx` (`codigo_clase`);

--
-- Indices de la tabla `tbl_facebook`
--
ALTER TABLE `tbl_facebook`
  ADD PRIMARY KEY (`codigo_facebook`),
  ADD KEY `fk_tbl_facebook_tbl_usuarios1_idx` (`codigo_usuario`);

--
-- Indices de la tabla `tbl_linkedin`
--
ALTER TABLE `tbl_linkedin`
  ADD PRIMARY KEY (`codigo_linkedin`),
  ADD KEY `fk_tbl_linkedin_tbl_usuarios1_idx` (`codigo_usuario`);

--
-- Indices de la tabla `tbl_mensajes`
--
ALTER TABLE `tbl_mensajes`
  ADD PRIMARY KEY (`codigo_mensaje`),
  ADD KEY `fk_tbl_mensajes_tbl_usuarios1_idx` (`codigo_usuario`);

--
-- Indices de la tabla `tbl_paises`
--
ALTER TABLE `tbl_paises`
  ADD PRIMARY KEY (`codigo_pais`);

--
-- Indices de la tabla `tbl_planes`
--
ALTER TABLE `tbl_planes`
  ADD PRIMARY KEY (`codigo_plan`);

--
-- Indices de la tabla `tbl_tipo_usuario`
--
ALTER TABLE `tbl_tipo_usuario`
  ADD PRIMARY KEY (`codigo_tipo_usuario`);

--
-- Indices de la tabla `tbl_twitter`
--
ALTER TABLE `tbl_twitter`
  ADD PRIMARY KEY (`codigo_twitter`),
  ADD KEY `fk_tbl_twitter_tbl_usuarios1_idx` (`codigo_usuario`);

--
-- Indices de la tabla `tbl_universidades`
--
ALTER TABLE `tbl_universidades`
  ADD PRIMARY KEY (`codigo_universidad`);

--
-- Indices de la tabla `tbl_universidades_x_tbl_carreras`
--
ALTER TABLE `tbl_universidades_x_tbl_carreras`
  ADD KEY `fk_tbl_universidades_has_tbl_carreras_tbl_carreras1_idx` (`codigo_carrera`),
  ADD KEY `fk_tbl_universidades_has_tbl_carreras_tbl_universidades1_idx` (`codigo_universidad`),
  ADD KEY `fk_tbl_universidades_x_tbl_carreras_tbl_usuarios1_idx` (`codigo_usuario`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`codigo_usuario`),
  ADD KEY `fk_tbl_usuario_tbl_plan1_idx` (`codigo_plan`),
  ADD KEY `fk_tbl_usuarios_tbl_paises1_idx` (`codigo_pais`),
  ADD KEY `fk_tbl_usuarios_tbl_tipo_usuario1_idx` (`codigo_tipo_usuario`),
  ADD KEY `fk_tbl_usuarios_tbl_universidad1_idx` (`codigo_universidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_carreras`
--
ALTER TABLE `tbl_carreras`
  MODIFY `codigo_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tbl_clases`
--
ALTER TABLE `tbl_clases`
  MODIFY `codigo_clase` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_clase_requisitos`
--
ALTER TABLE `tbl_clase_requisitos`
  MODIFY `codigo_requisito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_creditos`
--
ALTER TABLE `tbl_creditos`
  MODIFY `codigo_credito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `codigo_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `tbl_dificultades`
--
ALTER TABLE `tbl_dificultades`
  MODIFY `codigo_dificultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_facebook`
--
ALTER TABLE `tbl_facebook`
  MODIFY `codigo_facebook` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_linkedin`
--
ALTER TABLE `tbl_linkedin`
  MODIFY `codigo_linkedin` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_mensajes`
--
ALTER TABLE `tbl_mensajes`
  MODIFY `codigo_mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_paises`
--
ALTER TABLE `tbl_paises`
  MODIFY `codigo_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `tbl_planes`
--
ALTER TABLE `tbl_planes`
  MODIFY `codigo_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_usuario`
--
ALTER TABLE `tbl_tipo_usuario`
  MODIFY `codigo_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_twitter`
--
ALTER TABLE `tbl_twitter`
  MODIFY `codigo_twitter` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_universidades`
--
ALTER TABLE `tbl_universidades`
  MODIFY `codigo_universidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_carreras_x_tbl_clases`
--
ALTER TABLE `tbl_carreras_x_tbl_clases`
  ADD CONSTRAINT `fk_tbl_carreras_has_tbl_clases_tbl_carreras1` FOREIGN KEY (`codigo_carrera`) REFERENCES `tbl_carreras` (`codigo_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carreras_has_tbl_clases_tbl_clases1` FOREIGN KEY (`codigo_clase`) REFERENCES `tbl_clases` (`codigo_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carreras_x_tbl_clases_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_clases_x_tbl_clase_requisitos`
--
ALTER TABLE `tbl_clases_x_tbl_clase_requisitos`
  ADD CONSTRAINT `fk_tbl_clases_has_tbl_requisitos_tbl_clases1` FOREIGN KEY (`codigo_clase`) REFERENCES `tbl_clases` (`codigo_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_clases_has_tbl_requisitos_tbl_requisitos1` FOREIGN KEY (`codigo_requisito`) REFERENCES `tbl_clase_requisitos` (`codigo_requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_creditos`
--
ALTER TABLE `tbl_creditos`
  ADD CONSTRAINT `fk_tbl_credito_tbl_plan1` FOREIGN KEY (`codigo_plan`) REFERENCES `tbl_planes` (`codigo_plan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD CONSTRAINT `fk_tbl_departamentos_tbl_clases1` FOREIGN KEY (`codigo_clase`) REFERENCES `tbl_clases` (`codigo_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_dificultades`
--
ALTER TABLE `tbl_dificultades`
  ADD CONSTRAINT `fk_tbl_dificultades_tbl_clases1` FOREIGN KEY (`codigo_clase`) REFERENCES `tbl_clases` (`codigo_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_facebook`
--
ALTER TABLE `tbl_facebook`
  ADD CONSTRAINT `fk_tbl_facebook_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_linkedin`
--
ALTER TABLE `tbl_linkedin`
  ADD CONSTRAINT `fk_tbl_linkedin_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_mensajes`
--
ALTER TABLE `tbl_mensajes`
  ADD CONSTRAINT `fk_tbl_mensajes_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_twitter`
--
ALTER TABLE `tbl_twitter`
  ADD CONSTRAINT `fk_tbl_twitter_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_universidades_x_tbl_carreras`
--
ALTER TABLE `tbl_universidades_x_tbl_carreras`
  ADD CONSTRAINT `fk_tbl_universidades_has_tbl_carreras_tbl_carreras1` FOREIGN KEY (`codigo_carrera`) REFERENCES `tbl_carreras` (`codigo_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_universidades_has_tbl_carreras_tbl_universidades1` FOREIGN KEY (`codigo_universidad`) REFERENCES `tbl_universidades` (`codigo_universidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_universidades_x_tbl_carreras_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `fk_tbl_usuario_tbl_plan1` FOREIGN KEY (`codigo_plan`) REFERENCES `tbl_planes` (`codigo_plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuarios_tbl_paises1` FOREIGN KEY (`codigo_pais`) REFERENCES `tbl_paises` (`codigo_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuarios_tbl_tipo_usuario1` FOREIGN KEY (`codigo_tipo_usuario`) REFERENCES `tbl_tipo_usuario` (`codigo_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuarios_tbl_universidad1` FOREIGN KEY (`codigo_universidad`) REFERENCES `tbl_universidades` (`codigo_universidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
