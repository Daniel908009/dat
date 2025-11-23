-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2025 at 01:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservations`
--

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id_flight` int(11) NOT NULL,
  `id_plane` int(11) NOT NULL,
  `departure_place` varchar(100) NOT NULL,
  `arrival_place` varchar(100) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_date` date NOT NULL,
  `arrival_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id_flight`, `id_plane`, `departure_place`, `arrival_place`, `departure_date`, `departure_time`, `arrival_date`, `arrival_time`) VALUES
(1, 1, 'Praha', 'Londýn', '2025-01-10', '10:30:00', '2025-01-10', '12:00:00'),
(2, 2, 'Praha', 'Paříž', '2025-02-12', '14:00:00', '2025-02-12', '16:00:00'),
(3, 3, 'Brno', 'New York', '2025-03-05', '09:00:00', '2025-03-05', '18:00:00'),
(4, 4, 'Ostrava', 'Amsterdam', '2025-04-10', '07:45:00', '2025-04-10', '09:20:00'),
(5, 5, 'Praha', 'Tokyo', '2025-05-22', '13:15:00', '2025-05-23', '07:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id_passenger` int(11) NOT NULL,
  `firstname` varchar(70) NOT NULL,
  `lastname` varchar(70) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id_passenger`, `firstname`, `lastname`, `email`, `phone_number`) VALUES
(1, 'Jan', 'Novák', 'jan.novak@email.cz', '777111222'),
(2, 'Petr', 'Svoboda', 'petr.svoboda@email.cz', '608333444'),
(3, 'Lucie', 'Dvořáková', 'lucie.dvorakova@email.cz', '721555666'),
(4, 'Martin', 'Kouřil', 'martin.kouril@email.cz', '604789321'),
(5, 'Eva', 'Králová', 'eva.kralova@email.cz', '735112233');

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE `planes` (
  `id_plane` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`id_plane`, `type`, `capacity`) VALUES
(1, 'Boeing 737', 180),
(2, 'Airbus A320', 150),
(3, 'Boeing 777', 396),
(4, 'Embraer E190', 100),
(5, 'Airbus A380', 520);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id_reservation` int(11) NOT NULL,
  `state` enum('confirmed','cancelled','pending') NOT NULL,
  `passenger` int(11) NOT NULL,
  `flight` int(11) NOT NULL,
  `seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id_reservation`, `state`, `passenger`, `flight`, `seat`) VALUES
(1, 'confirmed', 1, 1, 1),
(2, 'pending', 2, 1, 2),
(3, 'cancelled', 3, 2, 5),
(4, 'confirmed', 4, 4, 10),
(5, 'pending', 5, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id_seat` int(11) NOT NULL,
  `plane` int(11) NOT NULL,
  `class` enum('economy','business','first') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id_seat`, `plane`, `class`) VALUES
(1, 1, 'economy'),
(2, 1, 'economy'),
(3, 1, 'business'),
(4, 2, 'economy'),
(5, 2, 'first'),
(6, 3, 'economy'),
(7, 1, 'economy'),
(8, 2, 'business'),
(9, 3, 'first'),
(10, 4, 'economy'),
(11, 4, 'business'),
(12, 5, 'economy'),
(13, 5, 'business'),
(14, 5, 'first');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id_flight`),
  ADD KEY `flights_ibfk_1` (`id_plane`),
  ADD KEY `departure_place` (`departure_place`),
  ADD KEY `arrival_place` (`arrival_place`),
  ADD KEY `departure_date` (`departure_date`),
  ADD KEY `departure_time` (`departure_time`),
  ADD KEY `arrival_date` (`arrival_date`),
  ADD KEY `arrival_time` (`arrival_time`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id_passenger`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `lastname` (`lastname`),
  ADD KEY `firstname` (`firstname`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id_plane`),
  ADD KEY `type` (`type`),
  ADD KEY `capacity` (`capacity`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `reservations_ibfk_1` (`passenger`),
  ADD KEY `reservations_ibfk_2` (`flight`),
  ADD KEY `reservations_ibfk_3` (`seat`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id_seat`),
  ADD KEY `seats_ibfk_1` (`plane`),
  ADD KEY `class` (`class`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `id_flight` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id_passenger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `planes`
--
ALTER TABLE `planes`
  MODIFY `id_plane` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id_seat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`id_plane`) REFERENCES `planes` (`id_plane`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`passenger`) REFERENCES `passengers` (`id_passenger`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`flight`) REFERENCES `flights` (`id_flight`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`seat`) REFERENCES `seats` (`id_seat`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`plane`) REFERENCES `planes` (`id_plane`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
