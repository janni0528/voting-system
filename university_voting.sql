-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2026 at 06:10 AM
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
-- Database: `university_voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` int(11) NOT NULL,
  `achievement` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `candidateID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `achievement`, `description`, `candidateID`) VALUES
(1, 'Consistent Dean\'s Lister', 'Maintained a GWA of 1.75 and above for 4 consecutive semesters.', 1),
(2, 'Former SSC Secretary', 'Served as the Student Supreme Council Secretary for A.Y. 2022-2023, managing official records and correspondence.', 1),
(3, 'Campus Journalism Awardee 2023', 'Recognized as an outstanding campus journalist for excellence in feature writing during the 2023 Press Conference.', 1),
(4, 'Peer Tutor of the Year 2022', 'Awarded for outstanding academic mentoring and consistent dedication in helping fellow students improve their grades across multiple subjects.', 2),
(5, 'Basketball Team Captain', 'Led the university basketball team during the 2022-2023 intramurals, bringing the team to the championship finals.', 2),
(6, 'COMELEC Committee Member', 'Served as an active member of the Commission on Elections, ensuring fair and orderly conduct of the university student council elections.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `candidateinfo`
--

CREATE TABLE `candidateinfo` (
  `id` int(11) NOT NULL,
  `profilePicture` varchar(500) DEFAULT NULL,
  `platform` longtext DEFAULT NULL,
  `partylist` varchar(100) DEFAULT NULL,
  `position` enum('President','Vice President','Secretary','Treasurer','Auditor') NOT NULL,
  `status` enum('approved','rejected','pending') NOT NULL DEFAULT 'pending',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userID` int(11) NOT NULL,
  `documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`documents`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidateinfo`
--

INSERT INTO `candidateinfo` (`id`, `profilePicture`, `platform`, `partylist`, `position`, `status`, `createdAt`, `updatedAt`, `userID`, `documents`) VALUES
(1, 'uploads/candidates/2/profile.jpg', 'My platform focuses on improving student welfare, providing better academic resources, and strengthening student-faculty communication.', 'Alyansa Party', 'President', 'pending', '2024-10-15 10:00:00', '2026-05-07 17:24:03', 2, '{\"good_moral\":\"\",\"photo\":\"\",\"id_card\":\"\",\"consent\":\"\",\"additional_docs\":\"\",\"submitted_at\":\"2026-05-07 11:24:03\"}'),
(2, 'uploads/candidates/3/profile.jpg', 'I aim to push for more inclusive campus programs, transparent student funds, and mental health awareness initiatives.', 'Sigla Party', 'President', 'pending', '2024-10-16 11:00:00', '2026-05-07 13:26:58', 3, '{\n    \"goodMoral\": \"uploads/candidates/3/good_moral.pdf\",\n    \"twoByTwo\": \"uploads/candidates/3/2x2_photo.jpg\",\n    \"validStudentID\": \"uploads/candidates/3/student_id.jpg\",\n    \"parentGuardianConsent\": \"uploads/candidates/3/consent_form.pdf\",\n    \"additionalDocuments\": [\"uploads/candidates/3/extra_cert.pdf\"]\n  }');

-- --------------------------------------------------------

--
-- Table structure for table `studentlist`
--

CREATE TABLE `studentlist` (
  `id` int(11) NOT NULL,
  `schoolID` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `mi` char(1) DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `program` varchar(100) NOT NULL,
  `department` enum('College of Accountancy','College of Business Adminstration','College of Teacher Education','College of Arts and Science','College of Tourism and Hospitality Management','College of Computer Science and Engineering') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentlist`
--

INSERT INTO `studentlist` (`id`, `schoolID`, `firstname`, `mi`, `lastname`, `suffix`, `program`, `department`) VALUES
(1, '2024-0001', 'Juan', 'S', 'Dela Cruz', NULL, 'Bachelor of Science in Computer Science', 'College of Computer Science and Engineering'),
(2, '2024-0002', 'Maria', 'G', 'Reyes', NULL, 'Bachelor of Science in Business Administration', 'College of Business Adminstration'),
(3, '2024-0003', 'Carlos', 'L', 'Bautista', 'Jr.', 'Bachelor of Arts in Communication', 'College of Arts and Science'),
(4, '2024-0004', 'Anna', 'C', 'Santos', NULL, 'Bachelor of Secondary Education', 'College of Teacher Education'),
(5, '2024-0005', 'Miguel', 'R', 'Fernandez', NULL, 'Bachelor of Science in Accountancy', 'College of Accountancy'),
(6, '2024-0006', 'Sofia', 'M', 'Torres', NULL, 'Bachelor of Science in Tourism Management', 'College of Tourism and Hospitality Management');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `mi` char(1) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `roles` enum('candidate','student','admin') NOT NULL DEFAULT 'student',
  `password` varchar(255) NOT NULL,
  `isFirstVote` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `lastLogin` datetime DEFAULT NULL,
  `loginID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `lastname`, `firstname`, `mi`, `suffix`, `email`, `roles`, `password`, `isFirstVote`, `createdAt`, `lastLogin`, `loginID`) VALUES
(1, 'Dela Cruz', 'Juan', 'S', NULL, 'juan.admin@school.edu', 'admin', '$2y$10$6xDB1lXeieHJajWHD0Z4SOrguS2ZGoul.PayLDwYg7CKAKR1z.TMG', 0, '2026-05-13 13:55:42', '2026-05-14 21:55:28', '2024-0001'),
(2, 'Reyes', 'Maria', 'G', NULL, 'maria.candidate@school.edu', 'candidate', '$2y$10$PNVH9nC4Cg4IcuZKHBrTx.ccIZMSydkN/eRs27y2pL1RjKEq5JirS', 1, '2026-05-13 13:55:42', '2026-05-08 16:19:13', '2024-0002'),
(3, 'Bautista', 'Carlos', 'L', 'Jr.', 'carlos.candidate@school.edu', 'candidate', 'password_cand2', 1, '2026-05-13 13:55:42', '2024-11-01 09:30:00', '2024-0003'),
(4, 'Santos', 'Anna', 'C', NULL, 'anna.student@school.edu', 'student', '$2y$10$VrN4iBk/wmrR9WH2mLJuw.QztusmvVTrwgYPCtc4oFCCvuolB5Wwq', 1, '2026-05-13 13:55:42', '2026-05-08 16:18:27', '2024-0004'),
(5, 'Fernandez', 'Miguel', 'R', NULL, 'miguel.student@school.edu', 'student', 'password_stu2', 1, '2026-05-13 13:55:42', NULL, '2024-0005'),
(6, 'Torres', 'Sofia', 'M', NULL, 'sofia.student@school.edu', 'student', 'password_stu3', 1, '2026-05-13 13:55:42', NULL, '2024-0006');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `candidateID` int(11) NOT NULL,
  `votedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidateID` (`candidateID`);

--
-- Indexes for table `candidateinfo`
--
ALTER TABLE `candidateinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `studentlist`
--
ALTER TABLE `studentlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `schoolID` (`schoolID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `loginID` (`loginID`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_vote` (`userID`,`candidateID`),
  ADD KEY `candidateID` (`candidateID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `candidateinfo`
--
ALTER TABLE `candidateinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `studentlist`
--
ALTER TABLE `studentlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievements`
--
ALTER TABLE `achievements`
  ADD CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`candidateID`) REFERENCES `candidateinfo` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidateinfo`
--
ALTER TABLE `candidateinfo`
  ADD CONSTRAINT `candidateinfo_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`candidateID`) REFERENCES `candidateinfo` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
