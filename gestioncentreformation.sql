-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2023 at 04:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestioncentreformation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `prenom`, `nom`, `email`, `pass`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'admin123', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emploi_temps`
--

CREATE TABLE `emploi_temps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `salle_id` bigint(20) UNSIGNED NOT NULL,
  `professeur_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_formation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emploi_temps`
--

INSERT INTO `emploi_temps` (`id`, `date`, `salle_id`, `professeur_id`, `groupe_formation_id`, `created_at`, `updated_at`) VALUES
(1, '2023-06-04 13:50:21', 1, 2, 1, NULL, NULL),
(2, '2023-06-07 10:50:49', 1, 4, 2, NULL, NULL),
(3, '2023-06-07 15:53:42', 1, 1, 2, NULL, NULL),
(4, '2023-06-04 03:08:00', 1, 1, 1, '2023-06-04 15:06:24', '2023-06-04 15:06:24'),
(5, '2023-06-06 11:00:00', 1, 2, 1, '2023-06-05 09:31:31', '2023-06-05 09:31:31'),
(6, '2023-06-10 02:00:00', 1, 2, 1, '2023-06-05 09:46:44', '2023-06-05 09:46:44'),
(7, '2023-06-09 19:00:00', 1, 3, 2, '2023-06-08 13:19:02', '2023-06-08 13:19:02'),
(8, '2023-06-24 14:00:00', 2, 8, 4, '2023-06-21 23:41:44', '2023-06-21 23:41:44'),
(9, '2023-06-23 14:00:00', 2, 2, 5, '2023-06-22 15:10:51', '2023-06-22 15:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `CIN` varchar(255) NOT NULL,
  `dateInscription` date NOT NULL,
  `tel` int(11) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`id`, `prenom`, `nom`, `email`, `pass`, `CIN`, `dateInscription`, `tel`, `adresse`, `created_at`, `updated_at`) VALUES
(1, 'ali', 'alia', 'ali@gmail.com', 'ali123', 'I15552', '2023-05-30', 666875466, 'Casa', '2023-05-30 18:32:04', '2023-06-22 15:14:46'),
(2, 'sara', 'sara', 'sara@gmail.com', 'sara123', 'I1452', '2023-05-23', 698745214, 'Fes', NULL, '2023-06-21 23:46:38'),
(3, 'ahmed', 'ahmed', 'ahmed@gmail.com', 'ahmed123', 'IO4512', '2023-05-30', 698745214, 'Marrakech', NULL, NULL),
(4, 'hassan', 'hassan', 'hassan@gmail.com', 'hassan123', 'O7845', '2023-05-28', 698745214, 'Rabat', NULL, NULL),
(6, 'Maria', 'Maria', 'maria@gmail.com', 'maria123', 'I14521', '2023-06-08', 741541254, 'Fes', '2023-06-08 11:55:06', '2023-06-08 11:55:49'),
(7, 'Safaa', 'Safaa', 'safaa@gmail.com', 'safaa123', 'A74852', '2023-06-09', 698748512, 'Casa', '2023-06-08 12:36:26', '2023-06-08 12:36:26'),
(8, 'boubker', 'nour', 'boub@gmail.com', 'boub', 'h1425', '2012-05-31', 621457152, 'Qu oued', '2023-06-12 15:12:46', '2023-06-12 15:12:46'),
(9, 'samira', 'samira', 'samira@gmail.com', 'samira123', 'IO7458', '2023-06-22', 647851287, 'Marrakech', '2023-06-21 23:32:22', '2023-06-21 23:33:14'),
(10, 'amal', 'amal', 'amal@gmail.com', 'amal123', 'I7461', '2023-06-22', 741854126, 'Rabat', '2023-06-22 15:05:34', '2023-06-22 15:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_formations`
--

CREATE TABLE `etudiant_formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `nvPrix` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etudiant_formations`
--

INSERT INTO `etudiant_formations` (`id`, `etudiant_id`, `formation_id`, `nvPrix`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4000, '2023-05-30 19:31:52', '2023-05-30 19:31:52'),
(2, 2, 3, 2500, '2023-05-30 19:32:21', '2023-05-30 19:32:21'),
(3, 1, 3, 2000, NULL, NULL),
(5, 6, 2, 2600, '2023-06-08 12:32:42', '2023-06-08 12:32:42'),
(6, 1, 2, 2500, '2023-06-09 08:06:21', '2023-06-09 08:06:21'),
(7, 4, 3, 2500, '2023-06-09 08:09:27', '2023-06-09 08:09:27'),
(8, 1, 5, 3600, '2023-06-09 09:08:54', '2023-06-09 09:08:54'),
(9, 8, 1, 5500, '2023-06-12 15:13:25', '2023-06-12 15:13:25'),
(10, 9, 5, 3800, '2023-06-21 23:33:36', '2023-06-21 23:33:36'),
(11, 10, 5, 3900, '2023-06-22 15:06:15', '2023-06-22 15:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_groupe_formations`
--

CREATE TABLE `etudiant_groupe_formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_formation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etudiant_groupe_formations`
--

INSERT INTO `etudiant_groupe_formations` (`id`, `etudiant_id`, `groupe_formation_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2023-05-30 19:32:05', '2023-05-30 19:32:05'),
(2, 6, 2, '2023-06-08 11:57:50', '2023-06-08 11:57:50'),
(3, 6, 4, '2023-06-09 09:09:41', '2023-06-09 09:09:41'),
(4, 9, 3, '2023-06-21 23:34:01', '2023-06-21 23:34:01'),
(5, 10, 4, '2023-06-22 15:06:31', '2023-06-22 15:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL,
  `prof` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fichiers`
--

CREATE TABLE `fichiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `fichier` varchar(255) NOT NULL,
  `video` blob NOT NULL,
  `titre` varchar(255) NOT NULL,
  `matiere_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fichiers`
--

INSERT INTO `fichiers` (`id`, `type`, `fichier`, `video`, `titre`, `matiere_id`, `created_at`, `updated_at`) VALUES
(15, 'TP', 'http://127.0.0.1:8000/files/1685956993179614.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638353935363939333434373134322e6d7034, 'TP4', 1, '2023-06-05 08:23:13', '2023-06-05 08:23:13'),
(16, 'Exam', 'http://127.0.0.1:8000/files/1685957380246293.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638353935373338303836393235392e6d7034, 'Exam gestion 1', 1, '2023-06-05 08:29:40', '2023-06-08 13:40:13'),
(17, 'TP', 'http://127.0.0.1:8000/files/1686235099666005.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638363233353039393739323433312e6d7034, 'TP 2', 1, '2023-06-08 13:38:19', '2023-06-08 13:38:19'),
(18, 'Cours', 'http://127.0.0.1:8000/files/1686235308314381.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638363233353330383635323931342e6d7034, 'TP CSS3', 4, '2023-06-08 13:41:48', '2023-06-12 15:54:04'),
(20, 'TP', 'http://127.0.0.1:8000/files/1686303097802449.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638363330333039373135363139382e6d7034, 'TP 1/2', 3, '2023-06-09 08:31:37', '2023-06-09 08:31:37'),
(21, 'Exam', 'http://127.0.0.1:8000/files/1686303661915422.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638363330333636313632363030352e6d7034, 'Exam 1/5', 3, '2023-06-09 08:41:02', '2023-06-09 08:41:02'),
(22, 'Exam', 'http://127.0.0.1:8000/files/1687394641785645.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638373339343634313135323538392e6d7034, 'Exam HTML', 4, '2023-06-21 23:44:01', '2023-06-21 23:44:01'),
(23, 'Exam', 'http://127.0.0.1:8000/files/1687450379289675.pdf', 0x687474703a2f2f3132372e302e302e313a383030302f766964656f732f313638373435303337393932333739342e6d7034, 'Exam 2', 4, '2023-06-22 15:12:59', '2023-06-22 15:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `formations`
--

CREATE TABLE `formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `periode` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formations`
--

INSERT INTO `formations` (`id`, `specialite`, `periode`, `prix`, `created_at`, `updated_at`) VALUES
(1, 'Full stack', '6 mois', 5500, NULL, '2023-06-03 13:39:40'),
(2, 'Back end', '3 mois', 3000, NULL, NULL),
(3, 'Back end', '4 mois', 2500, '2023-05-30 18:56:07', '2023-05-30 18:56:16'),
(4, 'E-commerce', '2 mois', 1500, '2023-05-30 18:56:40', '2023-05-30 18:56:40'),
(5, 'Data science', '3 mois', 4000, '2023-06-08 13:04:24', '2023-06-08 13:04:24'),
(6, 'test', '4 mois', 2000, '2023-06-12 09:19:50', '2023-06-12 09:19:50'),
(7, 'communication et langue', '2 mois', 2000, '2023-06-21 23:38:49', '2023-06-21 23:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `formation_matieres`
--

CREATE TABLE `formation_matieres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `matiere_id` bigint(20) UNSIGNED NOT NULL,
  `masseHorraire` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formation_matieres`
--

INSERT INTO `formation_matieres` (`id`, `formation_id`, `matiere_id`, `masseHorraire`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 15, '2023-05-30 18:58:57', '2023-05-30 18:58:57'),
(2, 1, 3, 20, '2023-05-30 18:59:59', '2023-05-30 18:59:59'),
(3, 4, 1, 10, '2023-05-30 19:00:26', '2023-05-30 19:00:32'),
(4, 5, 3, 20, '2023-06-08 13:06:39', '2023-06-08 13:06:39'),
(5, 3, 3, 14, '2023-06-09 08:08:55', '2023-06-09 08:08:55'),
(6, 1, 1, 15, '2023-06-09 09:04:29', '2023-06-09 09:04:29'),
(7, 1, 4, 20, '2023-06-09 09:08:03', '2023-06-09 09:08:03'),
(8, 6, 7, 10, '2023-06-12 09:36:31', '2023-06-12 09:36:31'),
(9, 6, 8, 50, '2023-06-12 09:36:47', '2023-06-12 09:36:47'),
(10, 6, 6, 1452, '2023-06-12 15:46:59', '2023-06-12 15:47:15'),
(11, 7, 6, 15, '2023-06-21 23:39:07', '2023-06-21 23:39:07'),
(12, 7, 6, 15, '2023-06-22 15:09:01', '2023-06-22 15:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `groupe_formations`
--

CREATE TABLE `groupe_formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomGroupe` varchar(255) NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groupe_formations`
--

INSERT INTO `groupe_formations` (`id`, `nomGroupe`, `formation_id`, `created_at`, `updated_at`) VALUES
(1, 'Groupe A', 1, '2023-05-30 19:02:15', '2023-05-30 19:02:15'),
(2, 'Groupe B2', 4, '2023-05-30 19:02:34', '2023-05-30 19:02:34'),
(3, 'Groupe C', 2, '2023-05-30 19:02:53', '2023-05-30 19:02:53'),
(4, 'Goupe M', 5, '2023-06-08 13:16:02', '2023-06-08 13:16:02'),
(5, 'Test', 6, '2023-06-12 09:38:04', '2023-06-12 09:38:04'),
(6, 'Groupe R', 7, '2023-06-21 23:41:06', '2023-06-21 23:41:06');

-- --------------------------------------------------------

--
-- Table structure for table `groupe_formation_professeurs`
--

CREATE TABLE `groupe_formation_professeurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `professeur_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_formation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groupe_formation_professeurs`
--

INSERT INTO `groupe_formation_professeurs` (`id`, `professeur_id`, `groupe_formation_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-05-30 19:34:36', '2023-05-30 19:34:36'),
(3, 6, 2, '2023-06-12 15:37:37', '2023-06-12 15:37:37'),
(5, 3, 2, '2023-06-22 15:08:06', '2023-06-22 15:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `matieres`
--

CREATE TABLE `matieres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomMatiere` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matieres`
--

INSERT INTO `matieres` (`id`, `nomMatiere`, `created_at`, `updated_at`) VALUES
(1, 'Gestion', '2023-05-30 18:57:08', '2023-05-30 18:57:08'),
(2, 'PHP', '2023-05-30 18:57:15', '2023-05-30 18:57:15'),
(3, 'JAVA', '2023-05-30 18:57:22', '2023-05-30 18:57:22'),
(4, 'HTML / CSS', '2023-05-30 18:57:34', '2023-05-30 18:57:34'),
(5, 'PHP/ Laravel', '2023-06-10 09:31:10', '2023-06-10 09:31:10'),
(6, 'Communication', '2023-06-10 09:31:28', '2023-06-10 09:31:28'),
(7, 'test1', '2023-06-12 09:20:04', '2023-06-12 09:20:04'),
(8, 'test2', '2023-06-12 09:20:11', '2023-06-12 09:20:11'),
(9, 'Langue', '2023-06-21 23:39:33', '2023-06-21 23:39:33'),
(10, 'Laravel', '2023-06-22 15:09:35', '2023-06-22 15:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `matiere_professeurs`
--

CREATE TABLE `matiere_professeurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matiere_id` bigint(20) UNSIGNED NOT NULL,
  `professeur_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matiere_professeurs`
--

INSERT INTO `matiere_professeurs` (`id`, `matiere_id`, `professeur_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2023-05-30 19:34:46', '2023-05-30 19:34:46'),
(2, 4, 2, '2023-05-30 19:34:52', '2023-05-30 19:34:52'),
(3, 4, 6, '2023-06-08 12:52:49', '2023-06-08 12:52:49'),
(4, 3, 5, '2023-06-09 08:11:37', '2023-06-09 08:11:37'),
(5, 4, 1, '2023-06-10 08:44:09', '2023-06-10 08:44:09'),
(8, 3, 8, '2023-06-21 23:36:13', '2023-06-21 23:36:35'),
(9, 6, 8, '2023-06-21 23:37:18', '2023-06-21 23:37:18'),
(10, 1, 3, '2023-06-22 15:07:46', '2023-06-22 15:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_12_112533_create_etudiants_table', 1),
(6, '2023_05_12_133058_create_salles_table', 1),
(7, '2023_05_12_133136_create_professeurs_table', 1),
(8, '2023_05_12_133951_create_matieres_table', 1),
(9, '2023_05_12_134034_create_formations_table', 1),
(10, '2023_05_12_112624_create_paiements_table', 2),
(11, '2023_05_12_133227_create_fichiers_table', 3),
(12, '2023_05_12_134126_create_groupe_formations_table', 4),
(13, '2023_05_18_135353_create_emploi_temps_table', 5),
(14, '2023_05_12_134438_create_etudiant_formations_table', 6),
(15, '2023_05_12_134922_create_formation_matieres_table', 6),
(16, '2023_05_12_135252_create_matiere_professeurs_table', 6),
(17, '2023_05_15_161909_create_table_groupe_formation_professeurs', 6),
(18, '2023_05_15_202133_create_table_etudiant_groupe_formations', 6),
(19, '2023_05_20_095048_create_events_table', 6),
(20, '2023_05_30_192814_create_admins_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `paiements`
--

CREATE TABLE `paiements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `montant` double NOT NULL,
  `datePaiement` date NOT NULL,
  `reste` double NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paiements`
--

INSERT INTO `paiements` (`id`, `montant`, `datePaiement`, `reste`, `etudiant_id`, `formation_id`, `created_at`, `updated_at`) VALUES
(4, 2500, '2023-06-08', 1500, 7, 5, '2023-06-08 13:22:48', '2023-06-08 13:22:48'),
(5, 2000, '2023-06-12', 1000, 6, 5, '2023-06-12 13:41:17', '2023-06-12 14:37:42'),
(6, 2000, '2023-06-12', 500, 2, 3, '2023-06-12 13:42:54', '2023-06-12 23:07:02'),
(8, 5200, '2023-06-06', 300, 1, 1, '2023-06-12 14:38:20', '2023-06-12 14:38:20'),
(9, 1000, '2023-06-12', 1500, 2, 3, '2023-06-12 14:52:45', '2023-06-12 23:06:51'),
(10, 1300, '2023-06-13', 1200, 4, 6, '2023-06-12 15:03:20', '2023-06-12 15:03:39'),
(13, 4000, '2023-06-13', 1500, 1, 1, '2023-06-12 16:16:25', '2023-06-12 16:16:25'),
(15, 2000, '2023-06-13', 3500, 8, 1, '2023-06-12 22:50:53', '2023-06-12 22:50:53'),
(19, 1320, '2023-06-14', 1180, 2, 3, '2023-06-12 23:06:11', '2023-06-12 23:06:35'),
(20, 4200, '2023-06-15', 1300, 8, 1, '2023-06-12 23:30:32', '2023-06-12 23:30:48'),
(21, 3200, '2023-06-22', 800, 9, 5, '2023-06-21 23:34:27', '2023-06-21 23:34:27'),
(22, 2500, '2023-06-22', 1500, 10, 5, '2023-06-22 15:06:54', '2023-06-22 15:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professeurs`
--

CREATE TABLE `professeurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tel` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `professeurs`
--

INSERT INTO `professeurs` (`id`, `prenom`, `nom`, `email`, `password`, `tel`, `created_at`, `updated_at`) VALUES
(1, 'amina', 'amina', 'amina@gmail.com', 'amina123', 754125485, NULL, NULL),
(2, 'mohamed', 'mohamed', 'mohamed@gmail.com', 'mohamed123', 654874178, NULL, '2023-06-22 15:13:40'),
(3, 'samiha', 'samiha', 'samiha@gmail.com', 'samiha123', 624125485, NULL, NULL),
(4, 'ali', 'ali', 'ali@gmail.com', 'ali', 784958475, NULL, NULL),
(5, 'Maria', 'Maria', 'maria@gmail.com', 'maria123', 621457152, '2023-06-08 12:45:01', '2023-06-08 12:45:01'),
(6, 'Sami', 'Sami', 'sami@gmail.com', 'sami123', 642875412, '2023-06-08 12:49:24', '2023-06-08 12:49:24'),
(8, 'hakim', 'hakim', 'hakim@gmail.com', 'hakim123', 784752145, '2023-06-21 23:35:45', '2023-06-21 23:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `salles`
--

CREATE TABLE `salles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomSalle` varchar(255) NOT NULL,
  `capacite` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salles`
--

INSERT INTO `salles` (`id`, `nomSalle`, `capacite`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Salle A', '30', 'Théorique', '2023-06-03 16:07:42', '2023-06-03 16:07:42'),
(2, 'Salle B5', '25', 'Pratique', '2023-06-08 13:13:29', '2023-06-08 13:13:29'),
(4, 'Q5', '25', 'Théorique', '2023-06-21 23:40:15', '2023-06-21 23:40:15'),
(5, 'Salla O', '30', 'Pratique', '2023-06-22 15:10:04', '2023-06-22 15:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emploi_temps`
--
ALTER TABLE `emploi_temps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emploi_temps_salle_id_foreign` (`salle_id`),
  ADD KEY `emploi_temps_professeur_id_foreign` (`professeur_id`),
  ADD KEY `emploi_temps_groupe_formation_id_foreign` (`groupe_formation_id`);

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etudiant_formations`
--
ALTER TABLE `etudiant_formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etudiant_formations_etudiant_id_foreign` (`etudiant_id`),
  ADD KEY `etudiant_formations_formation_id_foreign` (`formation_id`);

--
-- Indexes for table `etudiant_groupe_formations`
--
ALTER TABLE `etudiant_groupe_formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etudiant_groupe_formations_etudiant_id_foreign` (`etudiant_id`),
  ADD KEY `etudiant_groupe_formations_groupe_formation_id_foreign` (`groupe_formation_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fichiers`
--
ALTER TABLE `fichiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fichiers_matiere_id_foreign` (`matiere_id`);

--
-- Indexes for table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formation_matieres`
--
ALTER TABLE `formation_matieres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formation_matieres_formation_id_foreign` (`formation_id`),
  ADD KEY `formation_matieres_matiere_id_foreign` (`matiere_id`);

--
-- Indexes for table `groupe_formations`
--
ALTER TABLE `groupe_formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupe_formations_formation_id_foreign` (`formation_id`);

--
-- Indexes for table `groupe_formation_professeurs`
--
ALTER TABLE `groupe_formation_professeurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupe_formation_professeurs_professeur_id_foreign` (`professeur_id`),
  ADD KEY `groupe_formation_professeurs_groupe_formation_id_foreign` (`groupe_formation_id`);

--
-- Indexes for table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matiere_professeurs`
--
ALTER TABLE `matiere_professeurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matiere_professeurs_matiere_id_foreign` (`matiere_id`),
  ADD KEY `matiere_professeurs_professeur_id_foreign` (`professeur_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paiements_etudiant_id_foreign` (`etudiant_id`),
  ADD KEY `paiements_formation_id_foreign` (`formation_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `professeurs`
--
ALTER TABLE `professeurs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salles`
--
ALTER TABLE `salles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emploi_temps`
--
ALTER TABLE `emploi_temps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `etudiant_formations`
--
ALTER TABLE `etudiant_formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `etudiant_groupe_formations`
--
ALTER TABLE `etudiant_groupe_formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fichiers`
--
ALTER TABLE `fichiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `formation_matieres`
--
ALTER TABLE `formation_matieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `groupe_formations`
--
ALTER TABLE `groupe_formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groupe_formation_professeurs`
--
ALTER TABLE `groupe_formation_professeurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `matiere_professeurs`
--
ALTER TABLE `matiere_professeurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professeurs`
--
ALTER TABLE `professeurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salles`
--
ALTER TABLE `salles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emploi_temps`
--
ALTER TABLE `emploi_temps`
  ADD CONSTRAINT `emploi_temps_groupe_formation_id_foreign` FOREIGN KEY (`groupe_formation_id`) REFERENCES `groupe_formations` (`id`),
  ADD CONSTRAINT `emploi_temps_professeur_id_foreign` FOREIGN KEY (`professeur_id`) REFERENCES `professeurs` (`id`),
  ADD CONSTRAINT `emploi_temps_salle_id_foreign` FOREIGN KEY (`salle_id`) REFERENCES `salles` (`id`);

--
-- Constraints for table `etudiant_formations`
--
ALTER TABLE `etudiant_formations`
  ADD CONSTRAINT `etudiant_formations_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`),
  ADD CONSTRAINT `etudiant_formations_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`);

--
-- Constraints for table `etudiant_groupe_formations`
--
ALTER TABLE `etudiant_groupe_formations`
  ADD CONSTRAINT `etudiant_groupe_formations_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`),
  ADD CONSTRAINT `etudiant_groupe_formations_groupe_formation_id_foreign` FOREIGN KEY (`groupe_formation_id`) REFERENCES `groupe_formations` (`id`);

--
-- Constraints for table `fichiers`
--
ALTER TABLE `fichiers`
  ADD CONSTRAINT `fichiers_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`);

--
-- Constraints for table `formation_matieres`
--
ALTER TABLE `formation_matieres`
  ADD CONSTRAINT `formation_matieres_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`),
  ADD CONSTRAINT `formation_matieres_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`);

--
-- Constraints for table `groupe_formations`
--
ALTER TABLE `groupe_formations`
  ADD CONSTRAINT `groupe_formations_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`);

--
-- Constraints for table `groupe_formation_professeurs`
--
ALTER TABLE `groupe_formation_professeurs`
  ADD CONSTRAINT `groupe_formation_professeurs_groupe_formation_id_foreign` FOREIGN KEY (`groupe_formation_id`) REFERENCES `groupe_formations` (`id`),
  ADD CONSTRAINT `groupe_formation_professeurs_professeur_id_foreign` FOREIGN KEY (`professeur_id`) REFERENCES `professeurs` (`id`);

--
-- Constraints for table `matiere_professeurs`
--
ALTER TABLE `matiere_professeurs`
  ADD CONSTRAINT `matiere_professeurs_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`),
  ADD CONSTRAINT `matiere_professeurs_professeur_id_foreign` FOREIGN KEY (`professeur_id`) REFERENCES `professeurs` (`id`);

--
-- Constraints for table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`),
  ADD CONSTRAINT `paiements_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
