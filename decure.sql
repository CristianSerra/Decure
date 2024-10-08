-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/10/2024 às 02:20
-- Versão do servidor: 10.4.22-MariaDB
-- Versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `decure`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `homepage`
--

CREATE TABLE `homepage` (
  `id` int(11) NOT NULL,
  `imagem` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `link` varchar(150) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `homepage`
--

INSERT INTO `homepage` (`id`, `imagem`, `descricao`, `link`, `data`) VALUES
(1, 'image1.png', 'Notre-Dame de Paris - MIS Experience', 'misexperience.org.br', '2024-09-26'),
(2, 'image2.png', 'Línguas Africanas - Museu da Língua Portuguesa', 'www.museudalinguaportuguesa.org.br', '2024-09-25'),
(3, 'image3.png', 'O cinema de Billy Weider - MIS Jardim Europa', 'mis-sp.org.br', '2024-09-23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `midias`
--

CREATE TABLE `midias` (
  `id` int(11) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `midias`
--

INSERT INTO `midias` (`id`, `imagem`, `descricao`, `link`) VALUES
(1, 'image4.png', 'teste de coleta', 'aqui e o robot.html');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
