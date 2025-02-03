-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 07:35 PM
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
-- Database: `news_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Entertainment', '2025-01-28 07:40:17'),
(2, 'Technology', '2025-01-28 07:40:17'),
(3, 'Business', '2025-01-28 07:40:17'),
(4, 'Fashion', '2025-01-28 07:40:17'),
(5, 'Life Style', '2025-01-28 07:40:17'),
(6, 'Travel', '2025-01-28 07:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `image`, `category_id`, `author_id`, `created_at`, `updated_at`) VALUES
(6, 4, 'Discover Entertaiment', 'Explore the latest in movies and music.', 'bruce-mars.jpg', 4, 1, '2025-01-28 09:03:25', '2025-01-29 21:05:53'),
(7, 4, 'American live music lorem ipsum dolor sit amet consectetur', 'Live music in America is more than just entertainment. It\'s a cultural experience that combines the love for music, passion, and a sense of community. Explore how live performances have evolved over the years, and what makes them special.', 'post-05.jpg', 1, 1, '2025-01-28 08:59:00', '2025-01-29 19:45:25'),
(8, 4, 'Tech Trends', 'Stay updated with the latest technology trends.', 'post-03.jpg', 2, 1, '2025-01-28 09:03:25', '2025-01-29 19:45:25'),
(9, 4, 'Business Insights', 'Explore in-depth analysis of market trends.', 'curved-11.jpg', 3, 1, '2025-01-28 09:03:25', '2025-01-30 19:03:27'),
(10, 4, 'Fashion Forward', 'Discover the latest in fashion and style.', 'post-01.jpg', 4, 1, '2025-01-28 09:03:25', '2025-01-29 19:45:25'),
(11, 4, 'Life Style Tips', 'Learn to live a healthy and productive life.', 'post-04.jpg', 5, 1, '2025-01-28 09:03:25', '2025-01-29 19:45:25'),
(12, 4, 'Donec metus orci, malesuada et lectus vitae', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'post-06.jpg', 1, 1, '2023-02-16 20:30:00', '2025-01-29 19:45:25'),
(13, 4, 'Donec metus orci, malesuada et lectus vitae', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'post-07.jpg', 1, 1, '2023-02-15 20:30:00', '2025-01-29 19:45:25'),
(14, 4, 'Donec metus orci, malesuada et lectus vitae', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'post-08.jpg', 1, 1, '2023-02-11 20:30:00', '2025-01-29 19:45:25'),
(15, 4, 'Donec metus orci, malesuada et lectus vitae', 'Another content for Donec post', 'post-12.jpg', 3, 1, '2023-02-15 20:30:00', '2025-01-29 19:45:25'),
(16, 4, 'Donec metus orci, malesuada et lectus vitae', 'Content for Donec post', 'post-11.jpg', 3, 1, '2023-02-16 20:30:00', '2025-01-29 19:45:25'),
(17, 4, 'Bitcoin lorem ipsum dolor sit amet consectetur', 'Content for Bitcoin post', 'post-10.jpg', 3, 1, '2023-02-17 20:30:00', '2025-01-29 19:45:25'),
(21, 4, 'Apple iPhone X lorem ipsum dolor sit amet consectetur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'post-34.jpg', 2, 1, '2025-01-28 14:19:58', '2025-01-29 19:45:25'),
(22, 4, 'Donec metus orci, malesuada et lectus vitae', 'Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris. Aenean lacinia, eros et congue aliquet.', 'post-35.jpg', 2, 1, '2025-01-28 14:19:58', '2025-01-29 19:45:25'),
(23, 4, 'Review: Donec metus orci, malesuada et lectus vitae', 'In review: Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris. Quisque sed metus vitae massa aliquet tincidunt.', 'post-36.jpg', 2, 1, '2025-01-28 14:19:58', '2025-01-29 19:45:25'),
(24, 4, 'Bitcoin lorem ipsum dolor sit amet consectetur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'post-37.jpg', 5, 1, '2025-01-28 14:22:38', '2025-01-29 19:45:25'),
(25, 4, 'Donec metus orci, malesuada et lectus vitae', 'Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris. Aenean lacinia, eros et congue aliquet.', 'post-38.jpg', 5, 1, '2025-01-28 14:22:38', '2025-01-29 19:45:25'),
(26, 4, 'Review: Donec metus orci, malesuada et lectus vitae', 'In review: Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris. Quisque sed metus vitae massa aliquet tincidunt.', 'post-39.jpg', 5, 1, '2025-01-28 14:22:38', '2025-01-29 19:45:25'),
(27, 4, 'Apple iPhone X lorem ipsum dolor sit amet consectetur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'post-41.jpg', 4, 1, '2025-01-28 14:24:40', '2025-01-29 19:45:25'),
(28, 4, 'Donec metus orci, malesuada et lectus vitae', 'Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris. Aenean lacinia, eros et congue aliquet.', 'post-41.jpg', 4, 1, '2025-01-28 14:24:40', '2025-01-29 19:45:25'),
(29, 4, 'Donec metus orci, malesuada et lectus vitae', 'In review: Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris. Quisque sed metus vitae massa aliquet tincidunt.', 'post-42.jpg', 4, 1, '2025-01-28 14:24:40', '2025-01-29 19:45:25'),
(67, 4, 'You wish lorem ipsum dolor sit amet consectetur', 'Duis eu felis id tortor congue consequat. Sed vitae vestibulum enim, et pharetra magna.', 'post-14.jpg', 6, 1, '2025-01-28 14:48:38', '2025-01-29 19:45:25'),
(68, 4, 'Donec metus orci, malesuada et lectus vitae', 'Beach vibes: Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris.', 'post-15.jpg', 6, 1, '2025-01-28 14:48:38', '2025-01-29 19:45:25'),
(69, 4, 'Donec metus orci, malesuada et lectus vitae', 'Hotels: Donec malesuada et lectus vitae, efficitur nisl ut, ultrices mauris.', 'post-17.jpg', 6, 1, '2025-01-28 14:48:38', '2025-01-29 19:45:25'),
(72, 4, 'Discover Entertaiment', 'lorem ipsum', 'blog-list-02.jpg', 1, 4, '2025-01-29 21:49:25', '2025-01-30 17:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `last_activity`) VALUES
(2, 4, '2025-01-29 18:05:44'),
(3, 4, '2025-01-29 18:05:44'),
(5, 4, '2025-01-29 18:05:44'),
(7, 4, '2025-01-29 18:11:54'),
(8, 4, '2025-01-29 18:15:26'),
(9, 4, '2025-01-29 18:33:51'),
(10, 4, '2025-01-29 18:38:20'),
(11, 6, '2025-01-29 18:49:10'),
(12, 4, '2025-01-29 20:13:32'),
(13, 4, '2025-01-29 20:45:33'),
(14, 4, '2025-01-29 20:53:33'),
(15, 4, '2025-01-29 21:03:29'),
(16, 4, '2025-01-29 21:41:35'),
(17, 4, '2025-01-30 09:40:42'),
(18, 4, '2025-01-30 09:41:21'),
(19, 4, '2025-01-30 09:42:56'),
(20, 4, '2025-01-30 09:44:44'),
(21, 4, '2025-01-30 09:47:16'),
(22, 4, '2025-01-30 10:39:53'),
(23, 4, '2025-01-30 12:10:37'),
(24, 4, '2025-01-30 12:50:45'),
(25, 4, '2025-01-30 13:01:27'),
(26, 6, '2025-01-30 13:02:23'),
(27, 4, '2025-01-30 13:21:00'),
(28, 6, '2025-01-30 13:21:43'),
(29, 6, '2025-01-30 13:22:38'),
(30, 4, '2025-01-30 13:22:55'),
(31, 6, '2025-01-30 13:23:46'),
(32, 4, '2025-01-30 13:24:03'),
(33, 6, '2025-01-30 13:25:49'),
(34, 4, '2025-01-30 13:26:04'),
(35, 4, '2025-01-30 13:32:42'),
(36, 4, '2025-01-30 13:34:09'),
(37, 4, '2025-01-30 13:36:21'),
(38, 6, '2025-01-30 16:19:01'),
(40, 6, '2025-01-30 16:36:39'),
(42, 4, '2025-01-30 16:53:19'),
(43, 4, '2025-01-30 17:14:20'),
(44, 8, '2025-01-30 17:36:56'),
(45, 4, '2025-01-30 17:40:02'),
(46, 6, '2025-01-30 18:00:19'),
(47, 8, '2025-01-30 18:00:44'),
(48, 4, '2025-01-30 18:13:30'),
(49, 4, '2025-01-30 19:10:51'),
(50, 6, '2025-01-30 19:11:17'),
(51, 8, '2025-01-30 19:11:35'),
(52, 4, '2025-01-30 20:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_online` tinyint(1) DEFAULT 0,
  `role` enum('admin','author','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `is_online`, `role`) VALUES
(4, 'amir', '$2y$10$VASdr3neDrRpxpDgcw89jON/1n.45yY5FTsp/Sscn4c56Oih0edqq', 'pourmohamadikhadar@gmail.com', 1, 'admin'),
(6, 'ali', '$2y$10$MQz61vRunIEPNMARGbYXiemDgTUQTs4sw1WRAJBdGYTR3RojMZv1m', 'ali@gmail.com', 0, 'admin'),
(8, 'sajedeh', '$2y$10$jpK5rxkvnZU/gef2ufxu8OqQpYdONuYrdTtyz140COjPi.GtxxyOq', 'sajedeh@gmail.com', 0, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `fk_posts_users` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_ibfk_1` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=878;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
