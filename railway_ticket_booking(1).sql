-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2023 at 08:39 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway_ticket_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(5) NOT NULL,
  `passenger_id` int(10) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `train_id` int(6) DEFAULT NULL,
  `no_of_seats` int(4) DEFAULT NULL,
  `from_` varchar(20) DEFAULT NULL,
  `to_` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `passenger_id`, `booking_date`, `train_id`, `no_of_seats`, `from_`, `to_`) VALUES
(10009, 1000000001, '2023-10-18', 593900, 1, 'shoronur', 'calicut'),
(10010, 1000000000, '2023-10-19', 400465, 1, 'shoronur', 'chennai'),
(10011, 1000000002, '2023-10-19', 304780, 1, 'shoronur', 'mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `age` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `name`, `email`, `phone`, `age`) VALUES
(1000000000, 'athul', 'athul@gmail.com', 1234567890, 17),
(1000000001, 'bibin', 'bibin@gmail.com', 912345678, 19),
(1000000002, 'daya', 'daya@gmail.com', 891234567, 19),
(1000000003, 'aswin_mp', 'aswinmp@gmail.com', 945885432, 19),
(1000000004, 'aswin_kp', 'aswinkp@gmail.com', 945885431, 19),
(1000000005, 'ajesh', 'ajesh@gmail.com', 2133165160, 20),
(1000000006, 'aneesh', 'aneesh@gmail.com', 121233445, 20),
(1000000007, 'nishad', 'nishad@gmail.com', 445461564, 20),
(1000000008, 'arun', 'arun@gmail.com', 654634866, 18),
(1000000009, 'rahul', 'rahu@gmail.com', 464685640, 25);

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `train_id` int(6) NOT NULL,
  `train_name` varchar(20) DEFAULT NULL,
  `no_of_seats` int(5) DEFAULT NULL,
  `dep_station` varchar(20) DEFAULT NULL,
  `dep_time` time DEFAULT NULL,
  `arl_station` varchar(20) DEFAULT NULL,
  `arl_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`train_id`, `train_name`, `no_of_seats`, `dep_station`, `dep_time`, `arl_station`, `arl_time`) VALUES
(304780, 'mumbai_express', 1000, 'cochin', '20:00:00', 'mumbai', '20:00:00'),
(400465, 'chennai_mail', 500, 'shoronur', '08:00:00', 'chennai', '19:00:00'),
(454520, 'salam_mail', 500, 'shoronur', '12:00:00', 'salam', '21:00:00'),
(593900, 'erm_to_man', 500, 'eramkulam', '21:00:00', 'mangore', '05:00:00'),
(778565, 'kunnur_passenger', 200, 'coimbitore', '14:00:00', 'kunnur', '20:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `train_id` (`train_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`train_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
