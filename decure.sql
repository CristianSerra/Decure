-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/10/2024 às 00:31
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
-- Estrutura para tabela `filtro`
--

DROP TABLE IF EXISTS `filtro`;
CREATE TABLE `filtro` (
  `id` int(11) NOT NULL,
  `imagem` varchar(150) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `contato` varchar(200) NOT NULL,
  `agendamento` varchar(200) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

INSERT INTO `homepage` (`id`, `imagem`, `descricao`, `link`, `data`, `categoria`) VALUES
(1, 'banner1.png', 'Notre-Dame de Paris - MIS Experience', 'misexperience.org.br', '2024-09-26', 0),
(2, 'banner2.png', 'Línguas Africanas - Museu da Língua Portuguesa', 'www.museudalinguaportuguesa.org.br', '2024-09-25', 0),
(3, 'banner3.png', 'O cinema de Billy Weider - MIS Jardim Europa', 'mis-sp.org.br', '2024-09-23', 0),
(4, 'exposicao1.png', 'Exposicao 1', '', '2024-10-02', 2),
(5, 'novidade1.png', 'novidade teste', '', '2024-10-02', 1),
(6, 'galeria.png', 'teste galeria', '', '2024-10-02', 3),
(7, 'novidade3.png', 'Exposicao 4', '', '2024-10-02', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `instituicoes`
--

DROP TABLE IF EXISTS `instituicoes`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `instituicoes`
--

INSERT INTO `instituicoes` (`id`, `nome`, `categoria`, `descricao`, `endereco`, `contato`, `agendamento`, `horario`, `link`) VALUES
(1, 'MIS', 'Museus', 'teste descricao museu', 'rua do museu, n 345', 'curador', 'quintas-feiras', '10h', 'https://mis-sp.org.br/'),
(2, 'Museu do Ipiranga', 'Museus', 'novo cadastro museu', 'av independência, 541', ' ', 'aos sábados', '11h às 17h', 'https://museudoipiranga.org.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `midias`
--

DROP TABLE IF EXISTS `midias`;
CREATE TABLE `midias` (
  `id` int(11) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `contato` varchar(200) NOT NULL,
  `agendamento` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `midias`
--

INSERT INTO `midias` (`id`, `imagem`, `descricao`, `endereco`, `contato`, `agendamento`, `link`) VALUES
(1, 'image1.png', 'teste MIS', 'Av. Europa, 158', '(11) 2117-4777', '', 'https://mis-sp.org.br/'),
(2, 'image2.png', 'Museu Lingua Portuguesa', 'Praça da Luz, s/nº - Centro Histórico de São Paulo', '', '', 'https://www.museudalinguaportuguesa.org.br/');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `Codigo` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `DTNascimento` date NOT NULL,
  `logradouro` varchar(150) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `bairro` varchar(120) NOT NULL,
  `localidade` varchar(120) NOT NULL,
  `uf` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`Codigo`, `Nome`, `Email`, `CPF`, `Senha`, `Telefone`, `DTNascimento`, `logradouro`, `complemento`, `bairro`, `localidade`, `uf`) VALUES
(1, 'Cristian Serra Vieira Pinto', 'cristian.trt@gmail.com', '251.762.928', 'sp2013', '11982040343', '1976-06-04', 'Rua José Amaro Peçanha', '345', 'Parque São Domingos', 'São Paulo', 'SP'),
(2, 'Semirames', 'semirames@fatec.sp.gov.br', '123456789-2', 'Cbdh375!', '1199876554', '1980-06-05', 'Rua da Consolação', '1272', 'Consolação', 'São Paulo', 'SP');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `filtro`
--
ALTER TABLE `filtro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `instituicoes`
--
ALTER TABLE `instituicoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filtro`
--
ALTER TABLE `filtro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `instituicoes`
--
ALTER TABLE `instituicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
