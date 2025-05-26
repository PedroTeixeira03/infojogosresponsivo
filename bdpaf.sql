-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Maio-2025 às 13:52
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdpaf`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho_compra`
--

CREATE TABLE `carrinho_compra` (
  `n_carro` int(11) NOT NULL,
  `n_sessao` varchar(255) NOT NULL,
  `n_produto` int(11) NOT NULL,
  `n_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `carrinho_compra`
--

INSERT INTO `carrinho_compra` (`n_carro`, `n_sessao`, `n_produto`, `n_user`) VALUES
(1, 'sess_6834451d537f50.00417347', 12, 2),
(3, 'sess_6834451d537f50.00417347', 15, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plataforma`
--

CREATE TABLE `plataforma` (
  `n_plataforma` int(11) NOT NULL,
  `plataforma` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `plataforma`
--

INSERT INTO `plataforma` (`n_plataforma`, `plataforma`) VALUES
(1, 'PS5'),
(2, 'XBOX'),
(3, 'PC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `n_produto` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `n_plataforma` int(100) NOT NULL,
  `preco` float NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `imagem` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`n_produto`, `marca`, `modelo`, `n_plataforma`, `preco`, `descricao`, `imagem`) VALUES
(12, 'PLAYSTATION', 'JG. PS5 ASTRO BOT', 1, 69.99, 'Prepara-te para uma aventura emocionante com o jogo Astro Bot! Este título exclusivo para a PlayStation 5', 'fotos/1747666925_1746625551_img1.jpg'),
(14, 'NAMCO-BANDAI', 'JG. PS5 ASSASSINS CREED SHADOW', 1, 79.99, 'Vive uma história épica de ação e aventura históricas passada no Japão feudal! ', 'fotos/1747668031_img2.jpg'),
(15, 'MICROSOFT', ' Forza Horizon 5', 2, 69.99, 'A derradeira aventura do Horizon está à tua espera! Explora um mundo aberto de vibrantes paisagens mexicanas em constante evolução.', 'fotos/1747668595_img3.jpg'),
(16, 'SEGA EUROPE LTD', 'Football Manager 2024', 3, 59.99, 'No Football Manager 2024, não basta escolher um esquema tático ou criar uma equipa. Tens de aceitar desafios e ter em contas certas dificuldades  enquanto estabeleces o teu estilo.', 'fotos/1747669225_4.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipouser`
--

CREATE TABLE `tipouser` (
  `id_tipo` int(11) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipouser`
--

INSERT INTO `tipouser` (`id_tipo`, `descricao`) VALUES
(1, 'Admin'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `n_utilizador` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `passe` varchar(256) NOT NULL,
  `tipoUtilizador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`n_utilizador`, `login`, `email`, `passe`, `tipoUtilizador`) VALUES
(1, 'admin', 'admin@admin.pt', '698dc19d489c4e4db73e28a713eab07b', 1),
(2, 'teste', 'teste@teste.pt', '698dc19d489c4e4db73e28a713eab07b', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `n_vendas` int(11) NOT NULL,
  `n_utilizador` int(11) NOT NULL,
  `n_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinho_compra`
--
ALTER TABLE `carrinho_compra`
  ADD PRIMARY KEY (`n_carro`),
  ADD KEY `n_produto` (`n_produto`,`n_user`),
  ADD KEY `n_user` (`n_user`);

--
-- Índices para tabela `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`n_plataforma`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`n_produto`),
  ADD KEY `n_plataforma` (`n_plataforma`);

--
-- Índices para tabela `tipouser`
--
ALTER TABLE `tipouser`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`n_utilizador`),
  ADD KEY `tipoUtilizador` (`tipoUtilizador`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`n_vendas`),
  ADD KEY `n_utilizador` (`n_utilizador`),
  ADD KEY `n_produto` (`n_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho_compra`
--
ALTER TABLE `carrinho_compra`
  MODIFY `n_carro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `n_plataforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `n_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tipouser`
--
ALTER TABLE `tipouser`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `n_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `n_vendas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carrinho_compra`
--
ALTER TABLE `carrinho_compra`
  ADD CONSTRAINT `carrinho_compra_ibfk_1` FOREIGN KEY (`n_produto`) REFERENCES `produtos` (`n_produto`),
  ADD CONSTRAINT `carrinho_compra_ibfk_2` FOREIGN KEY (`n_user`) REFERENCES `utilizadores` (`n_utilizador`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `n_plataforma` FOREIGN KEY (`n_plataforma`) REFERENCES `plataforma` (`n_plataforma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD CONSTRAINT `utilizadores_ibfk_1` FOREIGN KEY (`tipoUtilizador`) REFERENCES `tipouser` (`id_tipo`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `n_produto` FOREIGN KEY (`n_produto`) REFERENCES `produtos` (`n_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `n_utilizador` FOREIGN KEY (`n_utilizador`) REFERENCES `utilizadores` (`n_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
