-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2020 at 01:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurante`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `ced_cli` int(13) NOT NULL,
  `nom_cli` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ape_cli` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dir_cli` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono_cli` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`ced_cli`, `nom_cli`, `ape_cli`, `dir_cli`, `telefono_cli`) VALUES
(502644206, 'Daniel', 'Tapia', 'Latacunga', '0987408783');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `cod_pla_per` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_fac_per` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detalle_factura`
--

INSERT INTO `detalle_factura` (`cod_pla_per`, `cantidad`, `precio`, `cod_fac_per`) VALUES
('001', '10', '10', '1'),
('001', '1', '3', '2'),
('001', '3', '10', '1'),
('001', '2', '12', '3'),
('002', '10', '10', '4'),
('003', '10', '10', '1'),
('004', '1', '3', '2'),
('001', '3', '10', '1'),
('002', '2', '12', '6'),
('003', '10', '10', '4'),
('004', '10', '10', '1'),
('006', '1', '3', '2'),
('002', '3', '10', '1'),
('001', '2', '12', '5'),
('001', '10', '10', '5'),
('001', '10', '10', '5'),
('001', '1', '3', '5'),
('001', '3', '10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `maestro_factura`
--

CREATE TABLE `maestro_factura` (
  `ced_cli_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_det_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ced_per_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_mesa_per` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fech_fac` date NOT NULL,
  `cod_fac` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maestro_factura`
--

INSERT INTO `maestro_factura` (`ced_cli_per`, `cod_det_per`, `ced_per_per`, `cod_mesa_per`, `fech_fac`, `cod_fac`, `estado`) VALUES
('0502644206', '333', '333', '333', '0000-00-00', 1, 'Progreso'),
('9999999999', '333', '333', '333', '0000-00-00', 2, 'Progreso'),
('7777777777', '333', '333', '333', '0000-00-00', 3, 'Progreso'),
('1111111111', '333', '333', '333', '0000-00-00', 4, 'Progreso'),
('1111111112', '333', '333', '333', '0000-00-00', 5, 'Progreso'),
('1111111112', '333', '333', '333', '0000-00-00', 6, 'Progreso');

-- --------------------------------------------------------

--
-- Table structure for table `mesa`
--

CREATE TABLE `mesa` (
  `cod_mesa` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ubi_mesa` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tamanio_mesa` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `ced_per` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nom_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ape_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dir_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tip_per` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`ced_per`, `nom_per`, `ape_per`, `dir_per`, `tip_per`, `usuario`, `contrasenia`) VALUES
('0502644206', 'Daniel', 'Tapia', 'Latacunga', 'Mesero', 'Danny', '12345'),
('8888888888', 'Jorge', 'Paez', 'Ambato', 'Mesero', 'Jorgito', '123'),
('9999999999', 'Juan', 'Perez', 'Ambato', 'Cajero', 'Juanito', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `platos`
--

CREATE TABLE `platos` (
  `cod_pla` int(5) NOT NULL,
  `nom_pla` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `costo_pla` int(10) NOT NULL,
  `tamanio_pla` varchar(40) NOT NULL,
  `stock_plat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `platos`
--

INSERT INTO `platos` (`cod_pla`, `nom_pla`, `costo_pla`, `tamanio_pla`, `stock_plat`) VALUES
(1, 'Alitas x12', 12, 'mediano', 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ced_cli`);

--
-- Indexes for table `maestro_factura`
--
ALTER TABLE `maestro_factura`
  ADD PRIMARY KEY (`cod_fac`);

--
-- Indexes for table `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`cod_mesa`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`ced_per`);

--
-- Indexes for table `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`cod_pla`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maestro_factura`
--
ALTER TABLE `maestro_factura`
  MODIFY `cod_fac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
