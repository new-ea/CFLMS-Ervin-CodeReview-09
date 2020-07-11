-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Jul 2020 um 14:13
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_ervin_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_ervin_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_ervin_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `town` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `address`, `zip`, `town`, `email`) VALUES
(1, 'John', 'Doe', 'Hauptstrasse 1', 1030, 'Vienna', 'john@doe.com'),
(2, 'Steve', 'Jobs', 'Nebenstrasse 20', 1230, 'Vienna', 'steve@jobs.com'),
(3, 'Elon', 'Musk', 'Parkstrasse 13', 1010, 'Vienna', 'elon@musk.com'),
(4, 'Jeff', 'Bezos', 'Schlossstrasse 5', 1040, 'Vienna', 'jeff@bezos.com'),
(5, 'Warren ', 'Buffet', 'Allee 78', 1080, 'Vienna', 'warren@b.com'),
(6, 'Oprah', 'Winfrey', 'Stadiongasse 77', 1110, 'Vienna', 'o@winfrey.com'),
(7, 'Angelina', 'Jolie', 'Neuestarsse 12', 1070, 'Vienna', 'angi@jol.com'),
(8, 'Sheldon', 'Cooper', 'Altestrasse 1', 1200, 'Vienna', 'dr@cooper.com'),
(9, 'Tony', 'Stark', 'Bachgasse 99', 1140, 'Vienna', 'iron@man.com'),
(10, 'Cameron', 'Diaz', 'Handelsgasse 43', 1150, 'Vienna', 'cam@diaz.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `fk_package_id` int(11) NOT NULL,
  `fk_package_type` int(11) DEFAULT NULL,
  `fk_emp_id` int(11) DEFAULT NULL,
  `fk_transport_type_id` int(11) DEFAULT NULL,
  `fk_receiver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_date`, `fk_package_id`, `fk_package_type`, `fk_emp_id`, `fk_transport_type_id`, `fk_receiver_id`) VALUES
(1, '2020-07-20', 1, 5, 103, 2, 1005),
(2, '2020-07-15', 3, 1, 101, 1, 1001),
(3, '2020-08-21', 2, 5, 102, 5, 1001),
(4, '2020-07-11', 4, 2, 103, 6, 1001),
(5, '2020-10-20', 5, 3, 108, 4, 1003);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `department`
--

INSERT INTO `department` (`department_id`, `department`) VALUES
(1, 'Customer service'),
(2, 'Processing System'),
(3, 'Transport'),
(4, 'Finance');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `fk_location_id`, `fk_department_id`) VALUES
(101, 'Nico', 'Schulz', 1, 1),
(102, 'Sandra', 'Neugruber', 1, 2),
(103, 'Hannes', 'Müller', 1, 3),
(104, 'Mario', 'Neustaätter', 2, 2),
(105, 'Wolfgang', 'Amadeus', 2, 1),
(106, 'Lisa', 'Simpson', 2, 3),
(107, 'Homer', 'Simpson', 3, 3),
(108, 'Howard', 'Wolowitz', 3, 2),
(109, 'Maria', 'Gruber', 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `head_quarter`
--

CREATE TABLE `head_quarter` (
  `hq_id` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `head_quarter`
--

INSERT INTO `head_quarter` (`hq_id`, `country`, `fk_location_id`) VALUES
(1, 'AUSTRIA', 1),
(2, 'AUSTRIA', 2),
(3, 'AUSTRIA', 3),
(4, 'AUSTRIA', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `address`, `zip`, `district`, `phone`) VALUES
(1, 'Hausstrasse 10', 1010, 'Vienna', 12345678),
(2, 'Aussenstrasse 102', 1230, 'Vienna', 87654321),
(3, 'Superstrasse 3', 1120, 'Vienna', 1111111),
(4, 'Neugasse 5', 1040, 'Vienna', 44444444);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `date_received` date DEFAULT NULL,
  `fk_package_type` int(11) DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_receiver_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `date_received`, `fk_package_type`, `fk_sender_id`, `fk_receiver_id`, `fk_location_id`) VALUES
(1, '2020-07-10', 1, 1001, 1005, 1),
(2, '2020-07-31', 3, 1003, 1001, 3),
(3, '2020-09-16', 5, 1005, 1001, 1),
(4, '2020-08-01', 1, 1001, 1001, 1),
(5, '2020-07-23', 1, 1003, 1003, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package_type`
--

CREATE TABLE `package_type` (
  `package_type` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package_type`
--

INSERT INTO `package_type` (`package_type`, `type`) VALUES
(1, 'letter'),
(2, 'small package 0kg < 1kg'),
(3, 'normal package 1kg < 5kg'),
(4, 'medium package 5kg < 10kg'),
(5, 'large package 10kg < 50kg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing`
--

CREATE TABLE `processing` (
  `processing_id` int(11) NOT NULL,
  `processing_date` date DEFAULT NULL,
  `fk_emp_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `processing`
--

INSERT INTO `processing` (`processing_id`, `processing_date`, `fk_emp_id`, `fk_package_id`) VALUES
(1, '2020-07-10', 102, 5),
(2, '2020-06-30', 101, 3),
(3, '2020-07-14', 105, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `receiver`
--

INSERT INTO `receiver` (`receiver_id`, `fk_customer_id`) VALUES
(1001, 6),
(1002, 7),
(1003, 8),
(1004, 9),
(1005, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sender`
--

INSERT INTO `sender` (`sender_id`, `fk_customer_id`) VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transport_type`
--

CREATE TABLE `transport_type` (
  `transport_type_id` int(11) NOT NULL,
  `transport` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `transport_type`
--

INSERT INTO `transport_type` (`transport_type_id`, `transport`) VALUES
(1, 'Motorcycle'),
(2, 'Van'),
(3, 'Train'),
(4, 'Ship'),
(5, 'Airplane'),
(6, 'Local Pick-up');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_package_type` (`fk_package_type`),
  ADD KEY `fk_emp_id` (`fk_emp_id`),
  ADD KEY `fk_transport_type_id` (`fk_transport_type_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`);

--
-- Indizes für die Tabelle `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_department_id` (`fk_department_id`);

--
-- Indizes für die Tabelle `head_quarter`
--
ALTER TABLE `head_quarter`
  ADD PRIMARY KEY (`hq_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_package_type` (`fk_package_type`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indizes für die Tabelle `package_type`
--
ALTER TABLE `package_type`
  ADD PRIMARY KEY (`package_type`);

--
-- Indizes für die Tabelle `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`processing_id`),
  ADD KEY `fk_emp_id` (`fk_emp_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `transport_type`
--
ALTER TABLE `transport_type`
  ADD PRIMARY KEY (`transport_type_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT für Tabelle `head_quarter`
--
ALTER TABLE `head_quarter`
  MODIFY `hq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `package_type`
--
ALTER TABLE `package_type`
  MODIFY `package_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `processing`
--
ALTER TABLE `processing`
  MODIFY `processing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `receiver`
--
ALTER TABLE `receiver`
  MODIFY `receiver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT für Tabelle `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT für Tabelle `transport_type`
--
ALTER TABLE `transport_type`
  MODIFY `transport_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_package_type`) REFERENCES `package_type` (`package_type`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`fk_transport_type_id`) REFERENCES `transport_type` (`transport_type_id`),
  ADD CONSTRAINT `delivery_ibfk_4` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`fk_department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints der Tabelle `head_quarter`
--
ALTER TABLE `head_quarter`
  ADD CONSTRAINT `head_quarter_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_package_type`) REFERENCES `package_type` (`package_type`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`),
  ADD CONSTRAINT `package_ibfk_4` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`fk_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `processing_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
