-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2021 at 11:20 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ReklamniProstori`
--

-- --------------------------------------------------------

--
-- Table structure for table `ImaSliku`
--

CREATE TABLE IF NOT EXISTS `ImaSliku` (
  `idRp` int(11) NOT NULL,
  `idSlika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `ImaSliku`
--

INSERT INTO `ImaSliku` (`idRp`, `idSlika`) VALUES
(1313, 1),
(2255, 4),
(6446, 2),
(6446, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ReklamniProstor`
--

CREATE TABLE IF NOT EXISTS `ReklamniProstor` (
  `idRp` int(11) NOT NULL,
  `idVrs` int(11) NOT NULL,
  `Adresa` varchar(45) COLLATE utf16_unicode_ci NOT NULL,
  `OpisLokacije` text COLLATE utf16_unicode_ci NOT NULL,
  `DimenzijaXcm` int(11) NOT NULL,
  `DimenzijaYcm` int(11) NOT NULL,
  `GeoSirina` decimal(6,4) NOT NULL,
  `GeoDuzina` decimal(6,4) NOT NULL,
  `CenaPoDanuRSD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `ReklamniProstor`
--

INSERT INTO `ReklamniProstor` (`idRp`, `idVrs`, `Adresa`, `OpisLokacije`, `DimenzijaXcm`, `DimenzijaYcm`, `GeoSirina`, `GeoDuzina`, `CenaPoDanuRSD`) VALUES
(1313, 1, 'Mutapova 4a', 'Veoma prohodan kraj sa pogledom sa ulice i okolnih zgrada.', 400, 250, 40.2565, 20.1542, 2500),
(2255, 1, 'Zvornicka 58', 'Jako prometno mesto sa velikim brojem okolnih stanica.', 450, 300, 40.2244, 20.6573, 3000),
(6446, 3, 'Pohorajeva 13', 'Pored autoputa nocno osvetljen i pored trznog centra.', 600, 300, 40.1122, 20.2233, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `Slike`
--

CREATE TABLE IF NOT EXISTS `Slike` (
  `idSlike` int(11) NOT NULL,
  `Slika` blob NOT NULL,
  `DatumOd` datetime NOT NULL,
  `DatumDo` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `Slike`
--

INSERT INTO `Slike` (`idSlike`, `Slika`, `DatumOd`, `DatumDo`) VALUES
(1, '', '2005-03-20 21:00:00', '2005-04-20 21:00:00'),
(2, '', '2010-05-20 21:00:00', '2018-05-20 21:00:00'),
(3, '', '2018-05-20 21:00:00', '2027-05-20 21:00:00'),
(4, '', '2030-06-20 21:00:00', '2030-07-20 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `VrstaProstora`
--

CREATE TABLE IF NOT EXISTS `VrstaProstora` (
  `idVrsta` int(11) NOT NULL,
  `Vrsta` varchar(45) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `VrstaProstora`
--

INSERT INTO `VrstaProstora` (`idVrsta`, `Vrsta`) VALUES
(1, 'LED Panel'),
(2, 'Bilbord'),
(3, 'Motorni Bilbord'),
(4, 'Pano'),
(5, 'Stubna reklama');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ImaSliku`
--
ALTER TABLE `ImaSliku`
  ADD KEY `idRp_idx` (`idRp`),
  ADD KEY `idSlika_idx` (`idSlika`);

--
-- Indexes for table `ReklamniProstor`
--
ALTER TABLE `ReklamniProstor`
  ADD PRIMARY KEY (`idRp`),
  ADD KEY `idV_idx` (`idVrs`);

--
-- Indexes for table `Slike`
--
ALTER TABLE `Slike`
  ADD PRIMARY KEY (`idSlike`);

--
-- Indexes for table `VrstaProstora`
--
ALTER TABLE `VrstaProstora`
  ADD PRIMARY KEY (`idVrsta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ImaSliku`
--
ALTER TABLE `ImaSliku`
  ADD CONSTRAINT `idRp` FOREIGN KEY (`idRp`) REFERENCES `ReklamniProstor` (`idRp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idSlika` FOREIGN KEY (`idSlika`) REFERENCES `Slike` (`idSlike`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ReklamniProstor`
--
ALTER TABLE `ReklamniProstor`
  ADD CONSTRAINT `idV` FOREIGN KEY (`idVrs`) REFERENCES `VrstaProstora` (`idVrsta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
