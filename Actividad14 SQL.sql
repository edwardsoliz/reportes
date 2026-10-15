-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2026 a las 06:29:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `helpdesk3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Hardware'),
(2, 'Software'),
(3, 'Redes e Internet'),
(4, 'Sistema de Facturación'),
(5, 'Impresoras y Escáner'),
(6, 'Servidor y Almacenamiento'),
(7, 'Cámaras de Seguridad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombre`) VALUES
(1, 'Soporte Hardware'),
(2, 'Soporte Software'),
(3, 'Redes y Conectividad'),
(4, 'Administración de Servidores'),
(5, 'Soporte Impresoras y Escáneres'),
(6, 'Mantenimiento Preventivo'),
(7, 'Seguridad Informática'),
(8, 'Soporte de Cámaras y Videovigilancia'),
(9, 'Instalación de Software y Licencias'),
(10, 'Capacitación y Soporte a Usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Pendiente'),
(2, 'Asignada'),
(3, 'En Proceso'),
(4, 'Resuelta'),
(5, 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `ticket` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descripcion` text NOT NULL,
  `equipo` varchar(80) NOT NULL,
  `sistema_operativo` varchar(80) NOT NULL,
  `ubicacion` varchar(120) NOT NULL,
  `categoria_ia` varchar(50) NOT NULL,
  `prioridad` varchar(10) NOT NULL,
  `solucion_ia` text NOT NULL,
  `solucion_final` text NOT NULL,
  `fecha_cierre` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id_incidencia`, `ticket`, `fecha`, `hora`, `titulo`, `descripcion`, `equipo`, `sistema_operativo`, `ubicacion`, `categoria_ia`, `prioridad`, `solucion_ia`, `solucion_final`, `fecha_cierre`, `usuario_id`, `tecnico_id`, `categoria_id`, `estado_id`) VALUES
(1, 'TK-0001', '2026-07-20', '08:10:00', 'PC del cyber no enciende', 'La computadora número 5 de la sala de cyber no responde al presionar el botón de encendido.', 'PC-CYBER-05', 'Windows 11', 'Sala de Cyber', 'Hardware', 'Alta', 'Verificar fuente de poder y conexiones internas.', 'Se reemplazó la fuente de alimentación.', '2026-07-20 09:30:00', 5, 1, 1, 4),
(2, 'TK-0002', '2026-07-20', '09:15:00', 'Internet lento en toda la sala', 'Los clientes reportan que la conexión a Internet está muy lenta en casi todas las PCs del cyber.', 'Router principal', 'N/A', 'Sala de Cyber', 'Redes e Internet', 'Alta', 'Revisar ancho de banda contratado y saturación de la red.', 'Se reinició el router y se optimizó el ancho de banda.', '2026-07-20 10:00:00', 1, 3, 3, 4),
(3, 'TK-0003', '2026-07-20', '10:00:00', 'Impresora no imprime documentos', 'La impresora de la sala de impresiones no responde a las órdenes de impresión de los clientes.', 'IMPRESORA-01', 'Windows 10', 'Sala de Impresión', 'Impresoras y Escáner', 'Media', 'Revisar cola de impresión y reiniciar el spooler.', 'Pendiente de revisión técnica.', '2026-07-20 12:00:00', 6, 1, 5, 2),
(4, 'TK-0004', '2026-07-20', '11:20:00', 'PC de capacitación con pantalla azul', 'La laptop número 3 de la sala de capacitación muestra pantalla azul al iniciar el sistema.', 'LAPTOP-CAPAC-03', 'Windows 11', 'Sala de Capacitación', 'Hardware', 'Crítica', 'Ejecutar diagnóstico de memoria RAM y disco duro.', 'En espera de repuesto.', '2026-07-20 13:00:00', 3, 1, 1, 3),
(5, 'TK-0005', '2026-07-21', '08:30:00', 'Sistema de facturación no abre', 'La PC de caja no puede abrir el sistema de facturación electrónica para emitir recibos.', 'PC-CAJA-01', 'Windows 11', 'Recepción', 'Sistema de Facturación', 'Alta', 'Revisar instalación del software de facturación y licencia.', 'Se reinstaló el sistema de facturación.', '2026-07-21 09:15:00', 2, 2, 4, 4),
(6, 'TK-0006', '2026-07-21', '09:50:00', 'PC del cyber con virus', 'La computadora número 8 del cyber muestra ventanas emergentes sospechosas y funciona muy lento.', 'PC-CYBER-08', 'Windows 10', 'Sala de Cyber', 'Software', 'Media', 'Ejecutar antivirus completo y limpiar archivos temporales.', 'En proceso de limpieza.', '2026-07-21 10:30:00', 5, 2, 2, 1),
(7, 'TK-0007', '2026-07-21', '11:00:00', 'Servidor de archivos caído', 'El servidor que almacena los archivos y respaldos del cyber no responde desde esta mañana.', 'SERVIDOR-PRINCIPAL', 'Ubuntu Server', 'Sala de Servidores', 'Servidor y Almacenamiento', 'Crítica', 'Revisar logs del servidor y reiniciar servicios.', 'Se reinició el servicio y se restauró la conexión.', '2026-07-21 12:30:00', 4, 4, 6, 4),
(8, 'TK-0008', '2026-07-22', '09:00:00', 'Cámara de seguridad sin señal', 'La cámara de la entrada principal del cyber dejó de transmitir video en el sistema de monitoreo.', 'CAMARA-ENTRADA', 'N/A', 'Entrada Principal', 'Cámaras de Seguridad', 'Media', 'Revisar cableado de red y fuente de alimentación de la cámara.', 'Pendiente de revisión técnica.', '2026-07-22 09:45:00', 4, 3, 7, 2),
(9, 'TK-0009', '2026-07-22', '10:30:00', 'Auriculares dañados en PC del cyber', 'Los auriculares conectados a la computadora número 12 no emiten sonido.', 'PC-CYBER-12', 'Windows 11', 'Sala de Cyber', 'Hardware', 'Baja', 'Revisar puerto de audio y probar con otro dispositivo.', 'Se reemplazaron los auriculares dañados.', '2026-07-22 11:00:00', 5, 1, 1, 4),
(10, 'TK-0010', '2026-07-23', '08:45:00', 'Laptop de capacitación sin WiFi', 'La laptop número 7 de la sala de capacitación no logra conectarse a la red inalámbrica del local.', 'LAPTOP-CAPAC-07', 'Windows 10', 'Sala de Capacitación', 'Redes e Internet', 'Media', 'Revisar adaptador de red y actualizar controladores.', 'En proceso de configuración.', '2026-07-23 09:30:00', 3, 3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `tecnico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_login`, `usuario`, `password`, `rol`, `tecnico_id`) VALUES
(1, 'admin', '123456', 'Administrador', 4),
(2, 'mterrazas', '123456', 'Tecnico', 1),
(3, 'gvillca', '123456', 'Tecnico', 2),
(4, 'isalvatierra', '123456', 'Tecnico', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id_tecnico` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id_tecnico`, `nombres`, `apellidos`, `correo`, `telefono`, `especialidad_id`) VALUES
(1, 'Marco', 'Terrazas Rocha', 'marcoterrazas28@gmail.com', 71122334, 1),
(2, 'Gabriela', 'Villca Soria', 'gabyvillca94@gmail.com', 72233445, 2),
(3, 'Iván', 'Salvatierra Guzmán', 'ivan.salvatierra7@gmail.com', 73344556, 3),
(4, 'Rosario', 'Camacho Peña', 'rosicamacho15@gmail.com', 74455667, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `cargo` varchar(80) NOT NULL,
  `area` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombres`, `apellidos`, `correo`, `telefono`, `cargo`, `area`) VALUES
(1, 'Diego', 'Aguilar Montaño', 'diegoaguilar02@gmail.com', 75566778, 'Recepcionista', 'Recepción'),
(2, 'Fabiola', 'Rocha Antezana', 'fabirocha21@gmail.com', 76677889, 'Cajera', 'Caja'),
(3, 'Sergio', 'Paredes Ledezma', 'sergioparedes33@gmail.com', 77788990, 'Instructor de Capacitación', 'Sala de Capacitación'),
(4, 'Mariana', 'Zambrana Herrera', 'marianazh10@gmail.com', 78899001, 'Administradora', 'Administración'),
(5, 'Pablo', 'Céspedes Rivas', 'pablocespedes99@gmail.com', 79900112, 'Encargado de Mantenimiento', 'Sala de Cyber'),
(6, 'Lucía', 'Montes Barrientos', 'luciamontes17@gmail.com', 70011223, 'Asistente de Impresiones', 'Sala de Impresión');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `fk_incidencia_usuario` (`usuario_id`),
  ADD KEY `fk_incidencia_tecnico` (`tecnico_id`),
  ADD KEY `fk_incidencia_categoria` (`categoria_id`),
  ADD KEY `fk_incidencia_estado` (`estado_id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `fk_login_tecnico` (`tecnico_id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD KEY `fk_tecnico_especialidad` (`especialidad_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `fk_incidencia_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_incidencia_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_incidencia_tecnico` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id_tecnico`),
  ADD CONSTRAINT `fk_incidencia_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_tecnico` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id_tecnico`);

--
-- Filtros para la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `fk_tecnico_especialidad` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id_especialidad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
