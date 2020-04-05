-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 05. dub 2020, 14:58
-- Verze serveru: 10.1.36-MariaDB
-- Verze PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `tickety`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `autorizace`
--

CREATE TABLE `autorizace` (
  `id` int(11) NOT NULL,
  `nazev` varchar(30) CHARACTER SET utf8 NOT NULL,
  `barva` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `autorizace`
--

INSERT INTO `autorizace` (`id`, `nazev`, `barva`) VALUES
(1, 'správce', '#ff8d00'),
(2, 'admin', '#59afff'),
(3, 'uživatel', '#66fbb3');

-- --------------------------------------------------------

--
-- Struktura tabulky `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `typ` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'Obecné'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `kategorie`
--

INSERT INTO `kategorie` (`id`, `typ`) VALUES
(1, 'obecné'),
(2, 'hardware'),
(3, 'software');

-- --------------------------------------------------------

--
-- Struktura tabulky `spolecnost`
--

CREATE TABLE `spolecnost` (
  `id_spol` int(11) NOT NULL,
  `nazev` varchar(50) CHARACTER SET utf8 NOT NULL,
  `telefon` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `spolecnost`
--

INSERT INTO `spolecnost` (`id_spol`, `nazev`, `telefon`, `email`) VALUES
(1, 'BMW', '1234', 'bmw@gmail.com'),
(2, 'Audi', 'info@audi,cz', '765987213'),
(3, 'O2', '558293846', 'info@ou.cz'),
(4, 'Vodafone', '559830987', 'info@vodafone.cz'),
(5, 'T-mobile', '558765120', 'info@tmobile.cz');

-- --------------------------------------------------------

--
-- Struktura tabulky `statusy`
--

CREATE TABLE `statusy` (
  `id` int(11) NOT NULL,
  `nazev` varchar(15) CHARACTER SET utf8 NOT NULL,
  `barva` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `statusy`
--

INSERT INTO `statusy` (`id`, `nazev`, `barva`) VALUES
(1, 'otevřený', '#2A2C2D'),
(2, 'přidělen', '#111515'),
(3, 'probíhající', 'rgba(0, 0, 0, 0.075)'),
(4, 'uzavřený', '#66fbb3');

-- --------------------------------------------------------

--
-- Struktura tabulky `tickety`
--

CREATE TABLE `tickety` (
  `id` int(11) NOT NULL,
  `predmet` varchar(50) CHARACTER SET utf8 NOT NULL,
  `popisek` varchar(100) CHARACTER SET utf8 NOT NULL,
  `kategorizuje_id` int(11) NOT NULL,
  `ma_uzivatele_id` int(11) NOT NULL,
  `ma_uzivatele_autorizuje_id` int(11) NOT NULL,
  `statusuje_id` int(11) NOT NULL,
  `mailsys` int(11) NOT NULL DEFAULT '0',
  `datum` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pridelen_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `tickety`
--

INSERT INTO `tickety` (`id`, `predmet`, `popisek`, `kategorizuje_id`, `ma_uzivatele_id`, `ma_uzivatele_autorizuje_id`, `statusuje_id`, `mailsys`, `datum`, `pridelen_ID`) VALUES
(1, 'Test Martina Benka', 'te', 3, 8, 3, 4, 0, '2020/04/04 07:33:16', 5),
(2, 'Test statistiky', 'dsad', 2, 7, 3, 3, 0, '2020/04/04 07:38:04', 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatele`
--

CREATE TABLE `uzivatele` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(20) CHARACTER SET utf8 NOT NULL,
  `prijmeni` varchar(30) CHARACTER SET utf8 NOT NULL,
  `nick` varchar(30) CHARACTER SET utf8 NOT NULL,
  `heslo` varchar(60) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `telefon` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `kategorie_id` int(11) DEFAULT NULL,
  `spolecnost_id` int(11) DEFAULT NULL,
  `autorizuje_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatele`
--

INSERT INTO `uzivatele` (`id`, `jmeno`, `prijmeni`, `nick`, `heslo`, `email`, `telefon`, `kategorie_id`, `spolecnost_id`, `autorizuje_id`) VALUES
(1, 'Ondřej', 'Hubík', 'hubiko', '1b929b62a2c822c4a59e688fde2a3a0b', 'hubikorg@gmail.com', '0', NULL, 0, 1),
(3, 'Jakub', 'Navrátil', 'navratilj', '052ae9a463019683738ff90984698dcb', 'navratilj@ticketsro.cz', '767651029', 1, NULL, 2),
(4, 'Patrik', 'Smutný', 'smutnyp', 'a4bf5b5179df1ee88d45ad66bca7c7b6', 'smutnyp@ticketsro.cz', '761092873', 2, NULL, 2),
(5, 'Richard ', 'Seidler', 'seidlerr', '629dd546d0c3ee4385fa86910bcdb40b', 'seidlerr@ticketsro.cz', '72918766', 3, NULL, 2),
(6, 'Libor', 'Šunka', 'sunkal', 'efd2c9fc26fa07bb78038e847513643d', 'sunkal@bmw.cz', '768210981', NULL, 1, 3),
(7, 'Petr', 'Novák', 'novakp', 'd2dcd8a64a032046c044afcb69a18e77', 'novakp@audi.cz', '987109280', NULL, 2, 3),
(8, 'Martin', 'Benek', 'benekm', '52c7cce7783ea47a591d7a2ffd61b6a8', 'benekm@vodafone.cz', '765098198', NULL, 4, 3),
(9, 'Vojtěch', 'Herman', 'hermanv', '4823d73eaec51ce106441720942e842b', 'hermanv@o2.cz', '768264732', NULL, 1, 3),
(10, 'Roman', 'Slepý', 'slepyr', '125aa8f5034c38e27c3ffd168d2ee5b3', 'slepyr@tmobile.cz', '763098109', NULL, 5, 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `zpravy`
--

CREATE TABLE `zpravy` (
  `id_zpravy` int(11) NOT NULL,
  `id_ticketu` int(11) NOT NULL,
  `id_uzivatele` int(11) NOT NULL,
  `id_autorizace` int(11) NOT NULL,
  `datum` varchar(30) CHARACTER SET utf8 NOT NULL,
  `zprava` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `zpravy`
--

INSERT INTO `zpravy` (`id_zpravy`, `id_ticketu`, `id_uzivatele`, `id_autorizace`, `datum`, `zprava`) VALUES
(31, 23, 10, 3, '2020/02/17 06:59:48', 'Nefungujou mi bakaláři!'),
(32, 23, 10, 3, '2020/02/17 07:12:11', 'Změna statusu'),
(33, 23, 9, 2, '2020/02/17 07:12:41', 'Změna statusu'),
(34, 23, 9, 2, '2020/02/17 07:21:04', 'Zkouška barvy'),
(35, 16, 12, 2, '2020/03/19 03:21:43', 'Neřvi!'),
(36, 18, 7, 2, '2020/04/01 02:08:05', 'Ahoj, vše je vyřešeno, můžeš uzavřít tiket!'),
(37, 17, 7, 2, '2020/04/01 02:10:51', 'Vyřešeno, můžeš ukončit'),
(38, 14, 7, 2, '2020/04/01 02:20:39', 'Vyřešeno, uzavři tiket!'),
(39, 24, 7, 2, '2020/04/01 02:30:05', 'Vyřešeno, pane Novák!'),
(40, 25, 2, 3, '2020/04/01 02:31:30', 'Pomoc!'),
(41, 25, 9, 2, '2020/04/01 02:47:59', 'Vyřešeno!'),
(42, 26, 7, 2, '2020/04/01 02:53:58', 'Vyřešeno! Uzavři tiket'),
(43, 27, 10, 3, '2020/04/01 10:47:19', 'Dobrý den,\r\n\r\nnedávno mi přestal fungovat server. Nevíte, co stím?'),
(44, 27, 9, 2, '2020/04/01 10:54:50', 'Dobrý den, máte zapojený síťtový kabel?'),
(45, 27, 10, 3, '2020/04/01 10:55:21', 'To bude ten problém! Děkuji'),
(46, 28, 5, 3, '2020/04/01 11:03:08', 'Blablabla'),
(47, 28, 8, 2, '2020/04/01 11:06:42', 'bldasfasdfsd'),
(48, 29, 7, 2, '2020/04/01 11:43:16', 'fsdaf'),
(49, 31, 12, 2, '2020/04/02 12:00:25', 'fdasfasdf'),
(50, 1, 8, 3, '2020/04/04 07:33:27', 'Potřebuji pomoc'),
(51, 1, 5, 2, '2020/04/04 07:35:21', 'Tiket vyřešen! Uzavři, prosím'),
(52, 2, 7, 3, '2020/04/04 07:38:59', 'Helloo'),
(53, 2, 4, 2, '2020/04/04 07:39:49', 'dasdasf');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `autorizace`
--
ALTER TABLE `autorizace`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `spolecnost`
--
ALTER TABLE `spolecnost`
  ADD PRIMARY KEY (`id_spol`);

--
-- Klíče pro tabulku `statusy`
--
ALTER TABLE `statusy`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `tickety`
--
ALTER TABLE `tickety`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `uzivatele`
--
ALTER TABLE `uzivatele`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `zpravy`
--
ALTER TABLE `zpravy`
  ADD PRIMARY KEY (`id_zpravy`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `autorizace`
--
ALTER TABLE `autorizace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `spolecnost`
--
ALTER TABLE `spolecnost`
  MODIFY `id_spol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `statusy`
--
ALTER TABLE `statusy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `tickety`
--
ALTER TABLE `tickety`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `uzivatele`
--
ALTER TABLE `uzivatele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `zpravy`
--
ALTER TABLE `zpravy`
  MODIFY `id_zpravy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
