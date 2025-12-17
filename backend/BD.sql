CREATE TABLE `computacion_categoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `computacion_subcategoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `peso` decimal(4,2) NOT NULL,
  `realidadAumentada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `peso` decimal(4,2) NOT NULL,
  `realidadAumentada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `computacion_fuente` (
  `id` bigint NOT NULL,
  `nombre` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  `oferta` tinyint(1) NOT NULL,
  `potencia_nominal` decimal(7,2) NOT NULL,
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

CREATE TABLE `localidades_argentina` (
  `id` bigint NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `costo_envio` decimal(8,2) NOT NULL,
  `latitud` decimal(6,4) NOT NULL,
  `longitud` decimal(6,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `usuario_interes` (
  `id` bigint NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `perfil_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario_perfil` (
  `id` bigint NOT NULL,
  `biografia` longtext,
  `avatar` varchar(100) DEFAULT NULL,
  `experiencia` varchar(255) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario_usuarioextra` (
  `id` bigint NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `usuario_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





















INSERT INTO `computacion_categoria` (`id`, `nombre`) VALUES
(1, 'Computadoras'),
(2, 'Hardware'),
(3, 'Perifericos'),
(4, 'Armar tu PC'),
(5, 'Contacto'),
(6, 'Software'),
(7, 'Ofertas'),
(8, 'Tu PC Ideal'),
(9, 'Uso');

INSERT INTO `computacion_subcategoria` (`id`, `nombre`, `categoria_id`) VALUES
(1, 'PC Escritorio', 1),
(2, 'Notebook', 1),
(3, 'Motherboard', 2),
(4, 'Cpu', 2),
(5, 'Gpu', 2),
(6, 'Ram', 2),
(7, 'Cooler', 3),
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

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$IcpPpMSE43ctg5aWuoyFKQ$SuDiA0Fx0Ds9QtOI0Op2mi1nrsKm6X1Yro8jPVrCI+4=', NULL, 1, 'lolo', 'pablo', 'urra', 'p@g.com', 1, 1, '2025-10-11 20:00:25.495499'),
(2, 'pbkdf2_sha256$870000$5bAuRJ7matBzo8wOM1nFhz$SxmoqdWWv4ZwP0Htk9yjmyrHYbQgPw62m0lB5JN9n9I=', NULL, 0, 'lulu', 'erica', 'cabezas', 'e@g.com', 0, 1, '2025-10-11 20:01:21.429203'),
(3, 'pbkdf2_sha256$870000$4H0xbTsGIuDL2Qg2MLDljc$IwLR2O/+z5RDjEfkW+v5lCfrYesuVRHHjuzqHZZArmg=', NULL, 0, 'lele', 'leandro', 'Gonzales', 'l@g.com', 0, 1, '2025-10-27 03:14:11.379443'),
(4, 'pbkdf2_sha256$1000000$1h5sOy4bOeKvBooHtYhtH2$pYtHT0XcJlyz2u7FidIKmgwIgMEO9QNmgH2UbcrFVHc=', NULL, 0, 'lala', 'lala', 'lala', 'lala@lala.com', 0, 1, '2025-11-10 20:54:11.924263');

INSERT INTO `computacion_pcescritorio` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `envio_gratis`, `sistema_operativo`, `teclado_extra`, `usos`, `almacenamiento`, `pantalla_tamanio`, `pantalla_tactil`, `pantalla_led`, `memoria_ram`, `gpu_dedicada`, `procesador`, `foto1`, `foto2`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Mini PC ASUS - (SIN MEMORIA DDR4 Y DISCO)', 274000.00, 100, 'Asus', 0, 0, 'Sin SO', 'No', 'Oficina', '0 GB', 'No', 'No', 'No', '0 GB', 'No', 'Intel Celeron N4505', 'CompuArmada/11_a.webp', 'CompuArmada/11_b.webp', 1, 1001, 1.2),
(2, 'AMD Athlon 3000G', 343301.00, 100, 'AMD', 0, 0, 'Windows 11', 'Si', 'Oficina', '240 GB', 'No', 'No', 'No', '8 GB', 'No', 'AMD Athlon 3000G', 'CompuArmada/12_a.webp', 'CompuArmada/12_b.webp', 1, 1002, 3.5),
(3, 'Intel Celeron G5925', 423646.00, 100, 'Intel', 0, 0, 'Windows 10', 'Si', 'Oficina', '480 GB', 'No', 'No', 'No', '8 GB', 'No', 'Intel Celeron G5925', 'CompuArmada/13_a.webp', 'CompuArmada/13_b.webp', 1, 1003, 3.6),
(4, 'AMD Ryzen 3 5300G', 501900.00, 100, 'AMD', 0, 0, 'Sin SO', 'No', 'Oficina', '512 GB', 'No', 'No', 'No', '16 GB', 'No', 'AMD Ryzen 3 5300G', 'CompuArmada/14_a.webp', 'CompuArmada/14_b.webp', 1, 1004, 4.0),
(5, 'Asus M32CD', 600000.00, 6, 'Asus', 0, 0, 'DOS', 'No', 'Gamer', '512 GB', '21.5\"', 'No', 'No', '16 GB', 'Si', 'AMD 5', 'CompuArmada/04_a.jpeg', 'CompuArmada/04_b.jpeg', 1, 1005, 7.00),
(6, 'AMD Ryzen 5 5600GT', 610700.00, 100, 'AMD', 0, 0, 'Windows 11', 'Si', 'Diseño', '512 GB', 'No', 'Si', 'Si', '16 GB', 'AMD Radeon RX 5600', 'AMD Ryzen 5 5600GT', 'CompuArmada/15_a.webp', 'CompuArmada/15_b.webp', 1, 1006, 4.2),
(7, 'AMD Ryzen 7 5700G', 646200.00, 100, 'AMD', 0, 0, 'Windows 11', 'Si', 'Diseño', '500 GB', 'No', 'Si', 'Si', '16 GB', 'No', 'AMD Ryzen 7 5700G', 'CompuArmada/16_a.webp', 'CompuArmada/16_b.webp', 1, 1007, 4.5),
(8, 'Acer Chromebox', 680000.00, 3, 'Acer', 1, 0, 'Chrome OS', 'No', 'Oficina', '120 GB', '21.5\"', 'No', 'Si', '8 GB', 'No', 'Intel Core i3', 'CompuArmada/09_a.webp', 'CompuArmada/09_b.webp', 1, 1008, 11.00),
(9, 'Lenovo IdeaCentre 3', 750000.00, 4, 'Lenovo', 0, 0, 'Linux', 'No', 'Diseño', '1 TB', '21.5\"', 'Si', 'Si', '4 GB', 'No', 'AMD 5', 'CompuArmada/02_a.jpeg', 'CompuArmada/02_b.jpeg', 1, 1009, 7.50),
(10, 'AMD Ryzen 7 5700G WIFI AC', 819100.00, 100, 'AMD', 0, 0, 'Windows 10', 'Si', 'Oficina', '512GB', 'No', 'Si', 'Si', '32 GB', 'No', 'AMD Ryzen 7 5700G', 'CompuArmada/17_a.jpg', 'CompuArmada/17_b.webp', 1, 1010, 4.7);


INSERT INTO `computacion_notebook` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `envio_gratis`, `sistema_operativo`, `usos`, `teclado_extra`, `almacenamiento`, `pantalla_tamanio`, `pantalla_tactil`, `pantalla_led`, `memoria_ram`, `gpu_dedicada`, `procesador`, `foto1`, `foto2`, `subcategoria_id`, `codigo`, `peso`, `realidadAumentada`) VALUES
(1, 'Lenovo IdeaPad 3', 1100000.00, 4, 'Lenovo', 1, 0, 'Windows', 'Diseño', 'No', '512 GB', '14\"', 'No', 'Si', '8 GB', 'No', 'AMD 5', 'Notebook/01_a.jpeg', 'Notebook/01_b.jpeg', 2, 2001, 1.2, 0),
(2, 'Apple MacBook Air', 2200000.00, 3, 'Apple', 0, 0, 'MacOS', 'Diseño', 'No', '512 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'AMD 5', 'Notebook/02_a.jpeg', 'Notebook/02_b.jpeg', 2, 2002, 1.2, 0),
(3, 'HP Pavilion 15', 1050000.00, 4, 'HP', 1, 0, 'Windows', 'Diseño', 'No', '512 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'AMD 7', 'Notebook/03_a.jpeg', 'Notebook/03_b.jpeg', 2, 2003, 1.2, 0),
(4, 'Dell Vostro 3400', 980000.00, 5, 'Dell', 0, 0, 'Linux', 'Gamer', 'No', '512 GB', '15.6\"', 'No', 'Si', '16 GB', 'No', 'Intel Core i7', 'Notebook/04_a.jpeg', 'Notebook/04_b.jpeg', 2, 2004, 1.2, 0),
(5, 'Samsung Chromebook', 870000.00, 4, 'Samsung', 1, 0, 'Chrome OS', 'Gamer', 'No', '512 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'Intel core i5', 'Notebook/05_a.jpeg', 'Notebook/05_b.jpeg', 2, 2005, 2.3, 0),
(6, 'Acer Aspire 5', 940000.00, 4, 'Acer', 0, 0, 'Windows', 'Gamer', 'No', '256 GB', '15.6\"', 'No', 'Si', '8 GB', 'No', 'Intel core i5', 'Notebook/06_a.jpeg', 'Notebook/06_b.jpeg', 2, 2006, 2.3, 0),
(7, 'Asus VivoBook', 1020000.00, 4, 'Asus', 1, 0, 'Linux', 'Oficina', 'No', '512 GB', '15.6\"', 'No', 'Si', '16 GB', 'No', 'AMD 5', 'Notebook/07_a.jpeg', 'Notebook/07_b.jpeg', 2, 2007, 2.3, 0),
(8, 'Dell Inspiron 15', 1200000.00, 4, 'Dell', 0, 0, 'Windows', 'Oficina', 'No', '512 GB', '15.6\"', 'No', 'Si', '16 GB', 'No', 'Intel core i7', 'Notebook/08_a.jpeg', 'Notebook/08_b.jpeg', 2, 2008, 2.00, 0),
(9, 'Apple MacBook Pro', 2500000.00, 4, 'Apple', 1, 0, 'MacOS', 'Oficina', 'No', '240 GB', '14\"', 'No', 'Si', '8 GB', 'No', 'Intel core i5', 'Notebook/09_a.jpeg', 'Notebook/09_b.jpeg', 2, 2009, 2.00, 0),
(10, 'Lenovo ThinkBook', 890000.00, 4, 'Lenovo', 0, 0, 'Windows', 'Oficina', 'No', '512 GB', '14\"', 'No', 'Si', '8 GB', 'No', 'AMD 5', 'Notebook/10_a.jpeg', 'Notebook/10_b.jpeg', 2, 2010, 2.00, 0);


INSERT INTO `computacion_cpu` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `modelo`, `nucleos`, `hilos`, `frecuencia`, `proceso_fabricacion`, `grafica_integrada`, `socket`, `incluye_cooler`, `tdp_watts`, `memoria_l1`, `memoria_l2`, `memoria_l3`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `subcategoria_id`, `codigo`, `peso`, `realidadAumentada`) VALUES
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

INSERT INTO `computacion_motherboard` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `memoria`, `socket_memoria`, `socket_cpu`, `socket_gpu`, `socket_sata_disco`, `socket_M2_disco`, `sonido`, `puerto_sata`, `ranura_ram`, `pci`, `usb`, `hdmi`, `vga`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Motherboard Asus A520M-K Prime AM4', 81500.00, 1, 'Asus', 1, 'DDR4 - 2 (64 GB)', 'DDR4', 'AM4', 'PCIe x16', 'Si', 'Si', 'Realtek ALC887', '4', '2', '1', '4 (3.2) / 2 (2.0)', '1', 'No', 5.00, '/Componentes/PlacaMadre/01_a.jpg', 'Componentes/PlacaMadre/01_b.jpg', '/Componentes/PlacaMadre/01_c.jpg', '/Componentes/PlacaMadre/01_d.jpg', NULL, 3, 3001, 0.84),
(2, 'Biostar B450MHP M-ATX DDR4 AM4', 81700.00, 100, 'Biostar', 1, 'DDR4 - 2 (Máx. 64 GB)', 'DDR4', 'AM4', 'PCIe x16', 'SI', 'No', 'Realtek 5.1', 4, 2, 2, 6, 1, 1, 58.40, '/Componentes/PlacaMadre/13_a.webp', '/Componentes/PlacaMadre/13_b.webp', '/Componentes/PlacaMadre/13_c.webp', '/Componentes/PlacaMadre/13_d.webp', NULL, 3, 3002, 1.10),
(3, 'MSI A520M A Pro AM4', 83200.00, 100, 'MSI', 0, 'DDR4 - 2 (Máx. 64 GB, hasta 4600 MHz OC)', 'DDR4', 'AM4', 'PCIe x16', 'SI', 'No', 'Realtek 5.1', 4, 2, 2, 6, 1, 1, 55.20, '/Componentes/PlacaMadre/18_a.webp', '/Componentes/PlacaMadre/18_b.jpg', '/Componentes/PlacaMadre/18_c.webp', NULL, NULL, 3, 3003, 1.05),
(4, 'Asrock B450M HDV R4.0 AM4', 94900.00, 100, 'Asrock', 0, 'DDR4 - 2 (32GB)', 'DDR4', 'AM4', 'PCIe x16', 'SI', 'No', 'Realtek 5.1', 4, 2, 2, 6, 1, 1, 57.90, '/Componentes/PlacaMadre/14_a.jpg', '/Componentes/PlacaMadre/14_b.jpg', '/Componentes/PlacaMadre/14_c.jpg', '/Componentes/PlacaMadre/14_d.jpg', '/Componentes/PlacaMadre/14_e.webp', 3, 3004, 1.08),
(5, 'Motherboard Gigabyte H510M-K V2 1200', 103800.00, 2, 'Gigabyte', 1, 'DDR4 - 2 (Max. 64 GB)', 'DDR4', '1200', 'PCIe x16', 'Si', 'Si', 'No informado', '4', '6', '2', '6 USB-A', 'Sí', 'No', 4.90, '/Componentes/PlacaMadre/02_a.jpg', '/Componentes/PlacaMadre/02_b.jpg', '/Componentes/PlacaMadre/02_c.jpg', NULL, NULL, 3, 3005, 0.75),
(6, 'Motherboard Asus Prime A620M-K DDR5 AM5', 118000.00, 3, 'Asus', 1, 'DDR5 - 2 (Máx. 96 GB)', 'DDR5', 'AM5', 'PCIe x16', 'Si', 'Si', 'No informado', '4', '4', '2', 'USB 3.2 Gen 1, USB 2.0', 'Sí (HDMI 2.1, 4K a 60Hz)', 'Sí', 60.00, '/Componentes/PlacaMadre/03_a.jpg', '/Componentes/PlacaMadre/03_b.jpg', '/Componentes/PlacaMadre/03_c.jpg', NULL, NULL, 3, 3006, 1.00),
(7, 'MSI B840M-B PRO DDR5 AM5', 137300.00, 100, 'MSI', 0, 'DDR5 Dual Channel', 'DDR5', 'AM5', 'PCIe x16', 'SI', 'SI', 'Realtek 7.1', 4, 2, 3, 8, 1, 'No', 62.30, '/Componentes/PlacaMadre/12_a.webp', '/Componentes/PlacaMadre/12_b.webp', '/Componentes/PlacaMadre/12_c.webp', '/Componentes/PlacaMadre/12_d.webp', '/Componentes/PlacaMadre/12_e.webp', 3, 3007, 1.28),
(8, 'Asus Prime B550M-K ARGB AM4', 137800.00, 100, 'Asus', 0, 'DDR4', 'DDR4', 'AM4', 'PCIe 4.0', 'SI', 'SI', 'Realtek 7.1', 4, 2, 3, 8, 1, 1, 64.80, '/Componentes/PlacaMadre/20_a.jpg', '/Componentes/PlacaMadre/20_b.jpg', '/Componentes/PlacaMadre/20_c.jpg', '/Componentes/PlacaMadre/20_d.jpg', '/Componentes/PlacaMadre/20_e.jpg', 3, 3008, 1.30),
(9, 'Motherboard Asrock B550 Phantom Gaming 4/ac AM4', 138500.00, 4, 'Asrock', 0, 'DDR4 - 4 (Max. 128 GB)', 'DDR4', 'AM4', 'PCIe x16', 'Si', 'Si', 'Realtek 1200 Codec', '4', '6', '2', '6 (3.2)', '1', 'No', 5.00, '/Componentes/PlacaMadre/04_a.jpg', '/Componentes/PlacaMadre/04_b.jpg', '/Componentes/PlacaMadre/04_c.jpg', '/Componentes/PlacaMadre/04_d.jpg', '/Componentes/PlacaMadre/04_e.jpg', 3, 3009, 0.92),
(10, 'Asrock B550M HDV AM4', 144700.00, 100, 'Asrock', 1, 'DDR4 - 2 (Max. 64GB)', 'DDR4', 'AM4', 'PCIe 4.0', 'SI', 'SI', 'Realtek 7.1', 4, 2, 3, 8, 1, 0, 63.70, '/Componentes/PlacaMadre/15_a.webp', '/Componentes/PlacaMadre/15_b.jpg', '/Componentes/PlacaMadre/15_c.jpg', '/Componentes/PlacaMadre/15_d.jpg', '/Componentes/PlacaMadre/15_e.webp', 3, 3010, 1.22);


INSERT INTO `computacion_cooler` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `color`, `consumo`, `cooler_incluidos`, `iluminacion`, `socket_cpu`, `foto1`, `foto2`, `foto3`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Fan Cooler 120mm Thermalright TL-C12CW - 120 White', 6400.00, 5, 'Thermalright', 0, 'Blanco', 3.00, 1, 'No', 'AM4', 'Componentes/Cooler/01_a.jpg', 'Componentes/Cooler/01_b.jpg', NULL, 7, 7001, 0.12),
(2, 'Fan Cooler 120mm Xigmatek G24A Artic Reverse PWM', 12900.00, 100, 'Xigmatek', 1, 'Negro o blanco', 3.00, 1, 'ARGB (conector 3-pin macho/hembra)', '1700', 'Componentes/Cooler/11_a.webp', 'Componentes/Cooler/11_b.webp', 'Componentes/Cooler/11_c.webp', 7, 7002, 0.25),
(3, 'Fan Cooler 120mm Xigmatek G24A Artic PWM', 12900.00, 100, 'Xigmatek', 0, 'Blanco', 3.00, 1, 'ARGB', '1700', 'Componentes/Cooler/12_a.jpg', 'Componentes/Cooler/12_b.jpg', NULL, 7, 7003, 0.24),
(4, 'CPU Cooler 90mm Netmak NM-Q90', 14800.00, 100, 'Netmak', 1, 'Negro', 4.00, 1, 'Sin iluminación', '1700', 'Componentes/Cooler/13_a.webp', 'Componentes/Cooler/13_b.webp', NULL, 7, 7004, 0.32),
(5, 'CPU Cooler Xigmatek Air-Killer S Rainbow - Compatible con Intel 12 Gen (Socket 1700)', 30000.00, 5, 'Xigmatek', 1, 'Negro', 3.60, 1, 'Si', '1700', 'Componentes/Cooler/02_a.jpg', NULL, NULL, 7, 7005, 0.65),
(6, 'Fan Cooler 120mm Xigmatek G20A - Black - Pack x3 ARGB', 36900.00, 5, 'Xigmatek', 0, 'Negro', 3.60, 1, 'Si', '1700', 'Componentes/Cooler/03_a.jpg', 'Componentes/Cooler/03_b.jpg', NULL, 7, 7006, 0.87),
(7, 'CPU Cooler Thermaltake UX150-L ARGB (Para Intel)', 40900.00, 100, 'Thermaltake', 0, 'Gris', 4.00, 1, 'ARGB direccionable (ventilador + top)', 'AM4', 'Componentes/Cooler/14_a.webp', 'Componentes/Cooler/14_b.webp', 'Componentes/Cooler/14_c.webp', 7, 7007, 0.55),
(8, 'Kit Fan Cooler x3 Gamemax 120mm RQ300 ARGB', 41000.00, 5, 'Gamemax', 0, 'Negro', 4.00, 1, 'ARGB direccionable con iluminación interior y exterior', 'AM4', 'Componentes/Cooler/04_a.jpg', 'Componentes/Cooler/04_b.jpg', NULL, 7, 7008, 0.99),
(9, 'Fan Cooler 120mm Corsair RS120 MAX PWM Single Black', 52600.00, 5, 'Corsair', 0, 'Negro', 3.60, 1, 'No', '1700', 'Componentes/Cooler/05_a.jpg', 'Componentes/Cooler/05_b.jpg', NULL, 7, 7009, 1.20),
(10, 'CPU Water Cooler 240mm Thermaltake TH240 V2 Ultra EX ARGB Sync Snow Edition', 235900.00, 5, 'Thermaltake', 0, 'Blanco', 6.25, 2, 'ARGB direccionable en ventiladores y bomba', 'AM5', 'Componentes/Cooler/07_a.jpg', 'Componentes/Cooler/07_b.jpg', 'Componentes/Cooler/07_c.jpg', 7, 7010, 2.78);


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

INSERT INTO `computacion_fuente` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `potencia_nominal`, `eficiencia`, `ventilador`, `subcategoria_id`, `socket_fuente_gpu`, `foto1`, `foto2`, `foto3`, `foto4`, `codigo`, `peso`) VALUES
(1, 'Fuente ATX 550W Perfomance', 23700.00, 4, 'Perfomance', 0, 500.00, '80 % Típicamente', '80 mm', 9, 'No', 'Componentes/Fuente/01_a.jpg', 'Componentes/Fuente/01_b.jpg', 'Componentes/Fuente/01_c.jpg', 'Componentes/Fuente/01_d.jpg', 9001, 1.20),
(2, 'Fuente 550W Thermaltake LitePower', 65100.00, 4, 'Thermaltake', 0, 550.00, 'No especifica', 'Si (120mm)', 9, 'PCIe x16', 'Componentes/Fuente/02_a.jpg', 'Componentes/Fuente/02_b.jpg', 'Componentes/Fuente/02_c.jpg', NULL, 9002, 1.30),
(3, 'Fuente 700W Adata XPG Probe 80 Plus Bronze', 88200.00, 3, 'Adata', 1, 700.00, '80 PLUS Bronze (hasta 87% a 50% de carga)', '120 mm con cojinete de manguito (2400 ±10% RPM)', 9, 'PCIe x16', 'Componentes/Fuente/03_a.jpg', 'Componentes/Fuente/03_b.jpg', NULL, NULL, 9003, 1.50),
(4, 'Fuente 850W Sentey GSP850-GM 80 PLUS Gold - Modular', 135400.00, 6, 'Sentey', 0, 850.00, '90 %', '120 mm silencioso con control inteligente', 9, 'PCIe x16', 'Componentes/Fuente/04_a.jpg', 'Componentes/Fuente/04_b.jpg', NULL, NULL, 9004, 1.70),
(5, 'Fuente 1000W Corsair HX1000 80 PLUS Platinum Modular', 444000.00, 7, 'Corsair', 1, 1000.00, 0.0, '97 %', '140 mm con rodamientos de fluido dinámico (FDB) y modo Zero RPM', 9, 'PCIe x16', 'Componentes/Fuente/05_a.jpg', 'Componentes/Fuente/05_b.jpg', 'Componentes/Fuente/05_c.jpg', 'Componentes/Fuente/05_d.jpg', 9005, 2.00),
(6, 'Fuente 1500W Corsair HX1500i 80 PLUS Platinum Full Modular', 634500.00, 7, 'Corsair', 1, 1500.00, '80 PLUS Platinum (hasta 92% de eficiencia)', '140 mm con rodamientos de fluido dinámico (FDB) y modo Zero RPM', 9, 'PCIe x16', 'Componentes/Fuente/06_a.jpg', 'Componentes/Fuente/06_b.jpg', 'Componentes/Fuente/06_c.jpg', 'Componentes/Fuente/06_d.jpg', 9006, 2.50);

INSERT INTO `computacion_placa_wifi` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `frecuencia`, `velocidad`, `consumo`, `foto1`, `foto2`, `foto3`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Placa de Red PCIe WIFI Tp-Link TL-WN881ND 2.4 Ghz 300Mbps', 14300.00, 4, 'Tp-Link', 1, '2.400-2.4835GHz', '11 Mbps - 300 Mbps', 2.00, '/Componentes/PlacaWifi/01_a.jpg', '/Componentes/PlacaWifi/01_b.jpg', '/Componentes/PlacaWifi/01_c.jpg', 16, 16001, 0.05),
(2, 'Placa de Red WIFI Usb Tp-Link Archer TX10UB Nano AX900 Dual Band 2.4/5Ghz - Wifi 6 + BT', 14721.00, 5, 'Tp-Link', 1, '2.400-2.4835GHz', 'Hasta 900 Mbps (600 Mbps @5 GHz + 300 Mbps @2.4 GHz)', 2.00, '/Componentes/PlacaWifi/02_a.jpg', '/Componentes/PlacaWifi/02_b.jpg', NULL, 16, 16002, 0.03),
(3, 'Placa de Red Usb WIFI Tp-Link Archer TXE50UH AXE3000 Triple Band High Gain 2.4/5/6Ghz - Wifi 6E', 14785.00, 5, 'Tp-Link', 1, '2.400-2.4835GHz', '2.4 GHz: hasta 574 Mbps / 5 GHz: hasta 1201 Mbps / 6 GHz: hasta 1201 Mbps', 3.00, '/Componentes/PlacaWifi/03_a.jpg', '/Componentes/PlacaWifi/03_b.jpg', NULL, 16, 16003, 0.04);


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

INSERT INTO `computacion_monitor` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `panel`, `pantalla`, `tamanio`, `vga`, `display_port`, `usb`, `hdmi`, `resolucion`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Monitor Led 19\" GO VGA/HDMI', 104800.00, 1, 'GO', 1, 'Led', 'Plana', '19\"', 'Sí', 'No', 'No', 'Sí', '1920 x 1080 (Full HD)', 18.00, '/Componentes/Monitor/01_a.jpg', NULL, NULL, NULL, 12, 12001, 18.00),
(2, 'Monitor LED IPS LG 24MS500 FULL HD 100Hz', 173000.00, 2, 'LG', 1, 'Led', 'Plana', '24\"', 'Sí', 'Sí', 'No', 'Sí', '1920 x 1080 (Full HD)', 16.00, '/Componentes/Monitor/02_a.jpg', '/Componentes/Monitor/02_b.jpg', '/Componentes/Monitor/02_c.jpg', NULL, 12, 12002, 16.00),
(3, 'Monitor Gamer IPS 24\" VIEWSONIC VX2428A 180Hz FHD Freesync 0.5ms', 227700.00, 3, 'LG', 1, 'Led', 'Plana', '24\"', 'No', 'Sí', 'No', 'Sí', '1920 x 1080 (Full HD)', 25.00, '/Componentes/Monitor/03_a.jpg', '/Componentes/Monitor/03_b.jpg', '/Componentes/Monitor/03_c.jpg', '/Componentes/Monitor/03_d.jpg', 12, 12003, 10.00),
(4, 'Monitor LED 32\" LG 32MN500M-B 75Hz IPS HDMI', 470700.00, 4, 'LG', 0, 'Led', 'Plana', '32\"', 'No', 'Sí', 'Sí', 'Sí', '1920 x 1080 (Full HD)', 25.00, '/Componentes/Monitor/04_a.jpg', '/Componentes/Monitor/04_b.jpg', '/Componentes/Monitor/04_c.jpg', '/Componentes/Monitor/04_d.jpg', 12, 12004, 10.00),
(5, 'Monitor Gamer LED 32\" LG 32GR93U-B Pivot UltraGear UHD 4K 144Hz 1Ms G-Sync Freesync Premium', 1386300.00, 5, 'LG', 0, 'Led', 'Plana', '32\"', 'Sí', 'Sí', 'Sí', 'Sí', '3840 x 2160 (Full HD)', 65.00, '/Componentes/Monitor/05_a.jpg', '/Componentes/Monitor/05_b.jpg', NULL, NULL, 12, 12005, 10.00);

INSERT INTO `computacion_mouse` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `color`, `conexion`, `botones`, `iluminacion`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `foto6`, `foto7`, `foto8`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Mouse Natec Optico RUFF 2 1000 DPI White', 2900.00, 1, 'Natec', 1, 'Blanco/Negro', 'USB cable', '3', 'No', 0.70, '/Componentes/Mouse/01_a.jpg', '/Componentes/Mouse/01_b.jpg', '/Componentes/Mouse/01_c.jpg', '/Componentes/Mouse/01_d.jpg', '/Componentes/Mouse/01_e.jpg', '/Componentes/Mouse/01_f.jpg', '/Componentes/Mouse/01_g.jpg', NULL, 13, 13001, 0.01),
(2, 'Mouse Fury Hustler RGB', 6100.00, 2, 'Fury', 1, 'Negro', 'USB cable', '7', 'Sí', 1.10, '/Componentes/Mouse/02_a.jpg', '/Componentes/Mouse/02_b.jpg', '/Componentes/Mouse/02_c.jpg', '/Componentes/Mouse/02_d.jpg', NULL, NULL, NULL, NULL, 13, 13002, 0.07),
(3, 'Mouse Gamer Wireless Genesis Fury Tanto T4', 32200.00, 3, 'Genesis', 1, 'Blanco/Azul', 'Wireless (2.4 GHz y Bluetooth 5.0) y cableada USB-C', '7 (programables)', 'No', 1.00, '/Componentes/Mouse/03_a.jpg', '/Componentes/Mouse/03_b.jpg', '/Componentes/Mouse/03_c.jpg', '/Componentes/Mouse/03_d.jpg', '/Componentes/Mouse/03_e.jpg', '/Componentes/Mouse/03_f.jpg', NULL, NULL, 13, 13003, 0.10),
(4, 'Mouse Logitech G502 HERO', 69200.00, 4, 'Logitech', 0, 'Negro', 'USB cable', '11 (Programables)', 'Sí', 1.00, '/Componentes/Mouse/04_a.jpg', '/Componentes/Mouse/04_b.jpg', '/Componentes/Mouse/04_c.jpg', '/Componentes/Mouse/04_d.jpg', NULL, NULL, NULL, NULL, 13, 13004, 0.20),
(5, 'Mouse Gamer Razer Basilisk V3 Pro 35k - Chroma RGB', 198200.00, 5, 'Razer', 0, 'Negro', 'Wireless (Razer HyperSpeed Wireless y Bluetooth), Cableada USB Tipo-C', '11 (Programables)', 'Sí', 0.90, '/Componentes/Mouse/05_a.jpg', '/Componentes/Mouse/05_b.jpg', '/Componentes/Mouse/05_c.jpg', '/Componentes/Mouse/05_d.jpg', NULL, NULL, NULL, NULL, 13, 13005, 0.12),
(6, 'Mouse Logitech G502 X Plus Black', 198900.00, 6, 'Logitech', 0, 'Negro/Blanco', 'Wireless', '13', 'Sí', 1.20, '/Componentes/Mouse/06_a.jpg', '/Componentes/Mouse/06_b.jpg', '/Componentes/Mouse/06_c.jpg', '/Componentes/Mouse/06_d.jpg', '/Componentes/Mouse/06_e.jpg', '/Componentes/Mouse/06_f.jpg', '/Componentes/Mouse/06_g.jpg', '/Componentes/Mouse/06_h.jpg', 13, 13006, 0.21),
(7, 'Mouse Razer Viper V2 PRO Wireless', 236300.00, 7, 'Razer', 0, 'Negro', 'Wireless (Razer HyperSpeed Wireless, USB-C)', '5 botones programables', 'No', 1.00, '/Componentes/Mouse/07_a.jpg', '/Componentes/Mouse/07_b.jpg', '/Componentes/Mouse/07_c.jpg', '/Componentes/Mouse/07_d.jpg', NULL, NULL, NULL, NULL, 13, 13007, 0.19);


INSERT INTO `computacion_teclado` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `color`, `conexion`, `iluminacion`, `consumo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `foto6`, `foto7`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Teclado Genesis RHOD 350 RGB Español', 12300.00, 4, 'Genesis', 0, 'Grafito', 'USB cable', 'Si', 0.30, 'Componentes/Teclado/02_a.jpg', 'Componentes/Teclado/02_b.jpg', 'Componentes/Teclado/02_c.jpg', 'Componentes/Teclado/02_d.jpg', 'Componentes/Teclado/02_e.jpg', 'Componentes/Teclado/02_f.jpg', 'Componentes/Teclado/02_g.jpg', 11, 11001, 0.30),
(2, 'Teclado Logitech K120 Usb', 24786.00, 5, 'Logitech', 0, 'Negro', 'USB cable', 'No', 0.20, 'Componentes/Teclado/01_a.jpg', 'Componentes/Teclado/01_b.jpg', 'Componentes/Teclado/01_c.jpg', 'Componentes/Teclado/01_d.jpg', 'Componentes/Teclado/01_e.jpg', NULL, NULL, 11, 11002, 0.20),
(3, 'Teclado Logitech K270 Wireless Graphite', 24786.00, 7, 'Logitech', 0, 'Grafito', 'Dongle USB-A wireless', 'No', 0.10, 'Componentes/Teclado/03_a.jpg', 'Componentes/Teclado/03_b.jpg', 'Componentes/Teclado/03_c.jpg', NULL, NULL, NULL, NULL, 11, 11003, 0.10),
(4, 'Teclado Genesis RHOD 500 RGB Español', 31100.00, 100, 'Genesis', 0, 'Plateado', 'USB', 'RGB', 6.00, 'Componentes/Teclado/17_a.webp', 'Componentes/Teclado/17_b.webp', 'Componentes/Teclado/17_c.webp', 'Componentes/Teclado/17_d.webp', 'Componentes/Teclado/17_e.webp', 'Componentes/Teclado/17_f.webp', NULL, 11, 11004, 0.63),
(5, 'Teclado Logitech K400 Plus Touchpad Inalambrico Black', 38900.00, 100, 'Logitech', 1, 'Grafito', 'USB', 'No', 2.60, 'Componentes/Teclado/20_a.jpg', 'Componentes/Teclado/20_b.jpg', 'Componentes/Teclado/20_c.jpg', NULL, NULL, NULL, NULL, 11, 11005, 0.70),
(6, 'Teclado Logitech K650 Wireless Graphite', 54400.00, 100, 'Logitech', 1, 'Grafito', 'Bluetooth 5.1, Logi Bolt USB', 'No', 3.50, 'Componentes/Teclado/08_a.webp', 'Componentes/Teclado/08_b.webp', 'Componentes/Teclado/08_c.webp', 'Componentes/Teclado/08_d.webp', NULL, NULL, NULL, 11, 11006, 1.71);


INSERT INTO `computacion_sistema_operativo` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `detalle`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Windows 10 Home', 150000.00, 3, 'Microsft', 0, 'Licencia digital OEM', '/Componentes/SO/02_a.jpg', '/Componentes/SO/02_b.jpg', '/Componentes/SO/02_c.png', '/Componentes/SO/02_d.png', NULL, 14, 14001, 0.00),
(2, 'Windows 10 Pro', 200000.00, 3, 'Microsft', 0, 'Licencia original', '/Componentes/SO/03_a.jpg', '/Componentes/SO/03_b.jpg', '/Componentes/SO/03_c.png', '/Componentes/SO/03_d.png', NULL, 14, 14002, 0.00),
(3, 'Windows 11 Home', 300000.00, 3, 'Microsft', 0, 'Single Language', '/Componentes/SO/04_a.webp', '/Componentes/SO/04_b.png', '/Componentes/SO/04_c.png', '/Componentes/SO/04_d.png', NULL, 14, 14003, 0.00),
(4, 'Windows 11 Pro', 350000.00, 3, 'Microsft', 0, 'Single Language', '/Componentes/SO/05_a.jpg', '/Componentes/SO/05_b.jpg', '/Componentes/SO/05_c.jpg', '/Componentes/SO/05_d.png', '/Componentes/SO/05_e.png', 14, 14004, 0.00),
(5, 'Ubuntu 22.04 LTS', 50000.00, 3, 'Ubuntu', 1, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/06_a.png', '/Componentes/SO/06_b.png', '/Componentes/SO/06_c.png', NULL, NULL, 14, 14005, 0.00),
(6, 'Ubuntu 24.04 LTS', 50000.00, 3, 'Ubuntu', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/07_a.png', '/Componentes/SO/07_b.png', '/Componentes/SO/07_c.png', '/Componentes/SO/07_d.jpg', NULL, 14, 14006, 0.00),
(7, 'Linux Mint', 50000.00, 3, 'Linux Mint', 1, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/08_a.jpg', NULL, NULL, NULL, NULL, 14, 14007, 0.00),
(8, 'Debian', 50000.00, 3, 'Debian', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/09_a.jpg', '/Componentes/SO/09_b.png', '/Componentes/SO/09_c.png', NULL, NULL, 14, 14008, 0.00),
(9, 'Fedora', 50000.00, 3, 'Fedora', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/10_a.jpg', '/Componentes/SO/10_b.jpg', NULL, NULL, NULL, 14, 14009, 0.00),
(10, 'Arch Linux', 50000.00, 3, 'Arch Linux', 0, 'Versión gratuita, se cobra costo de instalación', '/Componentes/SO/11_a.png', NULL, NULL, NULL, NULL, 14, 14010, 0.00);


INSERT INTO `computacion_paquete_office` (`id`, `nombre`, `precio`, `stock`, `fabricante`, `oferta`, `foto1`, `foto2`, `subcategoria_id`, `codigo`, `peso`) VALUES
(1, 'Office LTSC 2024 Professional plus', 25000.00, 5, 'Microsoft', 0, '/Componentes/Office/01_a.jpg', '/Componentes/Office/01_b.jpg', 15, 15001, 0.00),
(2, 'Office 2024 Professional plus', 15000.00, 5, 'Microsoft', 0, '/Componentes/Office/02_a.png', NULL, 15, 15002, 0.00);


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
(33, 'Río Negro', 'Allen', '8328', 103.82, -38.9514, -67.5732),
(34, 'Río Negro', 'Cipolletti', '8322', 103.33, -38.9500, -67.9900);

INSERT INTO `proveedor_proveedores` (`id`, `nombre`, `contacto`, `telefono`, `email`, `cuit`, `activo`, `categoria`) VALUES
(1, 'TechDistribuidora SA', 'Juan Pérez', '+54 11 4567-8900', 'ventas@techdist.com', '20-12345678-9', 1, 'hardware'),
(2, 'Componentes Pro', 'María González', '+54 11 5678-9012', 'info@componentespro.com', '30-98765432-1', 0, 'hardware'),
(3, 'Periféricos Import', 'Carlos Rodríguez', '+54 11 6789-0123', 'contacto@perifimport.com', '27-45678901-2', 0, 'hardware'),
(4, 'Embalajes del Sur', 'Ana Martínez', '+54 11 7890-1234', 'ventas@embalajesur.com', '33-23456789-0', 1, 'otros'),
(5, 'Logística Express', 'Roberto Silva', '+54 11 8901-2345', 'info@logexpress.com', '30-34567890-1', 0, 'otros');

INSERT INTO `usuario_perfil` (`id`, `biografia`, `avatar`, `experiencia`, `user_id`) VALUES
(1, 'Apasionado por la programación y el hardware. Siempre buscando optimizar código y armar la PC perfecta.', '/Usuarios/lolo.webp', 'Desarrollador autodidacta con proyectos en Python.', 1),
(2, 'Entusiasta de la tecnología y la programación. Ama combinar creatividad y lógica en cada proyecto.', '/Usuarios/lulu.jpg', 'Desarrolladora full stack.', 2),
(3, NULL, '', 'principiante', 3);

INSERT INTO `usuario_interes` (`id`, `nombre`, `perfil_id`) VALUES
(4, 'Café y largas sesiones de código', 1),
(1, 'Desarrollo web con Django y React', 1),
(2, 'Optimización de rendimiento en hardware', 1),
(3, 'Videojuegos retro', 1),
(6, 'Automatización con Python', 2),
(5, 'Diseño de interfaces con React y Figma', 2),
(7, 'Fotografía digital', 2),
(8, 'Música electrónica', 2);

INSERT INTO `usuario_usuarioextra` (`id`, `codigo_postal`, `usuario_id`) VALUES
(1, '8500', 2),
(2, '9410', 3),
(3, '8300', 4);

