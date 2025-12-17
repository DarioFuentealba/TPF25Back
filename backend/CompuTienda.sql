-- phpMyAdmin SQL Dump
-- version 5.2.3-1.fc42
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 31-10-2025 a las 13:03:34
-- Versión del servidor: 8.0.42
-- Versión de PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CompuTienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'administrador'),
(2, 'cliente'),
(3, 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoria', 7, 'add_categoria'),
(26, 'Can change categoria', 7, 'change_categoria'),
(27, 'Can delete categoria', 7, 'delete_categoria'),
(28, 'Can view categoria', 7, 'view_categoria'),
(29, 'Can add sub categoria', 8, 'add_subcategoria'),
(30, 'Can change sub categoria', 8, 'change_subcategoria'),
(31, 'Can delete sub categoria', 8, 'delete_subcategoria'),
(32, 'Can view sub categoria', 8, 'view_subcategoria'),
(33, 'Can add sistema_operativo', 9, 'add_sistema_operativo'),
(34, 'Can change sistema_operativo', 9, 'change_sistema_operativo'),
(35, 'Can delete sistema_operativo', 9, 'delete_sistema_operativo'),
(36, 'Can view sistema_operativo', 9, 'view_sistema_operativo'),
(37, 'Can add ram', 10, 'add_ram'),
(38, 'Can change ram', 10, 'change_ram'),
(39, 'Can delete ram', 10, 'delete_ram'),
(40, 'Can view ram', 10, 'view_ram'),
(41, 'Can add placa_wifi', 11, 'add_placa_wifi'),
(42, 'Can change placa_wifi', 11, 'change_placa_wifi'),
(43, 'Can delete placa_wifi', 11, 'delete_placa_wifi'),
(44, 'Can view placa_wifi', 11, 'view_placa_wifi'),
(45, 'Can add pc escritorio', 12, 'add_pcescritorio'),
(46, 'Can change pc escritorio', 12, 'change_pcescritorio'),
(47, 'Can delete pc escritorio', 12, 'delete_pcescritorio'),
(48, 'Can view pc escritorio', 12, 'view_pcescritorio'),
(49, 'Can add paquete_office', 13, 'add_paquete_office'),
(50, 'Can change paquete_office', 13, 'change_paquete_office'),
(51, 'Can delete paquete_office', 13, 'delete_paquete_office'),
(52, 'Can view paquete_office', 13, 'view_paquete_office'),
(53, 'Can add notebook', 14, 'add_notebook'),
(54, 'Can change notebook', 14, 'change_notebook'),
(55, 'Can delete notebook', 14, 'delete_notebook'),
(56, 'Can view notebook', 14, 'view_notebook'),
(57, 'Can add mouse', 15, 'add_mouse'),
(58, 'Can change mouse', 15, 'change_mouse'),
(59, 'Can delete mouse', 15, 'delete_mouse'),
(60, 'Can view mouse', 15, 'view_mouse'),
(61, 'Can add motherboard', 16, 'add_motherboard'),
(62, 'Can change motherboard', 16, 'change_motherboard'),
(63, 'Can delete motherboard', 16, 'delete_motherboard'),
(64, 'Can view motherboard', 16, 'view_motherboard'),
(65, 'Can add monitor', 17, 'add_monitor'),
(66, 'Can change monitor', 17, 'change_monitor'),
(67, 'Can delete monitor', 17, 'delete_monitor'),
(68, 'Can view monitor', 17, 'view_monitor'),
(69, 'Can add gpu', 18, 'add_gpu'),
(70, 'Can change gpu', 18, 'change_gpu'),
(71, 'Can delete gpu', 18, 'delete_gpu'),
(72, 'Can view gpu', 18, 'view_gpu'),
(73, 'Can add gabinete', 19, 'add_gabinete'),
(74, 'Can change gabinete', 19, 'change_gabinete'),
(75, 'Can delete gabinete', 19, 'delete_gabinete'),
(76, 'Can view gabinete', 19, 'view_gabinete'),
(77, 'Can add fuente', 20, 'add_fuente'),
(78, 'Can change fuente', 20, 'change_fuente'),
(79, 'Can delete fuente', 20, 'delete_fuente'),
(80, 'Can view fuente', 20, 'view_fuente'),
(81, 'Can add disco', 21, 'add_disco'),
(82, 'Can change disco', 21, 'change_disco'),
(83, 'Can delete disco', 21, 'delete_disco'),
(84, 'Can view disco', 21, 'view_disco'),
(85, 'Can add cpu', 22, 'add_cpu'),
(86, 'Can change cpu', 22, 'change_cpu'),
(87, 'Can delete cpu', 22, 'delete_cpu'),
(88, 'Can view cpu', 22, 'view_cpu'),
(89, 'Can add cooler', 23, 'add_cooler'),
(90, 'Can change cooler', 23, 'change_cooler'),
(91, 'Can delete cooler', 23, 'delete_cooler'),
(92, 'Can view cooler', 23, 'view_cooler'),
(93, 'Can add teclado', 24, 'add_teclado'),
(94, 'Can change teclado', 24, 'change_teclado'),
(95, 'Can delete teclado', 24, 'delete_teclado'),
(96, 'Can view teclado', 24, 'view_teclado'),
(97, 'Can add venta', 25, 'add_venta'),
(98, 'Can change venta', 25, 'change_venta'),
(99, 'Can delete venta', 25, 'delete_venta'),
(100, 'Can view venta', 25, 'view_venta'),
(101, 'Can add qr venta', 26, 'add_qrventa'),
(102, 'Can change qr venta', 26, 'change_qrventa'),
(103, 'Can delete qr venta', 26, 'delete_qrventa'),
(104, 'Can view qr venta', 26, 'view_qrventa'),
(105, 'Can add detalle venta', 27, 'add_detalleventa'),
(106, 'Can change detalle venta', 27, 'change_detalleventa'),
(107, 'Can delete detalle venta', 27, 'delete_detalleventa'),
(108, 'Can view detalle venta', 27, 'view_detalleventa'),
(109, 'Can add menu', 28, 'add_menu'),
(110, 'Can change menu', 28, 'change_menu'),
(111, 'Can delete menu', 28, 'delete_menu'),
(112, 'Can view menu', 28, 'view_menu'),
(113, 'Can add rol', 29, 'add_rol'),
(114, 'Can change rol', 29, 'change_rol'),
(115, 'Can delete rol', 29, 'delete_rol'),
(116, 'Can view rol', 29, 'view_rol'),
(117, 'Can add menu rol', 30, 'add_menurol'),
(118, 'Can change menu rol', 30, 'change_menurol'),
(119, 'Can delete menu rol', 30, 'delete_menurol'),
(120, 'Can view menu rol', 30, 'view_menurol'),
(121, 'Can add usuario rol', 31, 'add_usuariorol'),
(122, 'Can change usuario rol', 31, 'change_usuariorol'),
(123, 'Can delete usuario rol', 31, 'delete_usuariorol'),
(124, 'Can view usuario rol', 31, 'view_usuariorol'),
(125, 'Can add encuesta', 32, 'add_encuesta'),
(126, 'Can change encuesta', 32, 'change_encuesta'),
(127, 'Can delete encuesta', 32, 'delete_encuesta'),
(128, 'Can view encuesta', 32, 'view_encuesta'),
(129, 'Can add resultado', 33, 'add_resultado'),
(130, 'Can change resultado', 33, 'change_resultado'),
(131, 'Can delete resultado', 33, 'delete_resultado'),
(132, 'Can view resultado', 33, 'view_resultado'),
(133, 'Can add producto', 34, 'add_producto'),
(134, 'Can change producto', 34, 'change_producto'),
(135, 'Can delete producto', 34, 'delete_producto'),
(136, 'Can view producto', 34, 'view_producto'),
(137, 'Can add carrito item', 35, 'add_carritoitem'),
(138, 'Can change carrito item', 35, 'change_carritoitem'),
(139, 'Can delete carrito item', 35, 'delete_carritoitem'),
(140, 'Can view carrito item', 35, 'view_carritoitem'),
(141, 'Can add producto', 36, 'add_producto'),
(142, 'Can change producto', 36, 'change_producto'),
(143, 'Can delete producto', 36, 'delete_producto'),
(144, 'Can view producto', 36, 'view_producto'),
(145, 'Can add Perfil', 37, 'add_perfil'),
(146, 'Can change Perfil', 37, 'change_perfil'),
(147, 'Can delete Perfil', 37, 'delete_perfil'),
(148, 'Can view Perfil', 37, 'view_perfil'),
(149, 'Can add Interes', 38, 'add_interes'),
(150, 'Can change Interes', 38, 'change_interes'),
(151, 'Can delete Interes', 38, 'delete_interes'),
(152, 'Can view Interes', 38, 'view_interes'),
(153, 'Can add Producto Favorito', 39, 'add_favoritoproducto'),
(154, 'Can change Producto Favorito', 39, 'change_favoritoproducto'),
(155, 'Can delete Producto Favorito', 39, 'delete_favoritoproducto'),
(156, 'Can view Producto Favorito', 39, 'view_favoritoproducto'),
(157, 'Can add proveedores', 40, 'add_proveedores'),
(158, 'Can change proveedores', 40, 'change_proveedores'),
(159, 'Can delete proveedores', 40, 'delete_proveedores'),
(160, 'Can view proveedores', 40, 'view_proveedores'),
(161, 'Can add usuario extra', 41, 'add_usuarioextra'),
(162, 'Can change usuario extra', 41, 'change_usuarioextra'),
(163, 'Can delete usuario extra', 41, 'delete_usuarioextra'),
(164, 'Can view usuario extra', 41, 'view_usuarioextra'),
(165, 'Can add localidad argentina', 42, 'add_localidadargentina'),
(166, 'Can change localidad argentina', 42, 'change_localidadargentina'),
(167, 'Can delete localidad argentina', 42, 'delete_localidadargentina'),
(168, 'Can view localidad argentina', 42, 'view_localidadargentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$IcpPpMSE43ctg5aWuoyFKQ$SuDiA0Fx0Ds9QtOI0Op2mi1nrsKm6X1Yro8jPVrCI+4=', NULL, 1, 'lolo', 'pablo', 'urra', 'p@g.com', 1, 1, '2025-10-11 20:00:25.495499'),
(2, 'pbkdf2_sha256$870000$5bAuRJ7matBzo8wOM1nFhz$SxmoqdWWv4ZwP0Htk9yjmyrHYbQgPw62m0lB5JN9n9I=', NULL, 0, 'lulu', 'erica', 'cabezas', 'e@g.com', 0, 1, '2025-10-11 20:01:21.429203'),
(3, 'pbkdf2_sha256$870000$4H0xbTsGIuDL2Qg2MLDljc$IwLR2O/+z5RDjEfkW+v5lCfrYesuVRHHjuzqHZZArmg=', NULL, 0, 'lele', 'leandro', 'Gonzales', 'l@g.com', 0, 1, '2025-10-27 03:14:11.379443'),
(4, 'pbkdf2_sha256$1000000$1h5sOy4bOeKvBooHtYhtH2$pYtHT0XcJlyz2u7FidIKmgwIgMEO9QNmgH2UbcrFVHc=', NULL, 0, 'lala', 'lala', 'lala', 'lala@lala.com', 0, 1, '2025-11-10 20:54:11.924263');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_carritoitem`
--

CREATE TABLE `carrito_carritoitem` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `cantidad` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `carrito_carritoitem`
--

INSERT INTO `carrito_carritoitem` (`id`, `usuario_id`, `content_type_id`, `object_id`, `cantidad`) VALUES
(37, 1, 17, 3, 3),
(38, 1, 11, 2, 2),
(39, 1, 12, 6, 1),
(42, 2, 17, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_producto`
--

CREATE TABLE `carrito_producto` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_categoria`
--

CREATE TABLE `computacion_categoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_categoria`
--

INSERT INTO `computacion_categoria` (`id`, `nombre`) VALUES
(1, 'Computadoras'),
(2, 'Hardware'),
(3, 'Perifericos'),
(4, 'Armar tu PC'),
(5, 'Contacto'),
(6, 'Software'),
(7, 'Ofertas'),
(8, 'Tu PC  Ideal'),
(9, 'Uso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_cooler`
--

CREATE TABLE `computacion_cooler` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `color` varchar(50) NOT NULL,
  `consumo` decimal(5,2) NOT NULL,
  `cooler_incluidos` int NOT NULL,
  `iluminacion` varchar(150) NOT NULL,
  `socket_cpu` varchar(150) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_cooler`
--

INSERT INTO `computacion_cooler` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `color`, `consumo`, `cooler_incluidos`, `iluminacion`, `socket_cpu`, `foto1`, `foto2`, `foto3`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Fan Cooler 120mm Thermalright TL-C12CW - 120 White', 6400.00, 5, 'Thermalright', 0, 'Blanco', 3.00, 1, 'No', 'AM4', 'Componentes/Cooler/01_a.jpg', 'Componentes/Cooler/01_b.jpg', NULL, 7, 7001, 0.12),
(2, 'CPU Cooler Xigmatek Air-Killer S Rainbow - Compatible con Intel 12 Gen (Socket 1700)', 30000.00, 5, 'Xigmatek', 1, 'Negro', 3.60, 1, 'Si', '1700', 'Componentes/Cooler/02_a.jpg', NULL, NULL, 7, 7002, 0.65),
(3, 'Fan Cooler 120mm Xigmatek G20A - Black - Pack x3 ARGB', 36900.00, 5, 'Xigmatek', 0, 'Negro', 3.60, 1, 'Si', '1700', 'Componentes/Cooler/03_a.jpg', 'Componentes/Cooler/03_b.jpg', NULL, 7, 7003, 0.87),
(4, 'Kit Fan Cooler x3 Gamemax 120mm RQ300 ARGB', 41000.00, 5, 'Gamemax', 0, 'Negro', 4.00, 1, 'ARGB direccionable con iluminación interior y exterior', 'AM4', 'Componentes/Cooler/04_a.jpg', 'Componentes/Cooler/04_b.jpg', NULL, 7, 7004, 0.99),
(5, 'Fan Cooler 120mm Corsair RS120 MAX PWM Single Black', 52600.00, 5, 'Corsair', 0, 'Negro', 3.60, 1, 'No', '1700', 'Componentes/Cooler/05_a.jpg', 'Componentes/Cooler/05_b.jpg', NULL, 7, 7005, 1.20),
(6, 'CPU Water Cooler 360mm Gamemax Icechill 360 ARGB', 124700.00, 6, 'Gamemax', 1, 'Negro', 3.60, 3, 'Si', 'AM5', 'Componentes/Cooler/06_a.jpg', 'Componentes/Cooler/06_b.jpg', 'Componentes/Cooler/06_c.jpg', 7, 7006, 2.95),
(7, 'CPU Water Cooler 240mm Thermaltake TH240 V2 Ultra EX ARGB Sync Snow Edition', 235900.00, 5, 'Thermalright', 0, 'Blanco', 6.25, 2, 'ARGB direccionable en ventiladores y bomba', 'AM5', 'Componentes/Cooler/07_a.jpg', 'Componentes/Cooler/07_b.jpg', 'Componentes/Cooler/07_c.jpg', 7, 7007, 2.78),
(8, 'CPU Water Cooler 240mm Gigabyte AORUS WATERFORCE X II 240 ARGB', 326300.00, 5, 'Gigabyte', 0, 'Negro', 3.60, 2, 'Si', '1700', 'Componentes/Cooler/08_a.jpg', 'Componentes/Cooler/08_b.jpg', NULL, 7, 7008, 2.66),
(9, 'CPU Water Cooler 360mm Gigabyte AORUS WATERFORCE X II 360 ARGB', 430800.00, 5, 'Gigabyte', 1, 'Negro', 6.75, 3, 'Si', 'AM5', 'Componentes/Cooler/09_a.jpg', 'Componentes/Cooler/09_b.jpg', 'Componentes/Cooler/09_c.jpg', 7, 7009, 2.80),
(10, 'CPU Water 360mm Cooler Cooler Master ML 360 ION ARGB', 476600.00, 5, 'Cooler Master', 0, 'Negro', 6.75, 3, 'Si', 'AM5', 'Componentes/Cooler/10_a.jpg', 'Componentes/Cooler/10_b.jpg', NULL, 7, 7010, 2.97);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_cpu`
--

CREATE TABLE `computacion_cpu` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `modelo` varchar(200) NOT NULL,
  `nucleos` int NOT NULL,
  `hilos` int NOT NULL,
  `frecuencia` varchar(200) NOT NULL,
  `proceso_fabricacion` varchar(200) NOT NULL,
  `grafica_integrada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `socket` varchar(200) NOT NULL,
  `incluye_cooler` tinyint(1) NOT NULL,
  `tdp_watts` decimal(6,3) NOT NULL,
  `memoria_l1` varchar(200) NOT NULL,
  `memoria_l2` varchar(200) NOT NULL,
  `memoria_l3` varchar(200) NOT NULL,
  `consumo` decimal(10,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_cpu`
--

INSERT INTO `computacion_cpu` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `modelo`, `nucleos`, `hilos`, `frecuencia`, `proceso_fabricacion`, `grafica_integrada`, `socket`, `incluye_cooler`, `tdp_watts`, `memoria_l1`, `memoria_l2`, `memoria_l3`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Micro AMD Ryzen 3 4100 4.0 GHz AM4', 86000.00, 1, 'AMD', 1, 'AMD Ryzen 3 4100', 4, 8, 'Hasta 4 GHz', '7 nm', 'No informado', 'AM4', 1, 65.000, '64 Kb (por núcleo)', '512 KB (por núcleo)', '8 MB (compartido)', 65.00, '/Componentes/Micros/01_a.jpg', NULL, NULL, NULL, 4, 4001, 0.45),
(2, 'Micro Intel I3-13100 4.5 GHz 12Mb S.1700', 187700.00, 2, 'Intel', 1, 'Core i3-13100', 4, 8, 'Hasta 4.50 GHz', '10 nm', 'Gráficos UHD Intel® 730', '1700', 1, 60.000, '320 Kb', '5 MB', '12 MB', 110.00, '/Componentes/Micros/02_a.jpg', '/Componentes/Micros/02_b.jpg', '/Componentes/Micros/02_c.jpg', NULL, 4, 4002, 0.45),
(3, 'Micro Intel I5-12400 4.4 GHz 18Mb S.1700', 254000.00, 2, 'Intel', 1, 'I5-12400', 6, 12, '4.4 GHz', '10 nm', 'UHD Graphics 730', '1700', 1, 65.000, '80 K', '1.25 MB', '18 MB', 117.00, '/Componentes/Micros/03_a.jpg', '/Componentes/Micros/03_b.jpg', '/Componentes/Micros/03_c.jpg', '/Componentes/Micros/03_d.jpg', 4, 4003, 0.45),
(4, 'Micro AMD Ryzen 7 5800XT 4.8 GHz AM4', 365200.00, 1, 'AMD', 0, 'AMD Ryzen 7 5800XT', 8, 16, '4.8 GHz', '12 nm', 'No', 'AM4', 1, 105.000, '64 KB (Por Núcleo)', '512 KB (Por Núcleo)', '32 Mb', 105.00, '/Componentes/Micros/04_a.jpg', NULL, NULL, NULL, 4, 4004, 0.45),
(5, 'Micro Intel I7-12700F 4.9 GHz 25Mb S.1700', 421400.00, 2, 'Intel', 0, 'I7-12700F', 12, 20, '4.9 GHz', '10 nm', 'No informada', '1700', 1, 65.000, '80 K', '1.25 MB', '25 MB', 180.00, '/Componentes/Micros/05_a.jpg', '/Componentes/Micros/05_b.jpg', '/Componentes/Micros/05_c.jpg', '/Componentes/Micros/05_d.jpg', 4, 4005, 0.40),
(6, 'Micro AMD Ryzen 7 7800X3D 5.0 GHz AM5', 630300.00, 1, 'AMD', 0, 'AMD Ryzen 7 7800X 3D', 8, 16, 'Hasta 5.0 GHz', '5 nm', 'Radeon Graphics', 'AM5', 0, 120.000, '64 Kb', '1 MB', '96 MB', 120.00, '/Componentes/Micros/06_a.jpg', '/Componentes/Micros/06_b.jpg', '/Componentes/Micros/06_c.jpg', '/Componentes/Micros/06_d.jpg', 4, 4006, 0.40),
(7, 'Micro AMD Ryzen 9 9900X 5.6 GHz AM5', 682000.00, 1, 'AMD', 0, 'AMD Ryzen 9 9900X', 12, 24, '5.6 GHz', '5 nm', 'Sí', 'AM5', 0, 105.000, '768 kb', '6 MB', '64 MB', 162.00, '/Componentes/Micros/07_a.jpg', NULL, NULL, NULL, 4, 4007, 0.49),
(8, 'Micro Intel I9-14900KF 6 GHz 36Mb S.1700', 820400.00, 2, 'Intel', 0, 'I9-14900KF', 24, 32, '3.2 GHz (Base) / 6 GHz (Turbo)', 'No informado', 'No', '1700', 0, 125.000, '80 kb', '2 MB', '36 MB', 253.00, '/Componentes/Micros/08_a.jpg', NULL, NULL, NULL, 4, 4008, 0.49),
(9, 'Micro AMD Ryzen 9 9950X 4.3 GHz AM5', 920200.00, 1, 'AMD', 0, 'AMD Ryzen 9 9950X', 16, 32, '4.3 GHz (Base) / 5.7 GHz (Turbo)', '4 nm', 'Sí', 'AM5', 0, 170.000, '1 MB', '16 MB', '64 MB', 200.00, '/Componentes/Micros/09_a.jpg', NULL, NULL, NULL, 4, 4009, 0.48),
(10, 'Micro AMD Ryzen 9 9950X3D 5.7 GHz AM5', 1105700.00, 1, 'AMD', 0, 'AMD Ryzen 9 9950X3D', 16, 32, '4.3 GHz (Base) / 5.7 GHz (Turbo)', 'No informado', 'Sí', 'AM5', 0, 170.000, '80 KB por núcleo', '1 MB por núcleo', '128 MB compartidos', 170.00, '/Componentes/Micros/10_a.jpg', NULL, NULL, NULL, 4, 4010, 0.48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_disco`
--

CREATE TABLE `computacion_disco` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `socket_disco` varchar(100) NOT NULL,
  `capacidad_gb` varchar(100) NOT NULL,
  `consumo` decimal(10,2) NOT NULL,
  `velocidad` varchar(150) NOT NULL,
  `conexion` varchar(150) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_disco`
--

INSERT INTO `computacion_disco` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `socket_disco`, `capacidad_gb`, `consumo`, `velocidad`, `conexion`, `foto1`, `foto2`, `foto3`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Disco Solido SSD 240GB Memox Sata III 2.5\"', 21486.00, 1, 'Memox', 0, 'Sata', '240 GB', 0.20, '500 MB/s', 'SATA Rev. 3.0 (6 Gb/s), retrocompatible con SATA Rev. 2.0 (3 Gb/s)', '/Componentes/Disco/01_a.jpg', NULL, NULL, 8, 8001, 0.01),
(2, 'Disco Solido SSD 480GB Kingston A400 SATA III (Similar 500GB 512GB)', 56100.00, 2, 'Kingston', 0, 'Sata', '480 GB', 0.28, '545 MB/s', 'SATA Rev. 3.0 (6 Gb/s), retrocompatible con SATA Rev. 2.0 (3 Gb/s)', '/Componentes/Disco/02_a.jpg', '/Componentes/Disco/02_b.jpg', '/Componentes/Disco/02_c.jpg', 8, 8002, 0.02),
(3, 'Disco Solido SSD 960GB Hiksemi Wave SATA III (Similar 1TB)', 21486.00, 3, 'Hiksemi', 1, 'Sata', '960 GB', 0.27, 'Lectura hasta 550 MB/s, Escritura hasta 480 MB/s', 'SATA Rev. 3.0 (6 Gb/s), retrocompatible con SATA Rev. 2.0 (3 Gb/s)', '/Componentes/Disco/03_a.jpg', NULL, NULL, 8, 8003, 0.02),
(4, 'Disco Solido SSD 960GB Patriot P310 M.2 NVMe PCIe x4 3.0', 83600.00, 4, 'Patriot', 0, 'M.2', '960 GB', 2.38, 'Lectura hasta 2100 MB/s, Escritura hasta 1800 MB/s', 'M.2 Nvme', '/Componentes/Disco/04_a.jpg', NULL, NULL, 8, 8004, 0.01),
(5, 'Disco Solido SSD 2TB Adata Legend 710 M.2 NVMe PCIe x4 3.0', 170500.00, 5, 'Adata', 0, 'M.2', '2 TB', 2.38, 'Lectura hasta 2400 MB/s, Escritura hasta 1800 MB/s', 'M.2', '/Componentes/Disco/05_a.jpg', '/Componentes/Disco/05_b.jpg', '/Componentes/Disco/05_c.jpg', 8, 8005, 0.03),
(6, 'Disco Solido SSD 1TB Corsair MP700 Pro M.2 NVMe PCIe Gen 5.0 x4 - BULK', 234200.00, 6, 'Corsair', 1, 'M.2', '1 TB', 0.30, 'Lectura hasta 11700 MB/s, Escritura hasta 9600 MB/s', 'M.2', '/Componentes/Disco/06_a.jpg', NULL, NULL, 8, 8006, 0.02),
(7, 'Disco Solido SSD 2TB Kingston Fury Renegade (Con Difusor Térmico) M.2 NVMe PCIe x4 4.0', 283600.00, 3, 'Kingston', 0, 'M.2', '2 TB', 2.80, 'Lectura hasta 7300 MB/s, Escritura hasta 7000 MB/s', 'M.2', '/Componentes/Disco/07_a.jpg', '/Componentes/Disco/07_b.jpg', '/Componentes/Disco/07_c.jpg', 8, 8007, 0.04),
(8, 'Disco Solido SSD 2TB Adata XPG G5 Mars 980 Pro Air Cooling M.2 NVMe PCIe Gen5 x4 - C/Cooler Disipado', 337000.00, 8, 'Adata', 0, 'M.2', '2 TB', 2.80, 'Lectura hasta 14000 MB/s, Escritura hasta 13000 MB/s', 'M.2', '/Componentes/Disco/08_a.jpg', '/Componentes/Disco/08_b.jpg', NULL, 8, 8008, 0.04),
(9, 'Disco Solido SSD 4TB Kingston Fury Renegade G5 M.2 NVMe PCIe 5.0 14.800MB/s', 914900.00, 9, 'Kingston', 0, 'M.2', '4 TB', 3.00, 'Lectura hasta 14800 MB/s, Escritura hasta 14000 MB/s', 'M.2', '/Componentes/Disco/09_a.jpg', NULL, NULL, 8, 8009, 0.03);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_fuente`
--

CREATE TABLE `computacion_fuente` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `potencia_nominal` decimal(7,2) NOT NULL,
  `consumo` decimal(7,2) NOT NULL,
  `eficiencia` varchar(150) NOT NULL,
  `ventilador` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcategoria_id` bigint NOT NULL,
  `socket_fuente_gpu` varchar(200) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_fuente`
--

INSERT INTO `computacion_fuente` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `potencia_nominal`, `consumo`, `eficiencia`, `ventilador`, `subcategoria_id`, `socket_fuente_gpu`, `foto1`, `foto2`, `foto3`, `foto4`, `codigo`, `peso`) VALUES
(1, 'Fuente ATX 550W Perfomance', 23700.00, 4, 'Perfomance', 0, 500.00, 0.00, '80 % Típicamente', '80 mm', 9, 'No', 'Componentes/Fuente/01_a.jpg', 'Componentes/Fuente/01_b.jpg', 'Componentes/Fuente/01_c.jpg', 'Componentes/Fuente/01_d.jpg', 9001, 1.20),
(2, 'Fuente 550W Thermaltake LitePower', 65100.00, 4, 'Thermaltake', 0, 550.00, 0.00, 'No especifica', 'Si (120mm)', 9, 'PCIe x16', 'Componentes/Fuente/02_a.jpg', 'Componentes/Fuente/02_b.jpg', 'Componentes/Fuente/02_c.jpg', NULL, 9002, 1.30),
(3, 'Fuente 700W Adata XPG Probe 80 Plus Bronze', 88200.00, 3, 'Adata', 1, 700.00, 0.00, '80 PLUS Bronze (hasta 87% a 50% de carga)', '120 mm con cojinete de manguito (2400 ±10% RPM)', 9, 'PCIe x16', 'Componentes/Fuente/03_a.jpg', 'Componentes/Fuente/03_b.jpg', NULL, NULL, 9003, 1.50),
(4, 'Fuente 850W Sentey GSP850-GM 80 PLUS Gold - Modular', 135400.00, 6, 'Sentey', 0, 850.00, 0.00, '90 %', '120 mm silencioso con control inteligente', 9, 'PCIe x16', 'Componentes/Fuente/04_a.jpg', 'Componentes/Fuente/04_b.jpg', NULL, NULL, 9004, 1.70),
(5, 'Fuente 1000W Corsair HX1000 80 PLUS Platinum Modular', 444000.00, 7, 'Corsair', 1, 1000.00, 0.00, '97 %', '140 mm con rodamientos de fluido dinámico (FDB) y modo Zero RPM', 9, 'PCIe x16', 'Componentes/Fuente/05_a.jpg', 'Componentes/Fuente/05_b.jpg', 'Componentes/Fuente/05_c.jpg', 'Componentes/Fuente/05_d.jpg', 9005, 2.00),
(6, 'Fuente 1500W Corsair HX1500i 80 PLUS Platinum Full Modular', 634500.00, 7, 'Corsair', 1, 1500.00, 0.00, '80 PLUS Platinum (hasta 92% de eficiencia)', '140 mm con rodamientos de fluido dinámico (FDB) y modo Zero RPM', 9, 'PCIe x16', 'Componentes/Fuente/06_a.jpg', 'Componentes/Fuente/06_b.jpg', 'Componentes/Fuente/06_c.jpg', 'Componentes/Fuente/06_d.jpg', 9006, 2.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_gabinete`
--

CREATE TABLE `computacion_gabinete` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `ventana` varchar(150) NOT NULL,
  `colores` varchar(150) NOT NULL,
  `usb` varchar(150) NOT NULL,
  `audio_hd` varchar(150) NOT NULL,
  `ancho` varchar(50) NOT NULL,
  `alto` varchar(50) NOT NULL,
  `profundidad` varchar(50) NOT NULL,
  `ventiladores` varchar(150) NOT NULL,
  `incluidos` varchar(150) NOT NULL,
  `radiadores` varchar(150) NOT NULL,
  `consumo` decimal(5,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `foto6` varchar(100) DEFAULT NULL,
  `foto7` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_gabinete`
--

INSERT INTO `computacion_gabinete` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `ventana`, `colores`, `usb`, `audio_hd`, `ancho`, `alto`, `profundidad`, `ventiladores`, `incluidos`, `radiadores`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `foto6`, `foto7`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Gabinete Sentey 6100-SF H10 negro - Sin Cooler Fan', 34900.00, 4, 'Sentey', 0, 'Vidrio templado frontal y lateral', 'Negro', '1 x 3.0, 2 x 2.0', 'Si', '195', '410', '310', 'Soporta hasta 5 x 120 mm (superior, inferior y trasero)', 'No incluye ventiladores', 'Superior: hasta 240 mm', 5.00, 'Componentes/Gabinetes/01_a.jpg', 'Componentes/Gabinetes/01_b.jpg', 'Componentes/Gabinetes/01_c.jpg', NULL, NULL, NULL, NULL, 10, 10001, 5.00),
(2, 'Gabinete MSI Mag Shield M301 X1 Fan', 35500.00, 7, 'MSI', 0, 'No', 'Negro', '2 x 3.0, 1 x 2.0', 'Si', '206', '352', '345', '1x 120 mm', 'Si', 'No incluye radiadores', 3.00, 'Componentes/Gabinetes/02_a.jpg', 'Componentes/Gabinetes/02_b.jpg', 'Componentes/Gabinetes/02_c.jpg', 'Componentes/Gabinetes/02_d.jpg', NULL, NULL, NULL, 10, 10002, 3.00),
(3, 'Gabinete Sentey 6100-SF H10 Blanco - Sin Cooler Fan', 36600.00, 6, 'Sentey', 0, 'Vidrio templado frontal y lateral', 'Blanco', '1 x 3.0, 2 x 2.0', 'Si', '195', '410', '310', 'Soporta hasta 5 x 120 mm (superior, inferior y trasero)', 'No incluye ventiladores', 'Superior: hasta 240 mm', 5.00, 'Componentes/Gabinetes/03_a.jpg', 'Componentes/Gabinetes/03_b.jpg', 'Componentes/Gabinetes/03_c.jpg', 'Componentes/Gabinetes/03_d.jpg', NULL, NULL, NULL, 10, 10003, 5.00),
(4, 'Gabinete Genesis IRID 503 V2 ARGB', 79900.00, 4, 'Genesis', 0, 'Vidrio templado', 'Negro', '1 x 3.0, 1 x 2.0', 'Si', '210', '430', '430', 'Frontales: 2 x 140mm, 3 x 120mm - Traseros: 1 x 120 mm - Superiores: 2 x 120mm, 2 x 140mm', 'No incluye ventiladores', 'No incluye radiadores', 0.00, 'Componentes/Gabinetes/04_a.jpg', 'Componentes/Gabinetes/04_b.jpg', 'Componentes/Gabinetes/04_c.jpg', 'Componentes/Gabinetes/04_d.jpg', 'Componentes/Gabinetes/04_e.jpg', 'Componentes/Gabinetes/04_f.jpg', 'Componentes/Gabinetes/04_g.jpg', 10, 10004, 0.50),
(5, 'Gabinete Sentey GS-6130 H30 Blanco - Fan x5 Argb', 53500.00, 6, 'Sentey', 1, 'Paneles frontal y lateral de vidrio templado', 'Blanco', '1 x 3.0, 1 x 2.0', 'Si', '200', '407', '360', 'Lateral: 2 x 120 mm ARGB (incluidos); Superior: 2 x 120 mm ARGB (incluidos); Trasero: 1 x 120 mm ARGB (incluido); Inferior: hasta 2 x 120 mm', 'Si', 'Superior o lateral: hasta 240 mm', 20.00, 'Componentes/Gabinetes/05_a.jpg', 'Componentes/Gabinetes/05_b.jpg', 'Componentes/Gabinetes/05_c.jpg', NULL, NULL, NULL, NULL, 10, 10005, 20.00),
(6, 'Gabinete Cooler Master Masterbox Q300L V2 ARGB', 88500.00, 5, 'Cooler Master', 0, 'Si', 'Negro', '2 x 3.0, 1 x 2.0', 'No', '230', '383', '387', 'Frontales: 2 x 140mm - Traseros: 1 x 120 mm - Superiores: 2 x 120mm', 'No incluye ventiladores', '1 x 120 mm', 5.00, 'Componentes/Gabinetes/06_a.jpg', 'Componentes/Gabinetes/06_b.jpg', 'Componentes/Gabinetes/06_c.jpg', 'Componentes/Gabinetes/06_d.jpg', 'Componentes/Gabinetes/06_e.jpg', 'Componentes/Gabinetes/06_f.jpg', NULL, 10, 10006, 5.00),
(7, 'GGabinete Cooler Master Masterbox TD 300 Mesh Blanco ARGB', 115300.00, 6, 'Cooler Master', 0, 'Vidrio', 'Blanco', '3 x 3.0', 'Si', '206', '352', '345', 'Frontales: 2 x 140mm - Traseros: 1 x 120 mm - Superiores: 2 x 120mm', 'No incluye ventiladores', 'No incluye radiadores', 0.00, 'Componentes/Gabinetes/07_a.jpg', 'Componentes/Gabinetes/07_b.jpg', 'Componentes/Gabinetes/07_c.jpg', 'Componentes/Gabinetes/07_d.jpg', NULL, NULL, NULL, 10, 10007, 0.50),
(8, 'Gabinete ADATA XPG Starker Air BTF Fan x4 ARGB - Blanco', 146300.00, 4, 'ADATA', 1, 'Vidrio templado 3 mm', 'Blanco', '1 x USB 3.2 Tipo-C, 2 x USB 3.2 Tipo-A', 'Sí (combo auric/micro)', '496', '242', '464', 'Frontal/Superior: 3x120/3x140 - Trasero: 120/140 - Shroud: 3x120 - Lateral: 2x120 (al quitar bracket)', '4 x 120mm ARGB', 'Frontal/Superior: hasta 360/280/240mm - Trasero: hasta 140mm', 75.00, 'Componentes/Gabinetes/08_a.jpg', 'Componentes/Gabinetes/08_b.jpg', 'Componentes/Gabinetes/08_c.jpg', 'Componentes/Gabinetes/08_d.jpg', NULL, NULL, NULL, 10, 10008, 7.50),
(9, 'Gabinete Thermaltake The Tower 300 TG x2 Fan Bumblebee', 241100.00, 3, 'Thermaltake', 1, 'Paneles frontal y laterales de vidrio templado de 3 mm', 'Amarillo', '3 x 3.0', 'Si', '300', '515', '333', 'Superior: 2 x 140 mm - Lado derecho: hasta 3x140 mm - Trasero: hasta 2x140 mm - Cubierta de la PSU: 1x140 mm', 'Superior: 2 x 140 mm', 'Lado derecho: hasta 420 mm', 47.25, 'Componentes/Gabinetes/09_a.jpg', 'Componentes/Gabinetes/09_b.jpg', 'Componentes/Gabinetes/09_c.jpg', NULL, NULL, NULL, NULL, 10, 10009, 4.70),
(10, 'Gabinete Thermaltake AH T200 Tempered Glass Black Micro Chassis', 224100.00, 4, 'Thermaltake', 0, 'Paneles laterales de vidrio templado de 4 mm', 'Negro', '2 x USB 3.0, 1 x USB 3.1 Gen 2 Tipo-C', 'Si', '282', '444', '552', 'Frontal: 2 x 120/140 mm - Superior: 2 x 120/140 mm', 'No incluye ventiladores', 'Frontal: hasta 280 mm', 6.75, 'Componentes/Gabinetes/10_a.jpg', 'Componentes/Gabinetes/10_b.jpg', 'Componentes/Gabinetes/10_c.jpg', 'Componentes/Gabinetes/10_d.jpg', 'Componentes/Gabinetes/10_e.jpg', NULL, NULL, 10, 10010, 6.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_gpu`
--

CREATE TABLE `computacion_gpu` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `consumo` decimal(10,2) NOT NULL,
  `memoria_capacidad_gb` int NOT NULL,
  `memoria_tipo` varchar(200) NOT NULL,
  `memoria_velocidad` varchar(200) NOT NULL,
  `resolucion_max` varchar(200) NOT NULL,
  `refrigeracion` varchar(200) NOT NULL,
  `socket_gpu` varchar(200) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_gpu`
--

INSERT INTO `computacion_gpu` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `consumo`, `memoria_capacidad_gb`, `memoria_tipo`, `memoria_velocidad`, `resolucion_max`, `refrigeracion`, `socket_gpu`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Placa de Video Asus Nvidia Geforce GT 730 2GB GDDR5 Low Profile', 106400.00, 1, 'Asus', 1, 75.00, 2, 'GDDR5', '5 Gbps', 'No informada', 'No', 'PCIe x16', '/Componentes/PlacaVideo/01_a.jpg', '/Componentes/PlacaVideo/01_b.jpg', '/Componentes/PlacaVideo/01_c.jpg', NULL, NULL, 5, 5001, 0.05),
(2, 'Placa de Video Asrock AMD Radeon RX 6500 XT Phantom Gaming D 4GB GDDR6 OC', 260300.00, 2, 'AMD', 1, 107.00, 4, 'GDDR6', '18 Gbps', '7680 x 4320 (8K)', 'No', 'PCIe x16', '/Componentes/PlacaVideo/02_a.jpg', '/Componentes/PlacaVideo/02_b.jpg', '/Componentes/PlacaVideo/02_c.jpg', NULL, NULL, 5, 5002, 0.06),
(3, 'Placa de Video ASRock AMD Radeon RX 6600 Challenger D Dual Fan 8GB GDDR6', 378300.00, 3, 'AMD', 1, 132.00, 8, 'GDDR6', '14 Gbps', 'No informada', 'No', 'PCIe x16', '/Componentes/PlacaVideo/03_a.jpg', '/Componentes/PlacaVideo/03_b.jpg', '/Componentes/PlacaVideo/03_c.jpg', NULL, NULL, 5, 5003, 0.06),
(4, 'Placa de Video Pny Geforce RTX 5060 8GB Dual Fan OC GDDR7', 504400.00, 4, 'Geforce', 0, 160.00, 8, 'GDDR7', '28 Gbps', '7680 x 4320 (8K UHD)', 'No', 'PCIe x16', '/Componentes/PlacaVideo/04_a.jpg', '/Componentes/PlacaVideo/04_b.jpg', '/Componentes/PlacaVideo/04_c.jpg', '/Componentes/PlacaVideo/04_d.jpg', NULL, 5, 5004, 0.01),
(5, 'Placa de Video Pny Geforce RTX 5060 TI Epic X 8GB Triple Fan Argb OC GDDR7', 670300.00, 3, 'Geforce', 5, 185.00, 8, 'GDDR7', '28 Gbps', '7680 x 4320 (8K UHD)', 'No', 'PCIe x16', '/Componentes/PlacaVideo/05_a.jpg', '/Componentes/PlacaVideo/05_b.jpg', '/Componentes/PlacaVideo/05_c.jpg', '/Componentes/PlacaVideo/05_d.jpg', '/Componentes/PlacaVideo/05_e.jpg', 5, 5005, 0.01),
(6, 'Placa de Video Gigabyte Nvidia Geforce RTX 5060 TI EAGLE ICE 8GB OC GDDR7', 731900.00, 2, 'Gigabyte', 6, 185.00, 8, 'GDDR7', '20 Gbps', '7680 x 4320', 'Cooler WINDFORCE Dual (HAWK fans, Alternate Spinning)', 'PCIe x16', '/Componentes/PlacaVideo/06_a.jpg', '/Componentes/PlacaVideo/06_b.jpg', '/Componentes/PlacaVideo/06_c.jpg', '/Componentes/PlacaVideo/06_d.jpg', '/Componentes/PlacaVideo/06_e.jpg', 5, 5006, 0.01),
(7, 'Placa de Video Pny Geforce RTX 5060 TI 16GB STD Dual Fan OC GDDR7', 860700.00, 7, 'Geforce', 0, 185.00, 16, 'GDDR7', '20 Gbps', '7680 x 4320 (8K UHD)', 'Dual Fan (STD)', 'PCIe x16', '/Componentes/PlacaVideo/07_a.jpg', '/Componentes/PlacaVideo/07_b.jpg', '/Componentes/PlacaVideo/07_c.jpg', '/Componentes/PlacaVideo/07_d.jpg', '/Componentes/PlacaVideo/07_e.jpg', 5, 5007, 0.02),
(8, 'Placa de Video Pny Geforce RTX 5070 EPIC X ARGB 12GB OC Triple Fan GDDR7', 1098500.00, 8, 'Geforce', 0, 250.00, 12, 'GDDR7', '28 Gbps', '8K (7680 x 4320), hasta 4 monitores', 'Triple ventilador axial (3 x 90mm), iluminación EPIC-X RGB', 'PCIe x16', '/Componentes/PlacaVideo/08_a.jpg', '/Componentes/PlacaVideo/08_b.jpg', '/Componentes/PlacaVideo/08_c.jpg', '/Componentes/PlacaVideo/08_d.jpg', '/Componentes/PlacaVideo/08_e.jpg', 5, 5008, 0.02),
(9, 'Placa de Video AMD Radeon Asus RX 9070 PRIME OC 16GB GDDR6', 1133300.00, 9, 'AMD', 0, 220.00, 16, 'GDDR6', '20 Gbps', '7680 x 4320', 'Triple ventilador axial (3 x 90mm)', 'PCIe x16', '/Componentes/PlacaVideo/09_a.jpg', '/Componentes/PlacaVideo/09_b.jpg', '/Componentes/PlacaVideo/09_c.jpg', '/Componentes/PlacaVideo/09_d.jpg', NULL, 5, 5009, 0.02),
(10, 'Placa de Video Gigabyte Nvidia Geforce RTX 5090 Gaming OC 32GB GDDR7', 5056700.00, 10, 'Gigabyte', 0, 575.00, 32, 'GDDR7', '28 Gbps', '7680 x 4320 (8K)', 'WINDFORCE con 3 ventiladores Hawk y cámara de vapor', 'PCIe x16', '/Componentes/PlacaVideo/10_a.jpg', '/Componentes/PlacaVideo/10_b.jpg', '/Componentes/PlacaVideo/10_c.jpg', '/Componentes/PlacaVideo/10_d.jpg', NULL, 5, 5010, 0.02);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_monitor`
--

CREATE TABLE `computacion_monitor` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `panel` varchar(150) NOT NULL,
  `pantalla` varchar(150) NOT NULL,
  `tamanio` varchar(150) NOT NULL,
  `vga` varchar(150) NOT NULL,
  `display_port` varchar(150) NOT NULL,
  `usb` varchar(150) NOT NULL,
  `hdmi` varchar(150) NOT NULL,
  `resolucion` varchar(150) NOT NULL,
  `consumo` decimal(5,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_monitor`
--

INSERT INTO `computacion_monitor` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `panel`, `pantalla`, `tamanio`, `vga`, `display_port`, `usb`, `hdmi`, `resolucion`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Monitor Led 19\" GO VGA/HDMI', 104800.00, 1, 'GO', 1, 'Led', 'Plana', '19\"', 'Sí', 'No', 'No', 'Sí', '1920 x 1080 (Full HD)', 18.00, '/Componentes/Monitor/01_a.jpg', NULL, NULL, NULL, 12, 12001, 18.00),
(2, 'Monitor LED IPS LG 24MS500 FULL HD 100Hz', 173000.00, 2, 'LG', 1, 'Led', 'Plana', '24\"', 'Sí', 'Sí', 'No', 'Sí', '1920 x 1080 (Full HD)', 16.00, '/Componentes/Monitor/02_a.jpg', '/Componentes/Monitor/02_b.jpg', '/Componentes/Monitor/02_c.jpg', NULL, 12, 12002, 16.00),
(3, 'Monitor Gamer IPS 24\" VIEWSONIC VX2428A 180Hz FHD Freesync 0.5ms', 227700.00, 3, 'LG', 1, 'Led', 'Plana', '24\"', 'No', 'Sí', 'No', 'Sí', '1920 x 1080 (Full HD)', 25.00, '/Componentes/Monitor/03_a.jpg', '/Componentes/Monitor/03_b.jpg', '/Componentes/Monitor/03_c.jpg', '/Componentes/Monitor/03_d.jpg', 12, 12003, 10.00),
(4, 'Monitor LED 32\" LG 32MN500M-B 75Hz IPS HDMI', 470700.00, 4, 'LG', 0, 'Led', 'Plana', '32\"', 'No', 'Sí', 'Sí', 'Sí', '1920 x 1080 (Full HD)', 25.00, '/Componentes/Monitor/04_a.jpg', '/Componentes/Monitor/04_b.jpg', '/Componentes/Monitor/04_c.jpg', '/Componentes/Monitor/04_d.jpg', 12, 12004, 10.00),
(5, 'Monitor Gamer LED 32\" LG 32GR93U-B Pivot UltraGear UHD 4K 144Hz 1Ms G-Sync Freesync Premium', 1386300.00, 5, 'LG', 0, 'Led', 'Plana', '32\"', 'Sí', 'Sí', 'Sí', 'Sí', '3840 x 2160 (Full HD)', 65.00, '/Componentes/Monitor/05_a.jpg', '/Componentes/Monitor/05_b.jpg', NULL, NULL, 12, 12005, 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_motherboard`
--

CREATE TABLE `computacion_motherboard` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `memoria` varchar(200) NOT NULL,
  `socket_memoria` varchar(200) NOT NULL,
  `socket_gpu` varchar(200) NOT NULL,
  `socket_sata_disco` varchar(200) NOT NULL,
  `socket_M2_disco` varchar(200) NOT NULL,
  `socket_cpu` varchar(200) NOT NULL,
  `sonido` varchar(200) NOT NULL,
  `puerto_sata` varchar(200) NOT NULL,
  `ranura_ram` varchar(200) NOT NULL,
  `pci` varchar(200) NOT NULL,
  `usb` varchar(200) NOT NULL,
  `hdmi` varchar(200) NOT NULL,
  `vga` varchar(200) NOT NULL,
  `consumo` decimal(10,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_motherboard`
--

INSERT INTO `computacion_motherboard` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `memoria`, `socket_memoria`, `socket_cpu`, `socket_gpu`, `socket_sata_disco`, `socket_M2_disco`, `sonido`, `puerto_sata`, `ranura_ram`, `pci`, `usb`, `hdmi`, `vga`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Motherboard Asus A520M-K Prime AM4', 81500.00, 1, 'Asus', 1, 'DDR4 - 2 (64 GB)', 'DDR4', 'AM4', 'PCIe x16', 'Si', 'Si', 'Realtek ALC887', '4', '2', '1', '4 (3.2) / 2 (2.0)', '1', 'No', 5.00, '/Componentes/PlacaMadre/01_a.jpg', 'Componentes/Componentes/PlacaMadre/01_b.jpg', '/Componentes/PlacaMadre/01_c.jpg', '/Componentes/PlacaMadre/01_d.jpg', NULL, 3, 3001, 0.84),
(2, 'Motherboard Gigabyte H510M-K V2 1200', 103800.00, 2, 'Gigabyte', 1, 'DDR4 - 2 (Max. 64 GB)', 'DDR4', '1200', 'PCIe x16', 'Si', 'Si', 'No informado', '4', '6', '2', '6 USB-A', 'Sí', 'No', 4.90, '/Componentes/PlacaMadre/02_a.jpg', '/Componentes/PlacaMadre/02_b.jpg', '/Componentes/PlacaMadre/02_c.jpg', NULL, NULL, 3, 3002, 0.75),
(3, 'Motherboard Asus Prime A620M-K DDR5 AM5', 118000.00, 3, 'Asus', 1, 'DDR5 - 2 (Máx. 96 GB)', 'DDR5', 'AM5', 'PCIe x16', 'Si', 'Si', 'No informado', '4', '4', '2', 'USB 3.2 Gen 1, USB 2.0', 'Sí (HDMI 2.1, 4K a 60Hz)', 'Sí', 60.00, '/Componentes/PlacaMadre/03_a.jpg', '/Componentes/PlacaMadre/03_b.jpg', '/Componentes/PlacaMadre/03_c.jpg', NULL, NULL, 3, 3003, 1.00),
(4, 'Motherboard Asrock B550 Phantom Gaming 4/ac AM4', 138500.00, 4, 'Asrock', 0, 'DDR4 - 4 (Max. 128 GB)', 'DDR4', 'AM4', 'PCIe x16', 'Si', 'Si', 'Realtek 1200 Codec', '4', '6', '2', '6 (3.2)', '1', 'No', 5.00, '/Componentes/PlacaMadre/04_a.jpg', '/Componentes/PlacaMadre/04_b.jpg', '/Componentes/PlacaMadre/04_c.jpg', '/Componentes/PlacaMadre/04_d.jpg', '/Componentes/PlacaMadre/04_e.jpg', 3, 3004, 0.92),
(5, 'Motherboard MSI B760M-E PRO DDR5 1700', 177700.00, 5, 'MSI', 0, 'DDR5 - 2 (hasta 128 GB)', 'DDR5', '1700', 'PCIe x16', 'Si', 'Si', 'Realtek® ALC1200 codec', '1', '4', '2', '4 x USB 2.0 (traseros), 4 x USB 2.0 (frontales), 2 x USB 3.2 Gen 1 Type-A (traseros), 2 x USB 3.2 Gen 1 Type-A (frontales)', '1', 'No', 4.80, '/Componentes/PlacaMadre/05_a.jpg', '/Componentes/PlacaMadre/05_b.jpg', '/Componentes/PlacaMadre/05_c.jpg', NULL, NULL, 3, 3005, 0.97),
(6, 'Motherboard Gigabyte B550 Aorus Elite AX V2 AM4', 301300.00, 6, 'Gigabyte', 0, 'DDR4 - 4 (Max. 128 GB)', 'DDR4', 'AM4', 'PCIe x16', 'Si', 'Si',  'Realtek® ALC1200 codec', '4', '6', '4', '5', '1', 'No', 70.00, '/Componentes/PlacaMadre/06_a.jpg', '/Componentes/PlacaMadre/06_b.jpg', '/Componentes/PlacaMadre/06_c.jpg', '/Componentes/PlacaMadre/06_d.jpg', '/Componentes/PlacaMadre/06_e.jpg', 3, 3006, 1.20),
(7, 'Motherboard Asus Tuf Gaming B650M-Plus WIFI AM5', 308500.00, 7, 'Asus', 0, 'DDR5 - 4 (Max. 128 GB)', 'DDR5', 'AM5', 'PCIe x16', 'No', 'Si', 'Realtek® ALC1200 codec', '4', '6', '4', '7', 'Sí', 'No', 159.00, '/Componentes/PlacaMadre/07_a.jpg', '/Componentes/PlacaMadre/07_b.jpg', '/Componentes/PlacaMadre/07_c.jpg', NULL, NULL, 3, 3007, 1.12),
(8, 'Motherboard AsRock X870E Taichi Lite Wifi AM5 DDR5', 703800.00, 8, 'Asrock', 0, 'DDR5 - 4 (hasta 256 GB)', 'DDR5', 'AM5', 'PCIe x16', 'Si', 'Si', 'Realtek® ALC1200 codec', '4', '8', '4', '2 x USB4 Type-C, 5 x USB 3.2 Gen2 Type-A, 2 x USB 2.0', 'Sí', 'No', 396.00, '/Componentes/PlacaMadre/08_a.jpg', '/Componentes/PlacaMadre/08_b.jpg', NULL, NULL, NULL, 3, 3008, 1.09),
(9, 'Motherboard Gigabyte X870E AORUS MASTER AM5 DDR5', 767700.00, 9, 'Gigabyte', 0, 'DDR5 - 4 (hasta 128 GB)', 'DDR5', 'AM5', 'PCIe x16', 'Si', 'Si', 'Realtek® ALC1200 codec', '4 x SATA 6Gb/s', '8', '4', '2 x USB4 Type-C, USB 3.2 Gen 2x2', 'Sí, HDMI 2.1', 'No', 396.00, '/Componentes/PlacaMadre/09_a.jpg', '/Componentes/PlacaMadre/09_b.jpg', '/Componentes/PlacaMadre/09_c.jpg', '/Componentes/PlacaMadre/09_d.jpg', NULL, 3, 3009, 0.83),
(10, 'Motherboard Asus Rog Strix X870E - E Gaming Wifi AM5 DDR5', 957100.00, 10, 'Asus', 0, 'DDR5 - 4 (hasta 192 GB)', 'DDR5', 'AM5', 'PCIe x16', 'Si', 'Si', 'Realtek® ALC1200 codec', '4', '8', '4', '2 x USB4® Tipo-C®, 1 x USB 3.2 Gen 2 x 2 Tipo-C® (20 Gbps) con PD 3.0 hasta 30 W, 10 x USB 3.2 Gen 2 (10 Gbps)', '1', 'No', 396.00, '/Componentes/PlacaMadre/10_a.jpg', '/Componentes/PlacaMadre/10_b.jpg', NULL, NULL, NULL, 3, 3010, 0.99);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_mouse`
--

CREATE TABLE `computacion_mouse` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `color` varchar(50) NOT NULL,
  `conexion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `botones` varchar(50) NOT NULL,
  `iluminacion` varchar(50) NOT NULL,
  `consumo` decimal(5,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `foto6` varchar(100) DEFAULT NULL,
  `foto7` varchar(100) DEFAULT NULL,
  `foto8` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_mouse`
--

INSERT INTO `computacion_mouse` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `color`, `conexion`, `botones`, `iluminacion`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `foto6`, `foto7`, `foto8`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Mouse Natec Optico RUFF 2 1000 DPI White', 2900.00, 1, 'Natec', 1, 'Blanco/Negro', 'USB cable', '3', 'No', 0.70, '/Componentes/Mouse/01_a.jpg', '/Componentes/Mouse/01_b.jpg', '/Componentes/Mouse/01_c.jpg', '/Componentes/Mouse/01_d.jpg', '/Componentes/Mouse/01_e.jpg', '/Componentes/Mouse/01_f.jpg', '/Componentes/Mouse/01_g.jpg', NULL, 13, 13001, 0.01),
(2, 'Mouse Fury Hustler RGB', 6100.00, 2, 'Fury', 1, 'Negro', 'USB cable', '7', 'Sí', 1.10, '/Componentes/Mouse/02_a.jpg', '/Componentes/Mouse/02_b.jpg', '/Componentes/Mouse/02_c.jpg', '/Componentes/Mouse/02_d.jpg', NULL, NULL, NULL, NULL, 13, 13002, 0.07),
(3, 'Mouse Gamer Inalámbrico Genesis Fury Tanto T4', 32200.00, 3, 'Genesis', 1, 'Blanco/Azul', 'Inalámbrica (2.4 GHz y Bluetooth 5.0) y cableada USB-C', '7 (programables)', 'No', 1.00, '/Componentes/Mouse/03_a.jpg', '/Componentes/Mouse/03_b.jpg', '/Componentes/Mouse/03_c.jpg', '/Componentes/Mouse/03_d.jpg', '/Componentes/Mouse/03_e.jpg', '/Componentes/Mouse/03_f.jpg', NULL, NULL, 13, 13003, 0.10),
(4, 'Mouse Logitech G502 HERO', 69200.00, 4, 'Logitech', 0, 'Negro', 'USB cable', '11 (Programables)', 'Sí', 1.00, '/Componentes/Mouse/04_a.jpg', '/Componentes/Mouse/04_b.jpg', '/Componentes/Mouse/04_c.jpg', '/Componentes/Mouse/04_d.jpg', NULL, NULL, NULL, NULL, 13, 13004, 0.20),
(5, 'Mouse Gamer Razer Basilisk V3 Pro 35k - Chroma RGB', 198200.00, 5, 'Razer', 0, 'Negro', 'Inalámbrica (Razer HyperSpeed Wireless y Bluetooth), Cableada USB Tipo-C', '11 (Programables)', 'Sí', 0.90, '/Componentes/Mouse/05_a.jpg', '/Componentes/Mouse/05_b.jpg', '/Componentes/Mouse/05_c.jpg', '/Componentes/Mouse/05_d.jpg', NULL, NULL, NULL, NULL, 13, 13005, 0.12),
(6, 'Mouse Logitech G502 X Plus Black', 198900.00, 6, 'Logitech', 0, 'Negro/Blanco', 'Wireless', '13', 'Sí', 1.20, '/Componentes/Mouse/06_a.jpg', '/Componentes/Mouse/06_b.jpg', '/Componentes/Mouse/06_c.jpg', '/Componentes/Mouse/06_d.jpg', '/Componentes/Mouse/06_e.jpg', '/Componentes/Mouse/06_f.jpg', '/Componentes/Mouse/06_g.jpg', '/Componentes/Mouse/06_h.jpg', 13, 13006, 0.21),
(7, 'Mouse Razer Viper V2 PRO Wireless', 236300.00, 7, 'Razer', 0, 'Negro', 'Inalámbrica (Razer HyperSpeed Wireless, USB-C)', '5 botones programables', 'No', 1.00, '/Componentes/Mouse/07_a.jpg', '/Componentes/Mouse/07_b.jpg', '/Componentes/Mouse/07_c.jpg', '/Componentes/Mouse/07_d.jpg', NULL, NULL, NULL, NULL, 13, 13007, 0.19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_notebook`
--

CREATE TABLE `computacion_notebook` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `envio_gratis` tinyint(1) NOT NULL,
  `sistema_operativo` varchar(50) NOT NULL,
  `usos` varchar(150) NOT NULL,
  `teclado_extra` varchar(50) NOT NULL,
  `almacenamiento` varchar(50) NOT NULL,
  `pantalla_tamanio` varchar(50) NOT NULL,
  `pantalla_tactil` varchar(50) NOT NULL,
  `pantalla_led` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `memoria_ram` varchar(100) NOT NULL,
  `gpu_dedicada` varchar(50) NOT NULL,
  `procesador` varchar(50) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_notebook`
--

INSERT INTO `computacion_notebook` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `envio_gratis`, `sistema_operativo`, `usos`, `teclado_extra`, `almacenamiento`, `pantalla_tamanio`, `pantalla_tactil`, `pantalla_led`, `memoria_ram`, `gpu_dedicada`, `procesador`, `foto1`, `foto2`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Lenovo IdeaPad 3', 1100000.00, 4, 'Lenovo', 1, 0, 'Windows', 'Diseño', 'No', '512 GB', '14\"', 'No', 'Si', '8 GB', 'No', 'AMD 5', 'Notebook/01_a.jpeg', 'Notebook/01_b.jpeg', 2, 2001, 1.2),
(2, 'Apple MacBook Air', 2200000.00, 3, 'Apple', 0, 0, 'MacOS', 'Diseño', 'No', '512 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'AMD 5', 'Notebook/02_a.jpeg', 'Notebook/02_b.jpeg', 2, 2002, 1.2),
(3, 'HP Pavilion 15', 1050000.00, 4, 'HP', 1, 0, 'Windows', 'Diseño', 'No', '512 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'AMD 7', 'Notebook/03_a.jpeg', 'Notebook/03_b.jpeg', 2, 2003, 1.2),
(4, 'Dell Vostro 3400', 980000.00, 5, 'Dell', 0, 0, 'Linux', 'Gamer', 'No', '512 GB', '15.6\"', 'No', 'Si', '16 GB', 'No', 'Intel Core i7', 'Notebook/04_a.jpeg', 'Notebook/04_b.jpeg', 2, 2004, 1.2),
(5, 'Samsung Chromebook', 870000.00, 4, 'Samsung', 1, 0, 'Chrome OS', 'Gamer', 'No', '512 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'Intel core i5', 'Notebook/05_a.jpeg', 'Notebook/05_b.jpeg', 2, 2005, 2.3),
(6, 'Acer Aspire 5', 940000.00, 4, 'Acer', 0, 0, 'Windows', 'Gamer', 'No', '256 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'Intel core i5', 'Notebook/06_a.jpeg', 'Notebook/06_b.jpeg', 2, 2006, 2.3),
(7, 'Asus VivoBook', 1020000.00, 4, 'Asus', 1, 0, 'Linux', 'Oficina', 'No', '512 GB', '15.6\"', 'No', 'Si', '16 GB', 'No', 'AMD 5', 'Notebook/07_a.jpeg', 'Notebook/07_b.jpeg', 2, 2007, 2.3),
(8, 'Dell Inspiron 15', 1200000.00, 4, 'Dell', 0, 0, 'Windows', 'Oficina', 'No', '512 GB', '15.6\"', 'No', 'Si', '16 GB', 'No', 'Intel core i7', 'Notebook/08_a.jpeg', 'Notebook/08_b.jpeg', 2, 2008, 2.00),
(9, 'Apple MacBook Pro', 2500000.00, 4, 'Apple', 1, 0, 'MacOS', 'Oficina', 'No', '240 GB', '14\"', 'No', 'Si', '8 GB', 'No', 'Intel core i5', 'Notebook/09_a.jpeg', 'Notebook/09_b.jpeg', 2, 2009, 2.00),
(10, 'Lenovo ThinkBook', 890000.00, 4, 'Lenovo', 0, 0, 'Windows', 'Oficina', 'No', '512 GB', '14\"', 'No', 'Si', '8 GB', 'No', 'AMD 5', 'Notebook/10_a.jpeg', 'Notebook/10_b.jpeg', 2, 2010, 2.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_paquete_office`
--

CREATE TABLE `computacion_paquete_office` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_paquete_office`
--

INSERT INTO `computacion_paquete_office` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `foto1`, `foto2`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Office LTSC 2024 Professional plus', 25000.00, 5, 'Microsoft', 0, '/Componentes/Office/01_a.jpg', '/Componentes/Office/01_b.jpg', 15, 15001, 0.00),
(2, 'Office 2024 Professional plus', 15000.00, 5, 'Microsoft', 0, '/Componentes/Office/02_a.png', NULL, 15, 15002, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_pcescritorio`
--

CREATE TABLE `computacion_pcescritorio` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `envio_gratis` tinyint(1) NOT NULL,
  `sistema_operativo` varchar(50) NOT NULL,
  `teclado_extra` varchar(50) NOT NULL,
  `usos` varchar(150) NOT NULL,
  `almacenamiento` varchar(50) NOT NULL,
  `pantalla_tamanio` varchar(50) NOT NULL,
  `pantalla_tactil` varchar(50) NOT NULL,
  `pantalla_led` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `memoria_ram` varchar(50) NOT NULL,
  `gpu_dedicada` varchar(50) NOT NULL,
  `procesador` varchar(50) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_pcescritorio`
--

INSERT INTO `computacion_pcescritorio` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `envio_gratis`, `sistema_operativo`, `teclado_extra`, `usos`, `almacenamiento`, `pantalla_tamanio`, `pantalla_tactil`, `pantalla_led`, `memoria_ram`, `gpu_dedicada`, `procesador`, `foto1`, `foto2`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Dell Inspiron 3880', 850000.00, 3, 'Dell', 1, 0, 'Windows', 'No', 'Diseño', '480 GB', '27\"', 'No', 'Si', '8 GB', 'No', 'Intel Core i7', 'CompuArmada/01_a.jpeg', 'CompuArmada/01_b.jpeg', 1, 1001, 6.64),
(2, 'Lenovo IdeaCentre 3', 750000.00, 4, 'Lenovo', 0, 0, 'Linux', 'No', 'Diseño', '1 TB', '21.5\"', 'Si', 'Si', '4 GB', 'No', 'AMD 5', 'CompuArmada/02_a.jpeg', 'CompuArmada/02_b.jpeg', 1, 1002, 7.50),
(3, 'HP Pavilion TP01', 920000.00, 3, 'HP', 1, 0, 'Windows', 'No', 'Diseño', '256 GB', '21.5\"', 'No', 'Si', '8 GB', 'No', 'Intel Core i5', 'CompuArmada/03_a.webp', 'CompuArmada/03_b.webp', 1, 1003, 7.00),
(4, 'Asus M32CD', 600000.00, 6, 'Asus', 0, 0, 'DOS', 'No', 'Gamer', '512 GB', '21.5\"', 'No', 'No', '16 GB', 'Si', 'AMD 5', 'CompuArmada/04_a.jpeg', 'CompuArmada/04_b.jpeg', 1, 1004, 7.00),
(5, 'Acer Aspire TC', 950000.00, 3, 'Asus', 1, 0, 'Windows', 'No', 'Gamer', '512 GB', '21.5\"', 'No', 'Si', '16 GB', 'Si', 'AMD 7', 'CompuArmada/05_a.jpeg', 'CompuArmada/05_b.jpeg', 1, 1005, 6.47),
(6, 'Samsung Desktop', 820000.00, 3, 'Samsung', 0, 0, 'Linux', 'No', 'Gamer', '512 GB', '21.5\"', 'No', 'Si', '16 GB', 'Si', 'AMD 7', 'CompuArmada/06_a.jpeg', 'CompuArmada/06_b.jpeg', 1, 1006, 8.00),
(7, 'Apple iMac', 1500000.00, 3, 'Apple', 0, 0, 'McOS', 'No', 'Oficina', '960 GB', '21.5\"', 'No', 'Si', '8 GB', 'Si', 'Intel Core i5', 'CompuArmada/07_a.jpeg', 'CompuArmada/07_b.jpeg', 1, 1007, 9.00),
(8, 'Dell G5', 890000.00, 5, 'Dell', 1, 0, 'Windows', 'No', 'Oficina', '240 GB', 'No', 'No', 'Si', '8 GB', 'No', 'Intel Core i5', 'CompuArmada/08_a.jpeg', 'CompuArmada/08_b.jpeg', 1, 1008, 10.00),
(9, 'Acer Chromebox', 680000.00, 3, 'Acer', 1, 0, 'Chrome OS', 'No', 'Oficina', '120 GB', '21.5\"', 'No', 'Si', '8 GB', 'No', 'Intel Core i3', 'CompuArmada/09_a.webp', 'CompuArmada/09_b.webp', 1, 1009, 11.00),
(10, 'HP Omen 30L', 950000.00, 6, 'HP', 0, 0, 'Windows', 'No', 'Oficina', '480 GB', '21.5\"', 'No', 'Si', '8 GB', 'No', 'Intel Core i7', 'CompuArmada/10_a.jpeg', 'CompuArmada/10_b.jpeg', 1, 1010, 12.72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_placa_wifi`
--

CREATE TABLE `computacion_placa_wifi` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `frecuencia` varchar(150) NOT NULL,
  `velocidad` varchar(100) NOT NULL,
  `consumo` decimal(5,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_placa_wifi`
--

INSERT INTO `computacion_placa_wifi` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `frecuencia`, `velocidad`, `consumo`, `foto1`, `foto2`, `foto3`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Placa de Red PCIe WIFI Tp-Link TL-WN881ND 2.4 Ghz 300Mbps', 16500.00, 4, 'Tp-Link', 1, '2.400-2.4835GHz', '11 Mbps - 300 Mbps', 2.00, '/Componentes/PlacaWifi/01_a.jpg', '/Componentes/PlacaWifi/01_b.jpg', '/Componentes/PlacaWifi/01_c.jpg', 16, 16001, 0.05),
(2, 'Placa de Red WIFI Usb Tp-Link Archer TX10UB Nano AX900 Dual Band 2.4/5Ghz - Wifi 6 + BT', 21500.00, 5, 'Tp-Link', 1, '2.400-2.4835GHz', 'Hasta 900 Mbps (600 Mbps @5 GHz + 300 Mbps @2.4 GHz)', 2.00, '/Componentes/PlacaWifi/02_a.jpg', '/Componentes/PlacaWifi/02_b.jpg', NULL, 16, 16002, 0.03),
(3, 'Placa de Red Usb WIFI Tp-Link Archer TXE50UH AXE3000 Triple Band High Gain 2.4/5/6Ghz - Wifi 6E', 14785.00, 5, 'Tp-Link', 1, '2.400-2.4835GHz', '2.4 GHz: hasta 574 Mbps / 5 GHz: hasta 1201 Mbps / 6 GHz: hasta 1201 Mbps', 3.00, '/Componentes/PlacaWifi/03_a.jpg', '/Componentes/PlacaWifi/03_b.jpg', NULL, 16, 16003, 0.04);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_ram`
--

CREATE TABLE `computacion_ram` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `capacidad_gb` int NOT NULL,
  `latencia` varchar(50) NOT NULL,
  `consumo` decimal(10,2) NOT NULL,
  `velocidad` int NOT NULL,
  `pin_de_memoria` varchar(150) NOT NULL,
  `disipador_de_calor` varchar(150) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_ram`
--

INSERT INTO `computacion_ram` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `tipo`, `capacidad_gb`, `latencia`, `consumo`, `velocidad`, `pin_de_memoria`, `disipador_de_calor`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Memoria Ram Sodimm Hiksemi 4GB 1600MHz DDR3', 11000.00, 1, 'Hiksemi', 1, 'DDR3', 4, 'CL11', 4.00, 1600, '204', 'No', '/Componentes/Ram/01_a.jpg', NULL, NULL, NULL, NULL, 6, 6001, 0.02),
(2, 'Memoria Ram Hiksemi 4GB 1600MHz DDR3', 12500.00, 2, 'Hiksemi', 1, 'DDR3', 4, 'No especificado', 4.00, 1600, '240', 'No', '/Componentes/Ram/02_a.jpg', NULL, NULL, NULL, NULL, 6, 6002, 0.02),
(3, 'Memoria Ram PNY Performance 4GB 2666MHz DDR4', 19400.00, 3, 'PNY', 1, 'DDR4', 4, 'CL19', 3.70, 2666, '288', 'No', '/Componentes/Ram/03_a.jpg', '/Componentes/Ram/03_b.jpg', '/Componentes/Ram/03_c.jpg', NULL, NULL, 6, 6003, 0.03),
(4, 'Memoria Ram Hiksemi Armor 8GB 3200MHz DDR4', 28600.00, 4, 'Hiksemi', 0, 'DDR4', 8, 'CL16', 3.80, 3200, '288', 'Sí', '/Componentes/Ram/04_a.jpg', NULL, NULL, NULL, NULL, 6, 6004, 0.04),
(5, 'Memoria Ram Sodimm Memox 8GB 3200MHz DDR4', 29800.00, 5, 'Memox', 0, 'DDR4', 8, 'CL22', 3.70, 3200, 'SODIMM DDR4, 260-pin', 'Sí', '/Componentes/Ram/05_a.jpg', NULL, NULL, NULL, NULL, 6, 6005, 0.03),
(6, 'Memoria Ram Hiksemi Armor White 8GB 3200MHz DDR4', 30300.00, 6, 'Hiksemi', 0, 'DDR4', 8, 'CL22', 3.70, 3200, '288', 'Sí, con disipador térmico blanco', '/Componentes/Ram/06_a.jpg', '/Componentes/Ram/06_b.jpg', NULL, NULL, NULL, 6, 6006, 0.04),
(7, 'Memoria Ram Hiksemi 8GB 5600MHz DDR5 (No Compatible Con Ryzen Serie 8000)', 34400.00, 7, 'Hiksemi', 0, 'DDR5', 8, 'CL46', 3.00, 5600, '288', 'No', '/Componentes/Ram/07_a.jpg', NULL, NULL, NULL, NULL, 6, 6007, 0.03),
(8, 'Memoria Ram Hiksemi Future RGB 8GB 3200MHz DDR4', 35900.00, 8, 'Hiksemi', 0, 'DDR4', 8, 'CL16', 3.50, 3200, '288', 'Sí', '/Componentes/Ram/08_a.jpg', '/Componentes/Ram/08_b.jpg', NULL, NULL, NULL, 6, 6008, 0.04),
(9, 'Memoria Ram Sodimm Hikvision 8GB 5600MHz DDR5', 37800.00, 9, 'Hikvision', 0, 'DDR5', 8, 'CL46', 3.00, 5600, '262', 'No', '/Componentes/Ram/09_a.jpg', NULL, NULL, NULL, '', 6, 6009, 0.03),
(10, 'Memoria Ram Sodimm Adata 8GB 5600MHz DDR5', 40200.00, 10, 'Adata', 0, 'DDR5', 8, 'CL46', 3.00, 5600, '262', 'No', '/Componentes/Ram/10_a.jpg', '/Componentes/Ram/10_b.jpg', NULL, NULL, NULL, 6, 6010, 0.03),
(11, 'Memoria Ram Adata XPG SPECTRIX D35G RGB 8GB 3200MHz DDR4', 42100.00, 11, 'Adata', 0, 'DDR4', 8, 'CL16', 3.00, 3200, '288', 'Sí', '/Componentes/Ram/11_a.jpg', '/Componentes/Ram/11_b.jpg', '/Componentes/Ram/11_c.jpg', NULL, NULL, 6, 6011, 0.04),
(12, 'Memoria RAM Crucial Basics 8GB 4800MHz DDR5', 45300.00, 12, 'Crucial', 0, 'DDR5', 8, 'CL40', 4.00, 4800, '288', 'No', '/Componentes/Ram/12_a.jpg', '/Componentes/Ram/12_b.jpg', '/Componentes/Ram/12_c.jpg', NULL, NULL, 6, 6012, 0.03),
(13, 'Memoria RAM Kingston Fury Beast 8GB 5600MHz CL36 DDR5 Black - AMD EXPO', 46300.00, 13, 'Kingston', 0, 'DDR5', 8, 'CL36', 3.60, 5600, '288', 'Sí', '/Componentes/Ram/13_a.jpg', '/Componentes/Ram/13_b.jpg', '/Componentes/Ram/13_c.jpg', NULL, NULL, 6, 6013, 0.03),
(14, 'Memoria Ram Kingston Fury Beast RGB 8GB 3200MHz DDR4', 60100.00, 14, 'Kingston', 0, 'DDR4', 8, 'CL16', 3.20, 3200, '288', 'Sí', '/Componentes/Ram/14_a.jpg', NULL, NULL, NULL, NULL, 6, 6014, 0.04),
(15, 'Memoria RAM Kingston Fury Beast 16GB 5200MHz RGB DDR5 CL36 Black - Amd Expo', 79500.00, 15, 'Kingston', 0, 'DDR5', 16, 'CL36', 3.10, 5200, '288', 'Sí', '/Componentes/Ram/15_a.jpg', '/Componentes/Ram/15_b.jpg', '/Componentes/Ram/15_c.jpg', NULL, NULL, 6, 6015, 0.06),
(16, 'Memoria RAM Kingston Fury Beast RGB 16GB 5200MHz DDR5 CL36 White - Amd Expo', 79500.00, 16, 'Kingston', 0, 'DDR5', 16, 'CL36', 3.50, 5200, '288', 'Sí', '/Componentes/Ram/16_a.jpg', '/Componentes/Ram/16_b.jpg', NULL, NULL, NULL, 6, 6016, 0.06),
(17, 'Memoria Ram Adata XPG Lancer RGB 16GB 6800MHz DDR5', 126000.00, 17, 'Adata', 0, 'DDR5', 16, 'CL36', 3.50, 6800, '288', 'Sí', '/Componentes/Ram/17_a.jpg', '/Componentes/Ram/17_b.jpg', NULL, NULL, NULL, 6, 6017, 0.06),
(18, 'Memoria Ram Kingston Fury Renegade RGB 16GB 6400MHz DDR5 - Silver/Black - CL32 XMP', 130000.00, 18, 'Kingston', 0, 'DDR5', 16, 'CL32', 4.00, 6400, '288', 'Sí, aluminio en color plata y negro con iluminación RGB', '/Componentes/Ram/18_a.jpg', '/Componentes/Ram/18_b.jpg', NULL, NULL, NULL, 6, 6018, 0.06),
(19, 'Memoria RAM Corsair Dominator Platinum 32GB RGB (2x16GB) 5600MHz DDR5', 211600.00, 19, 'Corsair', 0, 'DDR5', 32, 'CL36', 3.50, 5600, '288', 'Sí', '/Componentes/Ram/19_a.jpg', '/Componentes/Ram/19_b.jpg', '/Componentes/Ram/19_c.jpg', '/Componentes/Ram/19_d.jpg', '/Componentes/Ram/19_e.jpg', 6, 6019, 0.12),
(20, 'Memoria Ram Acer Predator Hermes 48GB (2x24GB) RGB 6800MHz DDR5 Black AMD EXPO - Intel XMP', 414100.00, 20, 'Acer', 0, 'DDR5', 48, 'CL36 (36-46-46-125)', 3.70, 6800, '288', 'Sí, aluminio negro con iluminación RGB', '/Componentes/Ram/20_a.jpg', '/Componentes/Ram/20_b.jpg', NULL, NULL, NULL, 6, 6020, 0.18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_sistema_operativo`
--

CREATE TABLE `computacion_sistema_operativo` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `detalle` varchar(150) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_sistema_operativo`
--

INSERT INTO `computacion_sistema_operativo` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `detalle`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Windows 10 Home', 150000.00, 3, 'Microsft', 0, 'Licencia digital OEM', '/Componentes/SO/02_a.jpg', '/Componentes/SO/02_b.jpg', '/Componentes/SO/02_c.png', '/Componentes/SO/02_d.png', NULL, 14, 14001, 0.00),
(2, 'Windows 10 Pro', 200000.00, 3, 'Microsft', 0, 'Licencia original', '/Componentes/SO/03_a.jpg', '/Componentes/SO/03_b.jpg', '/Componentes/SO/03_c.png', '/Componentes/SO/03_d.png', NULL, 14, 14002, 0.00),
(3, 'Windows 11 Home', 300000.00, 3, 'Microsft', 0, 'Single Language', '/Componentes/SO/04_a.webp', '/Componentes/SO/04_b.png', '/Componentes/SO/04_c.png', '/Componentes/SO/04_d.png', NULL, 14, 14003, 0.00),
(4, 'Windows 11 Pro', 350000.00, 3, 'Microsft', 0, 'Single Language', '/Componentes/SO/05_a.jpg', '/Componentes/SO/05_b.jpg', '/Componentes/SO/05_c.jpg', '/Componentes/SO/05_d.png', '/Componentes/SO/05_e.png', 14, 14004, 0.00),
(5, 'Ubuntu 22.04 LTS', 500000.00, 3, 'Ubuntu', 1, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/06_a.png', '/Componentes/SO/06_b.png', '/Componentes/SO/06_c.png', NULL, NULL, 14, 14005, 0.00),
(6, 'Ubuntu 24.04 LTS', 150000.00, 3, 'Ubuntu', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/07_a.png', '/Componentes/SO/07_b.png', '/Componentes/SO/07_c.png', '/Componentes/SO/07_d.jpg', NULL, 14, 14006, 0.00),
(7, 'Linux Mint', 500000.00, 3, 'Linux Mint', 1, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/08_a.jpg', NULL, NULL, NULL, NULL, 14, 14007, 0.00),
(8, 'Debian', 150000.00, 3, 'Debian', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/09_a.jpg', '/Componentes/SO/09_b.png', '/Componentes/SO/09_c.png', NULL, NULL, 14, 14008, 0.00),
(9, 'Fedora', 150000.00, 3, 'Fedora', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/10_a.jpg', '/Componentes/SO/10_b.jpg', NULL, NULL, NULL, 14, 14009, 0.00),
(10, 'Arch Linux', 150000.00, 3, 'Arch Linux', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/11_a.png', NULL, NULL, NULL, NULL, 14, 14010, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_subcategoria`
--

CREATE TABLE `computacion_subcategoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_subcategoria`
--

INSERT INTO `computacion_subcategoria` (`id`, `nombre`, `categoria_id`) VALUES
(1, 'PC Escritorio', 1),
(2, 'Notebook', 1),
(3, 'Motherboard', 2),
(4, 'Cpu', 2),
(5, 'Gpu', 2),
(6, 'Ram', 2),
(7, 'Cooler', 2),
(8, 'Disco', 2),
(9, 'Fuente', 2),
(10, 'Gabinete', 2),
(11, 'Teclado', 3),
(12, 'Monitor', 3),
(13, 'Mouse', 3),
(14, 'Sistema_Operativo', 6),
(15, 'Paquete_office', 6),
(16, 'placa_wifi', 2),
(17, 'Gamer', 9),
(18, 'Hogar y Oficina', 9),
(19, 'Diseño', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computacion_teclado`
--

CREATE TABLE `computacion_teclado` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `color` varchar(50) NOT NULL,
  `conexion` varchar(50) NOT NULL,
  `iluminacion` varchar(50) NOT NULL,
  `consumo` decimal(5,2) NOT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `foto6` varchar(100) DEFAULT NULL,
  `foto7` varchar(100) DEFAULT NULL,
  `subcategoria_id` bigint NOT NULL,
  `codigo` int NOT NULL,
  `peso` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `computacion_teclado`
--

INSERT INTO `computacion_teclado` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `color`, `conexion`, `iluminacion`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `foto6`, `foto7`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Teclado Logitech K120 Usb', 24786.00, 5, 'Logitech', 0, 'Negro', 'USB cable', 'No', 0.20, 'Componentes/Teclado/01_a.jpg', 'Componentes/Teclado/01_b.jpg', 'Componentes/Teclado/01_c.jpg', 'Componentes/Teclado/01_d.jpg', 'Componentes/Teclado/01_e.jpg', NULL, NULL, 11, 11001, 0.20),
(2, 'Teclado Genesis RHOD 350 RGB Español', 12300.00, 4, 'Genesis', 0, 'GriGrafitos', 'USB cable', 'Si', 0.30, 'Componentes/Teclado/02_a.jpg', 'Componentes/Teclado/02_b.jpg', 'Componentes/Teclado/02_c.jpg', 'Componentes/Teclado/02_d.jpg', 'Componentes/Teclado/02_e.jpg', 'Componentes/Teclado/02_f.jpg', 'Componentes/Teclado/02_g.jpg', 11, 11002, 0.30),
(3, 'Teclado Logitech K270 Inalámbrico Graphite', 24786.00, 7, 'Logitech', 0, 'Grafito', 'Dongle USB-A wireless', 'No', 0.10, 'Componentes/Teclado/03_a.jpg', 'Componentes/Teclado/03_b.jpg', 'Componentes/Teclado/03_c.jpg', NULL, NULL, NULL, NULL, 11, 11003, 0.10),
(4, 'Teclado Mecanico Redragon FIDD K683WBO RGB Switch Magnetico Hall Wired Usb Tipo C', 79400.00, 5, 'Redragon', 1, 'Blanco, Naranja y Gris', 'USB cable', 'Si', 25.00, 'Componentes/Teclado/04_a.jpg', 'Componentes/Teclado/04_b.jpg', 'Componentes/Teclado/04_c.jpg', 'Componentes/Teclado/04_d.jpg', 'Componentes/Teclado/04_e.jpg', 'Componentes/Teclado/04_f.jpg', NULL, 11, 11004, 0.45),
(5, 'Teclado Razer BlackWidow V4 Mechanical Yellow Switch US Layout', 218200.00, 5, 'Razer', 1, 'Grafito', 'Cable USB-C desmontable', 'Chroma RGB por tecla + underglow lateral', 4.50, 'Componentes/Teclado/05_a.jpg', 'Componentes/Teclado/05_b.jpg', 'Componentes/Teclado/05_c.jpg', 'Componentes/Teclado/05_d.jpg', NULL, NULL, NULL, 11, 11005, 0.30),
(6, 'Teclado Logitech Pro X TKL Magenta Lightspeed inalambrico', 303800.00, 8, 'Logitech', 0, 'Magenta', 'Lightspeed 1 ms / Bluetooth / USB-C', 'No', 2.50, 'Componentes/Teclado/06_a.jpg', 'Componentes/Teclado/06_b.jpg', NULL, NULL, NULL, NULL, NULL, 11, 11006, 0.25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(35, 'carrito', 'carritoitem'),
(42, 'carrito', 'localidadargentina'),
(34, 'carrito', 'producto'),
(7, 'computacion', 'categoria'),
(23, 'computacion', 'cooler'),
(22, 'computacion', 'cpu'),
(21, 'computacion', 'disco'),
(20, 'computacion', 'fuente'),
(19, 'computacion', 'gabinete'),
(18, 'computacion', 'gpu'),
(17, 'computacion', 'monitor'),
(16, 'computacion', 'motherboard'),
(15, 'computacion', 'mouse'),
(14, 'computacion', 'notebook'),
(13, 'computacion', 'paquete_office'),
(12, 'computacion', 'pcescritorio'),
(11, 'computacion', 'placa_wifi'),
(10, 'computacion', 'ram'),
(9, 'computacion', 'sistema_operativo'),
(8, 'computacion', 'subcategoria'),
(24, 'computacion', 'teclado'),
(5, 'contenttypes', 'contenttype'),
(32, 'encuesta', 'encuesta'),
(33, 'encuesta', 'resultado'),
(36, 'productos', 'producto'),
(40, 'proveedor', 'proveedores'),
(6, 'sessions', 'session'),
(39, 'usuario', 'favoritoproducto'),
(38, 'usuario', 'interes'),
(28, 'usuario', 'menu'),
(30, 'usuario', 'menurol'),
(37, 'usuario', 'perfil'),
(29, 'usuario', 'rol'),
(41, 'usuario', 'usuarioextra'),
(31, 'usuario', 'usuariorol'),
(27, 'venta', 'detalleventa'),
(26, 'venta', 'qrventa'),
(25, 'venta', 'venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-10 20:52:05.324299'),
(2, 'auth', '0001_initial', '2025-10-10 20:52:07.646091'),
(3, 'admin', '0001_initial', '2025-10-10 20:52:08.422547'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-10 20:52:08.457841'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-10 20:52:08.498194'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-10 20:52:08.831678'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-10 20:52:09.045934'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-10 20:52:09.145287'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-10 20:52:09.186849'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-10 20:52:09.431236'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-10 20:52:09.437948'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-10 20:52:09.456600'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-10 20:52:09.661856'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-10 20:52:09.906782'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-10 20:52:10.004162'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-10 20:52:10.055374'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-10 20:52:10.321836'),
(18, 'carrito', '0001_initial', '2025-10-10 20:52:10.944581'),
(19, 'computacion', '0001_initial', '2025-10-10 20:52:16.712634'),
(20, 'encuesta', '0001_initial', '2025-10-10 20:52:16.884907'),
(21, 'encuesta', '0002_initial', '2025-10-10 20:52:17.475328'),
(22, 'productos', '0001_initial', '2025-10-10 20:52:17.581143'),
(23, 'sessions', '0001_initial', '2025-10-10 20:52:17.744380'),
(24, 'usuario', '0001_initial', '2025-10-10 20:52:19.100642'),
(25, 'venta', '0001_initial', '2025-10-10 20:52:20.321494'),
(26, 'computacion', '0002_remove_fuente_foto_fuente_foto1_fuente_foto2_and_more', '2025-10-11 00:19:38.678827'),
(27, 'carrito', '0002_carritoitem_content_type_carritoitem_object_id', '2025-10-22 02:10:32.679338'),
(28, 'usuario', '0002_remove_menurol_menu_remove_menurol_rol_and_more', '2025-10-22 02:10:35.504861'),
(29, 'computacion', '0002_alter_gabinete_alto_alter_gabinete_ancho_and_more', '2025-10-22 17:55:59.691367'),
(30, 'usuario', '0003_alter_perfil_biografia', '2025-10-23 14:38:10.628458'),
(31, 'usuario', '0004_rename_usuario_perfil_user', '2025-10-27 03:25:38.031980'),
(32, 'proveedor', '0001_initial', '2025-10-29 00:24:43.861340'),
(33, 'carrito', '0002_localidadargentina', '2025-10-30 13:32:52.159075'),
(34, 'usuario', '0005_usuarioextra', '2025-10-30 13:32:52.351314');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_encuesta`
--

CREATE TABLE `encuesta_encuesta` (
  `id` bigint NOT NULL,
  `fecha` date NOT NULL,
  `usuario_id` int NOT NULL,
  `resultado_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_resultado`
--

CREATE TABLE `encuesta_resultado` (
  `id` bigint NOT NULL,
  `puntaje` int NOT NULL,
  `comentario` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades_argentina`
--

CREATE TABLE `localidades_argentina` (
  `id` bigint NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `costo_envio` decimal(8,2) NOT NULL,
  `latitud` decimal(6,4) NOT NULL,
  `longitud` decimal(6,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `localidades_argentina`
--

INSERT INTO `localidades_argentina` (`id`, `provincia`, `localidad`, `codigo_postal`, `costo_envio`, `latitud`, `longitud`) VALUES
(1, 'Buenos Aires', 'La Plata', '1900', 5226.17, -34.9211, -57.9544),
(2, 'Buenos Aires', 'Mar del Plata', '7600', 4976.06, -38.0000, -57.5500),
(3, 'Buenos Aires', 'Bahía Blanca', '8000', 2621.63, -38.7167, -62.2667),
(4,'Buenos Aires', 'Tandil', '7000', 4225.30, -37.3217, -59.1332),
(5, 'Buenos Aires', 'Olavarría', '7400', 3780.53, -36.8927, -60.3225),
(6, 'Córdoba', 'Córdoba ciudad', '5000', 5031.10, -31.4167, -64.1833),
(7, 'Córdoba', 'Villa Carlos Paz', '5152', 4951.73, -31.4241, -64.4978),
(8, 'Córdoba', 'Río Cuarto', '5800', 4090.56, -33.1330, -64.3500),
(9, 'Mendoza', 'Mendoza ciudad', '5500', 3492.80, -32.8884, -68.8388),
(10, 'Mendoza', 'San Rafael', '5600', 2550.70, -34.5880, -68.2855),
(11, 'Mendoza', 'Godoy Cruz', '5501', 3481.42, -32.9253, -68.8440),
(12, 'San Luis', 'San Luis ciudad', '5700', 3346.08, -32.5000, -65.7800),
(13, 'San Luis', 'Villa Mercedes', '5730', 2710.15, -33.7000, -65.4300),
(14, 'La Pampa', 'Santa Rosa', '6300', 2267.45, -36.6167, -64.2833),
(15, 'La Pampa', 'General Pico', '6360', 2838.16, -35.6400, -63.7600),
(16, 'Neuquén', 'Neuquén ciudad', '8300', 100.00, -38.9516, -68.0591),
(17, 'Río Negro', 'Cipolletti', '8322', 103.33, -38.9500, -67.9900),
(18, 'Río Negro', 'Viedma', '8500', 216.10, -40.8000, -62.9890),
(19, 'Río Negro', 'General Roca', '8332', 127.41, -39.0340, -67.5710),
(20, 'Río Negro', 'Bariloche', '8400', 403.58, -41.1333, -71.3085),
(21, 'Santa Cruz', 'Río Gallegos', '9400', 1381.08, -51.6230, -69.2168),
(22, 'Tierra del Fuego', 'Río Grande', '9410', 1725.64, -53.7877, -67.7095),
(23, 'Salta', 'Salta ciudad', '4400', 8890.07, -24.8065, -65.4200),
(24, 'Jujuy', 'San Salvador de Jujuy', '4600', 9167.25, -24.1850, -65.3022),
(25, 'Tucumán', 'San Miguel de Tucumán', '4000', 7486.52, -26.8241, -65.2226),
(26, 'Chaco', 'Resistencia', '3500', 8130.74, -27.4516, -58.9861),
(27, 'Entre Ríos', 'Paraná', '3100', 5560.50, -31.7333, -60.5333),
(28, 'Santa Fe', 'Santa Fe ciudad', '3000', 5520.50, -31.6333, -60.7000),
(29, 'Santa Fe', 'Rosario', '2000', 4937.70, -32.9500, -60.6667),
(30, 'La Rioja', 'La Rioja ciudad', '5300', 5568.22, -29.4116, -66.8500),
(31, 'San Juan', 'San Juan ciudad', '5400', 4336.46, -31.5360, -68.5261),
(32, 'Neuquén', 'Plottier', '8316', 103.71, -38.9967, -68.2744),
(33, 'Río Negro', 'Allen', '8328', 103.82, -38.9514, -67.5732);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_producto`
--

CREATE TABLE `productos_producto` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext,
  `precio` decimal(10,2) NOT NULL,
  `stock` int UNSIGNED NOT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_proveedores`
--

CREATE TABLE `proveedor_proveedores` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `cuit` varchar(150) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor_proveedores`
--

INSERT INTO `proveedor_proveedores` (`id`, `nombre`, `contacto`, `telefono`, `email`, `cuit`, `activo`, `categoria`) VALUES
(1, 'TechDistribuidora SA', 'Juan Pérez', '+54 11 4567-8900', 'ventas@techdist.com', '20-12345678-9', 1, 'hardware'),
(2, 'Componentes Pro', 'María González', '+54 11 5678-9012', 'info@componentespro.com', '30-98765432-1', 0, 'hardware'),
(3, 'Periféricos Import', 'Carlos Rodríguez', '+54 11 6789-0123', 'contacto@perifimport.com', '27-45678901-2', 0, 'hardware'),
(4, 'Embalajes del Sur', 'Ana Martínez', '+54 11 7890-1234', 'ventas@embalajesur.com', '33-23456789-0', 1, 'otros'),
(5, 'Logística Express', 'Roberto Silva', '+54 11 8901-2345', 'info@logexpress.com', '30-34567890-1', 0, 'otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_favoritoproducto`
--

CREATE TABLE `usuario_favoritoproducto` (
  `id` bigint NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `perfil_id` bigint NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_interes`
--

CREATE TABLE `usuario_interes` (
  `id` bigint NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `perfil_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_interes`
--

INSERT INTO `usuario_interes` (`id`, `nombre`, `perfil_id`) VALUES
(4, 'Café y largas sesiones de código', 1),
(1, 'Desarrollo web con Django y React', 1),
(2, 'Optimización de rendimiento en hardware', 1),
(3, 'Videojuegos retro', 1),
(6, 'Automatización con Python', 2),
(5, 'Diseño de interfaces con React y Figma', 2),
(7, 'Fotografía digital', 2),
(8, 'Música electrónica', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_perfil`
--

CREATE TABLE `usuario_perfil` (
  `id` bigint NOT NULL,
  `biografia` longtext,
  `avatar` varchar(100) DEFAULT NULL,
  `experiencia` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_perfil`
--

INSERT INTO `usuario_perfil` (`id`, `biografia`, `avatar`, `experiencia`, `user_id`) VALUES
(1, 'Apasionado por la programación y el hardware. Siempre buscando optimizar código y armar la PC perfecta.', '/Usuarios/lolo.webp', 'Desarrollador autodidacta con proyectos en Python.', 1),
(2, 'Entusiasta de la tecnología y la programación. Ama combinar creatividad y lógica en cada proyecto.', '/Usuarios/lulu.jpg', 'Desarrolladora full stack.', 2),
(3, NULL, '', 'principiante', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuarioextra`
--

CREATE TABLE `usuario_usuarioextra` (
  `id` bigint NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `usuario_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_usuarioextra`
--

INSERT INTO `usuario_usuarioextra` (`id`, `codigo_postal`, `usuario_id`) VALUES
(1, '8500', 2),
(2, '9410', 3),
(3, '8300', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalleventa`
--

CREATE TABLE `venta_detalleventa` (
  `id` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `content_type_id` int NOT NULL,
  `venta_id` bigint NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_qrventa`
--

CREATE TABLE `venta_qrventa` (
  `id` bigint NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `venta_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_venta`
--

CREATE TABLE `venta_venta` (
  `id` bigint NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `cliente_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `carrito_carritoitem`
--
ALTER TABLE `carrito_carritoitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario` (`usuario_id`),
  ADD KEY `fk_content_type` (`content_type_id`);

--
-- Indices de la tabla `carrito_producto`
--
ALTER TABLE `carrito_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `computacion_categoria`
--
ALTER TABLE `computacion_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `computacion_cooler`
--
ALTER TABLE `computacion_cooler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_cooler_subcategoria_id_f34bff56_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_cpu`
--
ALTER TABLE `computacion_cpu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_cpu_subcategoria_id_6f0ca531_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_disco`
--
ALTER TABLE `computacion_disco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_disco_subcategoria_id_66cbbcec_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_fuente`
--
ALTER TABLE `computacion_fuente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_fuente_subcategoria_id_7d0c4604_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_gabinete`
--
ALTER TABLE `computacion_gabinete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_gabinete_subcategoria_id_df16538e_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_gpu`
--
ALTER TABLE `computacion_gpu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_gpu_subcategoria_id_1cde7b3a_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_monitor`
--
ALTER TABLE `computacion_monitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_monitor_subcategoria_id_798321df_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_motherboard`
--
ALTER TABLE `computacion_motherboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_motherbo_subcategoria_id_a9d7b672_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_mouse`
--
ALTER TABLE `computacion_mouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_mouse_subcategoria_id_8fbcb075_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_notebook`
--
ALTER TABLE `computacion_notebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_notebook_subcategoria_id_8df690aa_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_paquete_office`
--
ALTER TABLE `computacion_paquete_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_paquete__subcategoria_id_1f86c7c5_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_pcescritorio`
--
ALTER TABLE `computacion_pcescritorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_pcescrit_subcategoria_id_13cf0c79_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_placa_wifi`
--
ALTER TABLE `computacion_placa_wifi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_placa_wi_subcategoria_id_47a2ffad_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_ram`
--
ALTER TABLE `computacion_ram`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_ram_subcategoria_id_1ca43f7f_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_sistema_operativo`
--
ALTER TABLE `computacion_sistema_operativo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_sistema__subcategoria_id_b4455f2b_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `computacion_subcategoria`
--
ALTER TABLE `computacion_subcategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_subcateg_categoria_id_d4bd0610_fk_computaci` (`categoria_id`);

--
-- Indices de la tabla `computacion_teclado`
--
ALTER TABLE `computacion_teclado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computacion_teclado_subcategoria_id_9a883537_fk_computaci` (`subcategoria_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `encuesta_encuesta`
--
ALTER TABLE `encuesta_encuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encuesta_encuesta_usuario_id_dd006a7a_fk_auth_user_id` (`usuario_id`),
  ADD KEY `encuesta_encuesta_resultado_id_16784275_fk_encuesta_resultado_id` (`resultado_id`);

--
-- Indices de la tabla `encuesta_resultado`
--
ALTER TABLE `encuesta_resultado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidades_argentina`
--
ALTER TABLE `localidades_argentina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_producto`
--
ALTER TABLE `productos_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor_proveedores`
--
ALTER TABLE `proveedor_proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_favoritoproducto`
--
ALTER TABLE `usuario_favoritoproducto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_favoritoproducto_perfil_id_content_type_i_8bd2f611_uniq` (`perfil_id`,`content_type_id`,`object_id`),
  ADD KEY `usuario_favoritoprod_content_type_id_45a7caf7_fk_django_co` (`content_type_id`);

--
-- Indices de la tabla `usuario_interes`
--
ALTER TABLE `usuario_interes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_interes_perfil_id_nombre_8bd01d08_uniq` (`perfil_id`,`nombre`);

--
-- Indices de la tabla `usuario_perfil`
--
ALTER TABLE `usuario_perfil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`user_id`);

--
-- Indices de la tabla `usuario_usuarioextra`
--
ALTER TABLE `usuario_usuarioextra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `venta_detalleventa`
--
ALTER TABLE `venta_detalleventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_detalleventa_content_type_id_2c2f78c3_fk_django_co` (`content_type_id`),
  ADD KEY `venta_detalleventa_venta_id_66610f20_fk_venta_venta_id` (`venta_id`);

--
-- Indices de la tabla `venta_qrventa`
--
ALTER TABLE `venta_qrventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_qrventa_venta_id_748c3ab0_fk_venta_venta_id` (`venta_id`);

--
-- Indices de la tabla `venta_venta`
--
ALTER TABLE `venta_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_venta_cliente_id_ccc2a041_fk_auth_user_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito_carritoitem`
--
ALTER TABLE `carrito_carritoitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `carrito_producto`
--
ALTER TABLE `carrito_producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `computacion_categoria`
--
ALTER TABLE `computacion_categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `computacion_cooler`
--
ALTER TABLE `computacion_cooler`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_cpu`
--
ALTER TABLE `computacion_cpu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_disco`
--
ALTER TABLE `computacion_disco`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `computacion_fuente`
--
ALTER TABLE `computacion_fuente`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `computacion_gabinete`
--
ALTER TABLE `computacion_gabinete`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_gpu`
--
ALTER TABLE `computacion_gpu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_monitor`
--
ALTER TABLE `computacion_monitor`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `computacion_motherboard`
--
ALTER TABLE `computacion_motherboard`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_mouse`
--
ALTER TABLE `computacion_mouse`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `computacion_notebook`
--
ALTER TABLE `computacion_notebook`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_paquete_office`
--
ALTER TABLE `computacion_paquete_office`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `computacion_pcescritorio`
--
ALTER TABLE `computacion_pcescritorio`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_placa_wifi`
--
ALTER TABLE `computacion_placa_wifi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `computacion_ram`
--
ALTER TABLE `computacion_ram`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `computacion_sistema_operativo`
--
ALTER TABLE `computacion_sistema_operativo`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `computacion_subcategoria`
--
ALTER TABLE `computacion_subcategoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `computacion_teclado`
--
ALTER TABLE `computacion_teclado`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `encuesta_encuesta`
--
ALTER TABLE `encuesta_encuesta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `encuesta_resultado`
--
ALTER TABLE `encuesta_resultado`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidades_argentina`
--
ALTER TABLE `localidades_argentina`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `productos_producto`
--
ALTER TABLE `productos_producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_proveedores`
--
ALTER TABLE `proveedor_proveedores`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario_favoritoproducto`
--
ALTER TABLE `usuario_favoritoproducto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_interes`
--
ALTER TABLE `usuario_interes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario_perfil`
--
ALTER TABLE `usuario_perfil`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_usuarioextra`
--
ALTER TABLE `usuario_usuarioextra`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta_detalleventa`
--
ALTER TABLE `venta_detalleventa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_qrventa`
--
ALTER TABLE `venta_qrventa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_venta`
--
ALTER TABLE `venta_venta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `carrito_carritoitem`
--
ALTER TABLE `carrito_carritoitem`
  ADD CONSTRAINT `fk_content_type` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `computacion_cooler`
--
ALTER TABLE `computacion_cooler`
  ADD CONSTRAINT `computacion_cooler_subcategoria_id_f34bff56_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_cpu`
--
ALTER TABLE `computacion_cpu`
  ADD CONSTRAINT `computacion_cpu_subcategoria_id_6f0ca531_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_disco`
--
ALTER TABLE `computacion_disco`
  ADD CONSTRAINT `computacion_disco_subcategoria_id_66cbbcec_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_fuente`
--
ALTER TABLE `computacion_fuente`
  ADD CONSTRAINT `computacion_fuente_subcategoria_id_7d0c4604_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_gabinete`
--
ALTER TABLE `computacion_gabinete`
  ADD CONSTRAINT `computacion_gabinete_subcategoria_id_df16538e_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_gpu`
--
ALTER TABLE `computacion_gpu`
  ADD CONSTRAINT `computacion_gpu_subcategoria_id_1cde7b3a_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_monitor`
--
ALTER TABLE `computacion_monitor`
  ADD CONSTRAINT `computacion_monitor_subcategoria_id_798321df_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_motherboard`
--
ALTER TABLE `computacion_motherboard`
  ADD CONSTRAINT `computacion_motherbo_subcategoria_id_a9d7b672_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_mouse`
--
ALTER TABLE `computacion_mouse`
  ADD CONSTRAINT `computacion_mouse_subcategoria_id_8fbcb075_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_notebook`
--
ALTER TABLE `computacion_notebook`
  ADD CONSTRAINT `computacion_notebook_subcategoria_id_8df690aa_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_paquete_office`
--
ALTER TABLE `computacion_paquete_office`
  ADD CONSTRAINT `computacion_paquete__subcategoria_id_1f86c7c5_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_pcescritorio`
--
ALTER TABLE `computacion_pcescritorio`
  ADD CONSTRAINT `computacion_pcescrit_subcategoria_id_13cf0c79_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_placa_wifi`
--
ALTER TABLE `computacion_placa_wifi`
  ADD CONSTRAINT `computacion_placa_wi_subcategoria_id_47a2ffad_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_ram`
--
ALTER TABLE `computacion_ram`
  ADD CONSTRAINT `computacion_ram_subcategoria_id_1ca43f7f_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_sistema_operativo`
--
ALTER TABLE `computacion_sistema_operativo`
  ADD CONSTRAINT `computacion_sistema__subcategoria_id_b4455f2b_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `computacion_subcategoria`
--
ALTER TABLE `computacion_subcategoria`
  ADD CONSTRAINT `computacion_subcateg_categoria_id_d4bd0610_fk_computaci` FOREIGN KEY (`categoria_id`) REFERENCES `computacion_categoria` (`id`);

--
-- Filtros para la tabla `computacion_teclado`
--
ALTER TABLE `computacion_teclado`
  ADD CONSTRAINT `computacion_teclado_subcategoria_id_9a883537_fk_computaci` FOREIGN KEY (`subcategoria_id`) REFERENCES `computacion_subcategoria` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `encuesta_encuesta`
--
ALTER TABLE `encuesta_encuesta`
  ADD CONSTRAINT `encuesta_encuesta_resultado_id_16784275_fk_encuesta_resultado_id` FOREIGN KEY (`resultado_id`) REFERENCES `encuesta_resultado` (`id`),
  ADD CONSTRAINT `encuesta_encuesta_usuario_id_dd006a7a_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `usuario_favoritoproducto`
--
ALTER TABLE `usuario_favoritoproducto`
  ADD CONSTRAINT `usuario_favoritoprod_content_type_id_45a7caf7_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `usuario_favoritoproducto_perfil_id_53bf440b_fk_usuario_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `usuario_perfil` (`id`);

--
-- Filtros para la tabla `usuario_interes`
--
ALTER TABLE `usuario_interes`
  ADD CONSTRAINT `usuario_interes_perfil_id_248aa740_fk_usuario_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `usuario_perfil` (`id`);

--
-- Filtros para la tabla `usuario_perfil`
--
ALTER TABLE `usuario_perfil`
  ADD CONSTRAINT `usuario_perfil_user_id_8bc186fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `usuario_usuarioextra`
--
ALTER TABLE `usuario_usuarioextra`
  ADD CONSTRAINT `usuario_usuarioextra_usuario_id_3c7b9629_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `venta_detalleventa`
--
ALTER TABLE `venta_detalleventa`
  ADD CONSTRAINT `venta_detalleventa_content_type_id_2c2f78c3_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `venta_detalleventa_venta_id_66610f20_fk_venta_venta_id` FOREIGN KEY (`venta_id`) REFERENCES `venta_venta` (`id`);

--
-- Filtros para la tabla `venta_qrventa`
--
ALTER TABLE `venta_qrventa`
  ADD CONSTRAINT `venta_qrventa_venta_id_748c3ab0_fk_venta_venta_id` FOREIGN KEY (`venta_id`) REFERENCES `venta_venta` (`id`);

--
-- Filtros para la tabla `venta_venta`
--
ALTER TABLE `venta_venta`
  ADD CONSTRAINT `venta_venta_cliente_id_ccc2a041_fk_auth_user_id` FOREIGN KEY (`cliente_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
