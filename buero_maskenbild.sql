-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 13. Sep 2018 um 21:19
-- Server-Version: 10.1.35-MariaDB
-- PHP-Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `buero_maskenbild`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Anschrift`
--

CREATE TABLE `Anschrift` (
  `ID` int(11) NOT NULL,
  `Straße` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `PLZ` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Ort` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Land` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kontaktdaten`
--

CREATE TABLE `Kontaktdaten` (
  `ID` int(11) NOT NULL,
  `Telefon` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Handy` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `E-Mail` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Homepage` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kostenkalkulation`
--

CREATE TABLE `Kostenkalkulation` (
  `ID` int(11) NOT NULL,
  `Kostenkalkulationstitel` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Kostenkalkulationsdatum` date NOT NULL,
  `Anzahl` int(11) NOT NULL,
  `ProjektID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kunde`
--

CREATE TABLE `Kunde` (
  `ID` int(11) NOT NULL,
  `Firma` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Vorname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Nachname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `AnschriftID` int(11) NOT NULL,
  `KontaktdatenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Positionen`
--

CREATE TABLE `Positionen` (
  `ID` int(11) NOT NULL,
  `Anzahl` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `KostenkalkulationsID` int(11) NOT NULL,
  `RechnungsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Produkt`
--

CREATE TABLE `Produkt` (
  `ID` int(11) NOT NULL,
  `Produktbezeichnung` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Produktkategorie` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Marke` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Einheit` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Preis` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Projekt`
--

CREATE TABLE `Projekt` (
  `ID` int(11) NOT NULL,
  `Projektbezeichnung` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Projektbeginn` date NOT NULL,
  `Projektende` date NOT NULL,
  `KundenID` int(11) NOT NULL,
  `ProjektleitungsID` int(11) NOT NULL,
  `RegieleitungsID` int(11) NOT NULL,
  `Anmerkung` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Projektleitung`
--

CREATE TABLE `Projektleitung` (
  `ID` int(11) NOT NULL,
  `Vorname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Nachname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `KontaktdatenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rechung`
--

CREATE TABLE `Rechung` (
  `ID` int(11) NOT NULL,
  `Rechungstitel` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Rechnungsdatum` date NOT NULL,
  `Anzahl` int(11) NOT NULL,
  `Rechnungssumme` float NOT NULL,
  `ProjektID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Regieleitung`
--

CREATE TABLE `Regieleitung` (
  `ID` int(11) NOT NULL,
  `Vorname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Nachname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `KontaktdatenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Anschrift`
--
ALTER TABLE `Anschrift`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Kontaktdaten`
--
ALTER TABLE `Kontaktdaten`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Kostenkalkulation`
--
ALTER TABLE `Kostenkalkulation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjektID` (`ProjektID`),
  ADD KEY `ProduktID` (`ProduktID`);

--
-- Indizes für die Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KontaktdatenID` (`KontaktdatenID`),
  ADD KEY `AnschriftID` (`AnschriftID`);

--
-- Indizes für die Tabelle `Positionen`
--
ALTER TABLE `Positionen`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KostenkalkulationsID` (`KostenkalkulationsID`),
  ADD KEY `RechnungsID` (`RechnungsID`);

--
-- Indizes für die Tabelle `Produkt`
--
ALTER TABLE `Produkt`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Projekt`
--
ALTER TABLE `Projekt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KundenID` (`KundenID`),
  ADD KEY `ProjektleitungsID` (`ProjektleitungsID`),
  ADD KEY `RegieleitungsID` (`RegieleitungsID`);

--
-- Indizes für die Tabelle `Projektleitung`
--
ALTER TABLE `Projektleitung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KontaktdatenID` (`KontaktdatenID`);

--
-- Indizes für die Tabelle `Rechung`
--
ALTER TABLE `Rechung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjektID` (`ProjektID`),
  ADD KEY `ProduktID` (`ProduktID`);

--
-- Indizes für die Tabelle `Regieleitung`
--
ALTER TABLE `Regieleitung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KontaktdatenID` (`KontaktdatenID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Anschrift`
--
ALTER TABLE `Anschrift`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Kontaktdaten`
--
ALTER TABLE `Kontaktdaten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Kostenkalkulation`
--
ALTER TABLE `Kostenkalkulation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Positionen`
--
ALTER TABLE `Positionen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Produkt`
--
ALTER TABLE `Produkt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Projekt`
--
ALTER TABLE `Projekt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Projektleitung`
--
ALTER TABLE `Projektleitung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Rechung`
--
ALTER TABLE `Rechung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Regieleitung`
--
ALTER TABLE `Regieleitung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Kostenkalkulation`
--
ALTER TABLE `Kostenkalkulation`
  ADD CONSTRAINT `Kostenkalkulation_ibfk_1` FOREIGN KEY (`ProduktID`) REFERENCES `Produkt` (`ID`);

--
-- Constraints der Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  ADD CONSTRAINT `Kunde_ibfk_1` FOREIGN KEY (`KontaktdatenID`) REFERENCES `Kontaktdaten` (`ID`),
  ADD CONSTRAINT `Kunde_ibfk_2` FOREIGN KEY (`AnschriftID`) REFERENCES `Anschrift` (`ID`);

--
-- Constraints der Tabelle `Positionen`
--
ALTER TABLE `Positionen`
  ADD CONSTRAINT `Positionen_ibfk_1` FOREIGN KEY (`RechnungsID`) REFERENCES `Rechung` (`ID`),
  ADD CONSTRAINT `Positionen_ibfk_2` FOREIGN KEY (`KostenkalkulationsID`) REFERENCES `Kostenkalkulation` (`ID`);

--
-- Constraints der Tabelle `Projekt`
--
ALTER TABLE `Projekt`
  ADD CONSTRAINT `Projekt_ibfk_1` FOREIGN KEY (`KundenID`) REFERENCES `Kunde` (`ID`),
  ADD CONSTRAINT `Projekt_ibfk_2` FOREIGN KEY (`ProjektleitungsID`) REFERENCES `Projektleitung` (`ID`),
  ADD CONSTRAINT `Projekt_ibfk_3` FOREIGN KEY (`RegieleitungsID`) REFERENCES `Regieleitung` (`ID`),
  ADD CONSTRAINT `Projekt_ibfk_4` FOREIGN KEY (`ID`) REFERENCES `Kostenkalkulation` (`ProjektID`);

--
-- Constraints der Tabelle `Projektleitung`
--
ALTER TABLE `Projektleitung`
  ADD CONSTRAINT `Projektleitung_ibfk_1` FOREIGN KEY (`KontaktdatenID`) REFERENCES `Kontaktdaten` (`ID`);

--
-- Constraints der Tabelle `Rechung`
--
ALTER TABLE `Rechung`
  ADD CONSTRAINT `Rechung_ibfk_1` FOREIGN KEY (`ProjektID`) REFERENCES `Projekt` (`ID`),
  ADD CONSTRAINT `Rechung_ibfk_2` FOREIGN KEY (`ProduktID`) REFERENCES `Produkt` (`ID`);

--
-- Constraints der Tabelle `Regieleitung`
--
ALTER TABLE `Regieleitung`
  ADD CONSTRAINT `Regieleitung_ibfk_1` FOREIGN KEY (`KontaktdatenID`) REFERENCES `Kontaktdaten` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
