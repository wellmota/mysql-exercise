-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2020 at 05:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistematizacao`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ator`
--

CREATE TABLE `Ator` (
  `IDAtor` int(11) NOT NULL,
  `NomeArtistico` varchar(30) NOT NULL,
  `Nascimento` date NOT NULL,
  `IDSexo` enum('M','F') NOT NULL,
  `IDNascionalidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ator`
--

INSERT INTO `Ator` (`IDAtor`, `NomeArtistico`, `Nascimento`, `IDSexo`, `IDNascionalidade`) VALUES
(1, 'Pedro Paulo', '1990-01-01', 'M', 1),
(2, 'Jose', '1988-01-01', 'M', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `IDFilme` int(11) NOT NULL,
  `IDAtor` int(11) NOT NULL,
  `CalorCache` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`IDFilme`, `IDAtor`, `CalorCache`) VALUES
(1, 1, '9000000'),
(2, 2, '10000000');

-- --------------------------------------------------------

--
-- Table structure for table `elenco`
--

CREATE TABLE `elenco` (
  `IDElenco` int(11) NOT NULL,
  `IDFilme` int(11) NOT NULL,
  `IDPersonagem` int(11) NOT NULL,
  `NomePersonagem` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elenco`
--

INSERT INTO `elenco` (`IDElenco`, `IDFilme`, `IDPersonagem`, `NomePersonagem`) VALUES
(1, 1, 1, 'Neo'),
(2, 1, 1, 'Trinity');

-- --------------------------------------------------------

--
-- Table structure for table `estudio`
--

CREATE TABLE `estudio` (
  `IDEstudio` int(11) NOT NULL,
  `IDProprietario` varchar(30) NOT NULL,
  `DataFundacao` date NOT NULL,
  `NomeEstudio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estudio`
--

INSERT INTO `estudio` (`IDEstudio`, `IDProprietario`, `DataFundacao`, `NomeEstudio`) VALUES
(1, '1', '1987-01-01', 'Estudio Azul'),
(2, '2', '1987-01-01', 'Estudio Amarelo');

-- --------------------------------------------------------

--
-- Table structure for table `faturamento_estudio`
--

CREATE TABLE `faturamento_estudio` (
  `IDFaturamentoEstuduio` int(11) NOT NULL,
  `IDEstudio` int(11) NOT NULL,
  `AnoFaturamento` char(4) DEFAULT NULL,
  `ValorFaturamento` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faturamento_estudio`
--

INSERT INTO `faturamento_estudio` (`IDFaturamentoEstuduio`, `IDEstudio`, `AnoFaturamento`, `ValorFaturamento`) VALUES
(1, 1, '2019', '100000'),
(2, 1, '2019', '100000');

-- --------------------------------------------------------

--
-- Table structure for table `filme`
--

CREATE TABLE `filme` (
  `IDFilme` int(11) NOT NULL,
  `IDEstudio` int(11) DEFAULT NULL,
  `NomeFilme` varchar(20) DEFAULT NULL,
  `NCopyright` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filme`
--

INSERT INTO `filme` (`IDFilme`, `IDEstudio`, `NomeFilme`, `NCopyright`) VALUES
(1, 1, 'Matrix', 123456782),
(2, 2, 'Velozes e Furiosos', 12345678);

-- --------------------------------------------------------

--
-- Table structure for table `nacionalidade`
--

CREATE TABLE `nacionalidade` (
  `IDNacionalidade` int(11) NOT NULL,
  `NomeNacionalidade` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nacionalidade`
--

INSERT INTO `nacionalidade` (`IDNacionalidade`, `NomeNacionalidade`) VALUES
(1, 'Brasileiro'),
(2, 'Americano');

-- --------------------------------------------------------

--
-- Table structure for table `papel`
--

CREATE TABLE `papel` (
  `IDPapel` int(11) NOT NULL,
  `NomePapel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `papel`
--

INSERT INTO `papel` (`IDPapel`, `NomePapel`) VALUES
(1, 'Criança'),
(2, 'Adulto');

-- --------------------------------------------------------

--
-- Table structure for table `personagem`
--

CREATE TABLE `personagem` (
  `IDPersonagem` int(11) NOT NULL,
  `IDFilme` int(11) NOT NULL,
  `IDAtor` int(11) NOT NULL,
  `NomePersonagem` varchar(20) DEFAULT NULL,
  `IDPapel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personagem`
--

INSERT INTO `personagem` (`IDPersonagem`, `IDFilme`, `IDAtor`, `NomePersonagem`, `IDPapel`) VALUES
(1, 1, 1, 'Neo', 2),
(2, 2, 2, 'Toreto', 2);

-- --------------------------------------------------------

--
-- Table structure for table `producao`
--

CREATE TABLE `producao` (
  `IDProducao` int(11) NOT NULL,
  `TempoProducao` char(2) DEFAULT NULL,
  `CustoProducao` int(11) DEFAULT NULL,
  `IDFilme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producao`
--

INSERT INTO `producao` (`IDProducao`, `TempoProducao`, `CustoProducao`, `IDFilme`) VALUES
(1, '5', 1000000, 1),
(2, '3', 2000000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `proprietario_estudio`
--

CREATE TABLE `proprietario_estudio` (
  `IDProprietario` int(11) NOT NULL,
  `NomeProprietario` varchar(20) DEFAULT NULL,
  `NumSegSocial` int(11) DEFAULT NULL,
  `IDEstudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proprietario_estudio`
--

INSERT INTO `proprietario_estudio` (`IDProprietario`, `NomeProprietario`, `NumSegSocial`, `IDEstudio`) VALUES
(1, 'Marcos Paulo', 123232, 0),
(2, 'Angelo Ribeiro', 223331, 0),
(3, NULL, NULL, 1),
(4, NULL, NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ator`
--
ALTER TABLE `Ator`
  ADD PRIMARY KEY (`IDAtor`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`IDFilme`,`IDAtor`);

--
-- Indexes for table `elenco`
--
ALTER TABLE `elenco`
  ADD PRIMARY KEY (`IDElenco`);

--
-- Indexes for table `estudio`
--
ALTER TABLE `estudio`
  ADD PRIMARY KEY (`IDEstudio`);

--
-- Indexes for table `faturamento_estudio`
--
ALTER TABLE `faturamento_estudio`
  ADD PRIMARY KEY (`IDFaturamentoEstuduio`,`IDEstudio`);

--
-- Indexes for table `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`IDFilme`);

--
-- Indexes for table `nacionalidade`
--
ALTER TABLE `nacionalidade`
  ADD PRIMARY KEY (`IDNacionalidade`);

--
-- Indexes for table `papel`
--
ALTER TABLE `papel`
  ADD PRIMARY KEY (`IDPapel`);

--
-- Indexes for table `personagem`
--
ALTER TABLE `personagem`
  ADD PRIMARY KEY (`IDPersonagem`);

--
-- Indexes for table `producao`
--
ALTER TABLE `producao`
  ADD PRIMARY KEY (`IDProducao`);

--
-- Indexes for table `proprietario_estudio`
--
ALTER TABLE `proprietario_estudio`
  ADD PRIMARY KEY (`IDProprietario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ator`
--
ALTER TABLE `Ator`
  MODIFY `IDAtor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cache`
--
ALTER TABLE `cache`
  MODIFY `IDFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `elenco`
--
ALTER TABLE `elenco`
  MODIFY `IDElenco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estudio`
--
ALTER TABLE `estudio`
  MODIFY `IDEstudio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faturamento_estudio`
--
ALTER TABLE `faturamento_estudio`
  MODIFY `IDFaturamentoEstuduio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `filme`
--
ALTER TABLE `filme`
  MODIFY `IDFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nacionalidade`
--
ALTER TABLE `nacionalidade`
  MODIFY `IDNacionalidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `papel`
--
ALTER TABLE `papel`
  MODIFY `IDPapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personagem`
--
ALTER TABLE `personagem`
  MODIFY `IDPersonagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producao`
--
ALTER TABLE `producao`
  MODIFY `IDProducao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proprietario_estudio`
--
ALTER TABLE `proprietario_estudio`
  MODIFY `IDProprietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
