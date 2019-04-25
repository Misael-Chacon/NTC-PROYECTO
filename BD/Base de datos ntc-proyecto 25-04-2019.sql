-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2019 a las 19:55:00
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
-- Estructura de tabla para la tabla `tbl_clases`
--

CREATE TABLE `tbl_clases` (
  `codigo_clase` int(11) NOT NULL,
  `nombre_clase` varchar(100) NOT NULL,
  `codigo_abreviatura` varchar(45) NOT NULL,
  `unidades_valorativas` int(11) NOT NULL,
  `codigo_departamento` int(11) NOT NULL,
  `codigo_dificultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_clases`
--

INSERT INTO `tbl_clases` (`codigo_clase`, `nombre_clase`, `codigo_abreviatura`, `unidades_valorativas`, `codigo_departamento`, `codigo_dificultad`) VALUES
(1, 'Introducción a la Ingeniería en Sistemas', 'IS-110', 3, 16, 2),
(2, 'Matemática I', 'MM-110', 5, 15, 1),
(3, 'Geometría y Trigonometría', 'MM-111', 5, 15, 1),
(4, 'Sociología', 'SC-101', 4, 7, 3),
(5, 'Vectores y Matrices', 'MM-211', 3, 15, 1),
(6, 'Ingles I', 'IN-101', 4, 13, 3),
(7, 'Cálculo I', 'MM-201', 5, 15, 1),
(8, 'Cálculo II', 'MM-202', 5, 15, 1),
(9, 'Inglés II', 'IN-102', 4, 13, 2),
(10, 'Programación I', 'MM-314', 3, 16, 1),
(11, 'Español General I', 'EG-011', 4, 14, 3),
(12, 'Física I', 'FS-100', 5, 11, 1),
(13, 'Ecuaciones Diferenciales', 'MM-411', 3, 15, 1),
(14, 'Programación II', 'IS-210', 4, 16, 2),
(15, 'Filosofía', 'FF-101', 4, 10, 3),
(16, 'Inglés III', 'IN-103', 4, 13, 2),
(17, 'Dibujo I', 'DQ-101', 2, 16, 3),
(18, 'Física II', 'FS-200', 5, 11, 1),
(19, 'Circuitos Electricos para Ingeniería en Sistemas', 'IS-311', 3, 16, 1),
(20, 'Matemática Discreta', 'MM-420', 4, 15, 1),
(21, 'Dibujo II', 'DQ-102', 2, 17, 3),
(22, 'Estadística', 'MM-401', 3, 15, 2),
(23, 'Algoritmos y Estructuras de Datos', 'IS-310', 4, 16, 2),
(24, 'Programación Orientada a Objetos', 'IS-410', 5, 16, 2),
(25, 'Electrónica para Ingeniería en Sistemas', 'IS-411', 3, 16, 1),
(26, 'Sistemas Operativos I', 'IS-412', 5, 16, 2),
(27, 'Base de Datos I', 'IS-501', 5, 16, 2),
(28, 'Historia de Honduras', 'HH-101', 4, 7, 3),
(29, 'Instalaciones Electricas', 'IS-510', 3, 16, 3),
(30, 'Redes de Datos I', 'IS-511', 4, 16, 2),
(31, 'Sistemas Operativos II', 'IS-512', 5, 16, 3),
(32, 'Base de Datos II', 'IS-611', 4, 16, 2),
(33, 'Arquitectura de Computadoras', 'IS-603', 4, 16, 2),
(34, 'Lenguajes de Programación', 'IS-513', 5, 16, 3),
(35, 'Redes de Datos II', 'IS-611', 4, 16, 3),
(36, 'Diseño Digital', 'IS-711', 4, 16, 2),
(37, 'Sistemas de Información', 'IS-602', 4, 16, 3),
(38, 'Seguridad Informática', 'IS-811', 4, 16, 3),
(39, 'Administración I', 'IS-720', 4, 16, 3),
(40, 'Análisis y Diseño de Sistemas', 'IS-702', 4, 16, 3),
(41, 'Contabilidad I', 'IS-721', 4, 16, 3),
(42, 'Auditoría Informática', 'IS-903', 3, 16, 2),
(43, 'Inteligencia Artificial', 'IS-701', 4, 16, 2),
(44, 'Ingeniería del Software', 'IS-802', 4, 16, 2),
(45, 'Finanzas Administrativas', 'IS-820', 4, 16, 3),
(46, 'Industria del Software', 'IS-902', 4, 16, 3),
(47, 'Gerencia Informática', 'IS-904', 4, 16, 3),
(48, 'Tópicos Especiales y Avanzados', 'IS-906', 5, 16, 3),
(49, 'Economía Digital', 'IS-905', 5, 16, 3),
(50, 'Seminario de Investigación', 'IS-115', 4, 16, 3),
(51, 'Teoria de la Simulación', 'IS-910', 3, 16, 2),
(52, 'Microprocesadores', 'IS-911', 3, 16, 1),
(53, 'Liderazgo para el Cambio Informático', 'IS-914', 3, 16, 3),
(54, 'Sistemas Expertos', 'IS-912', 3, 16, 1),
(55, 'Diseño de Compiladores', 'IS-913', 3, 16, 1),
(56, 'Campo de Artes Fisica o Deportes', 'Electiva I', 3, 18, 3),
(57, 'Campo de las Ciencias Naturales', 'Electiva II', 3, 19, 3),
(58, 'Campo de Humanidades', 'Electiva III', 3, 20, 3),
(59, 'Psicologia General', 'PS-101', 4, 22, 3),
(60, 'Teoria General del Estado', 'TD-100', 4, 21, 3),
(61, 'Introduccion a la Estadistica (Orientada a Periodismo) ', 'MMP-100', 4, 21, 3),
(62, 'Psicologia de la comunicacion', 'PS-201', 4, 21, 3),
(63, 'Introduccion al estudio de Derecho', 'ID-102', 4, 21, 3),
(64, 'Ciencias Politicas', 'CP-101', 4, 21, 3),
(65, 'Historia de las ideas Politicas', 'AD-301', 5, 21, 3),
(66, 'Sociologia de la Comunicacion', 'SC-213', 3, 21, 2),
(67, 'Tecnicas de la Investigacion de la Comnicacion Social', 'TI-101', 4, 21, 2),
(68, 'Derecho Constitucional', 'TD-103', 4, 21, 1),
(69, 'Etica y Legislacion de la Prensa', 'EP-312', 3, 21, 2),
(70, 'Introduccion al Periodismo', 'IP-101', 5, 21, 3),
(71, 'Español III', 'EE-103', 4, 21, 2),
(72, 'Español II', 'EE-102', 4, 21, 3),
(73, 'Hitoria del Pensamiento Economico', 'HE-201', 4, 21, 1),
(74, 'Derecho Agrario', 'DA-100', 3, 21, 1),
(75, 'Periodismo Informativo', 'PV-211', 5, 21, 2),
(76, 'Español IV', 'EE-104', 4, 21, 2),
(77, 'Teoria Economica', 'EC-101', 4, 21, 2),
(78, 'Derecho Laboral', 'DL-100', 4, 21, 2),
(79, 'Periodismo de TV I', 'TV-101', 5, 21, 2),
(80, 'Periodismo Interpretativo', 'PN-212', 5, 21, 1),
(81, 'Radio Periodismo I', 'PR-211', 5, 21, 1),
(82, 'Periodismo Grafico', 'PL-221', 4, 21, 1),
(83, 'Derecho de Integracion', 'IE-100', 5, 21, 2),
(84, 'Periodismo en TV II', 'TV-201', 3, 21, 1),
(85, 'Periodismo de Opinion', 'PO-311', 4, 21, 2),
(86, 'Radio Periodismo II', 'PR-312', 3, 21, 1),
(87, 'Titulacion y Formato', 'TF-211', 5, 21, 1),
(88, 'Periodismo Cinematografico', 'TV-313', 3, 21, 1),
(89, 'Organizacion de medios', 'DA-312', 3, 21, 1),
(90, 'Relaciones Publicas', 'RP-312', 5, 21, 1),
(91, 'Publicidad y Propaganda', 'RP-313', 4, 21, 1),
(92, 'Problemas de la Comunicacion Moderna', 'AN-313', 2, 21, 1),
(93, 'Taller de Investigacion', 'AN-414', 4, 21, 1),
(94, 'Teoria de la Personalidad I', 'PS-642', 3, 22, 2),
(95, 'Metodos de Investigacion I', 'PS-638', 4, 22, 2),
(96, 'Teoria de la Personalidad II', 'PS-643', 3, 22, 2),
(97, 'Psicologia Evolutiva I', 'PS-647', 4, 22, 1),
(98, 'Metodos de Investigacion II', 'PS-639', 4, 22, 3),
(99, 'Psicologia Social', 'PS-650', 4, 22, 1),
(100, 'Psicofisiologia I', 'PS-644', 4, 22, 2),
(101, 'Metodos de Investigacion III', 'PS-640', 4, 22, 2),
(102, 'Psicofisiologia II', 'PS-645', 4, 22, 2),
(103, 'Psicologia Evolutiva II', 'PS-648', 4, 22, 2),
(104, 'PS de los procesos sociales', 'PS-651', 4, 22, 2),
(105, 'Medicion Psicologica I', 'PS-654', 4, 22, 2),
(106, 'PS Evolutiva III', 'PS-649', 4, 22, 2),
(107, 'Etica', 'PS-653', 2, 22, 2),
(108, 'Metodos de Investigacion IV', 'PS-641', 4, 22, 2),
(109, 'Psicofisiologia III', 'PS-646', 4, 22, 2),
(110, 'Medicion Psicologica II', 'PS-655', 4, 22, 2),
(111, 'Conducta Anormal', 'PS-658', 4, 22, 2),
(112, 'Medicion Psicologica III', 'PS-656', 4, 22, 2),
(113, 'Conducta Anormal II', 'PS-659', 4, 22, 2),
(114, 'Psicodiagnostico I', 'PS-660', 4, 22, 2),
(115, 'PS del Trabajo I', 'PS-662', 4, 22, 2),
(116, 'PS de los Grupos', 'PS-652', 4, 22, 1),
(117, 'Medicion Psicologica IV', 'PS-657', 4, 22, 1),
(118, 'Psicodiagnostico II', 'PS-661', 4, 22, 1),
(119, 'PS PReventiva', 'PS-665', 4, 22, 1),
(120, 'PS Educativa I', 'PS-670', 4, 22, 1),
(121, 'Ps Comunitaria', 'PS-621', 4, 22, 1),
(122, 'Comp. Organizacional', 'PS-664', 4, 22, 1),
(123, 'Tec. Terapeiticas II', 'PS-668', 4, 22, 1),
(124, 'Orientacion', 'PS-672', 4, 22, 1),
(125, 'Elaboracion Y Ejecucion de Proyectos', 'PS-673', 10, 22, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clases_x_tbl_clase_requisitos`
--

CREATE TABLE `tbl_clases_x_tbl_clase_requisitos` (
  `codigo_clase` int(11) NOT NULL,
  `codigo_requisito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_clases_x_tbl_clase_requisitos`
--

INSERT INTO `tbl_clases_x_tbl_clase_requisitos` (`codigo_clase`, `codigo_requisito`) VALUES
(10, 1),
(5, 2),
(7, 2),
(10, 2),
(7, 3),
(12, 4),
(17, 4),
(9, 5),
(8, 6),
(12, 6),
(13, 7),
(22, 7),
(16, 8),
(14, 9),
(20, 9),
(18, 10),
(19, 10),
(19, 11),
(23, 12),
(21, 13),
(25, 14),
(29, 14),
(26, 15),
(39, 15),
(27, 16),
(24, 17),
(26, 17),
(27, 18),
(34, 18),
(30, 19),
(31, 20),
(32, 21),
(33, 22),
(35, 22),
(38, 23),
(43, 24),
(36, 25),
(52, 25),
(55, 25),
(37, 26),
(38, 27),
(40, 28),
(43, 28),
(42, 29),
(47, 29),
(41, 30),
(44, 31),
(45, 32),
(54, 33),
(46, 34),
(49, 35),
(53, 35),
(48, 36),
(51, 36),
(20, 37),
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(6, NULL),
(11, NULL),
(15, NULL),
(28, NULL),
(56, NULL),
(57, NULL),
(58, NULL),
(50, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clase_requisitos`
--

CREATE TABLE `tbl_clase_requisitos` (
  `codigo_requisito` int(11) NOT NULL,
  `nombre_clase_requisito` varchar(100) NOT NULL,
  `codigo_abreviatura` varchar(45) NOT NULL,
  `unidades_valorativas` int(11) NOT NULL,
  `codigo_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_clase_requisitos`
--

INSERT INTO `tbl_clase_requisitos` (`codigo_requisito`, `nombre_clase_requisito`, `codigo_abreviatura`, `unidades_valorativas`, `codigo_departamento`) VALUES
(1, 'Introducción a la Ingeniería en Sistemas ', 'IS-110', 3, 16),
(2, 'Matemática I', 'MM-110', 5, 15),
(3, 'Geometría y Trigonometría', 'MM-111', 5, 15),
(4, 'Vectores y Matrices', 'MM-211', 3, 15),
(5, 'Inglés I', 'IN-101', 4, 13),
(6, 'Cálculo I', 'MM-201', 5, 15),
(7, 'Cálculo II', 'MM-202', 5, 15),
(8, 'Inglés II', 'IN-102', 4, 13),
(9, 'Programación I', 'MM-314', 3, 16),
(10, 'Física I', 'FS-100', 5, 11),
(11, 'Ecuaciones Diferenciales', 'MM-411', 3, 16),
(12, 'Programación II', 'IS-210', 4, 16),
(13, 'Dibujo I', 'DQ-101', 2, 17),
(14, 'Circuitos Eléctricos para Ingeniería en Sistemas', 'IS-311', 3, 16),
(15, 'Matemática Discreta ', 'MM-420', 4, 15),
(16, 'Estadística', 'MM-401', 3, 15),
(17, 'Algoritmos y Estructuras de Datos', 'IS-310', 4, 16),
(18, 'Programación Orientada a Objetos', 'IS-410', 5, 16),
(19, 'Electrónica para Ingeniería en Sistemas', 'IS-411', 3, 16),
(20, 'Sistemas Operativos I', 'IS-412', 5, 16),
(21, 'Base de Datos I', 'IS-501', 5, 16),
(22, 'Redes de Datos I', 'IS-511', 4, 16),
(23, 'Sistemas Operativos II', 'IS-512', 5, 16),
(24, 'Base de Datos II', 'IS-601', 4, 16),
(25, 'Arquitectura de Computadoras', 'IS-603', 4, 16),
(26, 'Lenguajes de Programación', 'IS-513', 5, 16),
(27, 'Diseño Digital', 'IS-711', 4, 16),
(28, 'Sistemas de Información', 'IS-602', 4, 16),
(29, 'Seguridad Informática', 'IS-811', 4, 16),
(30, 'Administración I', 'IS-720', 4, 16),
(31, 'Análisis y diseño de sistemas', 'IS-702', 4, 16),
(32, 'Contabilidad I', 'IS-721', 4, 16),
(33, 'Inteligencia Artificial', 'IS-701', 4, 16),
(34, 'Ingeniería del Software', 'IS-802', 4, 16),
(35, 'Finanzas Administrativas', 'IS-820', 4, 16),
(36, 'Gerencia Informática', 'IS-904', 4, 16),
(37, 'Filosofía', 'FF-101', 4, 10),
(38, 'Psicologia General', 'PS-101', 4, 21),
(39, 'Teoria General del Estado', 'TD-100', 4, 21),
(40, 'Sociologia de la Comunicacion', 'SC-213', 3, 21),
(41, 'Introduccion a la Estadistica', 'MMP-100', 4, 21),
(42, 'Introduccion al Derecho del Codigo', 'ID-102', 4, 21),
(43, 'Español III', 'EE-103', 4, 21),
(44, 'Español II', 'EE-102', 4, 21),
(45, 'Introduccion al Periodismo', 'IP-101', 5, 21),
(46, 'Periodismo Informaivo', 'PV-211', 5, 21),
(47, 'Derecho Constitucional', 'TD-103', 4, 21),
(48, 'Periodismo de TV I', 'TV-101', 5, 21),
(49, 'Periodismo Interpretativo', 'PN-212', 5, 21),
(50, 'Radio Periodismo I', 'PR-211', 5, 21),
(51, 'Periodismo Grafico', 'PL-221', 4, 21),
(52, 'Periodismo en TV II', 'TV-201', 3, 21),
(53, 'Periodismo de opinion', 'PO-311', 4, 21),
(54, 'Titulacion y Formato', 'TF-221', 5, 21),
(55, 'Publicidad y Propaganda', 'RP-313', 4, 21),
(56, 'Teoria de la Personalidad', 'PS-642', 3, 21),
(57, 'Metodos de Investigacion I', 'PS-638', 4, 21),
(58, 'Teoria de la Personalidad II', 'PS-643', 3, 21),
(59, 'Psicologia Evolutica I', 'PS-647', 4, 21),
(60, 'Metodos de Investigacion II', 'PS-639', 4, 21),
(61, 'Psicologia Social', 'PS-650', 4, 22),
(62, 'Psicofisiologia I', 'PS-644', 4, 22),
(63, 'Metodos de Investigacion III', 'PS-640', 4, 22),
(64, 'Psicofiiologia II', 'PS-645', 4, 22),
(65, 'Psicologia Evolutica II', 'PS-648', 4, 22),
(66, 'PS de los Procesos Sociales', 'PS-651', 4, 22),
(67, 'Medicion Psicologica I', 'PS-654', 4, 22),
(68, 'Metodo de Investigacion IV', 'PS-641', 4, 22),
(69, 'Psicofisiologia III', 'PS-646', 4, 22),
(70, 'Medicion Psicologica II', 'PS-655', 4, 22),
(71, 'Conducta Anormal I', 'PS-658', 4, 22),
(72, 'Medicion Psicologica III', 'PS-656', 4, 22),
(73, 'Conducta Anormal II', 'PS-659', 4, 22),
(74, 'Psicodiagnostico I', 'PS-660', 4, 22),
(75, 'PS del Trabajo I', 'PS-662', 4, 22),
(76, 'PS de los grupos', 'PS-652', 4, 22),
(77, 'Medicion Psicologica IV', 'Ps-657', 4, 22),
(78, 'Psicodiagnostico II', 'PS-661', 4, 22),
(79, 'PS Preventiva', 'PS-665', 4, 22),
(80, 'PS Educativa I', 'PS-670', 4, 22),
(81, 'PS del Trabajo II', 'PS-663', 4, 22),
(82, 'PS Comunitaria', 'PS-621', 4, 22),
(83, 'Comp. Organizacional', 'PS-664', 4, 22),
(84, 'Tec. Terapeutica II', 'PS-668', 4, 22),
(85, 'Orientacion', 'PS-672', 4, 22),
(86, 'Elaboracion Y Ejeucion de Proyectos', 'PS-673', 10, 22);

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
  `Nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`codigo_departamento`, `Nombre_departamento`) VALUES
(1, 'Antropología'),
(2, 'Arqueastronomía y Astronomía'),
(3, 'Arte'),
(4, 'Astronomía y Astrofísica'),
(5, 'Biología'),
(6, 'Ciencia y Tecnologías de la Información'),
(7, 'Ciencias Fisiologicas'),
(8, 'Ciencias políticas y derechos humanos'),
(9, 'Cultura Física y Deportes'),
(10, 'Filosofía'),
(11, 'Física'),
(12, 'Historia'),
(13, 'Lenguas extranjeras'),
(14, 'Letras'),
(15, 'Matemáticas'),
(16, 'Ingeniería en Sistemas'),
(17, 'Dibujo '),
(18, 'Artes, Fisica o Deportes'),
(19, 'Ciencias Naturales'),
(20, 'Humanidades'),
(21, 'Periodismo'),
(22, 'Psicología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dificultades`
--

CREATE TABLE `tbl_dificultades` (
  `codigo_dificultad` int(11) NOT NULL,
  `nombre_dificultad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_dificultades`
--

INSERT INTO `tbl_dificultades` (`codigo_dificultad`, `nombre_dificultad`) VALUES
(1, 'Alto (Dificil)'),
(2, 'Medio'),
(3, 'Bajo (Fácil)');

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
(3, 'Una Excelente ayuda en cuestion de tiempo!!.', 'Muy útil para seguir correctamente el plan de estudios... lograrás terminar tu carrera en el menor tiempo posible!!!.', 4),
(4, 'BUENA APLICACION PARA CONSULTAR MIS CLASES', 'Veo que es una buena aplicación para la consulta de clases y nos ayuda como estudiantes a elegir las clases que debemos matricular el siguiente periodo. es excelente. ', 10),
(5, 'TENEMOS JOVENES TALENTOSOS Y CREATIVOS', 'En Honduras se ve que tenemos buenos jovenes que pueden hacer cosas extraordinarias, y al compartir esta aplicacion con los estudiantes universitarios ayuda a guiarlos y dirigirlos en su proceso de estudio, felicito a los desarrolladores de esta aplicacion adelante cuando se quiere se puede.', 5);

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
(3, 'UNITEC', 'img/usuarios/UNITEC.jpg'),
(4, 'CEUTEC', 'img/usuarios/avatar.jpg'),
(5, 'CATOLICA', 'img/usuarios/avatar.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_universidades_x_tbl_carreras`
--

CREATE TABLE `tbl_universidades_x_tbl_carreras` (
  `codigo_universidad` int(11) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  `codigo_usuario` int(11) DEFAULT NULL,
  `codigo_clase` int(11) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_universidades_x_tbl_carreras`
--

INSERT INTO `tbl_universidades_x_tbl_carreras` (`codigo_universidad`, `codigo_carrera`, `codigo_usuario`, `codigo_clase`, `calificacion`) VALUES
(1, 1, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL),
(1, 3, NULL, NULL, NULL),
(1, 4, NULL, NULL, NULL),
(1, 5, NULL, NULL, NULL),
(1, 6, NULL, NULL, NULL),
(1, 7, NULL, NULL, NULL),
(1, 8, NULL, NULL, NULL),
(1, 9, NULL, NULL, NULL),
(1, 10, NULL, NULL, NULL),
(1, 11, NULL, NULL, NULL),
(1, 12, NULL, NULL, NULL),
(2, 1, NULL, NULL, NULL),
(2, 5, NULL, NULL, NULL),
(2, 6, NULL, NULL, NULL),
(2, 11, NULL, NULL, NULL),
(3, 2, NULL, NULL, NULL),
(3, 6, NULL, NULL, NULL),
(3, 12, NULL, NULL, NULL),
(3, 7, NULL, NULL, NULL),
(1, 1, 2, NULL, NULL),
(1, 1, 3, NULL, NULL),
(1, 1, NULL, 1, NULL),
(1, 1, NULL, 2, NULL),
(1, 1, NULL, 3, NULL),
(1, 1, NULL, 4, NULL),
(1, 1, NULL, 5, NULL),
(1, 1, NULL, 6, NULL),
(1, 1, NULL, 7, NULL),
(1, 1, NULL, 8, NULL),
(1, 1, NULL, 9, NULL),
(1, 1, NULL, 10, NULL),
(1, 1, NULL, 11, NULL),
(1, 1, NULL, 12, NULL),
(1, 1, NULL, 13, NULL),
(1, 1, NULL, 14, NULL),
(1, 1, NULL, 15, NULL),
(1, 1, NULL, 16, NULL),
(1, 1, NULL, 17, NULL),
(1, 1, NULL, 18, NULL),
(1, 1, NULL, 19, NULL),
(1, 1, NULL, 20, NULL),
(1, 1, NULL, 21, NULL),
(1, 1, NULL, 22, NULL),
(1, 1, NULL, 23, NULL),
(1, 1, NULL, 24, NULL),
(1, 1, NULL, 31, NULL),
(1, 1, NULL, 32, NULL),
(1, 1, NULL, 33, NULL),
(1, 1, NULL, 34, NULL),
(1, 1, NULL, 35, NULL),
(1, 1, NULL, 36, NULL),
(1, 1, NULL, 25, NULL),
(1, 1, NULL, 26, NULL),
(1, 1, NULL, 27, NULL),
(1, 1, NULL, 28, NULL),
(1, 1, NULL, 29, NULL),
(1, 1, NULL, 30, NULL),
(1, 1, NULL, 37, NULL),
(1, 1, NULL, 38, NULL),
(1, 1, NULL, 37, NULL),
(1, 1, NULL, 38, NULL),
(1, 1, NULL, 39, NULL),
(1, 1, NULL, 40, NULL),
(1, 1, NULL, 41, NULL),
(1, 1, NULL, 42, NULL),
(1, 1, NULL, 43, NULL),
(1, 1, NULL, 44, NULL),
(1, 1, NULL, 45, NULL),
(1, 1, NULL, 46, NULL),
(1, 1, NULL, 47, NULL),
(1, 1, NULL, 48, NULL),
(1, 1, NULL, 49, NULL),
(1, 1, NULL, 50, NULL),
(1, 1, NULL, 51, NULL),
(1, 1, NULL, 52, NULL),
(1, 1, NULL, 53, NULL),
(1, 1, NULL, 54, NULL),
(1, 1, NULL, 55, NULL),
(1, 1, NULL, 56, NULL),
(1, 1, NULL, 57, NULL),
(1, 1, NULL, 58, NULL),
(1, 1, 2, 1, 88),
(1, 1, 3, 1, 65),
(1, 1, 10, 1, 87),
(1, 1, 10, 2, 79),
(1, 1, 10, 3, 65),
(1, 1, 10, 4, 95),
(1, 1, 10, 6, 92),
(1, 1, 5, 1, 68),
(1, 1, 2, 2, 95),
(1, 1, 2, 3, 96),
(1, 1, 2, 4, 82),
(1, 1, 2, 6, 97),
(1, 1, 2, 5, 80),
(1, 1, 2, 7, 90);

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
(6, 'Josias Miasel Chacon Estrada', 'josiasmisaelchacon@gmail.com', 'JosiasChacon', 'josiaschacon', 'Masculino', NULL, NULL, NULL, 'img/usuarios/josias.jpg', NULL, 1, 8, 2, 3),
(7, 'Fares Jafeth Chacon Estrada', 'faresjafethchacon@gmail.com', 'FaresChacon', 'fareschacon', 'Masculino', NULL, NULL, NULL, 'img/usuarios/fares.jpg', NULL, 1, 1, 2, 2),
(8, 'Juan Flores', 'jflor@gmail.com', 'jflor', 'asd123', 'Masculino', NULL, NULL, NULL, 'img/usuarios/avatar.jpg', NULL, 1, 1, 2, 1),
(9, 'Elvin Emir Soto', 'elvinsoto@gmail.com', 'elvinsoto', 'elvinsoto', 'Masculino', NULL, NULL, NULL, 'img/usuarios/avatar.jpg', NULL, 1, 1, 2, 1),
(10, 'Rebeca Sarai Chacon Estrada', 'rebecasaraichacon@gmail.com', 'RebecaChacon', 'rebecachacon', 'Femenino', NULL, NULL, NULL, 'img/usuarios/sarai.jpg', NULL, 1, 1, 2, 1),
(11, 'Jonathan David Chacon Suazo', 'jonathanchacon@gmail.com', 'jonathanchacon', 'jonathanchacon', 'Masculino', NULL, NULL, NULL, 'img/usuarios/avatar.jpg', NULL, 1, 1, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_carreras`
--
ALTER TABLE `tbl_carreras`
  ADD PRIMARY KEY (`codigo_carrera`);

--
-- Indices de la tabla `tbl_clases`
--
ALTER TABLE `tbl_clases`
  ADD PRIMARY KEY (`codigo_clase`),
  ADD KEY `fk_tbl_clases_tbl_departamentos1_idx` (`codigo_departamento`),
  ADD KEY `fk_tbl_clases_tbl_dificultades1_idx` (`codigo_dificultad`);

--
-- Indices de la tabla `tbl_clases_x_tbl_clase_requisitos`
--
ALTER TABLE `tbl_clases_x_tbl_clase_requisitos`
  ADD KEY `fk_tbl_clases_x_tbl_clase_requisitos_tbl_clase_requisitos1_idx` (`codigo_requisito`),
  ADD KEY `fk_tbl_clases_x_tbl_clase_requisitos_tbl_clases1_idx` (`codigo_clase`);

--
-- Indices de la tabla `tbl_clase_requisitos`
--
ALTER TABLE `tbl_clase_requisitos`
  ADD PRIMARY KEY (`codigo_requisito`),
  ADD KEY `fk_tbl_clase_requisitos_tbl_departamentos1_idx` (`codigo_departamento`);

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
  ADD PRIMARY KEY (`codigo_departamento`);

--
-- Indices de la tabla `tbl_dificultades`
--
ALTER TABLE `tbl_dificultades`
  ADD PRIMARY KEY (`codigo_dificultad`);

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
  ADD KEY `fk_tbl_universidades_x_tbl_carreras_tbl_usuarios1_idx` (`codigo_usuario`),
  ADD KEY `fk_tbl_universidades_x_tbl_carreras_tbl_clases1_idx` (`codigo_clase`);

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
  MODIFY `codigo_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT de la tabla `tbl_clase_requisitos`
--
ALTER TABLE `tbl_clase_requisitos`
  MODIFY `codigo_requisito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT de la tabla `tbl_creditos`
--
ALTER TABLE `tbl_creditos`
  MODIFY `codigo_credito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `codigo_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
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
  MODIFY `codigo_mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `codigo_universidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_clases`
--
ALTER TABLE `tbl_clases`
  ADD CONSTRAINT `fk_tbl_clases_tbl_departamentos1` FOREIGN KEY (`codigo_departamento`) REFERENCES `tbl_departamentos` (`codigo_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_clases_tbl_dificultades1` FOREIGN KEY (`codigo_dificultad`) REFERENCES `tbl_dificultades` (`codigo_dificultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_clases_x_tbl_clase_requisitos`
--
ALTER TABLE `tbl_clases_x_tbl_clase_requisitos`
  ADD CONSTRAINT `fk_tbl_clases_x_tbl_clase_requisitos_tbl_clase_requisitos1` FOREIGN KEY (`codigo_requisito`) REFERENCES `tbl_clase_requisitos` (`codigo_requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_clases_x_tbl_clase_requisitos_tbl_clases1` FOREIGN KEY (`codigo_clase`) REFERENCES `tbl_clases` (`codigo_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_clase_requisitos`
--
ALTER TABLE `tbl_clase_requisitos`
  ADD CONSTRAINT `fk_tbl_clase_requisitos_tbl_departamentos1` FOREIGN KEY (`codigo_departamento`) REFERENCES `tbl_departamentos` (`codigo_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_creditos`
--
ALTER TABLE `tbl_creditos`
  ADD CONSTRAINT `fk_tbl_credito_tbl_plan1` FOREIGN KEY (`codigo_plan`) REFERENCES `tbl_planes` (`codigo_plan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_tbl_universidades_x_tbl_carreras_tbl_clases1` FOREIGN KEY (`codigo_clase`) REFERENCES `tbl_clases` (`codigo_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
