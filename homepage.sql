-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/10/2024 às 16:40
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

DROP TABLE IF EXISTS `homepage`;
CREATE TABLE `homepage` (
  `id` int(11) NOT NULL,
  `imagem` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `link` varchar(150) NOT NULL,
  `data` date NOT NULL,
  `categoria` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `homepage`
--

REPLACE INTO `homepage` (`id`, `imagem`, `descricao`, `link`, `data`, `categoria`) VALUES
(1, 'image1.png', 'Notre-Dame de Paris - MIS Experience', 'misexperience.org.br', '2024-09-26', 1),
(2, 'image2.png', 'Línguas Africanas - Museu da Língua Portuguesa', 'www.museudalinguaportuguesa.org.br', '2024-09-25', 1),
(3, 'image3.png', 'O cinema de Billy Weider - MIS Jardim Europa', 'mis-sp.org.br', '2024-09-23', 1),
(4, 'card1.png', 'Exposicao 1', '', '2024-10-02', 2),
(5, 'card2.png', 'Exposicao 2', '', '2024-10-02', 2),
(6, 'card3.png', 'Exposicao 3', '', '2024-10-02', 2),
(7, 'card4.png', 'Exposicao 4', '', '2024-10-02', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
