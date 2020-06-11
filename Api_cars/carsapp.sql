-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2020 a las 02:22:55
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carsapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `brand` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `price` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `category` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `color`, `price`, `category`) VALUES
(4, 'Mazda 3', 'Mazda', 'Azul', '20.000.000', 'Auto'),
(5, 'Toyota Prado', 'Toyota', 'Blanco', '200.000.000', 'Camioneta'),
(7, 'Captiva Sport', 'Chevrolet', 'Dorado', '45.000.000', 'Camioneta'),
(9, 'Ford Explore', 'Ford', 'Azul', '120.000.000', 'Camioneta'),
(10, 'Sendero', 'Renault', 'Vinotinto', '25.000.000', 'Auto'),
(11, 'Clio', 'Renault', 'Blanco', '18.000.000', 'auto'),
(12, 'Optra', 'Chevrolet', 'Dorado', '30.000.000', 'auto'),
(13, 'Chevrolet Tracker LS', 'Chevrolet', 'Plateado', '25.000.000', 'Camioneta'),
(15, 'Captiva LT Automatica', 'Chevrolet', 'Rojo', '68.000.000', 'Camioneta'),
(16, 'Mazda Cx-5', 'Mazda', 'Blanco', '74.000.000', 'Camioneta'),
(21, 'Hilux', 'Toyota', 'NEgra', '200.000.000', 'Camioneta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
