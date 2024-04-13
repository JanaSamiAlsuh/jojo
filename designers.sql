-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2024 at 10:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `designers`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `emailAdress` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `firstName`, `lastName`, `emailAdress`, `password`) VALUES
(1, 'Ahmed', 'Foad', 'ahmed@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(2, 'Samer', 'Abed', 'samer@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(3, 'Saleem', 'Radi', 'Saleem@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(4, 'Rashed', 'Kamal', 'rashed@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(5, 'daser', '', 'daser@client.com', '$2y$12$NwKS17oeoGBQiIuL6VjUHukk5CpB8jJ.lh0XdxI3OXZROaRARibUO'),
(6, 'kamal', '', 'kamal@client.com', '$2y$12$yuhBOejaKIhbeg.brefvxOWUv53CWOtjoTNDvqRuIt9pTk0v05qYq'),
(7, 'reem', 'dolla', 'reem@client.com', '$2y$12$aWNF33iZ07/DLUCWNaQ3Hu0/Hw9zbLxVGGtyWjkjwBLL5STiPNn.y'),
(8, 'zolla', 'tera', 'zolla@client.com', '$2y$12$r5lrEHLuzawNCGd/RyZUDe8sOFt8DMAyuqw27jVpgrXr.cVDiZbNS'),
(9, 'Sara', 'bolard', 'sara@client.com', '$2y$12$dzzCx3EgTnn8gma7WqkD1eTLPdFScesFsdLUuZ95zqNnKHet0hLRW');

-- --------------------------------------------------------

--
-- Table structure for table `designcategory`
--

CREATE TABLE `designcategory` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designcategory`
--

INSERT INTO `designcategory` (`id`, `category`) VALUES
(1, 'Intire decoration'),
(2, 'outdoor'),
(3, 'Garden decoration'),
(4, 'Hospitals');

-- --------------------------------------------------------

--
-- Table structure for table `designconsultation`
--

CREATE TABLE `designconsultation` (
  `id` int(11) NOT NULL,
  `requestID` int(11) NOT NULL,
  `consultation` text NOT NULL,
  `consultationImgFileName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designconsultation`
--

INSERT INTO `designconsultation` (`id`, `requestID`, `consultation`, `consultationImgFileName`) VALUES
(1, 3, 'You can find our supported range of browsers and their versions You can find our supported range of browsers and their versions', '815.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `designconsultationrequest`
--

CREATE TABLE `designconsultationrequest` (
  `id` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `designerID` int(11) NOT NULL,
  `roomTypeID` int(11) NOT NULL,
  `designCategoryID` int(11) NOT NULL,
  `roomLength` int(5) NOT NULL,
  `colorPreferences` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `statusID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designconsultationrequest`
--

INSERT INTO `designconsultationrequest` (`id`, `clientID`, `designerID`, `roomTypeID`, `designCategoryID`, `roomLength`, `colorPreferences`, `date`, `statusID`) VALUES
(1, 1, 4, 1, 3, 5000, 'white', '2024-03-26', 1),
(2, 4, 3, 3, 3, 9887, 'light blue', '2024-03-12', 2),
(3, 1, 6, 1, 3, 5000, 'white', '2024-03-26', 3),
(4, 4, 6, 3, 3, 9887, 'light blue', '2024-03-12', 1),
(5, 9, 3, 2, 4, 8575, '#e6d1d1', '2024-07-22', 1),
(6, 9, 6, 2, 2, 86757, '#8f6666', '2024-03-10', 1),
(7, 8, 6, 3, 3, 868686, '#146c1a', '2024-03-06', 1),
(8, 8, 3, 3, 4, 87977, '#dfe222', '2024-03-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `designer`
--

CREATE TABLE `designer` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `emailAdress` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL,
  `brandName` varchar(50) NOT NULL,
  `logoImgFileName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designer`
--

INSERT INTO `designer` (`id`, `firstName`, `lastName`, `emailAdress`, `password`, `brandName`, `logoImgFileName`) VALUES
(1, 'Mohammed', 'Ameen', 'mohammed@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Wecom', 'avatar5.PNG'),
(2, 'Sari', 'Boland', 'sari@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Rolla', 'avatar.PNG'),
(3, 'Walla', 'Sadeq', 'walla@design.com', '$2y$12$Ee3TPvVe63Wst23gjlWc0OsXtyDuevkGsVDVTT6P/AXexYDzDFFWi', 'Shams', 'avatar5.PNG'),
(4, 'Jamal', 'valy', 'jamal@design.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Sunnlla', 'avatar.PNG'),
(5, 'Ali', '', 'ali@design.com', '$2y$12$kW8CAi0bMvHYgrNtj4568uEIsQRn9niNVdGxaahSd9Db0fSqi1u9G', 'Hi', 'avatar.PNG'),
(6, 'Sami', '', 'sami@design.com', '$2y$12$Ee3TPvVe63Wst23gjlWc0OsXtyDuevkGsVDVTT6P/AXexYDzDFFWi', 'GOHEAD', 'avatar5.PNG'),
(7, 'Gerry', '', 'gerry@design.com', '$2y$12$4xNX5bD9MAg8WZMbYyoQNeoSe4dPxZ5CZkJSsrGTgsmOUENn/hogW', 'Go', 'avatar04.PNG'),
(8, 'sss', '', 'ss@dd.com', '$2y$12$bvmku8qbuv5eeFJGCt5TKuef7HF2FWjZUNHnwWuaA9G3qDJUyQEfy', 'ff', 'avatar.jpg'),
(9, 'df', '', 'samis@design.com', '$2y$12$lWFyw9dvapJh8PedGCUaMOsGiC6GhG5skF/OWEdeFhQQVAeDqDRnW', 'svsv', 'avatar.jpg'),
(10, 'sd', '', 'ds@ff.gg', '$2y$12$ziU2ivblLPhAr30PZMFrOudjgLCNTZw.O20wuAgcZ1walyrvqNukK', 'afa', 'avatar04.PNG'),
(11, 'dscs', '', 'sarii@design.com', '$2y$12$wLaEMRSwPW0Xm8gjmjdQ7.ORJ/cGOMBmG45JK49nfZ9EmCrGhfnXa', 'aaa', 'beautiful-hologram-w'),
(12, 'soad', '', 'soad@client.com', '$2y$12$zf9wYPXIuDOoXpwQZKkyku9mbfI9hEOlyX6etITL3.206677vahVm', '', 'avatar5.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `designerspeciality`
--

CREATE TABLE `designerspeciality` (
  `designerID` int(11) NOT NULL,
  `designCategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designerspeciality`
--

INSERT INTO `designerspeciality` (`designerID`, `designCategoryID`) VALUES
(2, 1),
(7, 1),
(9, 1),
(11, 1),
(3, 2),
(8, 2),
(1, 3),
(5, 3),
(4, 4),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `designportfolioproject`
--

CREATE TABLE `designportfolioproject` (
  `id` int(11) NOT NULL,
  `designerID` int(11) NOT NULL,
  `projectName` varchar(30) NOT NULL,
  `projectImgFileName` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `designCategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designportfolioproject`
--

INSERT INTO `designportfolioproject` (`id`, `designerID`, `projectName`, `projectImgFileName`, `description`, `designCategoryID`) VALUES
(1, 1, 'MoonLight', 'images.jpg', 'Short answer, no. However, there are forks and tutorials around the web\r\nShort answer, no. However, there are forks and tutorials around the web', 4),
(2, 2, 'Shelli', 'shell.jpg', 'emplate that can be used for any purpose. However, it is not made to be easily installed on Wordpress. It will require some effort and enough knowledge of the Wordpress script to do so.', 1),
(3, 3, 'Soft Fingers', 'jobs_banner.jpg', 'emplate that can be used for any purpose. However, it is not made to be easily installed ongh knowledge of the Wordpress script to do so.', 3),
(4, 6, 'MoonLight', 'notacarorbic.jpg', 'Short answer, no. However, there are forks and tutorials around the web\r\nShort answer, no. However, there are forks and tutorials around the web', 4),
(5, 6, 'Kates Children', '815.jpg', 'mmmm                                \r\n emplate that can be used for any purpose. However, it is not made to be easily installed on Wordpress. It will require some effort and enough knowledge of the Wordpress script to do so.                                                                                                                ', 3),
(6, 6, 'Soft Fingers', '1488677_1080925381948042_1117249540994929122_n.jpg', '\r\n                                emplate that can be used for any purpose. However, it is not made to be easily installed ongh knowledge of the Wordpress script to do so.                            ', 3),
(11, 6, 'High level', 'bbbca6bf8e644fa7f91f599bd35b3350.jpg', 'Here are some other little JavaScript changes\r\nHere are some other little JavaScript changes', 2);

-- --------------------------------------------------------

--
-- Table structure for table `requeststatus`
--

CREATE TABLE `requeststatus` (
  `id` int(11) NOT NULL,
  `status` enum('pending consultation','consultation declined','consultation provided','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `requeststatus`
--

INSERT INTO `requeststatus` (`id`, `status`) VALUES
(1, 'pending consultation'),
(2, 'consultation declined'),
(3, 'consultation provided');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`id`, `type`) VALUES
(1, 'High'),
(2, 'Medical '),
(3, 'Media ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designcategory`
--
ALTER TABLE `designcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designconsultation`
--
ALTER TABLE `designconsultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requestID` (`requestID`);

--
-- Indexes for table `designconsultationrequest`
--
ALTER TABLE `designconsultationrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientID` (`clientID`),
  ADD KEY `designerID` (`designerID`),
  ADD KEY `roomTypeID` (`roomTypeID`),
  ADD KEY `designCategoryID` (`designCategoryID`),
  ADD KEY `statusID` (`statusID`);

--
-- Indexes for table `designer`
--
ALTER TABLE `designer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designerspeciality`
--
ALTER TABLE `designerspeciality`
  ADD PRIMARY KEY (`designerID`),
  ADD KEY `designCategoryID` (`designCategoryID`);

--
-- Indexes for table `designportfolioproject`
--
ALTER TABLE `designportfolioproject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designerID` (`designerID`),
  ADD KEY `designCategoryID` (`designCategoryID`);

--
-- Indexes for table `requeststatus`
--
ALTER TABLE `requeststatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `designcategory`
--
ALTER TABLE `designcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designconsultation`
--
ALTER TABLE `designconsultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designconsultationrequest`
--
ALTER TABLE `designconsultationrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `designer`
--
ALTER TABLE `designer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `designerspeciality`
--
ALTER TABLE `designerspeciality`
  MODIFY `designerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `designportfolioproject`
--
ALTER TABLE `designportfolioproject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `requeststatus`
--
ALTER TABLE `requeststatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `designconsultation`
--
ALTER TABLE `designconsultation`
  ADD CONSTRAINT `designconsultation_ibfk_1` FOREIGN KEY (`requestID`) REFERENCES `designconsultationrequest` (`id`);

--
-- Constraints for table `designconsultationrequest`
--
ALTER TABLE `designconsultationrequest`
  ADD CONSTRAINT `designconsultationrequest_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_2` FOREIGN KEY (`designerID`) REFERENCES `designer` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_3` FOREIGN KEY (`roomTypeID`) REFERENCES `roomtype` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_4` FOREIGN KEY (`designCategoryID`) REFERENCES `designcategory` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_5` FOREIGN KEY (`statusID`) REFERENCES `requeststatus` (`id`);

--
-- Constraints for table `designerspeciality`
--
ALTER TABLE `designerspeciality`
  ADD CONSTRAINT `designerspeciality_ibfk_1` FOREIGN KEY (`designCategoryID`) REFERENCES `designcategory` (`id`),
  ADD CONSTRAINT `designerspeciality_ibfk_2` FOREIGN KEY (`designerID`) REFERENCES `designer` (`id`);

--
-- Constraints for table `designportfolioproject`
--
ALTER TABLE `designportfolioproject`
  ADD CONSTRAINT `designportfolioproject_ibfk_1` FOREIGN KEY (`designerID`) REFERENCES `designer` (`id`),
  ADD CONSTRAINT `designportfolioproject_ibfk_2` FOREIGN KEY (`designCategoryID`) REFERENCES `designcategory` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
