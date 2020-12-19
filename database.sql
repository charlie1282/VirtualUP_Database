-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 19, 2020 alle 13:11
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `generale`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `abilitafiltri`
--

CREATE TABLE `abilitafiltri` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `attivo` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazioni`
--

CREATE TABLE `applicazioni` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `licenza` int(11) NOT NULL,
  `datacreazione` datetime NOT NULL DEFAULT current_timestamp(),
  `folder` varchar(50) NOT NULL,
  `multilingua` bit(1) DEFAULT b'0',
  `categorie` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazionichiavi`
--

CREATE TABLE `applicazionichiavi` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `chiavesegreta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazionilogs`
--

CREATE TABLE `applicazionilogs` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `username` int(11) DEFAULT NULL,
  `remoteip` varchar(15) NOT NULL,
  `dataaccesso` datetime DEFAULT current_timestamp(),
  `ultimoaggiornamento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazionimultilingua`
--

CREATE TABLE `applicazionimultilingua` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `lingua` int(11) NOT NULL,
  `defaultlingua` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazionisceltatipo`
--

CREATE TABLE `applicazionisceltatipo` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazionitipo`
--

CREATE TABLE `applicazionitipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `applicazioniutenti`
--

CREATE TABLE `applicazioniutenti` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `utente` int(11) NOT NULL,
  `ruolo` int(11) NOT NULL,
  `attivo` bit(1) DEFAULT b'1',
  `bloccato` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `piattaforma` varchar(15) NOT NULL,
  `versioning` varchar(100) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `chiave` varchar(100) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `ultimamodifica` datetime NOT NULL DEFAULT current_timestamp(),
  `asset` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `aziendainfo`
--

CREATE TABLE `aziendainfo` (
  `id` int(11) NOT NULL,
  `indirizzo` varchar(50) DEFAULT NULL,
  `citta` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `aziende`
--

CREATE TABLE `aziende` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `partitaiva` varchar(16) NOT NULL,
  `info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `aziendeapplicazioni`
--

CREATE TABLE `aziendeapplicazioni` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `azienda` int(11) NOT NULL,
  `licenza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `lastattemp` datetime DEFAULT current_timestamp(),
  `attemps` int(11) NOT NULL,
  `blocked` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `chiavisegrete`
--

CREATE TABLE `chiavisegrete` (
  `id` int(11) NOT NULL,
  `chiave` varchar(50) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `datacreazione` datetime DEFAULT current_timestamp(),
  `secret` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `configurationoptions`
--

CREATE TABLE `configurationoptions` (
  `id` int(11) NOT NULL,
  `configuration` int(11) DEFAULT NULL,
  `opzione` varchar(50) NOT NULL,
  `valore` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `configurations`
--

CREATE TABLE `configurations` (
  `id` int(11) NOT NULL,
  `principale` int(11) DEFAULT NULL,
  `applicazione` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `login` bit(1) DEFAULT b'0',
  `nome` varchar(100) DEFAULT NULL,
  `image` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `contenuti`
--

CREATE TABLE `contenuti` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `marker` int(11) DEFAULT NULL,
  `contenuto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `contenuto`
--

CREATE TABLE `contenuto` (
  `id` int(11) NOT NULL,
  `contenuto` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `visibile` bit(1) DEFAULT b'0',
  `valido` bit(1) NOT NULL,
  `versioning` varchar(100) DEFAULT NULL,
  `piattaforma` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `contenutolingua`
--

CREATE TABLE `contenutolingua` (
  `id` int(11) NOT NULL,
  `contenuto` int(11) NOT NULL,
  `lingua` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `contenutoshader`
--

CREATE TABLE `contenutoshader` (
  `id` int(11) NOT NULL,
  `contenuto` int(11) NOT NULL,
  `shader` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `databaseconfig`
--

CREATE TABLE `databaseconfig` (
  `id` int(11) NOT NULL,
  `impostazione` varchar(50) NOT NULL,
  `valore` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `databasesvuforia`
--

CREATE TABLE `databasesvuforia` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `marker` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `errori`
--

CREATE TABLE `errori` (
  `id` int(11) NOT NULL,
  `datacreazione` datetime NOT NULL DEFAULT current_timestamp(),
  `errore` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `errori`
--
DELIMITER $$
CREATE TRIGGER `TR_Errori_Notifications` AFTER INSERT ON `errori` FOR EACH ROW insert into Notifications (ruolo, utenti, titolo, notifica)
	values ('1', '1', "1 Nuovo errore", concat('Si è creato un nuovo errore'))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `filtroapplicazione`
--

CREATE TABLE `filtroapplicazione` (
  `id` int(11) NOT NULL,
  `applicazione` int(11) NOT NULL,
  `filtro` int(11) NOT NULL,
  `conteggio` int(11) DEFAULT 0,
  `infinito` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `formatiaccettati`
--

CREATE TABLE `formatiaccettati` (
  `id` int(11) NOT NULL,
  `nome` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `infoutente`
--

CREATE TABLE `infoutente` (
  `id` int(11) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `utente` int(11) NOT NULL,
  `dataregistrazione` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `licenzainfo`
--

CREATE TABLE `licenzainfo` (
  `id` int(11) NOT NULL,
  `licenza` int(11) NOT NULL,
  `titolo` varchar(100) DEFAULT NULL,
  `descrizione` varchar(512) DEFAULT NULL,
  `target` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `licenze`
--

CREATE TABLE `licenze` (
  `id` int(11) NOT NULL,
  `tipolicenza` int(11) NOT NULL,
  `numeromarket` int(11) NOT NULL,
  `numero` varchar(64) NOT NULL,
  `validada` datetime DEFAULT NULL,
  `validafino` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue`
--

CREATE TABLE `lingue` (
  `id` int(11) NOT NULL,
  `lingua` varchar(50) NOT NULL,
  `sigla` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `loginlog`
--

CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL,
  `utente` int(11) DEFAULT NULL,
  `tentativo` datetime DEFAULT current_timestamp(),
  `valido` bit(1) DEFAULT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `loginlog`
--
DELIMITER $$
CREATE TRIGGER `TR_LoginLog_Registration` AFTER INSERT ON `loginlog` FOR EACH ROW insert into Notifications (ruolo, utenti, titolo, notifica)
	values ('1', NEW.utente, "1 Tentativo di log", concat('Tentativo di log dall''app: ', ifnull(NEW.utente, '')))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `marker`
--

CREATE TABLE `marker` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `applicazione` int(11) DEFAULT NULL,
  `identificativo` varchar(64) NOT NULL,
  `visibile` bit(1) NOT NULL DEFAULT b'0',
  `nomedatabase` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `markercategories`
--

CREATE TABLE `markercategories` (
  `id` int(11) NOT NULL,
  `marker` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `notificationconfig`
--

CREATE TABLE `notificationconfig` (
  `id` int(11) NOT NULL,
  `ruolo` varchar(25) NOT NULL,
  `tiporuolo` int(11) NOT NULL,
  `utenti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `datacreazione` datetime DEFAULT current_timestamp(),
  `ruolo` varchar(100) DEFAULT NULL,
  `utenti` varchar(255) DEFAULT NULL,
  `titolo` varchar(100) DEFAULT NULL,
  `notifica` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `notificationsreaded`
--

CREATE TABLE `notificationsreaded` (
  `id` int(11) NOT NULL,
  `utente` int(11) NOT NULL,
  `notifica` int(11) NOT NULL,
  `datalettura` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `notificationsroles`
--

CREATE TABLE `notificationsroles` (
  `id` int(11) NOT NULL,
  `utente` varchar(50) NOT NULL,
  `notifica` int(11) NOT NULL,
  `letta` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `passwords`
--

CREATE TABLE `passwords` (
  `id` int(11) NOT NULL,
  `utente` int(11) NOT NULL,
  `pass` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  `attemps` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `platformlogs`
--

CREATE TABLE `platformlogs` (
  `id` int(11) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `dati` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `ipaddress` varchar(25) DEFAULT NULL,
  `activitydate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `platformlogs`
--
DELIMITER $$
CREATE TRIGGER `trg_Statistics` AFTER INSERT ON `platformlogs` FOR EACH ROW begin
  IF EXISTS (select count(*) from platformlogs where date(activitydate) = curdate() > 0) THEN
    update Statistics s
			set s.accessi = (select count(*) from platformlogs where date(activitydate) = curdate())
		 where date(s.giorno) = curdate();
  ELSE 
    insert into Statistics (giorno, accessi)
		 values (date(curdate()),
		 (select distinct
			count(ipaddress) 
		from platformlogs where date(activitydate) = curdate()));
  END IF;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ruoloutente`
--

CREATE TABLE `ruoloutente` (
  `id` int(11) NOT NULL,
  `utenteid` int(11) NOT NULL,
  `ruolo` int(11) NOT NULL,
  `applicazione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `token` varchar(128) NOT NULL,
  `ultimoaccesso` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `giorno` datetime NOT NULL,
  `accessi` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipocontenuto`
--

CREATE TABLE `tipocontenuto` (
  `id` int(11) NOT NULL,
  `tipo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipocookie`
--

CREATE TABLE `tipocookie` (
  `id` int(11) NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `descrizionebreve` varchar(256) NOT NULL,
  `obbligatoria` int(11) NOT NULL DEFAULT 0,
  `globale` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipofiltro`
--

CREATE TABLE `tipofiltro` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipoformato`
--

CREATE TABLE `tipoformato` (
  `id` int(11) NOT NULL,
  `formatoaccettato` int(11) NOT NULL,
  `tipocontenuto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipolicenze`
--

CREATE TABLE `tipolicenze` (
  `id` int(11) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `descrizione` varchar(512) NOT NULL,
  `tempovalidita` int(11) NOT NULL DEFAULT 0,
  `visibile` bit(1) DEFAULT b'0',
  `numeromarket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiporuolo`
--

CREATE TABLE `tiporuolo` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `attivo` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bloccato` bit(1) DEFAULT b'0',
  `attivo` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `utente`
--
DELIMITER $$
CREATE TRIGGER `TR_User_Registration` AFTER INSERT ON `utente` FOR EACH ROW insert into Notifications (notifica)
	values (concat('Nuovo utente registrato: ', NEW.username))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `utente` int(11) NOT NULL,
  `token` varchar(50) NOT NULL,
  `valido` bit(1) DEFAULT b'1',
  `creato` datetime DEFAULT current_timestamp(),
  `utilizzato` datetime DEFAULT current_timestamp(),
  `permanente` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `visitorsproject`
--

CREATE TABLE `visitorsproject` (
  `id` int(11) NOT NULL,
  `visitatore` int(11) NOT NULL,
  `progetto` int(11) NOT NULL,
  `marker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `abilitafiltri`
--
ALTER TABLE `abilitafiltri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_abilitafiltri_applicazione` (`applicazione`);

--
-- Indici per le tabelle `applicazioni`
--
ALTER TABLE `applicazioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `applicazionichiavi`
--
ALTER TABLE `applicazionichiavi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applicazione` (`applicazione`),
  ADD UNIQUE KEY `chiavesegreta` (`chiavesegreta`);

--
-- Indici per le tabelle `applicazionilogs`
--
ALTER TABLE `applicazionilogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ApplicazioniLogs_Utente` (`username`),
  ADD KEY `FK_ApplicazioniLogs_Applicazioni` (`applicazione`);

--
-- Indici per le tabelle `applicazionimultilingua`
--
ALTER TABLE `applicazionimultilingua`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ApplicazioniMultilingua_Applicazioni` (`applicazione`),
  ADD KEY `FK_ApplicazioniMultilingua_Lingua` (`lingua`);

--
-- Indici per le tabelle `applicazionisceltatipo`
--
ALTER TABLE `applicazionisceltatipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_applicazionisceltatipo_applicazioni` (`applicazione`),
  ADD KEY `fk_applicazionisceltatipo_applicazionitipo` (`tipo`);

--
-- Indici per le tabelle `applicazionitipo`
--
ALTER TABLE `applicazionitipo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `applicazioniutenti`
--
ALTER TABLE `applicazioniutenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ApplicazioniUtenti_Applicazioni` (`applicazione`),
  ADD KEY `FK_ApplicazioniUtenti_Utente` (`utente`),
  ADD KEY `FK_ApplicazioniUtenti_TipoRuolo` (`ruolo`);

--
-- Indici per le tabelle `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Assets_Applicazioni` (`applicazione`);

--
-- Indici per le tabelle `aziendainfo`
--
ALTER TABLE `aziendainfo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `aziende`
--
ALTER TABLE `aziende`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partitaiva` (`partitaiva`),
  ADD KEY `FK_Azienda_AziendaInfo` (`info`);

--
-- Indici per le tabelle `aziendeapplicazioni`
--
ALTER TABLE `aziendeapplicazioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_AziendeApplicazioni_Applicazioni` (`applicazione`),
  ADD KEY `FK_AziendeApplicazioni_Azienda` (`azienda`),
  ADD KEY `FK_AziendeApplicazioni_Licenze` (`licenza`);

--
-- Indici per le tabelle `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categories_applicazione` (`applicazione`),
  ADD KEY `fk_categories_subcategory` (`parent`);

--
-- Indici per le tabelle `chiavisegrete`
--
ALTER TABLE `chiavisegrete`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applicazione` (`applicazione`),
  ADD UNIQUE KEY `chiave` (`chiave`);

--
-- Indici per le tabelle `configurationoptions`
--
ALTER TABLE `configurationoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_configurationoptions_configuration` (`configuration`);

--
-- Indici per le tabelle `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_configuration_applicazioni` (`applicazione`),
  ADD KEY `fk_configurations_applicazioneprincipale` (`principale`);

--
-- Indici per le tabelle `contenuti`
--
ALTER TABLE `contenuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Contenuti_Applicazioni` (`applicazione`),
  ADD KEY `FK_Contenuti_Contenuto` (`contenuto`),
  ADD KEY `FK_Contenuti_Marker` (`marker`);

--
-- Indici per le tabelle `contenuto`
--
ALTER TABLE `contenuto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Contenuto_TipoContenuto` (`tipo`);

--
-- Indici per le tabelle `contenutolingua`
--
ALTER TABLE `contenutolingua`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contenutolingua_contenuto` (`contenuto`),
  ADD KEY `fk_contenutolingua_lingua` (`lingua`);

--
-- Indici per le tabelle `contenutoshader`
--
ALTER TABLE `contenutoshader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contenutoshader_contenuto` (`contenuto`);

--
-- Indici per le tabelle `databaseconfig`
--
ALTER TABLE `databaseconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `databasesvuforia`
--
ALTER TABLE `databasesvuforia`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `errori`
--
ALTER TABLE `errori`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `filtroapplicazione`
--
ALTER TABLE `filtroapplicazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filtroapplicazione_tipofiltro` (`filtro`),
  ADD KEY `fk_filtroapplicazione_applicazioni` (`applicazione`);

--
-- Indici per le tabelle `formatiaccettati`
--
ALTER TABLE `formatiaccettati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `infoutente`
--
ALTER TABLE `infoutente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_InfoUtente_Utente` (`utente`);

--
-- Indici per le tabelle `licenzainfo`
--
ALTER TABLE `licenzainfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_LicenzaInfo_Licenze` (`licenza`);

--
-- Indici per le tabelle `licenze`
--
ALTER TABLE `licenze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Licenze_TipoLicenza` (`tipolicenza`);

--
-- Indici per le tabelle `lingue`
--
ALTER TABLE `lingue`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `loginlog`
--
ALTER TABLE `loginlog`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `marker`
--
ALTER TABLE `marker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Marker_DatabasesVuforia` (`nomedatabase`);

--
-- Indici per le tabelle `markercategories`
--
ALTER TABLE `markercategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_markercategories_marker` (`marker`),
  ADD KEY `fk_markercategories_category` (`category`);

--
-- Indici per le tabelle `notificationconfig`
--
ALTER TABLE `notificationconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `notificationsreaded`
--
ALTER TABLE `notificationsreaded`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_NotificationsReaded_Utente` (`utente`),
  ADD KEY `FK_NotificationsReaded_Notifications` (`notifica`);

--
-- Indici per le tabelle `notificationsroles`
--
ALTER TABLE `notificationsroles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `passwords`
--
ALTER TABLE `passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Passwords_Utente` (`utente`);

--
-- Indici per le tabelle `platformlogs`
--
ALTER TABLE `platformlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ruoloutente`
--
ALTER TABLE `ruoloutente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utenteid` (`utenteid`,`applicazione`),
  ADD KEY `FK_RuoloUtente_TipoRuolo` (`ruolo`),
  ADD KEY `FK_RuoloUtente_Applicazioni` (`applicazione`);

--
-- Indici per le tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tipocontenuto`
--
ALTER TABLE `tipocontenuto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tipocookie`
--
ALTER TABLE `tipocookie`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tipofiltro`
--
ALTER TABLE `tipofiltro`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tipoformato`
--
ALTER TABLE `tipoformato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TipoFormato_FormatiAccettati` (`formatoaccettato`),
  ADD KEY `FK_TipoFormato_TipoContenuto` (`tipocontenuto`);

--
-- Indici per le tabelle `tipolicenze`
--
ALTER TABLE `tipolicenze`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tiporuolo`
--
ALTER TABLE `tiporuolo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Visitors_Utente` (`utente`);

--
-- Indici per le tabelle `visitorsproject`
--
ALTER TABLE `visitorsproject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_VisitorsProject_Visitors` (`visitatore`),
  ADD KEY `FK_VisitorsProject_Applicazioni` (`progetto`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `abilitafiltri`
--
ALTER TABLE `abilitafiltri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `applicazioni`
--
ALTER TABLE `applicazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `applicazionichiavi`
--
ALTER TABLE `applicazionichiavi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `applicazionilogs`
--
ALTER TABLE `applicazionilogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT per la tabella `applicazionimultilingua`
--
ALTER TABLE `applicazionimultilingua`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `applicazionisceltatipo`
--
ALTER TABLE `applicazionisceltatipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `applicazionitipo`
--
ALTER TABLE `applicazionitipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `applicazioniutenti`
--
ALTER TABLE `applicazioniutenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT per la tabella `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `aziendainfo`
--
ALTER TABLE `aziendainfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `aziende`
--
ALTER TABLE `aziende`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `aziendeapplicazioni`
--
ALTER TABLE `aziendeapplicazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `chiavisegrete`
--
ALTER TABLE `chiavisegrete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `configurationoptions`
--
ALTER TABLE `configurationoptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `contenuti`
--
ALTER TABLE `contenuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT per la tabella `contenuto`
--
ALTER TABLE `contenuto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT per la tabella `contenutolingua`
--
ALTER TABLE `contenutolingua`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT per la tabella `contenutoshader`
--
ALTER TABLE `contenutoshader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `databaseconfig`
--
ALTER TABLE `databaseconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `databasesvuforia`
--
ALTER TABLE `databasesvuforia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT per la tabella `errori`
--
ALTER TABLE `errori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `filtroapplicazione`
--
ALTER TABLE `filtroapplicazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `formatiaccettati`
--
ALTER TABLE `formatiaccettati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `infoutente`
--
ALTER TABLE `infoutente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `licenzainfo`
--
ALTER TABLE `licenzainfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `licenze`
--
ALTER TABLE `licenze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `lingue`
--
ALTER TABLE `lingue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `loginlog`
--
ALTER TABLE `loginlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT per la tabella `marker`
--
ALTER TABLE `marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT per la tabella `markercategories`
--
ALTER TABLE `markercategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `notificationconfig`
--
ALTER TABLE `notificationconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT per la tabella `notificationsreaded`
--
ALTER TABLE `notificationsreaded`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `notificationsroles`
--
ALTER TABLE `notificationsroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `passwords`
--
ALTER TABLE `passwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT per la tabella `platformlogs`
--
ALTER TABLE `platformlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7042;

--
-- AUTO_INCREMENT per la tabella `ruoloutente`
--
ALTER TABLE `ruoloutente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `tipocontenuto`
--
ALTER TABLE `tipocontenuto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `tipocookie`
--
ALTER TABLE `tipocookie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tipofiltro`
--
ALTER TABLE `tipofiltro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `tipoformato`
--
ALTER TABLE `tipoformato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tipolicenze`
--
ALTER TABLE `tipolicenze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `tiporuolo`
--
ALTER TABLE `tiporuolo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT per la tabella `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `visitorsproject`
--
ALTER TABLE `visitorsproject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `abilitafiltri`
--
ALTER TABLE `abilitafiltri`
  ADD CONSTRAINT `fk_abilitafiltri_applicazione` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`);

--
-- Limiti per la tabella `applicazionichiavi`
--
ALTER TABLE `applicazionichiavi`
  ADD CONSTRAINT `FK_ApplicazioneChiavi_Applicazione` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `FK_ApplicazioniChiavi_ChiaviSegrete` FOREIGN KEY (`chiavesegreta`) REFERENCES `chiavisegrete` (`id`);

--
-- Limiti per la tabella `applicazionilogs`
--
ALTER TABLE `applicazionilogs`
  ADD CONSTRAINT `FK_ApplicazioniLogs_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`);

--
-- Limiti per la tabella `applicazionimultilingua`
--
ALTER TABLE `applicazionimultilingua`
  ADD CONSTRAINT `FK_ApplicazioniMultilingua_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `FK_ApplicazioniMultilingua_Lingua` FOREIGN KEY (`lingua`) REFERENCES `lingue` (`id`);

--
-- Limiti per la tabella `applicazionisceltatipo`
--
ALTER TABLE `applicazionisceltatipo`
  ADD CONSTRAINT `fk_applicazionisceltatipo_applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `fk_applicazionisceltatipo_applicazionitipo` FOREIGN KEY (`tipo`) REFERENCES `applicazionitipo` (`id`);

--
-- Limiti per la tabella `applicazioniutenti`
--
ALTER TABLE `applicazioniutenti`
  ADD CONSTRAINT `FK_ApplicazioniUtenti_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `FK_ApplicazioniUtenti_TipoRuolo` FOREIGN KEY (`ruolo`) REFERENCES `tiporuolo` (`id`),
  ADD CONSTRAINT `FK_ApplicazioniUtenti_Utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`id`);

--
-- Limiti per la tabella `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `FK_Assets_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`);

--
-- Limiti per la tabella `aziende`
--
ALTER TABLE `aziende`
  ADD CONSTRAINT `FK_Azienda_AziendaInfo` FOREIGN KEY (`info`) REFERENCES `aziendainfo` (`id`);

--
-- Limiti per la tabella `aziendeapplicazioni`
--
ALTER TABLE `aziendeapplicazioni`
  ADD CONSTRAINT `FK_AziendeApplicazioni_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `FK_AziendeApplicazioni_Azienda` FOREIGN KEY (`azienda`) REFERENCES `aziende` (`id`),
  ADD CONSTRAINT `FK_AziendeApplicazioni_Licenze` FOREIGN KEY (`licenza`) REFERENCES `licenze` (`id`);

--
-- Limiti per la tabella `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_categories_applicazione` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `fk_categories_subcategory` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`);

--
-- Limiti per la tabella `chiavisegrete`
--
ALTER TABLE `chiavisegrete`
  ADD CONSTRAINT `FK_ChiaviSegrete_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`);

--
-- Limiti per la tabella `configurationoptions`
--
ALTER TABLE `configurationoptions`
  ADD CONSTRAINT `fk_configurationoptions_configuration` FOREIGN KEY (`configuration`) REFERENCES `configurations` (`id`);

--
-- Limiti per la tabella `configurations`
--
ALTER TABLE `configurations`
  ADD CONSTRAINT `fk_configuration_applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `fk_configurations_applicazioneprincipale` FOREIGN KEY (`principale`) REFERENCES `applicazioni` (`id`);

--
-- Limiti per la tabella `contenuti`
--
ALTER TABLE `contenuti`
  ADD CONSTRAINT `FK_Contenuti_Applicazioni` FOREIGN KEY (`applicazione`) REFERENCES `applicazioni` (`id`),
  ADD CONSTRAINT `FK_Contenuti_Contenuto` FOREIGN KEY (`contenuto`) REFERENCES `contenuto` (`id`),
  ADD CONSTRAINT `FK_Contenuti_Marker` FOREIGN KEY (`marker`) REFERENCES `marker` (`id`);

--
-- Limiti per la tabella `contenuto`
--
ALTER TABLE `contenuto`
  ADD CONSTRAINT `FK_Contenuto_TipoContenuto` FOREIGN KEY (`tipo`) REFERENCES `tipocontenuto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
