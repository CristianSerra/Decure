-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2024 at 08:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decure`
--

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `id` int(11) NOT NULL,
  `imagem` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `link` varchar(150) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`id`, `imagem`, `descricao`, `link`, `data`) VALUES
(1, 'image1.png', 'Notre-Dame de Paris - MIS Experience', 'misexperience.org.br', '2024-09-26'),
(2, 'image2.png', 'Línguas Africanas - Museu da Língua Portuguesa', 'www.museudalinguaportuguesa.org.br', '2024-09-25'),
(3, 'image3.png', 'O cinema de Billy Weider - MIS Jardim Europa', 'mis-sp.org.br', '2024-09-23');

-- --------------------------------------------------------

--
-- Table structure for table `instituicoes`
--

CREATE TABLE `instituicoes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `contato` varchar(100) NOT NULL,
  `agendamento` varchar(255) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `midias`
--

CREATE TABLE `midias` (
  `id` int(11) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `midias`
--

INSERT INTO `midias` (`id`, `imagem`, `descricao`, `link`) VALUES
(1, 'image4.png', 'teste de coleta', 'aqui e o robot.html');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instituicoes`
--
ALTER TABLE `instituicoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `instituicoes`
--
ALTER TABLE `instituicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `midias`
--
ALTER TABLE `midias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
