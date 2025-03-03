-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-03-2025 a las 21:33:55
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Supermercado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Lácteos'),
(2, 'Carnes'),
(3, 'Bebidas'),
(4, 'Panadería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Carlos López', 'calle 23', '111222333'),
(2, 'Ana Torres', 'jardin', '444555666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleVentas`
--

CREATE TABLE `DetalleVentas` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `DetalleVentas`
--

INSERT INTO `DetalleVentas` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `subtotal`) VALUES
(1, 1, 2, 1, 10.00),
(2, 1, 3, 2, 4.00),
(3, 2, 4, 2, 2.40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`id_producto`, `nombre`, `precio`, `stock`, `id_categoria`, `id_proveedor`) VALUES
(1, 'Leche', 1.50, 100, 1, 1),
(2, 'Carne de res', 10.00, 50, 2, 2),
(3, 'Jugo de naranja', 2.00, 80, 3, 1),
(4, 'Pan integral', 1.20, 60, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`id_proveedor`, `nombre`, `contacto`, `telefono`) VALUES
(1, 'Proveedor A', 'Juan Pérez', '123456789'),
(2, 'Proveedor B', 'María Gómez', '987654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`id_venta`, `id_cliente`, `fecha`, `total`) VALUES
(1, 1, '2024-03-03', 15.00),
(2, 2, '2024-03-03', 5.20);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cantidad_productos_categoria as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_cantidad_productos_categoria as` (
`id_producto` int(11)
,`nombre` varchar(100)
,`precio` decimal(10,2)
,`stock` int(11)
,`id_categoria` int(11)
,`id_proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_compras as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes_compras as` (
`id_cliente` int(11)
,`nombre` varchar(100)
,`direccion` varchar(255)
,`telefono` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_mayor_compra as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes_mayor_compra as` (
`id_cliente` int(11)
,`nombre` varchar(100)
,`direccion` varchar(255)
,`telefono` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalleventas_productos as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalleventas_productos as` (
`id_detalle` int(11)
,`id_venta` int(11)
,`id_producto` int(11)
,`cantidad` int(11)
,`subtotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ingresos_mensuales as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ingresos_mensuales as` (
`id_venta` int(11)
,`id_cliente` int(11)
,`fecha` date
,`total` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ingresos_por_proveedor as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ingresos_por_proveedor as` (
`id_proveedor` int(11)
,`nombre` varchar(100)
,`contacto` varchar(100)
,`telefono` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_bajo_stock as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_bajo_stock as` (
`id_producto` int(11)
,`nombre` varchar(100)
,`precio` decimal(10,2)
,`stock` int(11)
,`id_categoria` int(11)
,`id_proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_categorias as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_categorias as` (
`id_categoria` int(11)
,`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_mas_caros as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_mas_caros as` (
`id_producto` int(11)
,`nombre` varchar(100)
,`precio` decimal(10,2)
,`stock` int(11)
,`id_categoria` int(11)
,`id_proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_mas_vendidos as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_mas_vendidos as` (
`id_producto` int(11)
,`nombre` varchar(100)
,`precio` decimal(10,2)
,`stock` int(11)
,`id_categoria` int(11)
,`id_proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_proveedores as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_proveedores as` (
`id_producto` int(11)
,`nombre` varchar(100)
,`precio` decimal(10,2)
,`stock` int(11)
,`id_categoria` int(11)
,`id_proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_proveedores_productos as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_proveedores_productos as` (
`id_proveedor` int(11)
,`nombre` varchar(100)
,`contacto` varchar(100)
,`telefono` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_clientes as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_clientes as` (
`id_cliente` int(11)
,`nombre` varchar(100)
,`direccion` varchar(255)
,`telefono` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_con_productos as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_con_productos as` (
`id_venta` int(11)
,`id_cliente` int(11)
,`fecha` date
,`total` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_por_fecha as`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_por_fecha as` (
`id_venta` int(11)
,`id_cliente` int(11)
,`fecha` date
,`total` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cantidad_productos_categoria as`
--
DROP TABLE IF EXISTS `vista_cantidad_productos_categoria as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_cantidad_productos_categoria as`  AS SELECT `supermercado`.`productos`.`id_producto` AS `id_producto`, `supermercado`.`productos`.`nombre` AS `nombre`, `supermercado`.`productos`.`precio` AS `precio`, `supermercado`.`productos`.`stock` AS `stock`, `supermercado`.`productos`.`id_categoria` AS `id_categoria`, `supermercado`.`productos`.`id_proveedor` AS `id_proveedor` FROM `supermercado`.`productos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_compras as`
--
DROP TABLE IF EXISTS `vista_clientes_compras as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_clientes_compras as`  AS SELECT `supermercado`.`clientes`.`id_cliente` AS `id_cliente`, `supermercado`.`clientes`.`nombre` AS `nombre`, `supermercado`.`clientes`.`direccion` AS `direccion`, `supermercado`.`clientes`.`telefono` AS `telefono` FROM `supermercado`.`clientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_mayor_compra as`
--
DROP TABLE IF EXISTS `vista_clientes_mayor_compra as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_clientes_mayor_compra as`  AS SELECT `supermercado`.`clientes`.`id_cliente` AS `id_cliente`, `supermercado`.`clientes`.`nombre` AS `nombre`, `supermercado`.`clientes`.`direccion` AS `direccion`, `supermercado`.`clientes`.`telefono` AS `telefono` FROM `supermercado`.`clientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalleventas_productos as`
--
DROP TABLE IF EXISTS `vista_detalleventas_productos as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_detalleventas_productos as`  AS SELECT `supermercado`.`detalleventas`.`id_detalle` AS `id_detalle`, `supermercado`.`detalleventas`.`id_venta` AS `id_venta`, `supermercado`.`detalleventas`.`id_producto` AS `id_producto`, `supermercado`.`detalleventas`.`cantidad` AS `cantidad`, `supermercado`.`detalleventas`.`subtotal` AS `subtotal` FROM `supermercado`.`detalleventas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ingresos_mensuales as`
--
DROP TABLE IF EXISTS `vista_ingresos_mensuales as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_ingresos_mensuales as`  AS SELECT `supermercado`.`ventas`.`id_venta` AS `id_venta`, `supermercado`.`ventas`.`id_cliente` AS `id_cliente`, `supermercado`.`ventas`.`fecha` AS `fecha`, `supermercado`.`ventas`.`total` AS `total` FROM `supermercado`.`ventas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ingresos_por_proveedor as`
--
DROP TABLE IF EXISTS `vista_ingresos_por_proveedor as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_ingresos_por_proveedor as`  AS SELECT `supermercado`.`proveedores`.`id_proveedor` AS `id_proveedor`, `supermercado`.`proveedores`.`nombre` AS `nombre`, `supermercado`.`proveedores`.`contacto` AS `contacto`, `supermercado`.`proveedores`.`telefono` AS `telefono` FROM `supermercado`.`proveedores` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_bajo_stock as`
--
DROP TABLE IF EXISTS `vista_productos_bajo_stock as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_productos_bajo_stock as`  AS SELECT `supermercado`.`productos`.`id_producto` AS `id_producto`, `supermercado`.`productos`.`nombre` AS `nombre`, `supermercado`.`productos`.`precio` AS `precio`, `supermercado`.`productos`.`stock` AS `stock`, `supermercado`.`productos`.`id_categoria` AS `id_categoria`, `supermercado`.`productos`.`id_proveedor` AS `id_proveedor` FROM `supermercado`.`productos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_categorias as`
--
DROP TABLE IF EXISTS `vista_productos_categorias as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_productos_categorias as`  AS SELECT `supermercado`.`categorias`.`id_categoria` AS `id_categoria`, `supermercado`.`categorias`.`nombre` AS `nombre` FROM `supermercado`.`categorias` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_mas_caros as`
--
DROP TABLE IF EXISTS `vista_productos_mas_caros as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_productos_mas_caros as`  AS SELECT `supermercado`.`productos`.`id_producto` AS `id_producto`, `supermercado`.`productos`.`nombre` AS `nombre`, `supermercado`.`productos`.`precio` AS `precio`, `supermercado`.`productos`.`stock` AS `stock`, `supermercado`.`productos`.`id_categoria` AS `id_categoria`, `supermercado`.`productos`.`id_proveedor` AS `id_proveedor` FROM `supermercado`.`productos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_mas_vendidos as`
--
DROP TABLE IF EXISTS `vista_productos_mas_vendidos as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_productos_mas_vendidos as`  AS SELECT `supermercado`.`productos`.`id_producto` AS `id_producto`, `supermercado`.`productos`.`nombre` AS `nombre`, `supermercado`.`productos`.`precio` AS `precio`, `supermercado`.`productos`.`stock` AS `stock`, `supermercado`.`productos`.`id_categoria` AS `id_categoria`, `supermercado`.`productos`.`id_proveedor` AS `id_proveedor` FROM `supermercado`.`productos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_proveedores as`
--
DROP TABLE IF EXISTS `vista_productos_proveedores as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_productos_proveedores as`  AS SELECT `supermercado`.`productos`.`id_producto` AS `id_producto`, `supermercado`.`productos`.`nombre` AS `nombre`, `supermercado`.`productos`.`precio` AS `precio`, `supermercado`.`productos`.`stock` AS `stock`, `supermercado`.`productos`.`id_categoria` AS `id_categoria`, `supermercado`.`productos`.`id_proveedor` AS `id_proveedor` FROM `supermercado`.`productos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_proveedores_productos as`
--
DROP TABLE IF EXISTS `vista_proveedores_productos as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_proveedores_productos as`  AS SELECT `supermercado`.`proveedores`.`id_proveedor` AS `id_proveedor`, `supermercado`.`proveedores`.`nombre` AS `nombre`, `supermercado`.`proveedores`.`contacto` AS `contacto`, `supermercado`.`proveedores`.`telefono` AS `telefono` FROM `supermercado`.`proveedores` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_clientes as`
--
DROP TABLE IF EXISTS `vista_ventas_clientes as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_ventas_clientes as`  AS SELECT `supermercado`.`clientes`.`id_cliente` AS `id_cliente`, `supermercado`.`clientes`.`nombre` AS `nombre`, `supermercado`.`clientes`.`direccion` AS `direccion`, `supermercado`.`clientes`.`telefono` AS `telefono` FROM `supermercado`.`clientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_con_productos as`
--
DROP TABLE IF EXISTS `vista_ventas_con_productos as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_ventas_con_productos as`  AS SELECT `supermercado`.`ventas`.`id_venta` AS `id_venta`, `supermercado`.`ventas`.`id_cliente` AS `id_cliente`, `supermercado`.`ventas`.`fecha` AS `fecha`, `supermercado`.`ventas`.`total` AS `total` FROM `supermercado`.`ventas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_por_fecha as`
--
DROP TABLE IF EXISTS `vista_ventas_por_fecha as`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supermercado`.`vista_ventas_por_fecha as`  AS SELECT `supermercado`.`ventas`.`id_venta` AS `id_venta`, `supermercado`.`ventas`.`id_cliente` AS `id_cliente`, `supermercado`.`ventas`.`fecha` AS `fecha`, `supermercado`.`ventas`.`total` AS `total` FROM `supermercado`.`ventas` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `DetalleVentas`
--
ALTER TABLE `DetalleVentas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DetalleVentas`
--
ALTER TABLE `DetalleVentas`
  ADD CONSTRAINT `detalleventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `Ventas` (`id_venta`),
  ADD CONSTRAINT `detalleventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `Productos` (`id_producto`);

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`id_categoria`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
