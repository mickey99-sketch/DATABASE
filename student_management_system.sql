-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2026 at 10:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_ID` int(11) NOT NULL,
  `Course_Code` varchar(20) NOT NULL,
  `Course_Name` varchar(50) NOT NULL,
  `Credit_Hours` int(5) NOT NULL,
  `Lecturer_Name` varchar(50) NOT NULL,
  `Lecturer_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_ID`, `Course_Code`, `Course_Name`, `Credit_Hours`, `Lecturer_Name`, `Lecturer_ID`) VALUES
(11, 'CSED101', 'Engineering Maths', 2, 'Prof. Samuel Antw', 1),
(12, 'ACCT101', 'Accounting', 2, 'Mr. Daniel Asante', 5),
(13, 'CSSD201', 'Digital Logic', 3, 'Mr. Mark Kobby', 7),
(14, 'INFT101', 'Information Security', 3, 'Dr. Patricia Boateng', 10),
(15, 'CSED201', 'Engineering Technology', 9, 'Prof. Kwesi Ofori', 5),
(16, 'ACCT201', 'Accounting', 4, 'Mrs. Linda Darko', 8),
(17, 'NETW101', 'Priciples of Networking', 3, 'Mr. Isaac Addo', 5),
(18, 'CSSD301', 'Signal and Systems', 3, 'Dr. Francis Appiah', 2),
(19, 'CYBS101', 'Cyber Security', 2, 'Ms. Rebecca Sarpong', 3),
(20, 'SWEN101', 'Software Engineering', 3, 'Mrs. Grace Owusu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `Enrollment_ID` int(50) NOT NULL,
  `Student_ID` int(50) NOT NULL,
  `Course_ID` int(50) NOT NULL,
  `Academic_Year` varchar(20) NOT NULL,
  `Semester` varchar(10) DEFAULT NULL,
  `Session` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`Enrollment_ID`, `Student_ID`, `Course_ID`, `Academic_Year`, `Semester`, `Session`) VALUES
(1, 1, 1, '2025/2026', '1', 'Morning'),
(2, 2, 2, '2025/2026', '1', 'Evening'),
(3, 3, 3, '2025/2026', '1', 'Weekend'),
(4, 4, 4, '2025/2026', '1', 'Distance'),
(5, 5, 5, '2025/2026', '2', 'Morning'),
(6, 6, 6, '2025/2026', '2', 'Evening'),
(7, 7, 7, '2025/2026', '2', 'Weekend'),
(8, 8, 8, '2025/2026', '2', 'Distance'),
(9, 9, 9, '2025/2026', '1', 'Morning'),
(10, 10, 10, '2025/2026', '1', 'Evening');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `Lecturer_ID` int(10) NOT NULL,
  `Lecturer_Name` varchar(50) NOT NULL,
  `Course_Name` varchar(50) NOT NULL,
  `Start_Time` varchar(10) NOT NULL,
  `End_Time` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Class_Days` varchar(15) NOT NULL,
  `Session_Thought` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`Lecturer_ID`, `Lecturer_Name`, `Course_Name`, `Start_Time`, `End_Time`, `Email`, `Phone`, `Class_Days`, `Session_Thought`) VALUES
(1, 'Dr. Michael Mensah', 'Engineering Maths', '08:00:00', '10:00:00', 'michael.mensah@ktu.edu.gh', 241234567, 'Monday', 'Morning'),
(2, 'Mrs. Grace Owusu', 'Accounting', '17:00:00', '19:00:00', 'grace.owusu@ktu.edu.gh', 202345678, 'Tuesday', 'Evening'),
(3, 'Mr. Daniel Asante', 'Digital Logic', '09:00:00', '12:00:00', 'daniel.asante@ktu.edu.gh', 553456789, 'Saturday', 'Weekend'),
(4, 'Dr. Patricia Boateng', 'Information Security', '18:00:00', '20:00:00', 'patricia.boateng@ktu.edu.gh', 274567890, 'Wednesday', 'Distance'),
(5, 'Prof. Kwesi Ofori', 'Engineering Technology', '08:30:00', '10:30:00', 'kwesi.ofori@ktu.edu.gh', 545678901, 'Thursday', 'Morning'),
(6, 'Mrs. Linda Darko', 'Accounting', '16:30:00', '18:30:00', 'linda.darko@ktu.edu.gh', 266789012, 'Friday', 'Evening'),
(7, 'Mr. Isaac Addo', 'Principles of Networking', '09:00:00', '11:30:00', 'isaac.addo@ktu.edu.gh', 507890123, 'Saturday', 'Weekend'),
(8, 'Dr. Francis Appiah', 'Signal and Systems', '19:00:00', '21:00:00', 'francis.appiah@ktu.edu.gh', 598901234, 'Sunday', 'Distance'),
(9, 'Ms. Rebecca Sarpong', 'Cyber Security', '10:00:00', '12:00:00', 'rebecca.sarpong@ktu.edu.gh', 249012345, 'Monday', 'Morning'),
(10, 'Prof. Samuel Antwi', 'Software Engineering', '17:30:00', '19:30:00', 'samuel.antwi@ktu.edu.gh', 201122334, 'Tuesday', 'Evening');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_ID` int(20) NOT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Level` int(5) NOT NULL,
  `Phone_Nuumber` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Session` varchar(15) NOT NULL,
  `Date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `First_Name`, `Last_Name`, `Course`, `Level`, `Phone_Nuumber`, `Email`, `Gender`, `Session`, `Date_of_birth`) VALUES
(1, 'Ama', 'Owusu', 'Engineering Maths', 100, '0241234567', 'ama.owusu@email.com', 'Female', 'Morning', '2005-03-15'),
(2, 'Kwame', 'Mensah', 'Accounting', 200, '0202345678', 'kwame.mensah@email.com', 'Male', 'Evening', '2004-07-21'),
(3, 'Efua', 'Asante', 'Digital Logic', 100, '0553456789', 'efua.asante@email.com', 'Female', 'Weekend', '2005-01-10'),
(4, 'Kofi', 'Boateng', 'Information Security', 300, '0274567890', 'kofi.boateng@email.com', 'Male', 'Distance', '2003-09-18'),
(5, 'Akosua', 'Darko', 'Engineering Technology', 200, '0545678901', 'akosua.darko@email.com', 'Female', 'Morning', '2004-05-25'),
(6, 'Yaw', 'Appiah', 'Accounting', 400, '0266789012', 'yaw.appiah@email.com', 'Male', 'Evening', '2002-12-30'),
(7, 'Abena', 'Frimpong', 'Principles of Networking', 100, '0507890123', 'abena.frimpong@email.com', 'Female', 'Weekend', '2005-08-14'),
(8, 'Kwabena', 'Osei', 'Signal and Systems', 500, '0598901234', 'kwabena.osei@email.com', 'Male', 'Distance', '2001-11-05'),
(9, 'Adwoa', 'Sarpong', 'Cyber Security', 200, '0249012345', 'adwoa.sarpong@email.com', 'Female', 'Morning', '2004-02-27'),
(10, 'Kojo', 'Antwi', 'Software Engineering', 300, '0201122334', 'kojo.antwi@email.com', 'Male', 'Evening', '2003-06-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Lecturer_ID` (`Lecturer_ID`),
  ADD KEY `Lecturer_ID_2` (`Lecturer_ID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`Enrollment_ID`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`Lecturer_ID`),
  ADD KEY `Lecturer_ID` (`Lecturer_ID`),
  ADD KEY `Lecturer_ID_2` (`Lecturer_ID`),
  ADD KEY `Lecturer_ID_3` (`Lecturer_ID`),
  ADD KEY `Lecturer_ID_4` (`Lecturer_ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `Enrollment_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `Lecturer_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Student_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
