-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 30, 2018 at 08:00 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_chatting`
--

CREATE TABLE `wp_chatting` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-10-13 14:08:58', '2018-10-13 14:08:58', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_finder_form`
--

CREATE TABLE `wp_finder_form` (
  `ID` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `other_skill` text COLLATE utf8_unicode_ci NOT NULL,
  `contact` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `semester` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_finder_form`
--

INSERT INTO `wp_finder_form` (`ID`, `user_id`, `title`, `description`, `other_skill`, `contact`, `status`, `semester`, `updated_date`, `created_date`) VALUES
(3, 13, 'Titile 3', 'This is demo decription of form 3', '', '9817470598', 1, 'SPRING 2018', '2018-11-02 12:36:37', '2018-11-02 12:36:37'),
(4, 16, 'Titile 4', 'This is demo decription of form 4', '', '2706835204', 1, 'SPRING 2018', '2018-11-02 12:36:37', '2018-11-02 12:36:37'),
(5, 20, 'Titile 5', 'This is demo decription of form 5', '', '7057751726', 0, 'SUMMER 2018', '2018-11-05 09:39:34', '2018-11-02 12:36:37'),
(6, 25, 'Titile 6', 'This is demo decription of form 6', '', '0757714414', 1, 'SUMMER 2018', '2018-11-02 12:36:37', '2018-11-02 12:36:37'),
(7, 26, 'Titile 7', 'This is demo decription of form 7', '', '3195907357', 1, 'SUMMER 2018', '2018-11-02 12:36:37', '2018-11-02 12:36:37'),
(8, 28, 'Titile 8', 'This is demo decription of form 8', '', '2243525960', 0, 'SPRING 2018', '2018-11-05 09:39:26', '2018-11-02 12:36:38'),
(9, 31, 'Titile 9', 'This is demo decription of form 9', '', '3724281812', 1, 'SUMMER 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(10, 35, 'Titile 10', 'This is demo decription of form 10', '', '7664791291', 0, 'SUMMER 2018', '2018-11-05 09:39:24', '2018-11-02 12:36:38'),
(11, 39, 'Titile 11', 'This is demo decription of form 11', '', '5836259796', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(12, 41, 'Titile 12', 'This is demo decription of form 12', '', '3509943513', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(13, 43, 'Titile 13', 'This is demo decription of form 13', '', '7324670981', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(14, 46, 'Titile 14', 'This is demo decription of form 14', '', '6959926531', 1, 'SUMMER 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(15, 50, 'Titile 15', 'This is demo decription of form 15', '', '6562418399', 0, 'SPRING 2018', '2018-11-05 09:39:32', '2018-11-02 12:36:38'),
(16, 55, 'Titile 16', 'This is demo decription of form 16', '', '4594281016', 1, 'SUMMER 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(17, 56, 'Titile 17', 'This is demo decription of form 17', '', '9116568521', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(18, 58, 'Titile 18', 'This is demo decription of form 18', '', '6774492993', 1, 'SUMMER 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(19, 61, 'Titile 19', 'This is demo decription of form 19', '', '1888466789', 0, 'SPRING 2018', '2018-11-05 09:39:37', '2018-11-02 12:36:38'),
(20, 64, 'Titile 20', 'This is demo decription of form 20', '', '1698898242', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(21, 66, 'Titile 21', 'This is demo decription of form 21', '', '4431759247', 1, 'SUMMER 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(22, 67, 'Titile 22', 'This is demo decription of form 22', '', '2032724175', 0, 'SPRING 2018', '2018-11-05 09:39:29', '2018-11-02 12:36:38'),
(23, 68, 'Titile 23', 'This is demo decription of form 23', '', '7946096822', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(24, 69, 'Titile 24', 'This is demo decription of form 24', '', '2569508160', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(25, 70, 'Titile 25', 'This is demo decription of form 25', '', '0391709479', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(26, 71, 'Titile 26', 'This is demo decription of form 26', '', '9571698034', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(27, 72, 'Titile 27', 'This is demo decription of form 27', '', '7741337993', 1, 'SPRING 2018', '2018-11-02 12:36:38', '2018-11-02 12:36:38'),
(28, 73, 'Titile 28', 'This is demo decription of form 28', '', '1507934772', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(29, 74, 'Titile 29', 'This is demo decription of form 29', '', '9120654492', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(30, 75, 'Titile 30', 'This is demo decription of form 30', '', '4077457514', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(31, 76, 'Titile 31', 'This is demo decription of form 31', '', '4162038480', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(32, 77, 'Titile 32', 'This is demo decription of form 32', '', '7585562378', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(33, 78, 'Titile 33', 'This is demo decription of form 33', '', '1928338760', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(34, 79, 'Titile 34', 'This is demo decription of form 34', '', '2885302409', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(35, 80, 'Titile 35', 'This is demo decription of form 35', '', '1894999053', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(36, 81, 'Titile 36', 'This is demo decription of form 36', '', '5787427678', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(37, 82, 'Titile 37', 'This is demo decription of form 37', '', '5609260519', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(38, 83, 'Titile 38', 'This is demo decription of form 38', '', '7528936562', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(39, 84, 'Titile 39', 'This is demo decription of form 39', '', '1493512101', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(40, 85, 'Titile 40', 'This is demo decription of form 40', '', '8135182650', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(41, 112, 'Titile 41', 'Teacher form 1', '', '1705574508', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(42, 113, 'Titile 42', 'Teacher form 2', '', '9996432756', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(43, 114, 'Titile 43', 'Teacher form 3', '', '8625236447', 1, 'FALL 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(44, 115, 'Titile 44', 'Teacher form 4', '', '5636790184', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(45, 116, 'Titile 45', 'Teacher form 5', '', '2883853632', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(46, 117, 'Titile 46', 'Teacher form 6', '', '4704674538', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(47, 118, 'Titile 47', 'Teacher form 7', '', '7844930068', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(48, 119, 'Titile 48', 'Teacher form 8', '', '0292747064', 1, 'SPRING 2018', '2018-11-02 12:36:39', '2018-11-02 12:36:39'),
(49, 120, 'Titile 49', 'Teacher form 9', '', '9228338181', 1, 'SPRING 2018', '2018-11-02 12:36:40', '2018-11-02 12:36:40'),
(50, 121, 'Titile 50', 'Teacher form 10', '', '1630932730', 1, 'SPRING 2018', '2018-11-02 12:36:40', '2018-11-02 12:36:40'),
(61, 122, 'kdaklsdj', '<p>djasjdasdaslk</p>', '', NULL, 1, 'SPRING 2018', '2018-11-20 16:58:13', '2018-11-20 16:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `wp_form_skill`
--

CREATE TABLE `wp_form_skill` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_groups`
--

CREATE TABLE `wp_groups` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_groups`
--

INSERT INTO `wp_groups` (`ID`, `form_id`, `type`, `created_date`) VALUES
(13, 61, 'Student', '2018-11-20 16:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_major`
--

CREATE TABLE `wp_major` (
  `ID` bigint(20) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `url_image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `size_image` int(11) NOT NULL,
  `image_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_major`
--

INSERT INTO `wp_major` (`ID`, `code`, `name`, `url_image`, `size_image`, `image_type`, `comment`, `date_created`) VALUES
(1, 'IS', 'Information System', 'http://localhost/studentservice/wp-content/plugins/manage-major/major_images/Information System_IS_1.png', 0, 'png', 'hello the world a', '2018-11-30 18:59:55'),
(2, 'ES', 'Embedded System', 'http://localhost/studentservice/wp-content/plugins/manage-major/major_images/Embedded System_ES_2.jpeg', 0, 'jpeg', '', '2018-11-30 19:00:13'),
(3, 'JS', 'Japanese Software engineering', '', 0, '', '', '2018-11-30 11:44:19');

-- --------------------------------------------------------

--
-- Table structure for table `wp_members`
--

CREATE TABLE `wp_members` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `member_role` int(1) NOT NULL,
  `joined_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_members`
--

INSERT INTO `wp_members` (`ID`, `form_id`, `member_id`, `member_role`, `joined_date`) VALUES
(31, 61, 122, 0, '2018-11-20 16:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/studentservice', 'yes'),
(2, 'home', 'http://localhost/studentservice', 'yes'),
(3, 'blogname', 'Graduation Project Finder', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:197:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:37:\"portfolio/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"portfolio/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"portfolio/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"portfolio/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"portfolio/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"portfolio/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"portfolio/([^/]+)/embed/?$\";s:47:\"index.php?zozo_portfolio=$matches[1]&embed=true\";s:30:\"portfolio/([^/]+)/trackback/?$\";s:41:\"index.php?zozo_portfolio=$matches[1]&tb=1\";s:38:\"portfolio/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?zozo_portfolio=$matches[1]&paged=$matches[2]\";s:45:\"portfolio/([^/]+)/comment-page-([0-9]{1,})/?$\";s:54:\"index.php?zozo_portfolio=$matches[1]&cpage=$matches[2]\";s:34:\"portfolio/([^/]+)(?:/([0-9]+))?/?$\";s:53:\"index.php?zozo_portfolio=$matches[1]&page=$matches[2]\";s:26:\"portfolio/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:36:\"portfolio/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:56:\"portfolio/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"portfolio/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"portfolio/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"portfolio/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:61:\"portfolio-categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?portfolio_categories=$matches[1]&feed=$matches[2]\";s:56:\"portfolio-categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?portfolio_categories=$matches[1]&feed=$matches[2]\";s:37:\"portfolio-categories/([^/]+)/embed/?$\";s:53:\"index.php?portfolio_categories=$matches[1]&embed=true\";s:49:\"portfolio-categories/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?portfolio_categories=$matches[1]&paged=$matches[2]\";s:31:\"portfolio-categories/([^/]+)/?$\";s:42:\"index.php?portfolio_categories=$matches[1]\";s:55:\"portfolio-tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?portfolio_tags=$matches[1]&feed=$matches[2]\";s:50:\"portfolio-tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?portfolio_tags=$matches[1]&feed=$matches[2]\";s:31:\"portfolio-tags/([^/]+)/embed/?$\";s:47:\"index.php?portfolio_tags=$matches[1]&embed=true\";s:43:\"portfolio-tags/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?portfolio_tags=$matches[1]&paged=$matches[2]\";s:25:\"portfolio-tags/([^/]+)/?$\";s:36:\"index.php?portfolio_tags=$matches[1]\";s:36:\"services/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"services/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"services/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"services/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"services/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"services/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"services/([^/]+)/embed/?$\";s:46:\"index.php?zozo_services=$matches[1]&embed=true\";s:29:\"services/([^/]+)/trackback/?$\";s:40:\"index.php?zozo_services=$matches[1]&tb=1\";s:37:\"services/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?zozo_services=$matches[1]&paged=$matches[2]\";s:44:\"services/([^/]+)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?zozo_services=$matches[1]&cpage=$matches[2]\";s:33:\"services/([^/]+)(?:/([0-9]+))?/?$\";s:52:\"index.php?zozo_services=$matches[1]&page=$matches[2]\";s:25:\"services/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"services/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"services/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"services/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"services/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"services/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:59:\"service-categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?service_categories=$matches[1]&feed=$matches[2]\";s:54:\"service-categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?service_categories=$matches[1]&feed=$matches[2]\";s:35:\"service-categories/([^/]+)/embed/?$\";s:51:\"index.php?service_categories=$matches[1]&embed=true\";s:47:\"service-categories/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?service_categories=$matches[1]&paged=$matches[2]\";s:29:\"service-categories/([^/]+)/?$\";s:40:\"index.php?service_categories=$matches[1]\";s:39:\"testimonial/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"testimonial/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"testimonial/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testimonial/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testimonial/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"testimonial/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:28:\"testimonial/([^/]+)/embed/?$\";s:49:\"index.php?zozo_testimonial=$matches[1]&embed=true\";s:32:\"testimonial/([^/]+)/trackback/?$\";s:43:\"index.php?zozo_testimonial=$matches[1]&tb=1\";s:40:\"testimonial/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?zozo_testimonial=$matches[1]&paged=$matches[2]\";s:47:\"testimonial/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?zozo_testimonial=$matches[1]&cpage=$matches[2]\";s:36:\"testimonial/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?zozo_testimonial=$matches[1]&page=$matches[2]\";s:28:\"testimonial/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:38:\"testimonial/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:58:\"testimonial/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testimonial/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testimonial/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"testimonial/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"testimonial-categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:61:\"index.php?testimonial_categories=$matches[1]&feed=$matches[2]\";s:58:\"testimonial-categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:61:\"index.php?testimonial_categories=$matches[1]&feed=$matches[2]\";s:39:\"testimonial-categories/([^/]+)/embed/?$\";s:55:\"index.php?testimonial_categories=$matches[1]&embed=true\";s:51:\"testimonial-categories/([^/]+)/page/?([0-9]{1,})/?$\";s:62:\"index.php?testimonial_categories=$matches[1]&paged=$matches[2]\";s:33:\"testimonial-categories/([^/]+)/?$\";s:44:\"index.php?testimonial_categories=$matches[1]\";s:32:\"team/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"team/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"team/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"team/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"team/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"team/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"team/([^/]+)/embed/?$\";s:49:\"index.php?zozo_team_member=$matches[1]&embed=true\";s:25:\"team/([^/]+)/trackback/?$\";s:43:\"index.php?zozo_team_member=$matches[1]&tb=1\";s:33:\"team/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?zozo_team_member=$matches[1]&paged=$matches[2]\";s:40:\"team/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?zozo_team_member=$matches[1]&cpage=$matches[2]\";s:29:\"team/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?zozo_team_member=$matches[1]&page=$matches[2]\";s:21:\"team/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"team/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"team/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"team/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"team/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"team/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:52:\"team-groups/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?team_categories=$matches[1]&feed=$matches[2]\";s:47:\"team-groups/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?team_categories=$matches[1]&feed=$matches[2]\";s:28:\"team-groups/([^/]+)/embed/?$\";s:48:\"index.php?team_categories=$matches[1]&embed=true\";s:40:\"team-groups/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?team_categories=$matches[1]&paged=$matches[2]\";s:22:\"team-groups/([^/]+)/?$\";s:37:\"index.php?team_categories=$matches[1]\";s:40:\"vc_grid_item/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"vc_grid_item/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"vc_grid_item/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"vc_grid_item/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"vc_grid_item/([^/]+)/embed/?$\";s:45:\"index.php?vc_grid_item=$matches[1]&embed=true\";s:33:\"vc_grid_item/([^/]+)/trackback/?$\";s:39:\"index.php?vc_grid_item=$matches[1]&tb=1\";s:41:\"vc_grid_item/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&paged=$matches[2]\";s:48:\"vc_grid_item/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&cpage=$matches[2]\";s:37:\"vc_grid_item/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?vc_grid_item=$matches[1]&page=$matches[2]\";s:29:\"vc_grid_item/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"vc_grid_item/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"vc_grid_item/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"vc_grid_item/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=7&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:27:\"js_composer/js_composer.php\";i:1;s:21:\"manage-major/main.php\";i:2;s:35:\"zozothemes-core/zozothemes-core.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:92:\"/Applications/XAMPP/xamppfiles/htdocs/studentservice/wp-content/themes/metal-child/style.css\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'metal', 'yes'),
(41, 'stylesheet', 'metal-child', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '600', 'yes'),
(65, 'large_size_h', '600', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '7', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'cron', 'a:5:{i:1543604938;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1543630138;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1543673378;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1543673926;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(112, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539439981;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(116, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1543586974;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(121, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1543586977;s:7:\"checked\";a:2:{s:11:\"metal-child\";s:5:\"1.0.1\";s:5:\"metal\";s:5:\"1.0.3\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(124, 'can_compress_scripts', '1', 'no'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(143, 'vc_version', '5.4.5', 'yes'),
(144, 'widget_zozo_tweets-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(145, 'current_theme', 'Metal Child', 'yes'),
(146, 'theme_mods_metal-child', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:12:\"primary-menu\";i:2;s:11:\"mobile-menu\";i:3;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539449207;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}}}s:18:\"custom_css_post_id\";i:-1;s:12:\"zozo_options\";a:1:{s:14:\"zozo_menu_type\";s:8:\"standard\";}}', 'yes'),
(147, 'theme_switched', '', 'yes'),
(148, 'widget_zozo_facebook_like-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(149, 'widget_zozo_call_to_action-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(150, 'widget_zozo_flickr_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(151, 'widget_zozo_instagram_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(152, 'widget_zozo_mailchimp_form_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(153, 'widget_zozo_popular_posts-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(154, 'widget_zozo_category_posts-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(155, 'widget_zozo_tabs-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(156, 'widget_zozo_counters_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(157, 'widget_zozo_social_link_widget-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(158, 'large_crop', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(159, 'zozo_options', 'a:266:{s:8:\"last_tab\";s:0:\"\";s:24:\"zozo_disable_page_loader\";s:0:\"\";s:20:\"zozo_page_loader_img\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:22:\"zozo_enable_responsive\";s:1:\"1\";s:20:\"zozo_enable_rtl_mode\";s:0:\"\";s:23:\"zozo_enable_breadcrumbs\";s:1:\"1\";s:22:\"zozo_disable_opengraph\";s:0:\"\";s:9:\"zozo_logo\";a:5:{s:3:\"url\";s:71:\"http://localhost/studentservice/wp-content/themes/metal/images/logo.png\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:2:\"86\";s:5:\"width\";s:3:\"197\";s:9:\"thumbnail\";s:0:\"\";}s:16:\"zozo_retina_logo\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:19:\"zozo_logo_maxheight\";s:3:\"100\";s:17:\"zozo_logo_padding\";a:3:{s:11:\"padding-top\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:16:\"zozo_sticky_logo\";a:5:{s:3:\"url\";s:78:\"http://localhost/studentservice/wp-content/themes/metal/images/sticky-logo.png\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:2:\"86\";s:5:\"width\";s:3:\"197\";s:9:\"thumbnail\";s:0:\"\";}s:24:\"zozo_sticky_logo_padding\";a:3:{s:11:\"padding-top\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:18:\"zozo_mailchimp_api\";s:0:\"\";s:15:\"zozo_custom_css\";s:0:\"\";s:23:\"zozo_enable_maintenance\";s:1:\"0\";s:26:\"zozo_maintenance_mode_page\";s:0:\"\";s:23:\"zozo_enable_coming_soon\";s:1:\"0\";s:21:\"zozo_coming_soon_page\";s:0:\"\";s:17:\"zozo_theme_layout\";s:9:\"fullwidth\";s:11:\"zozo_layout\";s:7:\"one-col\";s:25:\"zozo_fullwidth_site_width\";s:4:\"1200\";s:21:\"zozo_boxed_site_width\";s:4:\"1200\";s:18:\"zozo_header_layout\";s:9:\"fullwidth\";s:26:\"zozo_enable_header_top_bar\";s:1:\"1\";s:18:\"zozo_sticky_header\";s:1:\"1\";s:16:\"zozo_header_skin\";s:5:\"light\";s:24:\"zozo_header_transparency\";s:14:\"no-transparent\";s:23:\"zozo_header_search_type\";s:1:\"0\";s:16:\"zozo_header_type\";s:8:\"header-1\";s:21:\"zozo_header_menu_skin\";s:5:\"light\";s:27:\"zozo_header_elements_config\";a:2:{s:7:\"enabled\";a:5:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";}s:8:\"disabled\";a:5:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:25:\"zozo_header_elements_text\";s:11:\"Header Text\";s:27:\"zozo_header_logo_bar_config\";a:2:{s:7:\"enabled\";a:3:{s:7:\"placebo\";s:7:\"placebo\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:7:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:25:\"zozo_header_logo_bar_text\";s:20:\"Header Logo Bar Text\";s:23:\"zozo_header_left_config\";a:2:{s:7:\"enabled\";a:2:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"primary-menu\";s:12:\"Primary Menu\";}s:8:\"disabled\";a:8:{s:7:\"placebo\";s:7:\"placebo\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:21:\"zozo_header_left_text\";s:16:\"Header Left Text\";s:24:\"zozo_header_right_config\";a:2:{s:7:\"enabled\";a:4:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"social-icons\";s:12:\"Social Icons\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:6:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:22:\"zozo_header_right_text\";s:17:\"Header Right Text\";s:28:\"zozo_header_right_alt_config\";a:2:{s:7:\"enabled\";a:3:{s:7:\"placebo\";s:7:\"placebo\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:4:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:26:\"zozo_header_right_alt_text\";s:17:\"Header Right Text\";s:20:\"zozo_slider_position\";s:5:\"below\";s:27:\"zozo_header_toggle_position\";s:4:\"left\";s:22:\"zozo_header_side_width\";s:5:\"280px\";s:24:\"zozo_header_top_bar_left\";a:2:{s:7:\"enabled\";a:2:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"contact-info\";s:12:\"Contact Info\";}s:8:\"disabled\";a:8:{s:7:\"placebo\";s:7:\"placebo\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";s:12:\"social-icons\";s:12:\"Social Icons\";s:11:\"search-icon\";s:6:\"Search\";s:9:\"cart-icon\";s:4:\"Cart\";s:8:\"top-menu\";s:8:\"Top Menu\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:11:\"welcome-msg\";s:15:\"Welcome Message\";}}s:29:\"zozo_header_top_bar_left_text\";s:17:\"Top Bar Left Text\";s:25:\"zozo_header_top_bar_right\";a:2:{s:7:\"enabled\";a:2:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"social-icons\";s:12:\"Social Icons\";}s:8:\"disabled\";a:8:{s:7:\"placebo\";s:7:\"placebo\";s:12:\"contact-info\";s:12:\"Contact Info\";s:11:\"search-icon\";s:6:\"Search\";s:9:\"cart-icon\";s:4:\"Cart\";s:8:\"top-menu\";s:8:\"Top Menu\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:11:\"welcome-msg\";s:15:\"Welcome Message\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:30:\"zozo_header_top_bar_right_text\";s:18:\"Top Bar Right Text\";s:16:\"zozo_welcome_msg\";s:16:\"Welcome to Metal\";s:17:\"zozo_header_phone\";s:15:\"+12 123 456 789\";s:17:\"zozo_header_email\";s:17:\"info@yoursite.com\";s:19:\"zozo_header_address\";s:78:\"<strong>No. 12, Ribon Building, </strong><span>Walse street, Australia.</span>\";s:26:\"zozo_header_business_hours\";s:81:\"<strong>Monday-Friday: 9am to 5pm </strong><span>Saturday / Sunday: Closed</span>\";s:23:\"zozo_enable_sliding_bar\";s:0:\"\";s:24:\"zozo_disable_sliding_bar\";s:1:\"1\";s:24:\"zozo_sliding_bar_columns\";s:1:\"3\";s:19:\"zozo_header_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:14:\"zozo_menu_type\";s:8:\"standard\";s:19:\"zozo_menu_separator\";s:0:\"\";s:24:\"zozo_dropdown_menu_width\";a:2:{s:5:\"width\";s:5:\"200px\";s:5:\"units\";s:2:\"px\";}s:16:\"zozo_menu_height\";a:2:{s:6:\"height\";s:4:\"70px\";s:5:\"units\";s:2:\"px\";}s:23:\"zozo_sticky_menu_height\";a:2:{s:6:\"height\";s:4:\"60px\";s:5:\"units\";s:2:\"px\";}s:20:\"zozo_logo_bar_height\";a:2:{s:6:\"height\";s:4:\"76px\";s:5:\"units\";s:2:\"px\";}s:20:\"zozo_menu_height_alt\";a:2:{s:6:\"height\";s:4:\"60px\";s:5:\"units\";s:2:\"px\";}s:27:\"zozo_sticky_menu_height_alt\";a:2:{s:6:\"height\";s:4:\"60px\";s:5:\"units\";s:2:\"px\";}s:26:\"zozo_enable_secondary_menu\";s:0:\"\";s:28:\"zozo_secondary_menu_position\";s:5:\"right\";s:11:\"mobile_logo\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:20:\"sticky_mobile_header\";s:1:\"1\";s:20:\"mobile_header_layout\";s:9:\"left-logo\";s:15:\"mobile_top_text\";s:0:\"\";s:18:\"mobile_show_search\";s:1:\"0\";s:23:\"mobile_show_translation\";s:1:\"0\";s:16:\"mobile_show_cart\";s:1:\"0\";s:19:\"zozo_copyright_text\";s:45:\"&copy; Copyright [year]. All Rights Reserved.\";s:26:\"zozo_footer_widgets_enable\";s:1:\"1\";s:23:\"zozo_enable_back_to_top\";s:1:\"1\";s:25:\"zozo_back_to_top_position\";s:13:\"copyright_bar\";s:23:\"zozo_enable_footer_menu\";s:0:\"\";s:27:\"zozo_footer_copyright_align\";s:4:\"left\";s:16:\"zozo_footer_skin\";s:4:\"dark\";s:17:\"zozo_footer_style\";s:7:\"default\";s:16:\"zozo_footer_type\";s:8:\"footer-1\";s:19:\"zozo_footer_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:3:\"0px\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:29:\"zozo_footer_copyright_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:14:\"zozo_body_font\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"14px\";s:11:\"line-height\";s:4:\"25px\";s:5:\"color\";s:7:\"#333333\";}s:19:\"zozo_h1_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"48px\";s:11:\"line-height\";s:4:\"62px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h2_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"40px\";s:11:\"line-height\";s:4:\"52px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h3_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"32px\";s:11:\"line-height\";s:4:\"42px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h4_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"24px\";s:11:\"line-height\";s:4:\"31px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h5_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"18px\";s:11:\"line-height\";s:4:\"23px\";s:5:\"color\";s:0:\"\";}s:19:\"zozo_h6_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"21px\";s:5:\"color\";s:0:\"\";}s:25:\"zozo_top_menu_font_styles\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"12px\";s:11:\"line-height\";s:4:\"12px\";s:5:\"color\";s:0:\"\";}s:21:\"zozo_menu_font_styles\";a:8:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"11px\";s:5:\"color\";s:0:\"\";}s:24:\"zozo_submenu_font_styles\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"14px\";s:11:\"line-height\";s:4:\"20px\";s:5:\"color\";s:0:\"\";}s:28:\"zozo_single_post_title_fonts\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"32px\";s:11:\"line-height\";s:4:\"35px\";s:5:\"color\";s:0:\"\";}s:27:\"zozo_post_title_font_styles\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"26px\";s:11:\"line-height\";s:4:\"41px\";s:5:\"color\";s:0:\"\";}s:23:\"zozo_widget_title_fonts\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"42px\";s:5:\"color\";s:0:\"\";}s:22:\"zozo_widget_text_fonts\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"13px\";s:11:\"line-height\";s:4:\"25px\";s:5:\"color\";s:0:\"\";}s:30:\"zozo_footer_widget_title_fonts\";a:9:{s:11:\"font-family\";s:6:\"Oswald\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"42px\";s:5:\"color\";s:0:\"\";}s:29:\"zozo_footer_widget_text_fonts\";a:9:{s:11:\"font-family\";s:5:\"Arimo\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";s:9:\"font-size\";s:4:\"13px\";s:11:\"line-height\";s:4:\"25px\";s:5:\"color\";s:0:\"\";}s:17:\"zozo_color_scheme\";s:10:\"yellow.css\";s:15:\"zozo_theme_skin\";s:5:\"light\";s:24:\"zozo_custom_scheme_color\";s:0:\"\";s:22:\"zozo_custom_color_skin\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:15:\"zozo_link_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:18:\"zozo_body_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:18:\"zozo_page_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"zozo_header_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"zozo_sticky_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:32:\"zozo_header_top_background_color\";s:0:\"\";s:29:\"zozo_sliding_background_color\";s:0:\"\";s:20:\"zozo_top_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:21:\"zozo_main_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:24:\"zozo_submenu_show_border\";s:1:\"1\";s:24:\"zozo_main_submenu_border\";a:6:{s:10:\"border-top\";s:3:\"3px\";s:12:\"border-right\";s:0:\"\";s:13:\"border-bottom\";s:0:\"\";s:11:\"border-left\";s:0:\"\";s:12:\"border-style\";s:5:\"solid\";s:12:\"border-color\";s:0:\"\";}s:21:\"zozo_submenu_bg_color\";s:7:\"#ffffff\";s:20:\"zozo_sub_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:22:\"zozo_submenu_hbg_color\";s:0:\"\";s:20:\"zozo_footer_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:25:\"zozo_footer_copy_bg_image\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"zozo_social_bg_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:22:\"zozo_social_icon_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:21:\"zozo_social_icon_type\";s:11:\"transparent\";s:18:\"zozo_facebook_link\";s:0:\"\";s:17:\"zozo_twitter_link\";s:0:\"\";s:18:\"zozo_linkedin_link\";s:0:\"\";s:19:\"zozo_pinterest_link\";s:0:\"\";s:20:\"zozo_googleplus_link\";s:0:\"\";s:17:\"zozo_youtube_link\";s:0:\"\";s:13:\"zozo_rss_link\";s:0:\"\";s:16:\"zozo_tumblr_link\";s:0:\"\";s:16:\"zozo_reddit_link\";s:0:\"\";s:18:\"zozo_dribbble_link\";s:0:\"\";s:14:\"zozo_digg_link\";s:0:\"\";s:16:\"zozo_flickr_link\";s:0:\"\";s:19:\"zozo_instagram_link\";s:0:\"\";s:15:\"zozo_vimeo_link\";s:0:\"\";s:15:\"zozo_skype_link\";s:0:\"\";s:17:\"zozo_blogger_link\";s:0:\"\";s:15:\"zozo_yahoo_link\";s:0:\"\";s:28:\"zozo_portfolio_archive_count\";s:2:\"10\";s:29:\"zozo_portfolio_archive_layout\";s:4:\"grid\";s:30:\"zozo_portfolio_archive_columns\";s:1:\"4\";s:29:\"zozo_portfolio_archive_gutter\";s:2:\"30\";s:24:\"zozo_portfolio_prev_next\";s:1:\"1\";s:29:\"zozo_portfolio_related_slider\";s:1:\"1\";s:28:\"zozo_portfolio_related_title\";s:0:\"\";s:21:\"zozo_portfolio_citems\";s:0:\"\";s:28:\"zozo_portfolio_citems_scroll\";s:0:\"\";s:22:\"zozo_portfolio_ctablet\";s:0:\"\";s:27:\"zozo_portfolio_cmobile_land\";s:0:\"\";s:22:\"zozo_portfolio_cmobile\";s:0:\"\";s:22:\"zozo_portfolio_cmargin\";s:2:\"20\";s:24:\"zozo_portfolio_cautoplay\";s:1:\"1\";s:23:\"zozo_portfolio_ctimeout\";s:4:\"5000\";s:20:\"zozo_portfolio_cloop\";s:0:\"\";s:26:\"zozo_portfolio_cpagination\";s:1:\"1\";s:26:\"zozo_portfolio_cnavigation\";s:0:\"\";s:26:\"zozo_service_archive_count\";s:2:\"10\";s:28:\"zozo_service_archive_columns\";s:1:\"4\";s:19:\"zozo_service_citems\";s:0:\"\";s:26:\"zozo_service_citems_scroll\";s:0:\"\";s:20:\"zozo_service_ctablet\";s:0:\"\";s:25:\"zozo_service_cmobile_land\";s:0:\"\";s:20:\"zozo_service_cmobile\";s:0:\"\";s:20:\"zozo_service_cmargin\";s:0:\"\";s:22:\"zozo_service_cautoplay\";s:1:\"1\";s:21:\"zozo_service_ctimeout\";s:4:\"5000\";s:18:\"zozo_service_cloop\";s:0:\"\";s:24:\"zozo_service_cpagination\";s:1:\"1\";s:24:\"zozo_service_cnavigation\";s:0:\"\";s:28:\"zozo_disable_blog_pagination\";s:0:\"\";s:24:\"zozo_blog_read_more_text\";s:0:\"\";s:30:\"zozo_blog_excerpt_length_large\";s:2:\"80\";s:29:\"zozo_blog_excerpt_length_grid\";s:2:\"40\";s:28:\"zozo_blog_slideshow_autoplay\";s:1:\"1\";s:27:\"zozo_blog_slideshow_timeout\";s:4:\"5000\";s:21:\"zozo_blog_date_format\";s:5:\"d.m.Y\";s:26:\"zozo_blog_post_meta_author\";s:0:\"\";s:24:\"zozo_blog_post_meta_date\";s:0:\"\";s:30:\"zozo_blog_post_meta_categories\";s:0:\"\";s:28:\"zozo_blog_post_meta_comments\";s:0:\"\";s:19:\"zozo_blog_read_more\";s:0:\"\";s:24:\"zozo_blog_archive_layout\";s:7:\"one-col\";s:22:\"zozo_archive_blog_type\";s:5:\"large\";s:30:\"zozo_archive_blog_grid_columns\";s:3:\"two\";s:33:\"zozo_show_archive_featured_slider\";s:0:\"\";s:24:\"zozo_blog_page_title_bar\";s:1:\"1\";s:15:\"zozo_blog_title\";s:0:\"\";s:16:\"zozo_blog_slogan\";s:0:\"\";s:16:\"zozo_blog_layout\";s:7:\"one-col\";s:14:\"zozo_blog_type\";s:5:\"large\";s:22:\"zozo_blog_grid_columns\";s:3:\"two\";s:30:\"zozo_show_blog_featured_slider\";s:0:\"\";s:23:\"zozo_single_post_layout\";s:7:\"one-col\";s:24:\"zozo_blog_social_sharing\";s:1:\"1\";s:21:\"zozo_blog_author_info\";s:1:\"1\";s:18:\"zozo_blog_comments\";s:1:\"1\";s:23:\"zozo_show_related_posts\";s:1:\"1\";s:23:\"zozo_related_blog_items\";s:1:\"3\";s:30:\"zozo_related_blog_items_scroll\";s:1:\"1\";s:26:\"zozo_related_blog_autoplay\";s:1:\"1\";s:25:\"zozo_related_blog_timeout\";s:4:\"5000\";s:22:\"zozo_related_blog_loop\";s:0:\"\";s:24:\"zozo_related_blog_margin\";s:2:\"30\";s:24:\"zozo_related_blog_tablet\";s:1:\"3\";s:27:\"zozo_related_blog_landscape\";s:1:\"2\";s:26:\"zozo_related_blog_portrait\";s:1:\"1\";s:22:\"zozo_related_blog_dots\";s:0:\"\";s:21:\"zozo_related_blog_nav\";s:1:\"1\";s:19:\"zozo_blog_prev_next\";s:1:\"1\";s:25:\"zozo_single_blog_carousel\";s:0:\"\";s:23:\"zozo_single_blog_citems\";s:1:\"3\";s:30:\"zozo_single_blog_citems_scroll\";s:1:\"1\";s:26:\"zozo_single_blog_cautoplay\";s:1:\"1\";s:25:\"zozo_single_blog_ctimeout\";s:4:\"5000\";s:22:\"zozo_single_blog_cloop\";s:0:\"\";s:24:\"zozo_single_blog_cmargin\";s:0:\"\";s:24:\"zozo_single_blog_ctablet\";s:1:\"3\";s:28:\"zozo_single_blog_cmlandscape\";s:1:\"2\";s:27:\"zozo_single_blog_cmportrait\";s:1:\"1\";s:22:\"zozo_single_blog_cdots\";s:0:\"\";s:21:\"zozo_single_blog_cnav\";s:1:\"1\";s:25:\"zozo_featured_slider_type\";s:12:\"below_header\";s:25:\"zozo_featured_posts_limit\";s:1:\"6\";s:27:\"zozo_featured_slider_citems\";s:1:\"3\";s:34:\"zozo_featured_slider_citems_scroll\";s:1:\"1\";s:30:\"zozo_featured_slider_cautoplay\";s:1:\"1\";s:29:\"zozo_featured_slider_ctimeout\";s:4:\"5000\";s:26:\"zozo_featured_slider_cloop\";s:0:\"\";s:28:\"zozo_featured_slider_cmargin\";s:0:\"\";s:28:\"zozo_featured_slider_ctablet\";s:1:\"3\";s:32:\"zozo_featured_slider_cmlandscape\";s:1:\"2\";s:31:\"zozo_featured_slider_cmportrait\";s:1:\"1\";s:26:\"zozo_featured_slider_cdots\";s:0:\"\";s:25:\"zozo_featured_slider_cnav\";s:1:\"1\";s:21:\"zozo_search_page_type\";s:4:\"grid\";s:24:\"zozo_search_grid_columns\";s:3:\"two\";s:27:\"zozo_search_results_content\";s:4:\"both\";s:21:\"zozo_sharing_facebook\";s:1:\"1\";s:20:\"zozo_sharing_twitter\";s:1:\"1\";s:21:\"zozo_sharing_linkedin\";s:1:\"1\";s:23:\"zozo_sharing_googleplus\";s:1:\"1\";s:22:\"zozo_sharing_pinterest\";s:0:\"\";s:19:\"zozo_sharing_tumblr\";s:0:\"\";s:19:\"zozo_sharing_reddit\";s:0:\"\";s:17:\"zozo_sharing_digg\";s:0:\"\";s:18:\"zozo_sharing_email\";s:1:\"1\";s:11:\"cpt_disable\";a:4:{s:14:\"zozo_portfolio\";s:0:\"\";s:13:\"zozo_services\";s:0:\"\";s:16:\"zozo_testimonial\";s:0:\"\";s:9:\"zozo_team\";s:0:\"\";}s:14:\"portfolio_slug\";s:9:\"portfolio\";s:25:\"portfolio_categories_slug\";s:20:\"portfolio-categories\";s:19:\"portfolio_tags_slug\";s:14:\"portfolio-tags\";s:13:\"services_slug\";s:8:\"services\";s:23:\"service_categories_slug\";s:18:\"service-categories\";s:28:\"zozo_woo_enable_catalog_mode\";s:0:\"\";s:23:\"zozo_woo_archive_layout\";s:7:\"one-col\";s:22:\"zozo_woo_single_layout\";s:13:\"two-col-right\";s:27:\"zozo_loop_products_per_page\";s:2:\"12\";s:22:\"zozo_loop_shop_columns\";s:1:\"4\";s:27:\"zozo_related_products_count\";s:1:\"3\";s:22:\"zozo_woo_shop_ordering\";s:1:\"1\";s:23:\"zozo_woo_social_sharing\";s:1:\"1\";s:27:\"zozo_remove_scripts_version\";s:1:\"1\";s:15:\"zozo_minify_css\";s:1:\"1\";s:14:\"zozo_minify_js\";s:1:\"1\";}', 'yes'),
(160, 'zozo_options-transients', 'a:2:{s:14:\"changed_values\";a:1:{s:19:\"zozo_footer_spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}}s:9:\"last_save\";i:1541480224;}', 'yes'),
(164, 'theme_mods_metal', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539449720;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}}}}', 'yes'),
(167, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(329, 'clu_config', 'a:6:{s:5:\"login\";s:7:\"/login/\";s:8:\"register\";N;s:12:\"lostpassword\";N;s:6:\"logout\";N;s:14:\"redirect_login\";N;s:15:\"redirect_logout\";N;}', 'yes'),
(334, 'rda_access_switch', 'manage_options', 'yes'),
(335, 'rda_access_cap', 'manage_options', 'yes'),
(336, 'rda_redirect_url', 'http://localhost/studentservice', 'yes'),
(337, 'rda_enable_profile', '', 'yes'),
(338, 'rda_login_message', '', 'yes'),
(344, 'sbg_sidebars', 'a:0:{}', 'yes'),
(956, '_site_transient_timeout_browser_2b65bcd416b69043351960bca44acbff', '1544173651', 'no'),
(957, '_site_transient_browser_2b65bcd416b69043351960bca44acbff', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"70.0.3538.110\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(958, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1543613606', 'no'),
(959, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:0:{}}', 'no'),
(960, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1543612055', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(961, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"WordPress News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"https://wordpress.org/news\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"WordPress News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 23 Nov 2018 09:47:28 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"en-US\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:38:\"https://wordpress.org/?v=5.0-RC1-43947\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"WordPress 5.0 Release Candidate\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"https://wordpress.org/news/2018/11/wordpress-5-0-release-candidate/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 23 Nov 2018 09:46:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6257\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:323:\"The first release candidate for WordPress 5.0 is now available! This is an important milestone, as we near the release of WordPress 5.0.&#160;The WordPress 5.0 release date has shifted from the 27th to give more time for the RC to be fully tested. A final release date will be announced soon, based on feedback on [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Matias Ventura\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:6009:\"\n<p>The first release candidate for WordPress 5.0 is now available!</p>\n\n\n\n<p>This is an important milestone, as we near the release of WordPress 5.0.&nbsp;<strong>The WordPress 5.0 release date has shifted from the 27th to give more time for the RC to be fully tested</strong>. A final release date will be announced soon, based on feedback on the RC. This is a big release and needs <em>your</em> help—if you haven’t tried 5.0 yet, now is the time!&nbsp;</p>\n\n\n\n<p>To test WordPress 5.0, you can use the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-RC1.zip\">download the release candidate here</a>&nbsp;(zip).</p>\n\n\n\n<h2>What&#8217;s in WordPress 5.0?</h2>\n\n\n\n<figure class=\"wp-block-image\"><img src=\"https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?resize=632%2C316&#038;ssl=1\" alt=\"Screenshot of the new block editor interface.\" class=\"wp-image-6271\" srcset=\"https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?resize=1024%2C512&amp;ssl=1 1024w, https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?resize=300%2C150&amp;ssl=1 300w, https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?resize=768%2C384&amp;ssl=1 768w, https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?w=1264&amp;ssl=1 1264w, https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?w=1896&amp;ssl=1 1896w\" sizes=\"(max-width: 632px) 100vw, 632px\" data-recalc-dims=\"1\" /><figcaption>The new block-based post editor.</figcaption></figure>\n\n\n\n<p>WordPress 5.0 introduces the <a href=\"https://wordpress.org/gutenberg/\">new block-based post editor</a>. This is the first step toward an exciting new future with a streamlined editing experience across your site. You’ll have more flexibility with how content is displayed, whether you are building your first site, revamping your blog, or write code for a living.</p>\n\n\n\n<p>The block editor is&nbsp;<a href=\"https://gutenstats.blog/\">used on over a million sites</a>, we think it&#8217;s ready to be used on all WordPress sites. We do understand that some sites might need some extra time, though. If that&#8217;s you, please install the <a href=\"https://wordpress.org/plugins/classic-editor/\">Classic Editor plugin</a>, you&#8217;ll continue to use the classic post editor when you upgrade to WordPress 5.0.</p>\n\n\n\n<p>Twenty Nineteen is WordPress&#8217; new default theme, it&nbsp;features custom styles for the blocks available by default in 5.0.&nbsp;Twenty Nineteen is designed to work for a wide variety of use cases. Whether you’re running a photo blog, launching a new business, or supporting a non-profit, Twenty Nineteen is flexible enough to fit your needs.</p>\n\n\n\n<p>The block editor is a big change, but that&#8217;s not all. We&#8217;ve made some smaller changes as well,&nbsp; including:</p>\n\n\n\n<ul><li>All of the previous default themes, from Twenty Ten through to Twenty Seventeen, have been updated to support the block editor.</li><li>You can improve the accessibility of the content you write, now that <a href=\"https://core.trac.wordpress.org/ticket/30421\">simple ARIA labels</a>&nbsp;can be saved in posts and pages.</li><li>WordPress 5.0 officially supports the upcoming PHP 7.3 release: if you&#8217;re using an older version, we encourage you to <a href=\"https://wordpress.org/support/upgrade-php/\">upgrade PHP</a>&nbsp;on your site.</li><li>Developers can now add translatable strings directly to your JavaScript code, using the new <a href=\"https://make.wordpress.org/core/2018/11/09/new-javascript-i18n-support-in-wordpress/\">JavaScript language packs</a>.</li></ul>\n\n\n\n<p>You can read more about the fixes and changes since  Beta 5 <a href=\"https://make.wordpress.org/core/2018/11/20/whats-new-in-gutenberg-20th-november/\">in the last update post</a>.</p>\n\n\n\n<p>For more details about what’s new in version 5.0, check out the&nbsp;<a href=\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-1/\">Beta 1</a>,&nbsp;<a href=\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-2/\">Beta 2</a>,&nbsp;<a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-3/\">Beta 3</a>, <a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-4/\">Beta 4</a> and&nbsp;<a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-5/\">Beta 5</a>&nbsp;blog posts.</p>\n\n\n\n<h2>Plugin and Theme Developers</h2>\n\n\n\n<p>Please test your plugins and themes against WordPress 5.0 and update the&nbsp;<em>Tested up to</em>&nbsp;version in the readme to 5.0. If you find compatibility problems, please be sure to post to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">support forums</a> so we can figure those out before the final release. An in-depth field guide to developer-focused changes is coming soon on the&nbsp;<a href=\"https://make.wordpress.org/core/\">core development blog</a>. In the meantime, you can review the&nbsp;<a href=\"https://make.wordpress.org/core/tag/5.0+dev-notes/\">developer notes for 5.0</a>.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<p style=\"background-color:#f9f4e8\" class=\"has-background has-medium-font-size\"><em>Ruedan los bloques<br>Contando vivos cuentos<br>Que se despiertan</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6257\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.0 Beta 5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-5/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 01:09:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6250\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:360:\"WordPress 5.0 Beta 5 is now available! This software is still in development,&#160;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version. There are two ways to test this WordPress 5.0 Beta: try the&#160;WordPress Beta Tester&#160;plugin (you’ll want “bleeding edge nightlies”), or [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Jonathan Desrosiers\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4738:\"\n<p>WordPress 5.0 Beta 5 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test this WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta5.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p><strong>Reminder: the WordPress 5.0 release date has changed</strong>. It is now scheduled for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 27</a>, and we need your help to get there. Here are some of the big issues that we’ve fixed since Beta 4:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>The block editor has been updated to match the <a href=\"https://make.wordpress.org/core/2018/11/15/whats-new-in-gutenberg-15th-november-2/\">Gutenberg 4.4 release</a>, the major changes  include:</p>\n\n\n\n<ul><li>&nbsp;A <a href=\"https://github.com/WordPress/gutenberg/pull/11874\">permalink panel has been added to the document sidebar</a> to make it easier to find.</li><li>Editor document panels can now be <a href=\"https://github.com/WordPress/gutenberg/pull/11802\">programmatically removed</a>.</li><li>The uploading indicator for images and galleries has been replaced with a&nbsp;<a href=\"https://github.com/WordPress/gutenberg/pull/11876\">spinner and faded out image</a>.</li><li>The text and code editing blocks will now <a href=\"https://github.com/WordPress/gutenberg/pull/11750\">use the full width of the editor</a>.</li><li>Image handling has been improved. Images now  take up the right amount of space for <a href=\"https://github.com/WordPress/gutenberg/pull/11846\">themes with wider editors</a> (like Twenty Nineteen).<br></li><li>Hover styles are now <a href=\"https://github.com/WordPress/gutenberg/pull/10333\">correctly disabled for mobile devices</a>.</li><li>The i18n module has been refactored to benefit from <a href=\"https://github.com/WordPress/gutenberg/pull/11493\">significant performance gains</a>.</li></ul>\n\n\n\n<p>Additionally, there have been some pesky bugs fixed:</p>\n\n\n\n<ul><li>Better handling for <a href=\"https://github.com/WordPress/gutenberg/pull/11590\">links without an href</a> attribute, which were showing as <code>undefined</code>.</li><li>Japanese text (double byte characters) are <a href=\"https://github.com/WordPress/gutenberg/pull/11908\">now usable in the list block</a>.</li><li>Better handling for different text encodings (e.g. emoji) within a block <a href=\"https://github.com/WordPress/gutenberg/pull/11771\">in block validation</a>.</li></ul>\n\n\n\n<p>A full list of changes can be found in the <a href=\"https://make.wordpress.org/core/2018/11/15/whats-new-in-gutenberg-15th-november-2/\">Gutenberg 4.4 release post</a>.<br></p>\n\n\n\n<h2>PHP 7.3 Support</h2>\n\n\n\n<p>The final known PHP 7.3 compatibility issue has been fixed. You can brush up on what you need to know about PHP 7.3 and WordPress by checking out the <a href=\"https://make.wordpress.org/core/2018/10/15/wordpress-and-php-7-3/\">developer note on the Make WordPress Core blog</a>.<br></p>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Work on making Twenty Nineteen ready for prime time continues on its <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>. This update includes <a href=\"https://core.trac.wordpress.org/changeset/43904\">a host of tweaks and bug fixes</a>, including:</p>\n\n\n\n<ul><li>Add <code>.button</code> class support.</li><li>Fix editor font-weights for headings.</li><li>Improve support for sticky toolbars in the editor.</li><li>Improve text-selection custom colors for better contrast and legibility.</li><li>Fix editor to prevent Gutenberg&#8217;s meta boxes area from overlapping the content.</li></ul>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6250\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.0 Beta 4\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-4/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 13 Nov 2018 01:27:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6241\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:359:\"WordPress 5.0 Beta 4 is now available! This software is still in development,&#160;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version. There are two ways to test the WordPress 5.0 Beta: try the&#160;WordPress Beta Tester&#160;plugin (you’ll want “bleeding edge nightlies”), or [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Gary Pendergast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3700:\"\n<p>WordPress 5.0 Beta 4 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test the WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta4.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p><strong>The WordPress 5.0 release date has changed</strong>, it is now scheduled for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 27</a>, and we need your help to get there. Here are some of the big issues that we’ve fixed since Beta 3:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>The block editor has been updated to match the <a href=\"https://make.wordpress.org/core/2018/11/12/whats-new-in-gutenberg-12th-november/\">Gutenberg 4.3 release</a>, the major changes  include:</p>\n\n\n\n<ul><li>An <a href=\"https://github.com/WordPress/gutenberg/pull/7718\">Annotations API</a>, allowing plugins to add  contextual data as you write.</li><li>More consistent keyboard navigation between blocks, as well as back-and-forth between different areas of the interface.</li><li>Improved accessibility, with additional  labelling and speech announcements.</li></ul>\n\n\n\n<p>Additionally, there have been some bugs fixed that popped up in beta 3:</p>\n\n\n\n<ul><li>Better support for plugins that have more advanced meta box usage.</li><li>Script concatenation is now supported.</li><li>Ajax calls could occasionally cause PHP errors.</li></ul>\n\n\n\n<h2>Internationalisation</h2>\n\n\n\n<p>We&#8217;ve added an API for translating your plugin and theme strings in JavaScript files! The block editor is now using this, and you can start using it, too. Check out the <a href=\"https://make.wordpress.org/core/2018/11/09/new-javascript-i18n-support-in-wordpress/\">developer note</a>&nbsp;to get started.</p>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Twenty Nineteen is being polished over on its <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>. This update includes <a href=\"https://core.trac.wordpress.org/changeset/43892\">a host of tweaks and bug fixes</a>, including:</p>\n\n\n\n<ul><li>Menus now  properly support keyboard and touch interactions.</li><li>A footer menu has been added for secondary page links.</li><li>Improved backwards compatibility with older versions of WordPress.</li></ul>\n\n\n\n<h2>Default Themes</h2>\n\n\n\n<p>All of the older default themes—from Twenty Ten through to Twenty Seventeen—have polished  styling in the block editor.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p><em>International-<br>isation is a word with<br>many syllables.</em></p>\n\n\n\n<p><em>Meta boxes are<br>the original style block.<br>Old is new again.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6241\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:36:\"\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.0 Beta 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Nov 2018 00:20:08 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6236\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:359:\"WordPress 5.0 Beta 3 is now available! This software is still in development,&#160;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version. There are two ways to test the WordPress 5.0 Beta: try the&#160;WordPress Beta Tester&#160;plugin (you’ll want “bleeding edge nightlies”), or [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Gary Pendergast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3198:\"\n<p>WordPress 5.0 Beta 3 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test the WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta3.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p>WordPress 5.0 is slated for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 19</a>, and we need your help to get there. Here are some of the big issues that we&#8217;ve fixed since Beta 2:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>The block editor has been updated to include all of the features and bug fixes from the upcoming <a href=\"https://make.wordpress.org/core/2018/10/31/whats-new-in-gutenberg-31st-october-2/\">Gutenberg 4.2 release</a>. Additionally, there are some newer bug fixes and features, such as:</p>\n\n\n\n<ul><li>Adding support for the &#8220;Custom Fields&#8221; meta box.</li><li>Improving the reliability of REST API requests.</li><li>A myriad of minor tweaks and improvements.</li></ul>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Twenty Nineteen has been updated from its <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>, this version is full of new goodies to check out:</p>\n\n\n\n<ul><li>Adds support for Selective Refresh Widgets in the Customiser.</li><li>Adds support for Responsive Embeds.</li><li>Tweaks to improve readability and functionality on mobile devices.</li><li>Fixes nested blocks appearing wider than they should be.</li><li>Fixes some errors in older PHP versions, and in IE11.</li></ul>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English? <a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a> </p>\n\n\n\n<p>If you&#8217;re able to contribute with coding or testing changes, we have <a href=\"https://make.wordpress.org/core/2018/11/02/upcoming-5-0-bug-scrubs/\">a multitude of bug scrubs</a> scheduled this week, we&#8217;d love to have as many people as we can ensuring all bugs reported get the attention they deserve.</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p><em>WordPress Five Point Oh<br>is just two short weeks away.<br>Thank you for helping!</em> <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f496.png\" alt=\"💖\" class=\"wp-smiley\" style=\"height: 1em; max-height: 1em;\" /><em><br></em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6236\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:36:\"\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"Quarterly Updates | Q3 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:61:\"https://wordpress.org/news/2018/11/quarterly-updates-q3-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Nov 2018 16:46:16 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:7:\"General\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Updates\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6206\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:347:\"To keep everyone aware of big projects and efforts across WordPress contributor teams, I&#8217;ve reached out to each team&#8217;s listed representatives. I asked each of them to share their Top Priority (and when they hope for it to be completed), as well as their biggest Wins and Worries. Have questions? I&#8217;ve included a link to [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Josepha\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:14629:\"\n<p><em>To keep everyone aware of big projects and efforts across WordPress contributor teams, I&#8217;ve reached out to each team&#8217;s <a href=\"https://make.wordpress.org/updates/team-reps/\">listed representatives</a>. I asked each of them to share their Top Priority (and when they hope for it to be completed), as well as their biggest Wins and Worries. Have questions? I&#8217;ve included a link to each team&#8217;s site in the headings.</em></p>\n\n\n<h2><a href=\"https://make.wordpress.org/accessibility/\">Accessibility</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/joedolson/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>joedolson</a>, <a href=\'https://profiles.wordpress.org/audrasjb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>audrasjb</a>, <a href=\'https://profiles.wordpress.org/arush/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>arush</a></li>\n<li><strong>Priority</strong>: Work on authoring a manual for assistive technology users on Gutenberg, led by Claire Brotherton (<a href=\'https://profiles.wordpress.org/abrightclearweb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>abrightclearweb</a>). Continue to work on improving the overall user experience in Gutenberg. Update and organize the WP A11y handbook.</li>\n<li><strong>Struggle</strong>: Lack of developers and accessibility experts to help test and code the milestone issues. Still over 100 outstanding issues, and developing the Gutenberg AT manual helps expose additional issues. The announcement of an accessibility focus on 4.9.9 derailed our planning for Gutenberg in September with minimal productivity, as that goal was quickly withdrawn from the schedule.</li>\n<li><strong>Big Win</strong>: Getting focus constraint implemented in popovers and similar components in Gutenberg.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/cli/\">CLI</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: @danielbachhuber, <a href=\'https://profiles.wordpress.org/schlessera/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>schlessera</a></li>\n<li><strong>Priority</strong>: Current priority is v2.1.0 of WP-CLI, to polish the major refactoring v2.0.0 introduced. You can <a href=\"https://make.wordpress.org/cli/good-first-issues/\">join in or follow progress</a> on their site.</li>\n<li><strong>Struggle</strong>: Getting enough contributors to make peer-review possible/manageable.</li>\n<li><strong>Big Win</strong>: The major refactoring of v2 was mostly without any negative impacts on existing installs. It provided substantial improvements to maintainability including: faster and more reliable testing, more straight-forward changes to individual packages, and simpler contributor on-boarding.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/community/\">Community</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/francina/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>francina</a>, <a href=\'https://profiles.wordpress.org/hlashbrooke/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>hlashbrooke</a></li>\n<li><strong>Priority</strong>: Supporting contributors of all levels via: monthly <a href=\"https://make.wordpress.org/community/2018/10/08/announcement-monthly-chat-for-wordcamp-organisers/\">WordCamp Organizers chat</a>, better onboarding with a translated <a href=\"https://make.wordpress.org/community/2017/08/11/global-community-team-welcome-pack/\">welcome pack</a>, and Contribution Drive documentation.</li>\n<li><strong>Struggle</strong>: Fewer contributors than usual.</li>\n<li><strong>Big Win</strong>: <a href=\"https://make.wordpress.org/community/2018/09/21/meetup-application-vetting-sprint-26-27-september/\">Meetup Vetting Sprint</a>! </li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/core/\">Core</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/jeffpaul/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>jeffpaul</a></li>\n<li><strong>Priority</strong>: Continued preparation for the 5.0 release cycle and Gutenberg.</li>\n<li><strong>Struggle</strong>: Identifying tasks for first time contributors, as well as for new-to-JS contributors.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/design/\">Design</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/melchoyce/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>melchoyce</a>, <a href=\'https://profiles.wordpress.org/karmatosed/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>karmatosed</a>, <a href=\'https://profiles.wordpress.org/boemedia/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>boemedia</a>, <a href=\'https://profiles.wordpress.org/joshuawold/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>joshuawold</a>, <a href=\'https://profiles.wordpress.org/mizejewski/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>mizejewski</a></li>\n<li><strong>Priority</strong>: Preparing for WordPress 5.0 and continuing to work on better onboarding practices.</li>\n<li><strong>Struggle</strong>: Identifying tasks for contributor days, especially for small- to medium-sized tasks that can be fit into a single day.</li>\n<li><strong>Big Win</strong>: Regular contributions are starting to build up.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/docs/\">Documentation</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/kenshino/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>kenshino</a></li>\n<li><strong>Priority</strong>: Getting HelpHub out before WordPress 5.0&#8217;s launch to make sure Gutenberg User Docs have a permanent position to reside</li>\n<li><strong>Struggle</strong>: Getting the documentation from HelpHub into WordPress.org/support is more manual than initially anticipated.</li>\n<li><strong>Big Win</strong>: Had a good discussion with the Gutenberg team about their docs and how WordPress.org expects documentation to be distributed (via DevHub, Make and HelpHub). Getting past the code blocks to release HelpHub (soon)</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/hosting/\">Hosting</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/mikeschroder/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>mikeschroder</a>, <a href=\'https://profiles.wordpress.org/jadonn/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>jadonn</a></li>\n<li><strong>Priority</strong>: Helping Gutenberg land well at hosts for users in 5.0.</li>\n<li><strong>Struggle</strong>: Short time frame with few resources to accomplish priority items.</li>\n<li><strong>Big Win</strong>: Preparing Try Gutenberg support guide for hosts during the rollout and good reception from users following it.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/marketing/\">Marketing</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/bridgetwillard/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>bridgetwillard</a></li>\n<li><strong>Priority</strong>: Continuing to write and publish case studies from the community.</li>\n<li><strong>Big Win</strong>: Onboarding guide is going well and is currently being <a href=\"https://translate.wordpress.org/projects/meta/get-involved\">translated</a>.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/meta/\">Meta</a> (WordPress.org Site)</h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/tellyworth/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>tellyworth</a>, <a href=\'https://profiles.wordpress.org/coffee2code/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>coffee2code</a></li>\n<li><strong>Priority</strong>: Support for other teams in the lead up to, and the follow-up of, the release of WP 5.0. ETA is the WP 5.0 release date (Nov 19) and thereafter, unless it gets bumped to next quarter.</li>\n<li><strong>Struggle</strong>: Maintaining momentum on tickets (still).</li>\n<li><strong>Big Win</strong>: Launch of front-end demo of Gutenberg on https://wordpress.org/gutenberg/</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/mobile/\">Mobile</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/elibud/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>elibud</a></li>\n<li><strong>Priority</strong>: Have an alpha version of Gutenberg in the WordPress apps, ETA end of year 2018.</li>\n<li><strong>Struggle</strong>: Unfamiliar tech stack and the goal of reusing as much of Gutenberg-web&#8217;s code as possible.</li>\n<li><strong>Big Win</strong>: Running mobile tests on web&#8217;s PRs.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/plugins/\">Plugins</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/ipstenu/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>ipstenu</a></li>\n<li><strong>Priority</strong>: Cleaning up &#8216;inactive&#8217; users, which was supposed to be complete but some work preparing for 5.0 was necessary.</li>\n<li><strong>Struggles</strong>: Devnotes are lacking for the upcoming release which slows progress.</li>\n<li><strong>Big Win</strong>: No backlog even though a lot were out!</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/polyglots/\">Polyglots</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/petya/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>petya</a>, <a href=\'https://profiles.wordpress.org/ocean90/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>ocean90</a>, <a href=\'https://profiles.wordpress.org/nao/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>nao</a>, <a href=\'https://profiles.wordpress.org/chantalc/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>chantalc</a>, <a href=\'https://profiles.wordpress.org/deconf/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>deconf</a>, <a href=\'https://profiles.wordpress.org/casiepa/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>casiepa</a></li>\n<li><strong>Priority</strong>: Help re-activating inactive locale teams.</li>\n<li><strong>Struggle</strong>: Many GTEs are having a hard time keeping up with incoming translation <a href=\"https://make.wordpress.org/polyglots/?resolved=unresolved&amp;tags=editor-requests\">validation and PTE requests</a>.</li>\n<li><strong>Big Win</strong>: Made some progress in locale research and reassigning new GTEs.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/support/\">Support</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/clorith/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>clorith</a></li>\n<li><strong>Priority:</strong> Preparing for the upcoming 5.0 release</li>\n<li><strong>Struggle</strong>: Finding a good balance between how much we want to help people and how much we are able to help people. Also, contributor recruitment (always a crowd favorite!)</li>\n<li><strong>Big Win</strong>: How well the team, on a global level, has managed to maintain a good flow of user engagement through support.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/themes/\">Theme Review</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/acosmin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>acosmin</a>, <a href=\'https://profiles.wordpress.org/rabmalin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>rabmalin</a>, <a href=\'https://profiles.wordpress.org/thinkupthemes/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>thinkupthemes</a>, <a href=\'https://profiles.wordpress.org/williampatton/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>williampatton</a></li>\n<li><strong>Priority</strong>: Implementing the Theme Sniffer plugin on WordPress.org which is one step forward towards automation. ETA early 2019</li>\n<li><strong>Struggle</strong>: Not having so many contributors/reviewers.</li>\n<li><strong>Big Win</strong>: Implementing <a href=\"https://make.wordpress.org/themes/2018/10/25/new-requirements/\">multiple requirements</a> into our review flow, like screenshots and readme.txt requirements.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/training/\">Training</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\'https://profiles.wordpress.org/bethsoderberg/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>bethsoderberg</a>, <a href=\'https://profiles.wordpress.org/juliek/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>juliek</a></li>\n<li><strong>Priority:</strong> Getting the learn.wordpress.org site designed, developed, and being able to publish lesson plans to it.</li>\n<li><strong>Struggle:</strong> Getting contributors onboard and continually contributing. Part of that is related to the learn.wordpress.org site. People like to see their contributions.</li>\n<li><strong>Big Win</strong>: We have our new workflow and tools in place. We are also streamlining that process to help things go from idea to publication more quickly.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:paragraph --></p>\n<p><em>Interested in updates from the last quarter? You can find those here: <a href=\"https://wordpress.org/news/2018/07/quarterly-updates-q2-2018/\">https://wordpress.org/news/2018/07/quarterly-updates-q2-2018/</a></em></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6206\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"The Month in WordPress: October 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://wordpress.org/news/2018/11/the-month-in-wordpress-october-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Nov 2018 08:40:03 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6230\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:331:\"Teams across the WordPress project are working hard to make sure everything is ready for the upcoming release of WordPress 5.0. Find out what’s going on and how you can get involved. The Plan for WordPress 5.0 Early this month, the planned release schedule was announced for WordPress 5.0, which was updated a few weeks [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Hugh Lashbrooke\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:8116:\"\n<p>Teams across the WordPress project are working hard to make sure everything is ready for the upcoming release of WordPress 5.0. Find out what’s going on and how you can get involved.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>The Plan for WordPress 5.0</h2>\n\n\n\n<p>Early this month, <a href=\"https://make.wordpress.org/core/2018/10/03/proposed-wordpress-5-0-scope-and-schedule/\">the planned release schedule was announced</a> for WordPress 5.0, which was <a href=\"https://make.wordpress.org/core/2018/10/31/wordpress-5-0-schedule-updates/\">updated</a> a few weeks later. WordPress 5.0 is a highly anticipated release, as it’s the official &nbsp;launch of Gutenberg &#8212; the new block editor for WordPress Core. For more detail, check out this <a href=\"https://make.wordpress.org/core/2018/10/12/granular-timeline/\">&nbsp;granular timeline</a>.<br></p>\n\n\n\n<p>Along with the planned release schedule, <a href=\'https://profiles.wordpress.org/matt/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>matt</a>, who is heading up this release, <a href=\"https://make.wordpress.org/core/2018/10/03/a-plan-for-5-0/\">announced leads for critical focuses on the project</a>, including <a href=\'https://profiles.wordpress.org/matveb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>matveb</a>, <a href=\'https://profiles.wordpress.org/karmatosed/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>karmatosed</a>, <a href=\'https://profiles.wordpress.org/laurelfulford/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>laurelfulford</a>, <a href=\'https://profiles.wordpress.org/allancole/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>allancole</a>, <a href=\'https://profiles.wordpress.org/lonelyvegan/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>lonelyvegan</a>, <a href=\'https://profiles.wordpress.org/omarreiss/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>omarreiss</a>, <a href=\'https://profiles.wordpress.org/antpb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>antpb</a>, <a href=\'https://profiles.wordpress.org/pento/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>pento</a>, <a href=\'https://profiles.wordpress.org/chanthaboune/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>chanthaboune</a>, <a href=\'https://profiles.wordpress.org/danielbachhuber/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>danielbachhuber</a>, and <a href=\'https://profiles.wordpress.org/mcsf/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>mcsf</a>.<br></p>\n\n\n\n<p><a href=\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-2/\">WordPress 5.0 is currently in its second beta phase</a> and will soon move to the release candidate status. Help test this release right now by installing the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester plugin</a> on your site.<br></p>\n\n\n\n<p>Want to get involved in building WordPress Core? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a> and join the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>. You can also help out by <a href=\"https://make.wordpress.org/test/\">testing</a> or <a href=\"https://make.wordpress.org/polyglots/2018/10/24/wordpress-5-0-gutenberg-and-twenty-nineteen/\">translating</a> the release into a local language.</p>\n\n\n\n<h2>New Editor for WordPress Core</h2>\n\n\n\n<p>Active development continues on <a href=\"https://wordpress.org/gutenberg\">Gutenberg</a>, the new editing experience for WordPress Core. <a href=\"https://make.wordpress.org/core/2018/10/31/whats-new-in-gutenberg-31st-october-2/\">The latest release</a> is feature complete, meaning that all further development on it will be to improve existing features and fix outstanding bugs.<br></p>\n\n\n\n<p>Some have raised concerns about Gutenberg’s accessibility, prompting the development team <a href=\"https://make.wordpress.org/core/2018/10/18/regarding-accessibility-in-gutenberg/\">to detail some areas</a> in which the new editor is accessible. To help improve things further, the team has made <a href=\"https://make.wordpress.org/core/2018/10/19/call-for-testers-community-gutenberg-accessibility-tests/\">a public call for accessibility testers</a> to assist.<br></p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/tag/gutenberg\">the Gutenberg tag</a> on the Core team blog and join the #core-editor channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>. Read <a href=\"https://make.wordpress.org/test/2018/10/19/gutenberg-needs-testing-areas/\">this guide</a> to find areas where you can have the most impact.</p>\n\n\n\n<h2>Migrating HelpHub to WordPress.org</h2>\n\n\n\n<p>HelpHub is an ongoing project to move all of WordPress’ user documentation from the <a href=\"https://codex.wordpress.org/\">Codex</a> to the <a href=\"https://wordpress.org/support/\">WordPress Support portal</a>.<br></p>\n\n\n\n<p>HelpHub has been developed on <a href=\"https://wp-helphub.com/\">a separate staging server</a> and it’s now time to migrate the new documentation to its home on WordPress.org. The plan is to have everything moved over &nbsp;before WordPress 5.0 is released, so that all the new documentation will be available on the new platform from the start.<br></p>\n\n\n\n<p>The HelpHub team has published <a href=\"https://make.wordpress.org/docs/2018/11/01/call-for-volunteers-helphub-migration/\">a call for volunteers</a> to help with the migration. If you would like to get involved, join the #docs channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>, and contact <a href=\'https://profiles.wordpress.org/atachibana/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>atachibana</a> to get started.</p>\n\n\n\n<h2>A New Default Theme for WordPress</h2>\n\n\n\n<p><a href=\"https://make.wordpress.org/core/2018/10/16/introducing-twenty-nineteen/\">A brand new default theme &#8212; Twenty Nineteen &#8212; has been announced</a>&nbsp;with development being led by <a href=\'https://profiles.wordpress.org/allancole/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>allancole</a>. The theme is packaged with WordPress 5.0, so it will be following the same release schedule as Core.<br></p>\n\n\n\n<p>The new theme is designed to integrate seamlessly with Gutenberg and showcase how you can build a theme alongside the new block editor and take advantage of the creative freedom that it offers.<br></p>\n\n\n\n<p>Want to help build Twenty Nineteen? Join in on <a href=\"https://github.com/WordPress/twentynineteen\">the theme’s GitHub repo</a> and join the #core-themes channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.<br></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>The Support team are putting together more formal <a href=\"https://github.com/Clorith/wporg-support-guidelines\">Support Guidelines</a> for the WordPress Support Forums.</li><li>The group focused on privacy tools in Core <a href=\"https://make.wordpress.org/core/2018/10/11/whats-new-in-core-privacy/\">has released some details</a> on the work they have been doing recently, with a roadmap for their plans over the next few months.</li><li>The Core team <a href=\"https://make.wordpress.org/core/2018/10/15/wordpress-and-php-7-3/\">released an update</a> about how WordPress will be compatible with PHP 7.3.</li><li>The Theme Review Team have published <a href=\"https://make.wordpress.org/themes/2018/10/25/new-requirements/\">some new requirements</a> regarding child themes, readme files and trusted authors in the Theme Directory.</li><li>The WordCamp Europe team <a href=\"https://make.wordpress.org/community/2018/10/23/progressive-web-app-for-wordcamps/\">are working on a PWA service</a> for all WordCamp websites.</li></ul>\n\n\n\n<p><em>If you have a story we should consider including in the next “Month in WordPress” post, please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em><br></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6230\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.0 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 30 Oct 2018 05:04:12 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6222\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:359:\"WordPress 5.0 Beta 2 is now available! This software is still in development,&#160;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version. There are two ways to test the WordPress 5.0 Beta: try the&#160;WordPress Beta Tester&#160;plugin (you’ll want “bleeding edge nightlies”), or [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Gary Pendergast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2228:\"\n<p>WordPress 5.0 Beta 2 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test the WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta2.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p>WordPress 5.0 is slated for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 19</a>, and we need your help to get there. Here are some of the big issues that we fixed since Beta 1:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>We&#8217;ve updated to the latest version of the block editor from the Gutenberg plugin, which includes the new <a href=\"https://github.com/WordPress/gutenberg/pull/10209\">Format API</a>, embedding improvements, and <a href=\"https://github.com/WordPress/gutenberg/milestone/71\">a variety of bug fixes</a>.</p>\n\n\n\n<p>Meta boxes had a few bugs, and they weren&#8217;t showing at all in the block editor, so we&#8217;ve fixed and polished there.</p>\n\n\n\n<h2>Internationalisation</h2>\n\n\n\n<p>We&#8217;ve added support for <a href=\"https://core.trac.wordpress.org/ticket/45103\">registering and loading JavaScript translation files</a>.</p>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>The <a href=\"https://github.com/WordPress/twentynineteen\">Twenty Nineteen repository</a> is a hive of activity, there have been a stack of minor bugs clean up, and some notable additions:</p>\n\n\n\n<ul><li>There&#8217;s now a widget area in the page footer.</li><li>Navigation submenus have been implemented for mobile devices.</li><li>Customiser options have been added for changing the theme colours and feature image filters.</li></ul>\n\n\n\n<h2>Everything Else</h2>\n\n\n\n<p>The REST API has a couple of bug fixes and performance improvements. PHP 7.3 compatibility has been improved.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p><em>We&#8217;re fixing the bugs:<br>All the ones you&#8217;ve reported.<br>Some that we&#8217;ve found, too.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6222\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:39:\"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.0 Beta 1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 24 Oct 2018 21:59:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6209\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:312:\"WordPress 5.0 Beta 1 is now available! This software is still in development,&#160;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version, and if you are using an existing test site be sure to update the Gutenberg plugin to v4.1. There are [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Gary Pendergast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3734:\"\n<p>WordPress 5.0 Beta 1 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version, and if you are using an existing test site be sure to update the Gutenberg plugin to v4.1. </p>\n\n\n\n<p>There are two ways to test the WordPress 5.0 beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta1.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p>WordPress 5.0 is slated for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 19</a>, and we need your help to get there. Here are some of the big items to test so we can find as many bugs as possible in the coming weeks.</p>\n\n\n\n<h2>The Block Editor</h2>\n\n\n\n<p>The new Gutenberg block editor is now the default post editor!</p>\n\n\n\n<p>The block editor provides a modern, media-rich editing experience. You can create flexible, beautiful content without writing a single line of code, or you can dive into the <a href=\"https://wordpress.org/gutenberg/handbook/\">modern programming APIs</a> that the block editor provides.</p>\n\n\n\n<p>Even before you install WordPress 5.0, you can <a href=\"https://wordpress.org/gutenberg/\">try the block editor here</a>.</p>\n\n\n\n<p>Of course, we recognise you might not be ready for this change quite yet. If that&#8217;s the case, you can install the <a href=\"https://wordpress.org/plugins/classic-editor/\">Classic Editor plugin</a> now, which will keep the editor you&#8217;re familiar with as the default, even after you upgrade to WordPress 5.0.</p>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Along with the new block editor, we have a new default theme, called Twenty Nineteen, which takes advantage of the new features the block editor provides.</p>\n\n\n\n<p>You can read more about Twenty Nineteen in its <a href=\"https://make.wordpress.org/core/2018/10/16/introducing-twenty-nineteen/\">introduction post</a>, and follow along with development over on the <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>.</p>\n\n\n\n<h2>Default Themes</h2>\n\n\n\n<p>Of course, we couldn&#8217;t release a beautiful new default theme, and leave all of our old ones behind. All the way back to Twenty Ten, we&#8217;ve updated every default them to look good in the new block editor.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English? <a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a> <strong>A known issue</strong>: the block autocompleter fails for blocks whose names contain  characters in non-Latin scripts. Adding blocks via the plus sign works, and this bug is fixed in the Gutenberg 4.1 plugin. <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f642.png\" alt=\"🙂\" class=\"wp-smiley\" style=\"height: 1em; max-height: 1em;\" /></p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p><em>Minor bug fixes<br>Add up one by one by one<br>Then you change the world</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6209\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:38:\"The Month in WordPress: September 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"https://wordpress.org/news/2018/10/the-month-in-wordpress-september-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 01 Oct 2018 12:01:41 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6203\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:347:\"The new WordPress editor continues to be a major focus for all WordPress contribution teams. Read on to find out some more about their work, as well as everything else that has been happening around the community this past month. Further Enhancements to the New WordPress Editor Active development continues on Gutenberg, the new editing [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Hugh Lashbrooke\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4632:\"\n<p>The new WordPress editor continues to be a major focus for all WordPress contribution teams. Read on to find out some more about their work, as well as everything else that has been happening around the community this past month.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Enhancements to the New WordPress Editor</h2>\n\n\n\n<p>Active development continues on <a href=\"https://wordpress.org/gutenberg/\">Gutenberg</a>, the new editing experience for WordPress Core. <a href=\"https://make.wordpress.org/core/2018/09/21/whats-new-in-gutenberg/\">The latest update for the editor</a> includes great new features, such as reusable content blocks, a dark editor style, export and import of templates, and much more. In addition, the Gutenberg team has published <a href=\"https://make.wordpress.org/core/2018/09/26/an-update-on-gutenberg-tasks/\">a comprehensive guide</a> to the features currently included in the editor.<br /></p>\n\n\n\n<p>Users can test Gutenberg right now by installing <a href=\"https://wordpress.org/plugins/gutenberg/\">the plugin</a>, which currently has over 450,000 active installs according to the new <a href=\"https://gutenstats.blog/\">Gutenberg in Numbers</a> site. Along with that, <a href=\"https://wordpress.org/gutenberg/handbook/reference/faq/\">the Gutenberg Handbook</a> has some very useful information about how to use and develop for the new editor.<br /></p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/tag/gutenberg/\">the #gutenberg tag on the Core team blog</a> and join the #core-editor channel in the <a href=\"https://make.wordpress.org/chat/\">Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Work Begins on WordPress 5.0</h2>\n\n\n\n<p>After initially announcing a minor v4.9.9 release, <a href=\"https://make.wordpress.org/core/2018/09/28/dev-chat-summary-september-26th-4-9-9-week-7/\">the Core team has shifted their focus to the next major release</a> — v5.0. One of the primary factors for this change is that Gutenberg is nearly ready to be considered for merging into Core, with the goal to complete the merge in v5.0.<br /></p>\n\n\n\n<p>To maintain flexibility in the development process the final timelines are not yet determined, allowing work already done for v4.9.9 to be moved to v5.0 if needed. Ensuring that WordPress is compatible with the upcoming PHP 7.3 release is a high priority for the Core team. Once a final decision is made, the details will be announced on <a href=\"https://make.wordpress.org/core/\">the Core team blog</a>.<br /></p>\n\n\n\n<p>Want to get involved in building WordPress Core? Follow the Core team blog and join the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.<br /></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>The Community Team has some great updates on <a href=\"https://make.wordpress.org/community/2018/09/25/wordcamp-incubator-2018-update-thread-september-edition/\">the progress of the current WordCamp Incubator Program</a>.</li><li>A team inside the Drupal community <a href=\"https://drupalgutenberg.org/\">is working on integrating Gutenberg into their CMS</a>.</li><li>There is a current discussion among community organizers about <a href=\"https://make.wordpress.org/community/2018/09/17/proposal-to-increase-the-maximum-ticket-price-for-wordcamps/\">plans to increase the maximum ticket price for WordCamps</a>.</li><li>The Mobile Team <a href=\"https://make.wordpress.org/updates/2018/09/25/mobile-team-update-september-25th/\">is looking for people</a> to grow the beta program for testing the iOS and Android mobile apps.</li><li>The Diversity Outreach Speaker Training group <a href=\"https://make.wordpress.org/community/2018/09/13/input-requested-building-a-diverse-speaker-roster-document/\">is looking for feedback</a> on their document to assist WordPress Meetups and WordCamps in building diverse speaker rosters.</li><li>The Theme Team <a href=\"https://make.wordpress.org/themes/2018/09/26/new-requirement-regarding-affiliate-links/\">has updated their rules</a> regarding sponsored and affiliate links inside themes added to the Theme Directory.</li><li>Meetup organizers <a href=\"https://make.wordpress.org/community/2018/09/25/meetup-organiser-badge-assignments/\">are now able to receive a WordPress.org profile badge</a> for their community work.</li></ul>\n\n\n\n<p><em>If you have a story we should consider including in the next “Month in WordPress” post, please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em><br /></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6203\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:33:\"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"The Month in WordPress: August 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://wordpress.org/news/2018/09/the-month-in-wordpress-august-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 03 Sep 2018 11:00:43 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6191\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:355:\"Many of the WordPress contribution teams have been working hard on the new WordPress editor, and the tools, services, and documentation surrounding it. Read on to find out more about this ongoing project, as well as everything else that has been happening around the WordPress community in August. WordPress 4.9.8 is Released WordPress 4.9.8 was [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Hugh Lashbrooke\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:5589:\"\n<p>Many of the WordPress contribution teams have been working hard on the new WordPress editor, and the tools, services, and documentation surrounding it. Read on to find out more about this ongoing project, as well as everything else that has been happening around the WordPress community in August.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>WordPress 4.9.8 is Released</h2>\n\n\n\n<p><a href=\"https://wordpress.org/news/2018/08/wordpress-4-9-8-maintenance-release/\">WordPress 4.9.8 was released</a> at the beginning of the month. While this was a maintenance release fixing 46 bugs, it was significant for Core development because it made a point of highlighting Gutenberg — the new WordPress editor that is currently in development (more on that below).<br /></p>\n\n\n\n<p>This release also included some important updates to the privacy tools that were added to Core earlier this year.<br /></p>\n\n\n\n<p>Want to get involved in building WordPress Core? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a> and join the #core channel in the <a href=\"https://make.wordpress.org/chat/\">Making WordPress Slack group</a>.</p>\n\n\n\n<h2>New WordPress Editor Development Continues</h2>\n\n\n\n<p>Active development continues on <a href=\"https://wordpress.org/gutenberg/\">Gutenberg</a>, the new editing experience for WordPress Core. <a href=\"https://make.wordpress.org/core/2018/08/31/whats-new-in-gutenberg-31st-august/\">The latest version</a> features a number of important user experience improvements, including a new unified toolbar and support for a more focussed writing mode.<br /></p>\n\n\n\n<p>Users can test Gutenberg right now by installing <a href=\"https://wordpress.org/plugins/gutenberg/\">the plugin</a>, which currently has nearly 300,000 active installs. Along with that, <a href=\"https://wordpress.org/gutenberg/handbook/reference/faq/\">the Gutenberg Handbook</a> has some very useful information about how to use and develop for the new editor.<br /></p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/tag/gutenberg/\">the #gutenberg tag on the Core team blog</a> and join the #core-editor channel in the <a href=\"https://make.wordpress.org/chat/\">Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Planning Begins for the Next Global WordPress Translation Day</h2>\n\n\n\n<p>The Global WordPress Translation Day is a 24-hour event held online and all across the world. It is designed to bring communities together to translate WordPress into their local languages, and to help them connect with other communities doing the same thing.<br /></p>\n\n\n\n<p>There have been three Translation Days since April 2016, and <a href=\"https://make.wordpress.org/polyglots/2018/08/29/global-wordpress-translation-day-4-preliminary-planning/\">the fourth edition is in the planning stages now</a>. The Polyglots team, who organizes these events, is currently looking for input on the date, format, and content for the event and would love some feedback from the community.<br /></p>\n\n\n\n<p>Want to get involved in translating WordPress into your own language? Follow <a href=\"https://make.wordpress.org/polyglots/\">the Polyglots team blog</a> and join the #polyglots channel in the <a href=\"https://make.wordpress.org/chat/\">Making WordPress Slack group</a>.<br /></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li><a href=\"https://wordpress.org/support/upgrade-php/\">The Update PHP page on WordPress.org</a> has been revised and improved to make the reasons for upgrading more clear.</li><li>The Mobile team is looking for people to help test the latest versions of the <a href=\"https://make.wordpress.org/mobile/2018/08/29/call-for-testing-wordpress-for-android-10-8/\">Android</a> and <a href=\"https://make.wordpress.org/mobile/2018/08/28/call-for-testing-wordpress-for-ios-10-8/\">iOS</a> apps for WordPress.</li><li><a href=\"https://wordbits.io/\">WordBits</a> is a innovative new platform for publishing WordPress-based code snippets with the ability to download each snippet as a working plugin.</li><li>The Community Team <a href=\"https://make.wordpress.org/community/2018/08/27/wordcamp-incubator-2018-update-thread-august-edition/\">has some updates</a> about how things are going with this year’s WordCamp Incubator program.</li><li>The WordPress Support Forums <a href=\"https://make.wordpress.org/support/2018/08/august-16th-support-team-meeting-summary/\">now include a feature</a> allowing forum volunteers to easily report a post to the moderators for a follow-up.</li><li>WordCamp Kochi, India <a href=\"https://2018.kochi.wordcamp.org/wordcamp-kochi-2018-is-postponed-to-november-3rd-2018-saturday/\">has unfortunately had to postpone their event</a> due to floods in the region.</li><li><a href=\"http://www.wpglossary.net/\">WP Glossary</a> is a new site that offers helpful definitions of words that you could encounter when using WordPress.</li><li>A few WordPress community members <a href=\"https://make.wordpress.org/community/2018/08/13/in-the-words-of-the/\">have started a working group</a> to tackle the idea of building diverse WordPress  communities all across the world.</li><li>A new <a href=\"https://editorblockswp.com/library/\">Gutenberg Block Library</a> is available, listing the details of the many blocks available for the new editor.</li></ul>\n\n\n\n<p><em>If you have a story we should consider including in the next “Month in WordPress” post, please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"6191\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:32:\"https://wordpress.org/news/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"hourly\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:4:\"site\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"14607090\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:9:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Fri, 30 Nov 2018 09:07:35 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:25:\"strict-transport-security\";s:11:\"max-age=360\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Fri, 23 Nov 2018 09:47:28 GMT\";s:4:\"link\";s:63:\"<https://wordpress.org/news/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";}}s:5:\"build\";s:14:\"20130910210210\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(962, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1543612055', 'no'),
(963, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1543568855', 'no'),
(964, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1543612057', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(965, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:61:\"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"WordPress Planet\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:28:\"http://planet.wordpress.org/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"en\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"WordPress Planet - http://planet.wordpress.org/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:50:{i:0;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:90:\"WPTavern: Gutenberg Times to Host Live Q&amp;A with Gutenberg Leads on Friday, November 30\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85908\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:95:\"https://wptavern.com/gutenberg-times-to-host-live-qa-with-gutenberg-leads-on-friday-november-30\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1224:\"<p><a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2018/11/creating-gutenberg-q-and-a.jpg?ssl=1\"><img /></a></p>\n<p>Birgit Pauli-Haack, curator of the <a href=\"https://gutenbergtimes.com/\" rel=\"noopener\" target=\"_blank\">Gutenberg Times</a> website, is hosting a Q&#038;A session with Gutenberg&#8217;s phase 1 design and development leads on Friday, November 30, at 2pm ET (19:00 UTC). Matias Ventura, Tammie Lister, and Joen Asmussen will join Pauli-Haack to discuss their journey &#8220;Creating Gutenberg&#8221; over the past two years.</p>\n<p>If you have any pressing questions about Gutenberg&#8217;s architecture, design, or the future of the project, this event is a good opportunity to speak to members of the team who have been building it full-time. The Q&#038;A is free to watch but attendees who want to participate with questions will need to <a href=\"https://zoom.us/webinar/register/6915430666443/WN_d_ejr1e0T0Se1YpyoU0Ojg\" rel=\"noopener\" target=\"_blank\">register</a>. There are 100 seats available. Pauli-Haack will also be live-streaming the session to the <a href=\"https://www.youtube.com/channel/UCSD3LG2kSHdr7llRSHaylxw\" rel=\"noopener\" target=\"_blank\">Gutenberg Times YouTube channel</a>. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 30 Nov 2018 00:48:18 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"Matt: WordPress 5.0: A Gutenberg FAQ\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:22:\"https://ma.tt/?p=48628\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:38:\"https://ma.tt/2018/11/a-gutenberg-faq/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:17970:\"<p>We are nearing the release date for WordPress 5.0 and Gutenberg, one of the most important and exciting projects I’ve worked on in my <a href=\"https://ma.tt/2018/05/wordpress-at-15/\">15 years</a> with this community. <br /></p>\n\n\n\n<p>I knew we would be taking a big leap. But it’s a leap we need to take, and I think the end result is going to open up many new opportunities for everyone in the ecosystem, and for those being introduced to WordPress for the first time. It brings us closer to our mission of democratizing publishing for everyone.<br /></p>\n\n\n\n<p>I recently visited WordCamp Portland to talk about Gutenberg and WordPress 5.0, which will also include the new default theme <a href=\"https://make.wordpress.org/core/2018/10/16/introducing-twenty-nineteen/\">Twenty Nineteen</a>, which you’re seeing me test out on this very site. There were some great questions and testimonials about Gutenberg, so I’d urge you to watch the <a href=\"https://wordpress.tv/2018/11/08/matt-mullenweg-qa-at-wordcamp-portland-2018/\">full video</a> and <a href=\"https://wptavern.com/matt-mullenweg-addresses-controversies-surrounding-gutenberg-at-wordcamp-portland-qa\">read the WP Tavern recap</a>. I&#8217;ve also visited meetups, responded to review threads, kept an eye on support, and I&#8217;m in the middle of <a href=\"https://make.wordpress.org/core/2018/11/29/gutenberg-5-0-listening-office-hours/\">office hours with the core community</a>.<br /></p>\n\n\n\n<p>As we head toward the release date and <a href=\"https://2018.us.wordcamp.org/\">WordCamp US</a>, I&#8217;ve put many questions and answers into a Gutenberg FAQ below. For those who have other questions, I will be checking the comments here. <br /></p>\n\n\n\n<p>It’s an exciting time, and I’m thrilled to be working with y’all on this project. </p>\n\n\n\n<img />Not the ship of Theseus\n\n\n\n<h2>What is Gutenberg? </h2>\n\n\n\n<p>Gutenberg, for those who aren&#8217;t actively following along, is a brand new Editor for WordPress &#8212; contributors have been working on it since January 2017 and it&#8217;s one of the most significant changes to WordPress in years. It&#8217;s built on the idea of using &#8220;blocks&#8221; to write and design posts and pages. <br /></p>\n\n\n\n<p>This will serve as the foundation for future improvements to WordPress, including blocks as a way not just to design posts and pages, but also entire sites. <br /></p>\n\n\n\n<p>The overall goal is to simplify the first-time user experience of WordPress &#8212; for those who are writing, editing, publishing, and designing web pages. The editing experience is intended to give users a better visual representation of what their post or page will look like when they hit publish. As I wrote in <a href=\"https://ma.tt/2017/08/we-called-it-gutenberg-for-a-reason/\">my post last year</a>, &#8220;Users will finally be able to build the sites they see in their imaginations.&#8221; <br /></p>\n\n\n\n<p>Matías Ventura, team lead for Gutenberg, <a href=\"https://matiasventura.com/post/gutenberg-or-the-ship-of-theseus/\">wrote an excellent post</a> about the vision for Gutenberg, saying, “It’s an attempt to improve how users interact with their content in a fundamentally visual way, while at the same time giving developers the tools to create more fulfilling experiences for the people they are helping.”</p>\n\n\n\n<h2>Why do we need Gutenberg at all? </h2>\n\n\n\n<p>For many of us already in the WordPress community, it can be easy to forget the learning curve that exists for people being introduced to WordPress for the first time. Customizing themes, adding shortcodes, editing widgets and menus &#8212; there’s an entire language that one must learn behind the scenes in order to make a site or a post look like you want it to look. <br /></p>\n\n\n\n<p>Over the past several years, JavaScript-based applications have created opportunities to simplify the user experience in consumer apps and software. Users’ expectations have changed, and the bar has been raised for simplicity. It is my deep belief that WordPress must evolve to improve and simplify its own user experience for first-time users. <br /></p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">What can you do in 137 lines in <a href=\"https://twitter.com/hashtag/Gutenberg?src=hash&ref_src=twsrc%5Etfw\">#Gutenberg</a>? <a href=\"https://t.co/zLINZGMXMe\">pic.twitter.com/zLINZGMXMe</a></p>&mdash; Dennis Snell (@dmsnell23) <a href=\"https://twitter.com/dmsnell23/status/1063126946350096389?ref_src=twsrc%5Etfw\">November 15, 2018</a></blockquote>\n</div>\n\n\n\n<h2>Why blocks? </h2>\n\n\n\n<p>The idea with blocks was to create a new common language across WordPress, a new way to connect users to plugins, and replace a number of older content types &#8212; things like shortcodes and widgets &#8212; that one had to be well-versed in the idiosyncrasies of WordPress to understand. <br /></p>\n\n\n\n<p>The block paradigm is not a new one &#8212; in fact many great plugins have already shown the promise of blocks with page design in WordPress. Elementor, one of the pioneers in this space, has now introduced <a href=\"https://elementor.com/blog/blocks-for-gutenberg/\">a new collection of Gutenberg blocks</a> to showcase what’s possible: <br /></p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n\n</div>\n\n\n\n<h2>Why change the Editor? </h2>\n\n\n\n<p>The Editor is where most of the action happens in WordPress’s daily use, and it was a place where we could polish and perfect the block experience in a contained environment. <br /></p>\n\n\n\n<p>Additionally, the classic Editor was built primarily for text &#8212; articles have become increasingly multimedia, with social media embeds, maps, contact forms, photo collages, videos, and GIFs. It was time for a design paradigm that allowed us to move past the messy patchwork of shortcodes and text. <br /></p>\n\n\n\n<p>The Editor is just the start. In upcoming phases blocks will become a fundamental part of entire site templates and designs. It’s currently a struggle to use the Customizer and figure out how to edit sections like menus, headers, and footers. With blocks, people will be able to edit and manipulate everything on their site without having to understand where WordPress hides everything behind the scenes. <br /></p>\n\n\n\n<h2>What does Automattic get out of this? </h2>\n\n\n\n<p>There have been posts recently asking questions about Automattic’s involvement in Gutenberg compared to other contributors and companies. There is no secret conspiracy here &#8212; as project lead I was able to enlist the help of dozens of my colleagues to contribute to this project, and I knew that a project of this size would require it. Automattic aims to have 5% of its people dedicated to WordPress community projects, which at its current size would be about 42 people full-time. The company is a bit behind that now (~35 full-time), and the company is growing a lot next year, so look for 10-15 additional people working on core and community projects.&nbsp;<br /></p>\n\n\n\n<p>In the end, Gutenberg is similar to many other open source projects &#8212; Automattic will benefit from it, but so will everyone else in the WordPress community (and even <a href=\"https://drupalgutenberg.org/\">the Drupal community</a>). It’s available for everyone under the GPL. If the goal was purely to benefit Automattic it would have been faster, easier, and created an advantage for Automattic to have Gutenberg just on WP.com. That wasn&#8217;t, and isn&#8217;t, the point.</p>\n\n\n\n<h2>Is Gutenberg ready? </h2>\n\n\n\n<p>Absolutely. Our original goal with Gutenberg was to get it on 100,000 sites to begin testing &#8212; it’s now already on <a href=\"https://gutenstats.blog/\">more than 1 million sites</a>, and it’s the fastest-growing plugin in WordPress history. There is a lot of user demand.<br /></p>\n\n\n\n<p>The goal was to both test Gutenberg on as many sites as possible before the 5.0 release, and also to encourage plugin developers to make sure their plugins and services will be ready. With everyone pitching in, we can make this the most <em>anti-climactic</em> release in WordPress history. &nbsp;<br /></p>\n\n\n\n<p>In the recent debate over Gutenberg readiness, I think it&#8217;s important to understand the difference between Gutenberg being ready code-wise (it is now), and whether the entire community is ready for Gutenberg.<br /></p>\n\n\n\n<p>It will take some time &#8212; we&#8217;ve had 15 years to polish and perfect core, after all &#8212; but the global WordPress community has some of the world&#8217;s most talented contributors and we can make it as good as we want to make it. <br /></p>\n\n\n\n<p>There is also a new opportunity to dramatically expand the WordPress contributor community to include more designers and JavaScript engineers. With JavaScript apps there are also new opportunities for designing documentation and support right on the page, so that help arrives right where you need it. <br /></p>\n\n\n\n<p>Someone described Gutenberg to me as “WordPress in 3D.” I like the sound of that. Blocks are like layers you can zoom in and out of. The question now is: What are we going to build with this new dimension? </p>\n\n\n\n<h2>Do I have to switch to Gutenberg when WordPress 5.0 is released? </h2>\n\n\n\n<p>Not at all. When it’s released, you get to choose what happens. You can install the <a href=\"https://wordpress.org/plugins/classic-editor/\">Classic Editor plugin</a> today and when 5.0 is released, nothing will change. We&#8217;ve commited to supporting and updating Classic Editor until 2022. If you’d like to <a href=\"https://wordpress.org/plugins/gutenberg/\">install Gutenberg early</a>, you can do that now too. The Classic Editor plugin has been available for 13 months now, and Gutenberg has been available for 18 months. Both have been heavily promoted since August 2018, and more than 1.3 million .org sites have opted-in already to either experience, so nothing will change for them when they update to 5.0.</p>\n\n\n\n<h2>How can I make sure I’m ready? </h2>\n\n\n\n<p>Before updating to 5.0, try out the <a href=\"https://wordpress.org/plugins/gutenberg/\">Gutenberg plugin</a> with your site to ensure it works with your existing plugins, and also to get comfortable with the new experience. Developers across the entire ecosystem are working hard to update their plugins, but your mileage and plugins may vary. And you can always use the Classic Editor to address any gaps.<br /></p>\n\n\n\n<p>As with every new thing, things might feel strange and new for a bit, but I’m confident once you start using it you’ll get comfy quickly and you won’t want to go back.</p>\n\n\n\n<p>The release candidate of 5.0 is stable and fine to develop against and test.</p>\n\n\n\n<h2>When will 5.0 be released?</h2>\n\n\n\n<p>We have had a stable RC1, which stands for first release candidate, and about to do our second one. There is only currently one known blocker and it&#8217;s cosmetic. The stability and open issues in the release candidates thus far makes me optimistic we can release soon, but as before the primary driver will be the stability and quality of the underlying software. We made the mistake prior of announcing dates when lots of code was still changing, and had to delay because of regressions and bugs. Now that things aren&#8217;t changing, we&#8217;re approaching a time we can commit to a date soon.</p>\n\n\n\n<h2>Is it terrible to do a release in December?</h2>\n\n\n\n<p>Some people think so, some don&#8217;t. There have been <a href=\"https://wordpress.org/about/roadmap/\">9 major WordPress releases</a> in previous Decembers. December releases actually comprise 34% of our major releases in the past decade.</p>\n\n\n\n<h2>Can I set it up so only certain users get to use Gutenberg? </h2>\n\n\n\n<p>Yes, and soon. We’re going to be doing another update to the Classic Editor before the 5.0 release to give it a bit more fine-grained user control &#8212; we’ve heard requests for options that allow certain users or certain roles and post types to have Gutenberg while others have Classic Editor. </p>\n\n\n\n<h2>What happens after 5.0? </h2>\n\n\n\n<p>We’ve been doing a release of Gutenberg every two weeks, and 5.0 isn’t going to stop that. We’ll do minor release to 5.0 (5.0.1, 5.0.2) fortnightly, with occasional breaks, so if there’s feedback that comes in, we can address it quickly. Many of the previous bugs in updates were from juggling between updates in the plugin and core, now that Gutenberg is in core it&#8217;s much easier and safer to incrementally update.</p>\n\n\n\n<h2>What about Gutenberg and accessibility? </h2>\n\n\n\n<p>We’ve had some important discussions about accessibility over the past few weeks and I am grateful for those who have helped raise these questions in the community. <br /></p>\n\n\n\n<p>Accessibility has been core to WordPress from the very beginning. It’s part of why we started – the adoption of web standards and accessibility.<br /></p>\n\n\n\n<p>But where I think we fell down was with project management &#8212; specifically, we had a team of volunteers that felt like they were disconnected from the rapid development that was happening with Gutenberg. We need to improve that. In the future I don’t know if it makes sense to have accessibility as a separate kind of process from the core development. It needs to be integrated at every single stage. <br /></p>\n\n\n\n<p>Still, we’ve accomplished a lot, as Matías <a href=\"https://make.wordpress.org/core/2018/10/18/regarding-accessibility-in-gutenberg/\">has written about</a>. There have been more than 200 closed issues related to accessibility since the very beginning. <br /></p>\n\n\n\n<p>We’re also taking the opportunity to fix some things that have had poor accessibility in WordPress from the beginning. <a href=\"https://codemirror.net/6/\">CodeMirror</a>, which is a code editor for templates, is not accessible, so we have some parts of WordPress that we really need to work on to make better. <br /></p>\n\n\n\n<p>Speaking of which, CodeMirror was seeking funding for their next version &#8212; Automattic has now <a href=\"https://codemirror.net/6/\">sponsored that funding</a> and in return it will be made available under the GPL, and that the next version of CodeMirror will be fully accessible. <br /></p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">Great news ? Due to a substantial donation from <a href=\"https://twitter.com/automattic?ref_src=twsrc%5Etfw\">@automattic</a> our crowdfunding goal has been reached, and CodeMirror 6 is definitely happening!</p>&mdash; CodeMirror (@codemirror) <a href=\"https://twitter.com/codemirror/status/1054759532990218242?ref_src=twsrc%5Etfw\">October 23, 2018</a></blockquote>\n</div>\n\n\n\n<p>Finally, Automattic will be funding an accessibility study of WordPress, Gutenberg, and an evaluation of best practices across the web, to ensure WordPress is fully accessible and setting new standards for the web overall. </p>\n\n\n\n<h2>After WordPress 5.0, is the Gutenberg name going to stick around?</h2>\n\n\n\n<p>Sometimes code names can take on a life of their own. I think Gutenberg is still what we’ll call this project &#8212; it’s <a href=\"https://github.com/WordPress/gutenberg\">called that on GitHub</a>, and you’re also seeing it <a href=\"https://drupalgutenberg.org/\">adopted by other CMSes beyond WordPress</a> &#8212; but for those outside the community I can see it simply being known as “the new WordPress editor.” </p>\n\n\n\n<h2>With the adoption of React for Gutenberg, what do you see as the future for React and WordPress? </h2>\n\n\n\n<p>In 2015 I said <a href=\"https://wordpress.tv/2015/12/07/matt-mullenweg-state-of-the-word-2015/\">“Learn JavaScript deeply”</a> &#8212; then in 2016 we brought the <a href=\"https://developer.wordpress.org/rest-api/\">REST API</a> into Core. Gutenberg is the first major feature built entirely on the REST API, so if you are learning things today, learn JavaScript, and I can imagine a future wp-admin that’s 100% JavaScript talking to APIs. I’m excited to see that happen. <br /></p>\n\n\n\n<p>Now, switching to a pure JavaScript interface could break some backward compatibility, but a nice thing about Gutenberg is that it provides an avenue for all plugins to work through &#8212; it gives them a way to plug in to that. It can eliminate the need for what’s currently done in custom admin screens. &nbsp;<br /></p>\n\n\n\n<p>The other beautiful thing is that because Gutenberg essentially allows for translation into many different formats &#8212; it can publish to your web page, it can publish your RSS feed, AMP, it can publish blocks that can be translated into email for newsletters &#8212; there’s so much in the structured nature of Gutenberg and the semantic HTML that it creates and the grammar that’s used to parse it, can enable for other applications. <br /></p>\n\n\n\n<p>It becomes a little bit like a <em>lingua franca</em> that even crosses CMSes. There’s now these new cross-CMS Gutenberg blocks that will be possible. It’s not just WordPress anymore &#8212; it might be a JavaScript block that was written for Drupal that you install on your WordPress site. How would that have ever happened before? That’s why we took two years off &#8212; it’s why we’ve had everyone in the world working on this thing. It’s because we want it to be #WorthIt. <br /></p>\n\n\n\n<p>And WordPress 5.0 is just the starting line. We want to get it to that place where it’s not just better than what we have today, but a world-class, web-defining experience. It’s what we want to create and what everyone deserves. </p>\n\n\n\n<h2>Was this post published with Gutenberg?</h2>\n\n\n\n<p>Of course. <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f604.png\" alt=\"😄\" class=\"wp-smiley\" /> No bugs, but I do see lots of areas we can continue to improve and I&#8217;m excited to get to work on future iterations.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 29 Nov 2018 23:56:51 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"Matt\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"WPTavern: WPCampus Seeks to Raise $30K for Gutenberg Accessibility Audit\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=86032\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://wptavern.com/wpcampus-seeks-to-raise-30k-for-gutenberg-accessibility-audit\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4364:\"<p>WPCampus is <a href=\"https://wpcampus.org/2018/11/fundraising-for-wpcampus-gutenberg-accessibility-audit/\" rel=\"noopener\" target=\"_blank\">seeking funding</a> to conduct an accessibility audit of WordPress&#8217; Gutenberg editor. The non-profit organization is dedicated to helping web professionals, educators, and others who work with WordPress in higher education. Educational institutions often have stricter legal obligations that require software to be WCAG 2.0 level AA compliant and many European institutions set the bar even higher at WCAG 2.1.</p>\n<p><a href=\"https://wptavern.com/wpcampus-is-pursuing-an-independent-accessibility-audit-of-gutenberg\" rel=\"noopener\" target=\"_blank\">WPCampus moved to spearhead an audit</a> after Automattic decided to forego Matt MacPherson&#8217;s <a href=\"https://wptavern.com/gutenberg-accessibility-audit-postponed-indefinitely\" rel=\"noopener\" target=\"_blank\">proposal</a> for Gutenberg to undergo an accessibility audit. Results of the audit will help WPCampus determine any potential legal risk for institutions upgrading to WordPress 5.0 and will also identify specific challenges that Gutenberg introduces for assistive technology users and others with accessibility needs.</p>\n<p>&#8220;A professional accessibility audit is a large expense for a small nonprofit like WPCampus,&#8221; WPCampus director Rachel Cherry said. &#8220;Accessibility is important to all of us in the WordPress community. We’re asking for your help to fund the audit and ensure this important research is completed.&#8221;</p>\n<p>WPCampus is still evaluating proposals from vendors and will announce its selection soon, along with an updated timeline for completing the audit. The organization has set its funding goal at $30,000, an amount that falls in the mid-range of the proposals the selection committee has received. If the campaign raises more than the amount required, WPCampus plans to designate the funds for other accessibility-related efforts, such as future audits and live captioning at conferences.</p>\n<p>Two days after launching the campaign, WPCampus has received $3,692 (12%) towards its funding goal. The organization plans to share the results of the audit and any supporting documents on its website.</p>\n<p>The comments published on the donations page demonstrate how strongly supporters feel about getting an audit and using that information to make Gutenberg a tool that anyone can use. The topic of accessibility is close to the heart for many donating to the campaign.</p>\n<p>&#8220;When I was navigating stores with three small children, stores which helped me with automatic doors, wide aisles, and shopping carts for a crowd often made the decision for me as to whether I could shop at all,&#8221; WordPress developer <a href=\"https://robincornett.com/\" rel=\"noopener\" target=\"_blank\">Robin Cornett</a> said. &#8220;As we create content and build tools for the internet, we should be doing all we can to ensure the best online experience we can for everyone.&#8221;</p>\n<p>WordPress co-founder <a href=\"https://mikelittle.org/\" rel=\"noopener\" target=\"_blank\">Mike Little</a> also donated to the campaign, with comments on how important accessibility is to fulfilling the project&#8217;s mission.</p>\n<p>&#8220;As the platform that democratizes publishing, we can&#8217;t allow new features in WordPress to take that away from users with accessibility needs,&#8221; Little said.</p>\n<p>&#8220;Accessibility matters to everyone — injured, encumbered, distracted, disabled, everyone,&#8221; WordPress consultant <a href=\"http://adrianroselli.com\" rel=\"noopener\" target=\"_blank\">Adrian Roselli</a> said. Accessibility in WordPress matters to my clients because some of their people require it in order to use the tool and therefore stay gainfully employed.&#8221;</p>\n<p>The audit proposed months ago has evolved to become a community effort funded by passionate supporters working in various capacities throughout the WordPress ecosystem. If WPCampus is successful in funding its campaign, this particular approach has the benefit of making it a more cooperative effort with more people invested in the process than if it were funded by a single company. WPCampus aims to release the audit report to the community by January 17, 2019 but the dates will depend on the arrangement with the vendor. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 29 Nov 2018 22:03:13 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"WPTavern: Drupal 8.7 to Introduce Layout Builder, Contributors Face Accessibility Challenges\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85572\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:102:\"https://wptavern.com/drupal-8-7-to-introduce-layout-builder-contributors-face-accessibility-challenges\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6649:\"<p>WordPress 5.0 will soon replace the editor with the new Gutenberg editor as part of a multi-phase project to improve the experience of authoring rich content. Phase 2 will shift focus to tackle site customization, bringing more complex layout and page builder capabilities to Gutenberg.</p>\n<p>As this phase kicks off soon, it&#8217;s valuable to see what other platforms are doing on this front. Drupal has traditionally appealed to a more technical audience, and probably wouldn&#8217;t count Squarespace, Wix, and Tumblr among their competitors, but the project is getting more friendly towards site builders and content editors. Drupal has brought improvements to its usability, media, and layout experiences over the past few years in support of users who have demanded a more modern, simplified admin UI. The project is currently testing a visual design tool for building layouts.</p>\n<p>Two weeks ago, Drupal founder and project lead Dries Buytaert <a href=\"https://dri.es/why-drupal-layout-builder-is-so-unique-and-powerful\" rel=\"noopener noreferrer\" target=\"_blank\">previewed the new Layout Builder</a>, an experimental feature that is stabilizing and expected to land in Drupal 8.7 in May 2019. Layout Builder offers layouts for templated content, customizations to templated layouts, and custom pages. These uses are especially important when building sites with large amounts of content that occasionally require template overrides and one-off landing pages.</p>\n<p>Buytaert described how Layout Builder approaches the creation of one-off dynamic pages, which he said is similar to the capabilities found in services such as Squarespace and projects like Gutenberg for WordPress and Drupal: </p>\n<blockquote><p>A content author can start with a blank page, design a layout, and start adding blocks. These blocks can contain videos, maps, text, a hero image, or custom-built widgets (e.g. a Drupal View showing a list of the ten most popular gift baskets). Blocks can expose configuration options to the content author. For instance, a hero block with an image and text may offer a setting to align the text left, right, or center. These settings can be configured directly from a sidebar.</p></blockquote>\n<p>Buytaert&#8217;s demo video shows the Layout Builder in action. Its capabilities are similar to many of WordPress&#8217; third-party page builders, such as <a href=\"https://elementor.com/theme-builder/\" rel=\"noopener noreferrer\" target=\"_blank\">Elementor</a> and <a href=\"https://www.wpbeaverbuilder.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Beaver Builder</a>.</p>\n<p></p>\n<h3>Layout Builder Poses Accessibility Challenges</h3>\n<p>Layout Builder is anchored on one of Drupal&#8217;s stronger features &#8211; the ability to create structured content, but it faces some of the same accessibility challenges that WordPress&#8217; Gutenberg editor has encountered. </p>\n<p>In his post introducing Layout Builder, Buytaert made some pointed remarks about Drupal&#8217;s commitment to accessibility:</p>\n<blockquote><p>Accessibility is one of Drupal&#8217;s core tenets, and building software that everyone can use is part of our core values and principles. A key part of bringing Layout Builder functionality to a &#8220;stable&#8221; state for production use will be ensuring that it passes our accessibility gate (Level AA conformance with WCAG and ATAG). This holds for both the authoring tool itself, as well as the markup that it generates. We take our commitment to accessibility seriously.</p></blockquote>\n<p>Some contributors are not as optimistic about Drupal being able to fulfill these bold claims in time to ship the feature in 8.7.0. Andrew Macpherson, one of the accessibility topic maintainers for Drupal 8 core, has <a href=\"https://www.drupal.org/project/drupal/issues/3007978#comment-12853731\" rel=\"noopener\" target=\"_blank\">proposed Layout Builder offer an alternative UI</a> that users can access without the visual preview UI.</p>\n<p>&#8220;Dries&#8217; blog post about layout builder yesterday says we&#8217;re on track to mark this as stable for D8.7.0,&#8221; Macpherson said. &#8220;I&#8217;m not at all optimistic about that, because as yet there is no feasible plan for how it can be made accessible.</p>\n<p>&#8220;A minimum viable product for Layout Builder accessibility would be at least one method which works, for each user task, for each input/output method. I don&#8217;t think we can say we have found a feasible approach. We&#8217;re in deeply experimental territory here &#8211; there isn&#8217;t a well-established, reliable pattern we can just copy to make the current layout builder accessible. Essentially, we&#8217;re making stuff up in a hurry, for a novel UI, with limited opportunity for design validation. There&#8217;s no guarantee that users are going to understand it, or find it easy to use. That&#8217;s why I&#8217;m not optimistic about it getting past the accessibility gate in time for D8.7.0.&#8221;</p>\n<p>Macpherson said that WCAG strongly advises against providing alternate versions but allows for them in instances where the main version cannot be made accessible.</p>\n<p>&#8220;I think we are effectively in this situation now, although we are still exploring ideas,&#8221; he said. </p>\n<p>Macpherson also recommended they continue striving to make the drag-and-drop, visual-preview layout builder UI accessible at the same time. He referenced emerging <a href=\"https://inclusivedesignprinciples.org/#offer-choice\" rel=\"noopener\" target=\"_blank\">principles of Inclusive Design</a> for application developers, which recommend &#8220;offering choice,&#8221; giving users different ways of completing tasks, especially those that may be complex or non-standard.</p>\n<p>&#8220;Eventually, I&#8217;d like to see BOTH layout builder UIs being accessible, and offer genuinely useful choices for everyone,&#8221; Macpherson said. &#8220;But let&#8217;s take the time to do it well, instead of hastily bolting on fixes for one type of interaction method at a time, in a rush to ship a single layout builder UI. &#8221;</p>\n<p>Macpherson&#8217;s proposal is still under consideration, but it provides an interesting perspective on similar challenges WordPress contributors are facing with Gutenberg. Modernizing UIs to make the site building experience more accessible for those who don&#8217;t know how to code has to be balanced with considerations for those who may not be able see very well or use a mouse. Drupal contributors are exploring providing an alternative accessible UI as a solution to empower more users to take advantage of the new Layout Builder.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 29 Nov 2018 04:31:11 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:106:\"WPTavern: WPWeekly Episode 339 – Interview With Pippin Williamson, Founder of Sandhills Development, LLC\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"https://wptavern.com?p=86062&preview=true&preview_id=86062\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:111:\"https://wptavern.com/wpweekly-episode-339-interview-with-pippin-williamson-founder-of-sandhills-development-llc\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1455:\"<p>In this episode, <a href=\"http://jjj.me\">John James Jacoby</a> and I are joined by <a href=\"http://pippin.com/\">Pippin Williamson</a>, founder of <a href=\"http://sandhillsdev.com/\">Sandhills Development</a>, LLC. Pippin describes what he&#8217;s learned going through the process of opening a brick and mortar business.</p>\n<p>He also describes the emotional process of firing employees, making business decisions as a team, and how he wants to create a life-long company where employees stick around for decades.</p>\n<p>Near the end of the episode, Pippin expresses his opinions on Gutenberg the product and Gutenberg the process. You might be surprised by what he has to say.</p>\n<h2>Stories Discussed:</h2>\n<p><a href=\"https://pippinsplugins.com/2017-in-review/\">2017 in review</a></p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, December 5th 3:00 P.M. Eastern</p>\n<p>Subscribe to <a href=\"https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738\">WordPress Weekly via Itunes</a></p>\n<p>Subscribe to <a href=\"https://www.wptavern.com/feed/podcast\">WordPress Weekly via RSS</a></p>\n<p>Subscribe to <a href=\"http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr\">WordPress Weekly via Stitcher Radio</a></p>\n<p>Subscribe to <a href=\"https://play.google.com/music/listen?u=0#/ps/Ir3keivkvwwh24xy7qiymurwpbe\">WordPress Weekly via Google Play</a></p>\n<p><strong>Listen To Episode #339:</strong><br />\n</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 28 Nov 2018 19:54:37 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:65:\"WPTavern: SyntaxHighlighter Evolved Plugin Adds Gutenberg Support\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85968\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"https://wptavern.com/syntaxhighlighter-evolved-plugin-adds-gutenberg-support\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4743:\"<p>WordPress 5.0 will ship with a code block in the new editor but it doesn&#8217;t include syntax highlighting. The code is currently wrapped in pre tags. During the earlier days of Gutenberg&#8217;s development, the HTML block had syntax highlighting but the team was not satisfied with its implementation and decided to pull it until they could <a href=\"https://github.com/WordPress/gutenberg/issues/10423\" rel=\"noopener\" target=\"_blank\">provide more consistent behavior across blocks</a>. </p>\n<p>For now, users will have to depend on a plugin to get syntax highlighting. <a href=\"https://wordpress.org/plugins/syntaxhighlighter/\" rel=\"noopener\" target=\"_blank\">SyntaxHighlighter Evolved</a> is one of the first plugins of its kind to add Gutenberg support via its own block. </p>\n<p><a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-28-at-10.08.36-AM.png?ssl=1\"><img /></a></p>\n<p>The plugin currently adds syntax highlighting to source code on the frontend only. Nevertheless, it&#8217;s a great use case for Gutenberg, as the plugin previously required you to remember how to structure the shortcode in a particular way in order to use it. </p>\n<p>Ian Dunn <a href=\"https://github.com/Viper007Bond/syntaxhighlighter/pull/78\" rel=\"noopener\" target=\"_blank\">contributed the Gutenberg support</a> for SyntaxHighlighter Evolved. In the PR for this feature, Dunn said he wanted to give existing users a way to continue using the plugin after WordPress 5.0 is released:</p>\n<blockquote><p>\nThe syntax highlighting only works on the front end, due to the nature of SyntaxHighlighter. Details are documented in the edit() function&#8217;s docblock.</p>\n<p>Because of that, this isn&#8217;t the ideal syntax highlighting block[1], but this provides a way for existing users to continue using the plugin without having to migrate old posts to a different plugin.</p>\n<p>Another limitation is that this PR only supports the language attribute of the shortcode, because I ran out of time/energy. This lays the groundwork, though, so the rest of them can easily be added in a future iteration.</p></blockquote>\n<p>SyntaxHighlighter Evolved is active on more than 40,000 installations and is also used on WordPress.com, so this update to the plugin should help those who rely on it to be able to use the new Gutenberg editor without having to switch back to the old editor when they need to add code to their content.</p>\n<p>There is still some debate about the best way to provide syntax highlighting in Gutenberg. Another implementation called <a href=\"https://github.com/mkaz/code-syntax-block\" rel=\"noopener\" target=\"_blank\">Code Syntax Block</a> by Marcus Kazmierczak, extends Gutenberg&#8217;s existing code block to offer syntax highlighting, instead of creating a new block for it. It also uses <a href=\"http://prismjs.com/\" rel=\"noopener\" target=\"_blank\">PrismJS syntax highlighter</a>.</p>\n<p><a href=\"https://github.com/cedaro/shiny-code\" rel=\"noopener\" target=\"_blank\">Shiny Code</a> is another approach that adds a new block for code and provides a preview inside the Gutenberg editor. </p>\n<p><a href=\"https://cloudup.com/cAjq1AKskL8\"><img src=\"https://i1.wp.com/cldup.com/2MLWW0oXx3.gif?resize=627%2C308&ssl=1\" alt=\"Shiny code\" width=\"627\" height=\"308\" /></a></p>\n<p>In the official plugin directory, the <a href=\"https://wordpress.org/plugins/enlighter/\" rel=\"noopener\" target=\"_blank\">Enlighter</a> plugin, which has 10,000 active installs, offers experimental support for Gutenberg that is being <a href=\"https://github.com/EnlighterJS/Plugin.Gutenberg\" rel=\"noopener\" target=\"_blank\">actively developed on GitHub</a>. <a href=\"https://wordpress.org/plugins/kebo-code/\" rel=\"noopener\" target=\"_blank\">Kebo Code</a>, a relatively new plugin with fewer than 10 installs, was created to offer syntax highlighting for Gutenberg and currently supports 121 languages and two themes. Users will have to switch to the frontend to see the code rendered with the theme selected. </p>\n<p>SyntaxHighlighter Evolved does not yet provide a way for highlighting existing code blocks or transforming a core code block to use the plugin&#8217;s syntax highlighting. Converting all existing code blocks might take some time for those who have been using it extensively. Alex Mills, the plugin&#8217;s author, said he is considering all of these issues and welcomes patches on the <a href=\"https://github.com/Viper007Bond/syntaxhighlighter\" rel=\"noopener\" target=\"_blank\">GitHub repository for the plugin</a>. Plugin authors may change their approaches over time, depending on where Gutenberg goes in the future, so users will want to evaluate available plugins periodically to see which ones suit their needs.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 28 Nov 2018 17:10:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"WPTavern: WordCamp US 2018 Livestream Tickets Now Available\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85848\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://wptavern.com/wordcamp-us-2018-livestream-tickets-now-available\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1353:\"<a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2016/11/nashville.jpg?ssl=1\"><img /></a>photo credit: Viv Lynch <a href=\"http://www.flickr.com/photos/68894626@N00/30070498810\">Westward</a> &#8211; <a href=\"https://creativecommons.org/licenses/by-nc-nd/2.0/\">(license)</a>\n<p>The countdown has started for <a href=\"https://2018.us.wordcamp.org\" rel=\"noopener\" target=\"_blank\">WordCamp US 2018</a> in Nashville. The event is just 10 days away. If you cannot attend, watching via the livestream is the next best option. Anyone can join the livestream for free, but viewers will need to <a href=\"https://2018.us.wordcamp.org/tickets/\" rel=\"noopener\" target=\"_blank\">sign up for a ticket</a> on the event website. </p>\n<p>This year&#8217;s <a href=\"https://2018.us.wordcamp.org/schedule/\" rel=\"noopener\" target=\"_blank\">schedule</a> includes sessions in two tracks: Banjo and Guitar. Matt Mullenweg&#8217;s annual <a href=\"https://2018.us.wordcamp.org/2018/11/27/state-of-the-word-2018/\" rel=\"noopener\" target=\"_blank\">State of the Word</a> address is scheduled for Saturday, December 8, at 4:00 p.m. CST. Livestream ticket holders can tune in to any of the sessions and may also want to participate in the conversations on Twitter using the <a href=\"https://twitter.com/hashtag/WCUS?src=hash\" rel=\"noopener\" target=\"_blank\">#WCUS hashtag</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 27 Nov 2018 22:09:16 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:41:\"BuddyPress: BuddyPress 4.0.0 “Pequod”\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://buddypress.org/?p=282222\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://buddypress.org/2018/11/buddypress-4-0-0-pequod/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5882:\"<p>BuddyPress 4.0.0 &#8220;Pequod&#8221; is now available!</p>\n<h3>A focus on data privacy and control</h3>\n<p>BuddyPress boasts a proud history of letting community members and managers control their data, independent of third-party, commercial entities. In this spirit, as well as the spirit of recent regulations like the EU&#8217;s General Data Protection Regulation (GDPR), Expanding on some of the tools introduced by WordPress in version 4.9.8, BuddyPress 4.0 introduces a suite of tools allowing users and site admins to manage member data and privacy.</p>\n<div id=\"attachment_282223\" class=\"wp-caption alignnone\"><a href=\"https://buddypress.org/wp-content/uploads/1/2018/11/data-export.png\"><img class=\"size-full wp-image-282223\" src=\"https://buddypress.org/wp-content/uploads/1/2018/11/data-export.png\" alt=\"Screenshot of \" /></a><p class=\"wp-caption-text\">Giving your users greater control over their data</p></div>\n<p>The new &#8220;Export Data&#8221; Settings panel lets users request an export of all BuddyPress data they&#8217;ve created. BuddyPress integrates seamlessly with the data export functionality introduced in WordPress 4.9.8, and BP data is included in exports that are initiated either from the Export Data panel or via WP&#8217;s Tools &gt; Export Personal Data interface.</p>\n<p>BuddyPress 4.0 also integrates with WordPress 4.9.8&#8217;s Privacy Policy tools. When you create or update your Privacy Policy, BP will suggest text that&#8217;s specifically tailored to the kinds of social data generated on a BuddyPress site. And will prompt registering users to agree to the Privacy Policy, if your theme supports it.</p>\n<p>We&#8217;ve also done a complete review of BuddyPress&#8217;s cookie behavior, and dramatically reduced the number of cookies needed to browse a BP-powered site &#8211; especially for logged-out users. We&#8217;re confident that this change will help site owners comply with local privacy regulations.</p>\n<h3>Nouveau and other improvements</h3>\n<p>The BuddyPress team has been hard at work improving the Nouveau template pack introduced in BuddyPress 4.0. We&#8217;ve improved accessibility, extensibility, and responsiveness on mobile devices.</p>\n<p>BuddyPress 4.0 also contains a number of internal improvements that improve compatibility with various version of PHP, fix formatting and content issues when sending emails, and address some backward-compatibility concerns.</p>\n<h3>Mille grazie</h3>\n<p>As usual, this BuddyPress release is only possible thanks to the contributions of the community. Special thanks to the following folks who contributed code and testing to the release: <a href=\"https://profiles.wordpress.org/xknown/\">Alex Concha (xknown)</a>, <a href=\"https://profiles.wordpress.org/ankit-k-gupta/\">Ankit K Gupta (ankit-k-gupta)</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone B Gorges (boonebgorges)</a>, <a href=\"https://profiles.wordpress.org/sbrajesh/\">Brajesh Singh (sbrajesh)</a>, <a href=\"https://profiles.wordpress.org/brianbws/\">Brian Cruikshank (brianbws)</a>, <a href=\"https://profiles.wordpress.org/needle/\">Christian Wach (needle)</a>, <a href=\"https://profiles.wordpress.org/cyberwani/\">Dinesh Kesarwani (cyberwani)</a>, <a href=\"https://profiles.wordpress.org/dipesh.kakadipa/\">dipeshkakadiya</a>, <a href=\"https://profiles.wordpress.org/drywallbmb/\">drywallbmb</a>, <a href=\"https://profiles.wordpress.org/dullowl/\">dullowl</a>, <a href=\"https://profiles.wordpress.org/eric01/\">Eric (eric01)</a>, <a href=\"https://profiles.wordpress.org/garrett-eclipse/\">Garrett Hyder (garrett-eclipse)</a>, <a href=\"https://profiles.wordpress.org/harshall/\">Harshal Limaye (harshall)</a>, <a href=\"https://profiles.wordpress.org/hnla/\">Hugo (hnla)</a>, <a href=\"https://profiles.wordpress.org/johnjamesjacoby/\">John James Jacoby (johnjamesjacoby)</a>, <a href=\"https://profiles.wordpress.org/marcella1981/\">Marcella (marcella1981)</a>, <a href=\"https://profiles.wordpress.org/imath/\">Mathieu Viet (imath)</a>, <a href=\"https://profiles.wordpress.org/mercime/\">mercime</a>, <a href=\"https://profiles.wordpress.org/MorgunovVit/\">MorgunovVit</a>, <a href=\"https://profiles.wordpress.org/n0barcode/\">n0barcode</a>, <a href=\"https://profiles.wordpress.org/pareshradadiya/\">paresh.radadiya (pareshradadiya)</a>, <a href=\"https://profiles.wordpress.org/DJPaul/\">Paul Gibbs (DJPaul)</a>, <a href=\"https://profiles.wordpress.org/pooja1210/\">Pooja N Muchandikar (pooja1210)</a>, <a href=\"https://profiles.wordpress.org/r-a-y/\">r-a-y</a>, <a href=\"https://profiles.wordpress.org/espellcaste/\">Renato Alves (espellcaste)</a>, <a href=\"https://profiles.wordpress.org/RT77/\">RT77</a>, <a href=\"https://profiles.wordpress.org/cyclic/\">Ryan Williams (cyclic)</a>, <a href=\"https://profiles.wordpress.org/elhardoum/\">Samuel Elh (elhardoum)</a>, <a href=\"https://profiles.wordpress.org/shubh14/\">shubh14</a>, <a href=\"https://profiles.wordpress.org/spdustin/\">spdustin</a>, <a href=\"https://profiles.wordpress.org/suvikki/\">suvikki</a>, <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar (netweb)</a>, <a href=\"https://profiles.wordpress.org/thejimmy/\">thejimmy</a>, <a href=\"https://profiles.wordpress.org/vapvarun/\">vapvarun</a>, <a href=\"https://profiles.wordpress.org/wbcomdesigns/\">Wbcom Designs (wbcomdesigns)</a>, <a href=\"https://profiles.wordpress.org/yahil/\">Yahil Madakiya (yahil)</a></p>\n<p>This version of BuddyPress is code-named &#8220;Pequod&#8221; after the famous <a href=\"https://pequodspizza.com/\">Pequod&#8217;s Pizza</a> in Chicago, where the crust really is caramelized, and the dish really is deep. Buon gusto!</p>\n<h3>Keep on truckin&#8217;</h3>\n<p>Questions or comments about the release? Visit the <a href=\"https://buddypress.org/support/\">buddypress.org support forums</a>, or open a ticket on <a href=\"https://buddypress.trac.wordpress.org\">our bugtracker</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 27 Nov 2018 19:57:28 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Boone Gorges\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:90:\"WPTavern: Jetpack 6.8 Adds Gutenberg Blocks for Payment Buttons, Forms, Maps, and Markdown\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85576\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:98:\"https://wptavern.com/jetpack-6-8-adds-gutenberg-blocks-for-payment-buttons-forms-maps-and-markdown\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3613:\"<p><a href=\"https://jetpack.com/2018/11/27/jetpack-6-8-building-jetpack-for-the-new-wordpress-editor/\" rel=\"noopener\" target=\"_blank\">Jetpack 6.8</a> was released today, introducing the plugin&#8217;s first set of blocks for Gutenberg. The necessary infrastructure was added in version 6.6 and all existing features that touch the editor are in the process of being ported over to blocks. This release includes blocks for payment buttons, forms, maps, and markdown.</p>\n<p>The Contact Form module is one of the plugin&#8217;s most popular features and one that users often enable on new websites. This block removes a major barrier to implementing a form on WordPress sites &#8211; new users will have no need to try to understand the concept of shortcodes in order to collect feedback on their sites. Creating a new form essentially works like adding blocks inside of blocks:</p>\n<p><a href=\"https://cloudup.com/cNVMNF2ZGd8\"><img src=\"https://i2.wp.com/cldup.com/LZmv0Xj_Iq.gif?resize=627%2C568&ssl=1\" alt=\"Form\" width=\"627\" height=\"568\" /></a></p>\n<p>The <a href=\"https://jetpack.com/support/jetpack-blocks/simple-payments-block/\" rel=\"noopener\" target=\"_blank\">Simple Payments button block</a> is slightly different in that it already has the form fields set up so the user can fill them out for whatever they are selling. This block is available for users on the Jetpack Premium or Professional plan.</p>\n<p>The <a href=\"https://jetpack.com/support/jetpack-blocks/map-block/\" rel=\"noopener\" target=\"_blank\">map block</a> makes it easy for users to embed an interactive map within the content of posts or pages. After <a href=\"https://www.mapbox.com/signup/\" rel=\"noopener\" target=\"_blank\">signing up for a free Mapbox Access Token</a>, users can select a location directly inside the new editor and preview it live with different map theme options and a color-picker for the marker.</p>\n<p><a href=\"https://cloudup.com/cUFrJDi-tqy\"><img src=\"https://i2.wp.com/cldup.com/NL4okuVN0s.gif?resize=627%2C338&ssl=1\" alt=\"Map\" width=\"627\" height=\"338\" /></a></p>\n<p>Some of those who have tested Gutenberg may not be a fan of its current writing interface, but after you see some of these blocks in action for things like maps and payment buttons, it&#8217;s clear that this is a superior interface for these content types. Modernizing the interface for content that previously relied on shortcodes is where Gutenberg truly excels right now.</p>\n<p>Development on the Gutenberg plugin has been so active that it makes sense that the Jetpack team waited until WordPress 5.0 RC to release any blocks. Jetpack users can take advantage of them now if they have Gutenberg installed, or wait until 5.0 is officially released. The Jetpack team is also working on a number of other blocks for existing features. You can <a href=\"https://github.com/Automattic/jetpack/labels/Gutenberg\" rel=\"noopener\" target=\"_blank\">follow the progress</a> on upcoming blocks at Jetpack&#8217;s GitHub repository and log issues with blocks that have already been released.</p>\n<p>Jetpack 6.8 also restores the Publicize module to the pre-publish sidebar, so users can continue automatically sharing posts after WordPress 5.0 is released. This version ensures compatibility with Jetpack&#8217;s widgets for those using the Twenty Nineteen theme. Check out the <a href=\"https://wp.me/p1moTy-cee\" rel=\"noopener\" target=\"_blank\">release post</a> to see more blocks in action and the <a href=\"https://wordpress.org/plugins/jetpack/#developers\" rel=\"noopener\" target=\"_blank\">changelog</a> for a full list of all the enhancements and bug fixes.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 27 Nov 2018 17:52:05 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"WPTavern: WordPress 5.0 RC 1 Released, Gutenberg Passes 1 Million Installations\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85923\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://wptavern.com/wordpress-5-0-rc-1-released-gutenberg-passes-1-million-installations\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5988:\"<p><a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-release-candidate/\" rel=\"noopener\" target=\"_blank\">WordPress 5.0 RC 1</a> was released over the weekend after a string of five betas that began in late October. According to the <a href=\"https://gutenstats.blog/\" rel=\"noopener\" target=\"_blank\">Gutenberg stats page</a>, more than 1.1 million sites have the Gutenberg plugin installed and users have written more than 980,000 posts using the new editor. These numbers are conservative estimates, as the numbers only include WordPress.com sites and sites running Jetpack.</p>\n<p>Most of the changes included in the RC were outlined in the <a href=\"https://make.wordpress.org/core/2018/11/20/whats-new-in-gutenberg-20th-november/\" rel=\"noopener\" target=\"_blank\">Gutenberg 4.5</a> release post last week. An update published today shows 12 PRs waiting for review in the 4.6 milestone, 14 open issues in the 5.0.0 milestone, and more than 150 issues open in 5.0.1 and subsequent releases. <a href=\"https://make.wordpress.org/core/tag/5.0+dev-notes/\" rel=\"noopener\" target=\"_blank\">Dev notes for 5.0</a> have been published and tagged on the make.wordpress.org/core blog.</p>\n<p>WordPress 5.0&#8217;s official release date was set for November 27 but after further evaluation the date has been <a href=\"https://make.wordpress.org/core/2018/11/21/5-0-gutenberg-status-update-nov-21/\" rel=\"noopener\" target=\"_blank\">pushed back</a>. Last week WordPress core core committers, contributors, and former release leads made strong, last-minute <a href=\"https://wptavern.com/wordpress-5-0-rc-expected-on-u-s-thanksgiving-holiday-despite-last-minute-pushback-from-contributors\" rel=\"noopener\" target=\"_blank\">appeals</a> to hold off RC and defer the release to January. Development is moving forward desipite the pushback. A new release date has not yet been announced. The current plan is to monitor feedback on the RC and the team will make a decision from there.</p>\n<h3>Mullenweg Responds to Critics on Twitter, Reiterates Vision for Gutenberg</h3>\n<p>Over the weekend, Matt Mullenweg responded to critics on Twitter who voiced concerns about his leadership and communication throughout WordPress 5.0&#8217;s development. One particular post titled &#8220;<a href=\"https://cameronjonesweb.com.au/blog/lets-take-a-very-serious-look-at-gutenberg/\" rel=\"noopener\" target=\"_blank\">Let’s Take A Very Serious Look At Gutenberg</a>,&#8221; written by WordPress developer Cameron Jones, sparked conversation. In response to Cliff Seal, who urged Mullenweg to &#8220;re-cast the vision of WordPress in a way that accounts for the apparent urgency of this effort,&#8221; Mullenweg <a href=\"https://twitter.com/photomatt/status/1066397086206304256\" rel=\"noopener\" target=\"_blank\">responded</a>:</p>\n<blockquote><p>\nMany people who try to start publishing with WordPress fail; those who don&#8217;t struggle with shortcodes, embeds, widgets; those who can toggle to code view to do basic tasks in the editor, and for clients set up elaborate meta-field and CPT based schemes to avoid catastrophe.</p>\n<p>Gutenberg aims to solve these problems, improve the WP experience for all its users, and open up independent, open source, beautiful publishing on the web to a class of users that couldn&#8217;t publish with WordPress before.</p>\n<p>It may seem rushed to people unused to this pace of development and improvement in the WordPress world. However this has been a pace sustained for almost two years now, and we still look slow compared to some modern software. Speed of iteration is enabled by the new tech stack.</p>\n<p>It bothers me at a deep, moral level to hold back a user experience that will significantly upgrade the publishing ability and success of tens or hundreds of millions of users. It hasn&#8217;t been ready (for core) yet, so it&#8217;s not released. I hope it will be soon! </p>\n<p>This may all look very quaint in retrospect, when we look back three or five years from now. It&#8217;s a tough transition but the foundation Gutenberg enables will be worth it.</p></blockquote>\n<p>Matt Medeiros, another vocal critic of Mullenweg&#8217;s leadership on WordPress 5.0, <a href=\"https://www.youtube.com/watch?v=W1Rhr9Y54ck\" rel=\"noopener\" target=\"_blank\">recorded a video</a>, expounding on his concerns about transparency and the rushed pace. He summarized the frustrations that inspired him to make the video.</p>\n<p>&#8220;While I agree WordPress needs innovation to reach new users that desperately require freedom over their content, especially within the context of today&#8217;s social networks, I don&#8217;t agree and am also discouraged by Matt not sharing the product vision with the community,&#8221; Medeiros said. &#8220;It&#8217;s polarizing to build software under the guise of openness with a mission to democratize publishing, but not give the same people volunteering to &#8216;Five for the Future&#8217; a voice for the future. </p>\n<p>&#8220;Lack of communication, not Gutenberg or the team developing it, has lead to the current divide and we&#8217;re left asking &#8212; why? WordPress has always had a branding problem and this continues to muddy the lines between open source project and WordPress the &#8216;product.\'&#8221;</p>\n<p>The 5.0 release is heading into the home stretch but Gutenberg has several phases ahead with many more years of development. Mullenweg&#8217;s responses on Twitter over the weekend indicate he is interested in keeping the lines of communication open throughout the process. He said he plans to dedicate more time to responding directly to feedback.</p>\n<p>&#8220;One thing will try: I’m going to open up some listening office hours in the next week so people can talk directly,&#8221; Mullenweg <a href=\"https://twitter.com/photomatt/status/1065981341496471555\" rel=\"noopener\" target=\"_blank\">said</a>. &#8220;I want everyone to be and feel heard, as they have been since the beginning of this process in 2016.&#8221;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 27 Nov 2018 01:54:09 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:10;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:41:\"Dev Blog: WordPress 5.0 Release Candidate\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6257\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"https://wordpress.org/news/2018/11/wordpress-5-0-release-candidate/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5355:\"<p>The first release candidate for WordPress 5.0 is now available!</p>\n\n\n\n<p>This is an important milestone, as we near the release of WordPress 5.0.&nbsp;<strong>The WordPress 5.0 release date has shifted from the 27th to give more time for the RC to be fully tested</strong>. A final release date will be announced soon, based on feedback on the RC. This is a big release and needs <em>your</em> help—if you haven’t tried 5.0 yet, now is the time!&nbsp;</p>\n\n\n\n<p>To test WordPress 5.0, you can use the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-RC1.zip\">download the release candidate here</a>&nbsp;(zip).</p>\n\n\n\n<h2>What&#8217;s in WordPress 5.0?</h2>\n\n\n\n<img src=\"https://i1.wp.com/wordpress.org/news/files/2018/11/Gutenberg-3.png?resize=632%2C316&ssl=1\" alt=\"Screenshot of the new block editor interface.\" class=\"wp-image-6271\" />The new block-based post editor.\n\n\n\n<p>WordPress 5.0 introduces the <a href=\"https://wordpress.org/gutenberg/\">new block-based post editor</a>. This is the first step toward an exciting new future with a streamlined editing experience across your site. You’ll have more flexibility with how content is displayed, whether you are building your first site, revamping your blog, or write code for a living.</p>\n\n\n\n<p>The block editor is&nbsp;<a href=\"https://gutenstats.blog/\">used on over a million sites</a>, we think it&#8217;s ready to be used on all WordPress sites. We do understand that some sites might need some extra time, though. If that&#8217;s you, please install the <a href=\"https://wordpress.org/plugins/classic-editor/\">Classic Editor plugin</a>, you&#8217;ll continue to use the classic post editor when you upgrade to WordPress 5.0.</p>\n\n\n\n<p>Twenty Nineteen is WordPress&#8217; new default theme, it&nbsp;features custom styles for the blocks available by default in 5.0.&nbsp;Twenty Nineteen is designed to work for a wide variety of use cases. Whether you’re running a photo blog, launching a new business, or supporting a non-profit, Twenty Nineteen is flexible enough to fit your needs.</p>\n\n\n\n<p>The block editor is a big change, but that&#8217;s not all. We&#8217;ve made some smaller changes as well,&nbsp; including:</p>\n\n\n\n<ul><li>All of the previous default themes, from Twenty Ten through to Twenty Seventeen, have been updated to support the block editor.</li><li>You can improve the accessibility of the content you write, now that <a href=\"https://core.trac.wordpress.org/ticket/30421\">simple ARIA labels</a>&nbsp;can be saved in posts and pages.</li><li>WordPress 5.0 officially supports the upcoming PHP 7.3 release: if you&#8217;re using an older version, we encourage you to <a href=\"https://wordpress.org/support/upgrade-php/\">upgrade PHP</a>&nbsp;on your site.</li><li>Developers can now add translatable strings directly to your JavaScript code, using the new <a href=\"https://make.wordpress.org/core/2018/11/09/new-javascript-i18n-support-in-wordpress/\">JavaScript language packs</a>.</li></ul>\n\n\n\n<p>You can read more about the fixes and changes since  Beta 5 <a href=\"https://make.wordpress.org/core/2018/11/20/whats-new-in-gutenberg-20th-november/\">in the last update post</a>.</p>\n\n\n\n<p>For more details about what’s new in version 5.0, check out the&nbsp;<a href=\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-1/\">Beta 1</a>,&nbsp;<a href=\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-2/\">Beta 2</a>,&nbsp;<a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-3/\">Beta 3</a>, <a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-4/\">Beta 4</a> and&nbsp;<a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-5/\">Beta 5</a>&nbsp;blog posts.</p>\n\n\n\n<h2>Plugin and Theme Developers</h2>\n\n\n\n<p>Please test your plugins and themes against WordPress 5.0 and update the&nbsp;<em>Tested up to</em>&nbsp;version in the readme to 5.0. If you find compatibility problems, please be sure to post to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">support forums</a> so we can figure those out before the final release. An in-depth field guide to developer-focused changes is coming soon on the&nbsp;<a href=\"https://make.wordpress.org/core/\">core development blog</a>. In the meantime, you can review the&nbsp;<a href=\"https://make.wordpress.org/core/tag/5.0+dev-notes/\">developer notes for 5.0</a>.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<p class=\"has-background has-medium-font-size\"><em>Ruedan los bloques<br />Contando vivos cuentos<br />Que se despiertan</em></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 23 Nov 2018 09:46:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Matias Ventura\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:11;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:112:\"WPTavern: WordPress 5.0 RC Expected on U.S. Thanksgiving Holiday, despite Last-Minute Pushback from Contributors\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85784\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:121:\"https://wptavern.com/wordpress-5-0-rc-expected-on-u-s-thanksgiving-holiday-despite-last-minute-pushback-from-contributors\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:9937:\"<a href=\"https://i0.wp.com/wptavern.com/wp-content/uploads/2017/10/ship-bottle.jpg?ssl=1\"><img /></a>photo credit: KaylaKandzorra <a href=\"http://www.flickr.com/photos/48077358@N02/4952091078\">i miss you grampa.</a> &#8211; <a href=\"https://creativecommons.org/licenses/by/2.0/\">(license)</a>\n<p>WordPress core committers, core contributors, and former release leads made strong, last-minute <a href=\"https://make.wordpress.org/core/2018/11/19/5-0-gutenberg-status-update-nov-19/\" rel=\"noopener noreferrer\" target=\"_blank\">appeals</a> on Monday for the 5.0 release to be deferred to January. RC was expected Monday but those urging its delay cited the large number of open issues on the milestone and the fact that many confirmed bugs are being aggressively punted to followup releases.  </p>\n<p>&#8220;I do not see how we can seriously ship a release candidate today,&#8221; Joe McGill said. &#8220;In doing so, we are either saying we’re ok with shipping a major version of WordPress with this many known issues, or that the term &#8216;release candidate&#8217; does not actually have meaning. I would suggest that we revise the schedule to push back RC for at least 4 weeks so we have a reasonable deadline and, in the mean time, continue releasing betas.&#8221;</p>\n<p>Nearly every contributor involved in the discussion was enthusiastic about Gutenberg but urged release lead Matt Mullenweg to allow for four weeks of RC and code freeze to give the community to prepare. </p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">&#8211; Building site with Gutenberg<br />&#8211; Find bug, go to GH to file an issue <br />&#8211; Find the ticket already exists.<br />&#8211; Bug has already been punted to \"5.0.x Follow Ups\"<br />&#8211; Find all the other *known* bugs planned for 5.0 launch</p>\n<p>:(<a href=\"https://t.co/EiXR8tgHnz\">https://t.co/EiXR8tgHnz</a></p>\n<p>&mdash; Bill Erickson (@BillErickson) <a href=\"https://twitter.com/BillErickson/status/1064619368045252608?ref_src=twsrc%5Etfw\">November 19, 2018</a></p></blockquote>\n<p></p>\n<p>Contributors said they don&#8217;t understand the rush to get 5.0. Several noted that Gutenberg seems to be measured by a different rod of success than previous releases where headline features were held to a different standard in regards to shipping known bugs. </p>\n<p>&#8220;We’re fast approaching a million (Jetpack tracked) posts made through the editor, with the non-tracked number probably a multiple of that,&#8221; Mullenweg said in response to contributors&#8217; concerns. &#8220;There’s been an explosion of plugins building on top of Gutenberg and some things like the work ACF and Block Lab have done that seem really transformational for WordPress. For those whom the editor is not a good fit they can opt in at any point, including post-5.0, to Classic and continue using WP exactly as they had before until at least 2022 and likely beyond.&#8221; </p>\n<p>Mullenweg identified a few questions he sees as &#8220;good measures of success for Gutenberg:&#8221;</p>\n<ul>\n<li>Are people, when given the choice, choosing to use it over the old editor?</li>\n<li>Can they create things they weren’t able to create before?</li>\n<li>Are new-to-WP users more successful (active, happy with what they create) than pre-Gutenberg?</li>\n<li>Are interesting things being built on top of it?</li>\n</ul>\n<p>Interesting plugins are being built on top of Gutenberg but they are breaking with every release of the plugin. Gutenberg 4.5 was released yesterday, matching the first 5.0 RC feature set. It includes a large number of changes and bug fixes that have gone relatively untested by the community at large. Most notably, 4.5 introduced a regression that caused a <a href=\"https://github.com/WordPress/gutenberg/issues/12148\" rel=\"noopener noreferrer\" target=\"_blank\">white screen of death when trying to load custom post types</a> in the classic editor, forcing a 4.5.1 release earlier in the day. Every release introduces changes that cause plugins to break, requiring immediate updates from plugin developers.</p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">Our new <a href=\"https://twitter.com/hashtag/gutenberg?src=hash&ref_src=twsrc%5Etfw\">#gutenberg</a> development cycle<br />1) New version of GB is released<br />2) We cross our fingers<br />3) Find out GB breaks stuff<br />4) Fix GB issues<br />5) Issue release<br />6) New version of GB released<br />repeat process <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f613.png\" alt=\"😓\" class=\"wp-smiley\" /></p>\n<p>&mdash; pootlepress (@pootlepress) <a href=\"https://twitter.com/pootlepress/status/1065146009964212225?ref_src=twsrc%5Etfw\">November 21, 2018</a></p></blockquote>\n<p></p>\n<p>Gutenberg technical lead Matias Ventura posted an <a href=\"https://make.wordpress.org/core/2018/11/21/5-0-gutenberg-status-update-nov-21/\" rel=\"noopener noreferrer\" target=\"_blank\">update</a> today, confirming that WordPress 5.0 will miss the planned November 27 release date but did not offer a secondary date.</p>\n<p>&#8220;The date for 5.0 release is under consideration, given it’s not plausible for it to be the on 27th,&#8221; Ventura said. </p>\n<h3>WordPress 5.0 Will Ship &#8220;When It&#8217;s Ready,&#8221; Contributors are Focusing on Getting Release Candidate out ASAP</h3>\n<p>When the second set of November dates for release were missed, many assumed WordPress 5.0 would fall back to the secondary dates in January, but that has not yet been confirmed. The previous <a href=\"https://make.wordpress.org/core/2018/10/03/proposed-wordpress-5-0-scope-and-schedule/\" rel=\"noopener noreferrer\" target=\"_blank\">scope and schedule Gary Pendergast outlined</a> said the November dates could slip by up to eight days if necessary and that if additional time was required, they would aim for the January dates:</p>\n<p>Secondary RC 1: January 8, 2019</p>\n<p>Secondary Release: January 22, 2019 </p>\n<p>During the regularly scheduled core developers&#8217; chat today, the discussion regarding WordPress 5.0&#8217;s release date became heated, as contributors continued to push for a January release. Pendergast suggested that December might have a viable date, to which Yoast CEO Joost de Valk responded, &#8220;I’m going to raise hell if we do December.&#8221;</p>\n<p>WordPress plugin developers and agencies are trying to plan for upcoming holidays and want to have staff available when the release lands. Many of those who attended the meeting were hoping to receive confirmation on the release being pushed back to January.</p>\n<p>&#8220;Please also consider the plugin shops that are rearranging their priorities to have blocks ready for 5.0, only to have had to fix them several times in the last few weeks,&#8221; Kevin Hoffman said. &#8220;The success of 5.0 depends just as much on third-party support as it does core.&#8221; </p>\n<p>&#8220;There&#8217;s agreement on that from all sides, that the amount of code churn and missed earlier deadlines means that the 27th is untenable,&#8221; Mullenweg said. &#8220;RC is still possible soon, but please don&#8217;t assume that implies a final release date until we see how that goes and pick one. I hope that it shows that we are willing to change decisions based on new information, it&#8217;s not about being &#8216;right&#8217; or sticking to previous plans blindly.&#8221;</p>\n<p>This statement indicates Mullenweg may be considering dates that were not included in the original schedule, as he later said,&#8221;If y&#8217;all can take the data without freaking out about what it means for the release date, there have been 8 major releases in December, it&#8217;s actually been 34% of our last 23 major releases.&#8221;</p>\n<p>Several contributors agreed that getting an RC out ASAP would finally force a longer code freeze for Gutenberg&#8217;s UI, API, documentation, and features. This would give the community more time to prepare. </p>\n<p>&#8220;As part of the development team for almost two years now, I’d love for us to draw the RC line soon for the sake of everyone’s fatigue,&#8221; Matias Ventura said. &#8220;And think it’s ready to be drawn. I am concerned with letting us do &#8216;one more little thing&#8217; and pushing the stability line further down, in an almost endless process.&#8221; </p>\n<p>Contributors are now wrapping up the last few tickets and the plan is to get the release candidate out tomorrow during the U.S. Thanksgiving holiday. Given WordPress&#8217; global contributor base, releasing on the holiday shouldn&#8217;t be an issue. The team is also still investigating the possibility of bundling the Classic Editor plugin with updates for existing WordPress sites.</p>\n<p>&#8220;Our focus right now is on a great RC,&#8221; Mullenweg said. Throughout Gutenberg&#8217;s development Mullenweg has said WordPress 5.0 would ship &#8220;when it&#8217;s ready.&#8221; No release date will be announced until the team has had time to evaluate the release candidate.</p>\n<p>&#8220;It is true that the primary thing is whether it&#8217;s ready, and it&#8217;s not currently ready,&#8221; Mullenweg said.</p>\n<p>In 1928, John A. Shedd published a little book called “Salt from My Attic.&#8221; It included a saying that U.S. Navy Rear Admiral Grace Hopper said was influential in her life: &#8220;A ship in harbor is safe, but that is not what ships are built for.&#8221; </p>\n<p>Shipping a major overhaul of WordPress&#8217; editor has brought a fair share of uncertainty and frustration to contributors and the community that depends on the software. After mission-critical issues have been resolved, it seems to become a cycle of fixing and breaking things that could continue indefinitely. Although the holiday timing isn&#8217;t ideal, if Gutenberg stalls much longer it&#8217;s going to be burning daylight. At some point the ship just needs to push away from the port and see how it sails.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 22 Nov 2018 03:17:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:12;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"WPTavern: ExpressionEngine Goes Open Source after 16 Years\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85816\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wptavern.com/expressionengine-goes-open-source-after-16-years\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6180:\"<p>In a post titled &#8220;<a href=\"https://expressionengine.com/blog/open-source-has-won\" rel=\"noopener noreferrer\" target=\"_blank\">Open Source Has Won</a>,&#8221; EllisLab founder Rick Ellis explained why ExpressionEngine is <a href=\"https://expressionengine.com/blog/expressionengine-is-now-free\" rel=\"noopener noreferrer\" target=\"_blank\">going open source</a> after 16 years. The content management system is an evolution of the pMachine blogging software first released in early 2002. EllisLab previously required a license fee to use the full version of ExpressionEngine, which is built on object-oriented PHP and uses MySQL for storage.</p>\n<p>&#8220;Although open source was a viable licensing model when we launched our first CMS back in 2002, it was not apparent then just how dominant open source would become on the web,&#8221; Ellis said. &#8220;It wasn’t until Eric Raymond wrote The Cathedral &#038; The Bazaar that open source would even begin to enter the general public’s consciousness. Since then we’ve watched the open source market grow rapidly and continuously.</p>\n<p>&#8220;Today, over 90% of the CMS market is open source. In fact, it’s nearly the de-facto license model for all-things web. Stunningly, the market is expected to triple in revenue within the next five to ten years, and it’s estimated that over 70% of businesses worldwide rely on open-source software. To say that the internet is open source would not be an exaggeration. It’s that dominant.&#8221;</p>\n<p>Ellis said he had wanted to migrate to an open source license for a long time but had not yet found &#8220;the right strategic and financial partner to enable the full vision of what we hope to achieve.&#8221; The first part of EllisLab&#8217;s business plan is to build a successful services model and then branch out from there.</p>\n<p>Prior to licensing ExpressionEngine under the <a href=\"https://expressionengine.com/license\" rel=\"noopener noreferrer\" target=\"_blank\">Apache License, Version 2.0</a>, EllisLab&#8217;s <a href=\"https://web.archive.org/web/20180627183126/https://expressionengine.com/license\" rel=\"noopener noreferrer\" target=\"_blank\">commercial license</a> imposed severe restrictions on what users could do with the software. Users were not permitted to do any of the following:</p>\n<ul>\n<li>Use the Core License (free) for any client or contract work.</li>\n<li>Use the Software as the basis of a hosted blogging service, or to provide hosting services to others.</li>\n<li>Reproduce, distribute, or transfer the Software, or portions thereof, to any third party.</li>\n<li>Modify, tamper with, bypass, or in any way impede license registration routines in the Software.</li>\n<li>Sell, rent, lease, assign, or sublet the Software or portions thereof, including sites in your multi-site license.</li>\n<li>Grant rights to any other person.</li>\n<li>Use the Software in violation of any U.S. or international law or regulation.</li>\n</ul>\n<p>Additional stipulations encouraged users not to share code by keeping their repositories private, and to make sure they were paying for commercial licenses if they were being paid for their work. </p>\n<p><a href=\"https://i2.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-20-at-1.35.18-PM.png?ssl=1\"><img /></a></p>\n<p>There was simply no way ExpressionEngine could capture any significant amount of market share with this kind of restrictive licensing and its usage has steadily declined over the years. It is currently used by <a href=\"https://w3techs.com/technologies/details/cm-expressionengine/all/all\" rel=\"noopener noreferrer\" target=\"_blank\">0.3% of all the websites</a> whose content management system w3techs can detect. By this or any other measure of market share, ExpressionEngine stands as a sobering monument to the importance of giving a project a license that empowers its community to continue adding wood to the fire.</p>\n<p>&#8220;The community is mostly gone at this point and I don&#8217;t even think its related to them charging for the software but they just stopped responding people and helping them in their forums,&#8221; reddit user @netzvolk <a href=\"https://www.reddit.com/r/PHP/comments/9ylq4i/expressionengine_is_now_open_source/ea2g130/\" rel=\"noopener noreferrer\" target=\"_blank\">commented</a> on the news.</p>\n<p>&#8220;I have paid EE multiple times in the past but considered NOT paying anymore because third party developers are gone, the community members are gone, the tutorials and books are gone&#8230;.EE 2 was the best version so far. Moving to yearly releases also caused more harm than good in terms of building a stable ecosystem around the product.&#8221;</p>\n<p>ExpressionEngine&#8217;s new open source licensing is a major win for its remaining users. How much further down the road would the software be if the decision was made years ago? There&#8217;s no way to know, but moving forward users will have more input and influence over the future of the software. </p>\n<p>&#8220;I suspect open sourcing EE is an approach to get that community and developers back,&#8221; @netzvolk <a href=\"https://www.reddit.com/r/PHP/comments/9ylq4i/expressionengine_is_now_open_source/ea2n7ce/\" rel=\"noopener noreferrer\" target=\"_blank\">said</a>. &#8220;EllisLab can still make money with consulting, support and add-ons.</p>\n<p>&#8220;But all those suffer if nobody is using the product anymore. This is more about expanding reach to stay afloat than anything else because some of their past bad decisions are what created alternatives like <a href=\"https://craftcms.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Craft</a>. EllisLab turned an amazing product into a forgotten one in just a few years. I hope this means some change, and maybe, maybe one day the old developers and hard core EE community members come back.&#8221;</p>\n<p>Users can only speculate on why EllisLab is making this move after 16 years of keeping its software locked down under restrictive licensing, but Ellis makes it clear in his post that the market decided long ago.</p>\n<p>&#8220;Open source has won,&#8221; Ellis said. &#8220;It’s not even a contest anymore.&#8221;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 20 Nov 2018 21:21:16 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:13;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"WPTavern: Figma Partners with WordPress to Improve Design Collaboration\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85769\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://wptavern.com/figma-partners-with-wordpress-to-improve-design-collaboration\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3679:\"<p><a href=\"https://i0.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-19-at-8.43.27-PM.png?ssl=1\"><img /></a></p>\n<p><a href=\"https://www.figma.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Figma</a>, an online collaborative interface design tool, has donated an organizational membership to the WordPress project. The browser-based application helps designers and developers collaborate more efficiently and is used by organizations like Microsoft, Slack, and Uber. It provides design tools, prototyping, previews, and real-time feedback, all in the same place, and is often described as the &#8220;Google Docs for designing apps.&#8221;</p>\n<p>Figma aims to match the way designers work today in collaborative roles, with features like shared component libraries, versioning, live device preview, and Sketch import. It was created to offer &#8220;one single source of truth for design files.&#8221;</p>\n<p>&#8220;Where we may have used multiple tools in order to support all the parts of the design process, Figma incorporates many of the core features of other tools all in one product for a more efficient and powerful workflow,&#8221; Alexis Lloyd, Head of Design Innovation at Automattic, said in the <a href=\"https://make.wordpress.org/design/2018/11/19/figma-for-wordpress/\" rel=\"noopener noreferrer\" target=\"_blank\">announcement</a> on the make.wordpress design blog. &#8220;I’m excited about the possibilities for how Figma can make the WordPress design process more collaborative, robust, and efficient.&#8221;</p>\n<p>Figma launched in 2016 but has quickly gained popularity due to its seamless developer handoff exports and cross-platform compatibility. Many teams inside the WordPress community are already big fans of using Figma. 10up has been using the tool as part of the company&#8217;s design process. The <a href=\"https://10up.com/blog/2018/wordpress-wireframes-sketch/\" rel=\"noopener noreferrer\" target=\"_blank\">SketchPress</a> library that 10up created, a collection of WordPress admin interfaces, symbols, and icons, is in the process of being converted into a shared team library for Figma so that WordPress contributors can take advantage of it.</p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">We\'ve been using Figma at <a href=\"https://twitter.com/10up?ref_src=twsrc%5Etfw\">@10up</a> to improve collaboration across our team &amp; clients. Excited to see <a href=\"https://twitter.com/figmadesign?ref_src=twsrc%5Etfw\">@figmadesign</a> partnering w/ <a href=\"https://twitter.com/WordPress?ref_src=twsrc%5Etfw\">@WordPress</a> to make design more collaborative. Big thanks to <a href=\"https://twitter.com/apollo_ux?ref_src=twsrc%5Etfw\">@apollo_ux</a> for adapting <a href=\"https://twitter.com/hashtag/SketchPress?src=hash&ref_src=twsrc%5Etfw\">#SketchPress</a> to Figma as well! <a href=\"https://t.co/Lq2Poqexjj\">https://t.co/Lq2Poqexjj</a></p>\n<p>&mdash; Chris Wallace (@chriswallace) <a href=\"https://twitter.com/chriswallace/status/1064618129370873858?ref_src=twsrc%5Etfw\">November 19, 2018</a></p></blockquote>\n<p></p>\n<p>If you have held back on getting involved in designing for the WordPress project because of archaic collaboration tools, working with Figma may improve your contribution experience. Designers can get access to the WordPress.org Figma team by signing in with a WordPress.org Slack account using the <a href=\"https://www.figma.com/slack/642003996626140596/invite\" rel=\"noopener noreferrer\" target=\"_blank\">invitation link</a>. New users can upgrade their default &#8220;view&#8221; capabilities and get access to edit files by requesting permission in WordPress&#8217; #design Slack channel. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 20 Nov 2018 02:53:23 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:14;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"WPTavern: New Block Lab Plugin Makes it Easy to Create Custom Gutenberg Blocks\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85659\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://wptavern.com/new-block-lab-plugin-makes-it-easy-to-create-custom-gutenberg-blocks\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5435:\"<p><a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-19-at-10.25.08-AM.png?ssl=1\"><img /></a></p>\n<p><a href=\"https://getblocklab.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Block Lab</a> is a new tool that provides an admin interface and a templating system for creating custom Gutenberg blocks. Rob Stinson, Luke Carbis, and Rheinard Korf, all employees at <a href=\"https://xwp.co/\" rel=\"noopener noreferrer\" target=\"_blank\">XWP</a>, kicked off the project in their own time with the goal of removing the relatively steep barrier to block creation. The plugin is <a href=\"https://wordpress.org/plugins/block-lab/\" rel=\"noopener noreferrer\" target=\"_blank\">now available on WordPress.org</a> and Stinson said their target audience is WordPress developers ranging from junior to experienced.</p>\n<p>The Block Lab admin screen lets users select an icon for the custom block, enter keywords, and choose from a variety of input fields. </p>\n<p><a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2018/11/block-lab-admin.png?ssl=1\"><img /></a></p>\n<p>Rendering the custom blocks in the editor and on the frontend requires simple PHP functions that most WordPress developers are probably already familiar with. Here&#8217;s an example for a testimonial block from the <a href=\"https://github.com/getblocklab/block-lab/wiki/Displaying-custom-blocks\" rel=\"noopener noreferrer\" target=\"_blank\">plugin&#8217;s documentation</a>:</p>\n<pre class=\"brush: php; light: true; title: ; notranslate\">\n&lt;img src=\"&lt;?php block_field( \'profile-picture\' ); ?&gt;\" alt=\"&lt;?php block_field( \'author-name\' ); ?&gt;\" /&gt;\n&lt;h3&gt;&lt;?php block_field( \'author-name\' ); ?&gt;&lt;/h3&gt;\n&lt;p&gt;&lt;?php block_field( \'testimonial\' ); ?&gt;&lt;/p&gt;\n</pre>\n<p>The plugin makes it possible to build custom blocks in a matter of minutes, as demonstrated in the video below.</p>\n<p></p>\n<h3>Block Lab Puts Block Creation Inside the WordPress Admin</h3>\n<p>Block Lab differs from existing block creation tools in that it aims to provide a Gutenberg-first solution directly inside the WordPress admin. With the exception of the template creation, developers are not required to write any code when using it to create blocks.</p>\n<p>&#8220;Ahmad’s <a href=\"https://github.com/ahmadawais/create-guten-block\" rel=\"noopener noreferrer\" target=\"_blank\">create-gluten-block</a> is an excellent solution, but is more focused on streamlining block creation from the ground floor,&#8221; Stinson said. &#8220;As I understand, it’s a development framework. Block Lab is about letting the developer kick off from the 10th floor and does this by offering a super simple WP Admin and traditional templating  experience.&#8221;</p>\n<p>Stinson said <a href=\"https://wptavern.com/acf-5-8-beta-1-introduces-blocks-feature-release-slated-for-november\" rel=\"noopener noreferrer\" target=\"_blank\">ACF&#8217;s solution</a> was one of the inspirations for his team but that Block Lab tackles block creation from a different angle. </p>\n<p>&#8220;ACF is amazing as well &#8211; easily one of our all time favorite plugins and one that has inspired us,&#8221; Stinson said. &#8220;Block Lab is a Gutenberg-first solution. Where ACF is a meta data first solution. They both arrive at similar destinations but get there by very different means, both technically and as far as UX goes.&#8221;</p>\n<p>Developers and users who adopt Block Labs should be aware that if the plugin is deactivated, the custom blocks they created will also be deactivated. They are stored in the database and the templates are stored in the theme or child theme. Switching themes means users will lose the blocks as well.</p>\n<p>&#8220;Adding templates to a stand-alone plugin is the most effective way around this,&#8221; Stinson said. &#8220;Either way though, the templating is simple enough that copying template folders/files from one theme to another is pretty easy. I did this exact thing yesterday in about 5 minutes.&#8221;</p>\n<p>Data portability isn&#8217;t a guarantee for users right now, but Stinson said his team has some ideas about how they can reduce barriers even further to include an in-admin templating experience. </p>\n<p>Block Lab&#8217;s creators have plans to offer commercial extensions eventually, but at this stage they are focusing on solving the problem for users in the free plugin.</p>\n<p>&#8220;Once we better understand what folks are needing, we’ll find a way of gracefully offering premium stuff,&#8221; Stinson said.  </p>\n<p>There are still many unknowns about how the larger community of WordPress users will react to the upcoming 5.0 release, but Stinson is convinced that Gutenberg will have a positive impact on the plugin ecosystem and users&#8217; experiences with extensions.</p>\n<p>&#8220;Gutenberg is going to, ultimately, change things for the better in the plugin ecosystem,&#8221; he said. &#8220;There is no doubt it’s going to be bumpy for the first little while, but the net effect is that WordPress will have a better editing experience in general and one that gives plugin developers a stronger baseline for extending the editing experience. Even as we explore what we can do with Block Lab we’re discovering really cool things that we would never have thought of unless we just started using it. I think this will be the larger experience by most people in the WordPress community.&#8221;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 19 Nov 2018 21:41:17 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:15;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:94:\"WPTavern: Gutenberg is Coming to WordPress’ Mobile Apps, Beta Version Expected February 2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85696\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://wptavern.com/gutenberg-is-coming-to-wordpress-mobile-apps-beta-version-expected-february-2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3582:\"<p>The team working on integrating Gutenberg into WordPress&#8217; mobile apps is making progress, but users will not have access to the new editor in the apps until early 2019. Jorge Bernal, a mobile engineer at Automattic, <a href=\"https://make.wordpress.org/mobile/2018/11/15/gutenberg-in-the-apps-what-to-expect/\" rel=\"noopener noreferrer\" target=\"_blank\">posted an update</a> yesterday, highlighting current capabilities:</p>\n<blockquote><p>Gutenberg Mobile [is] working inside the apps and the first post published with it, the writing flow has improved so it’s starting to feel more like an editor and less like a collection of isolated blocks, we have a working toolbar in place, you can now select images from your media library.</p></blockquote>\n<p>If you are using one of the mobile apps and you attempt to edit a post that was created with Gutenberg, you will see a warning like the one below:</p>\n<p><a href=\"https://i0.wp.com/wptavern.com/wp-content/uploads/2018/11/Screenshot_20181116-170549.png?ssl=1\"><img /></a></p>\n<p>This doesn&#8217;t mean users cannot edit content in the mobile apps, but there will be inconsistencies while Gutenberg support is still in progress. </p>\n<p>I created some posts with Gutenberg and then went to edit them in the Android app. During my tests of switching back to the Gutenberg editor after saving some changes in the mobile app, I found that Gutenberg included the content but not the formatting options I had selected in the app. I received a warning about unexpected or invalid content. </p>\n<p><a href=\"https://i2.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-16-at-5.08.13-PM.png?ssl=1\"><img /></a></p>\n<p>The mobile apps team expects to ship an <a href=\"https://github.com/wordpress-mobile/gutenberg-mobile/milestone/4\" rel=\"noopener noreferrer\" target=\"_blank\">alpha release</a> to testers at the end of 2018, with basic capabilities like adding a heading, paragraph, and images from the media library:</p>\n<blockquote><p>We will have an alpha release at the end of the year that will showcase the editing flow with some selected basic blocks. We will have a basic integration with the apps, enough to be able to experience Gutenberg (via secret opt-in or special builds), but won’t be showing this to users. Being able to use early versions of Gutenberg directly in the apps will make it easier to gather feedback and do user testing.</p></blockquote>\n<p>A beta with support for the most common types of content is tentatively planned for February 2019. The team is aiming to make writing a post using Gutenberg Mobile as pleasant as it currently is with Aztec.</p>\n<p>&#8220;As Gutenberg rolls out to users on the web, we might see a good amount of users hitting problems trying to edit Gutenberg posts on Aztec,&#8221; Bernal said. &#8220;We have done (and keep doing) a lot of work to try to make that as good as possible, but there are limits to how compatible we can make the existing editor. We want to reduce the gap between Gutenberg launching and having a version in the apps, so we’re adjusting scope a bit to ship in February.&#8221;</p>\n<p>It will be interesting to see how Gutenberg support is presented in the apps. I imagine it will be challenging to improve upon the mobile apps&#8217; current editing experience, which is already fairly intuitive and streamlined. </p>\n<p>Users can follow along with the process and give feedback on the <a href=\"https://github.com/wordpress-mobile/gutenberg-mobile\" rel=\"noopener noreferrer\" target=\"_blank\">Gutenberg Mobile</a> GitHub repo.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 23:52:31 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:16;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"WPTavern: How WordPress Has Changed People’s Lives\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85710\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://wptavern.com/how-wordpress-has-changed-peoples-lives\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4877:\"<p>It&#8217;s Friday and we could probably all use a little more positivity in our lives, especially on social media. Morten Rand-Hendriksen recently <a href=\"https://twitter.com/mor10/status/1062839649498845186\">asked his followers</a> on Twitter how WordPress has changed their lives. Here are a couple of the responses that stood out to me.</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>As a beginner web designer, who was struggling to find a job/work, WordPress opened the door to web development and enabled me  to offer clients control over their websites. That was nearly 10 years ago and I’ve been building with WP ever since. </p><cite><a href=\"https://twitter.com/keithdevon/status/1062978809090228225\">Keith Devon</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>I graduated in 2008 right into the thick of the recession. No jobs, nothing &#8211; the only way I could put food on the table and pay rent was to build WordPress sites for people. This led to my entire career in UX design, and my life would be very very different without WordPress.</p><cite><a href=\"https://twitter.com/scotsullivan/status/1063158394809393152\">Scott Sullivan</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Here&#8217;s one you won&#8217;t expect. I was in an agency job I hated. I had an interview with Automattic and failed. Devastated, it forced me to look at what I really wanted. I now have my own consultancy.</p><cite><a href=\"https://twitter.com/mrwiblog/status/1062976260182368257\">Chris Taylor</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>I&#8217;d been working in the social field for more than 30 years. In 2015 I had to change and decided to work in the digital world. I casually met the Turin Meetup community and joined them. Then I started to contribute to the Polyglots team. Now, I&#8217;m one of the Italian GTE</p><cite><a href=\"https://twitter.com/lausacco/status/1063076968051232768\">Laurasacco</a></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>I&#8217;d been working for a hosting company and noticed how many of our users were enjoying it. Decided to go to WordCamp in 2008. The software was great, but the community was what really drew me in. I&#8217;ve been using WordPress in my career ever since then.</p><cite><a href=\"https://twitter.com/supernovia/status/1062926352511160320\">Ms. Velda</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Made a WP website for a friend, then another, then someone who paid me&#8230; Today is 6 years and 120 clients later.<br /></p><cite><a href=\"https://twitter.com/Sara11D/status/1063032808669614080\">Sara Dunn</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>#<strong>WCSEA</strong> and specifically <a href=\"https://twitter.com/adspedia\">@<strong>adspedia</strong></a> reminded me that WordPress is about the inspiring people I meet at so many occasions. Beautiful minds &amp; souls who inspired me to build a new and better life 2 years ago. It’s way more than software and individual ego.</p><cite><a href=\"https://twitter.com/CaroleOlinger/status/1062991590199832576\">Carole Olinger</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>I started by own consultancy doing WordPress for nonprofits straight out of college. Somehow, I&#8217;m still here and still loving it almost a decade later. Meetups and WordCamps (<a href=\"https://twitter.com/hashtag/wcsea?src=hash\">#<strong>wcsea</strong></a>!) were so crucial to my learning, developing as a speaker, and networking.</p><cite><a href=\"https://twitter.com/MRWweb/status/1062858131988828160\">Mark Root-Wiley</a><br /></cite></blockquote>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>I started working with <a href=\"https://twitter.com/hashtag/WordPress?src=hash\">#<strong>WordPress</strong></a> in 2012 after my business was sold out from under me by a ‘partner&#8217;. I ended up losing everything. Developing WordPress sites contributed to getting my Family out of debt, back on our feet. <a href=\"https://twitter.com/mor10\">@<strong>Mor10</strong></a> you&#8217;ve been an inspiration along the way&#8230;</p><cite><a href=\"https://twitter.com/d8m18n/status/1063203958485803009\">Damian Saunders</a><br /></cite></blockquote>\n\n\n\n<p>There&#8217;s always a lot happening in the WordPress ecosystem and every once in awhile, it&#8217;s nice to step back to see how this software, which is used by millions of people across the world, is impacting  lives.<br /></p>\n\n\n\n<p>I highly encourage you to read <a href=\"https://twitter.com/mor10/status/1062839649498845186\">the thread</a> in its entirety.  If you&#8217;d like to read similar, more in-depth content, check out <a href=\"https://heropress.com/\">HeroPress</a>. HeroPress publishes inspirational essays from members of the community once a month. <br /></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 22:25:47 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:17;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"WPTavern: WordPress 5.0 Beta 5 Adds Permalink Editing to the Document Sidebar\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85671\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:97:\"https://wptavern.com/wordpress-5-0-beta-5-released-adds-permalink-editing-to-the-document-sidebar\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2257:\"<div class=\"wp-block-image\"><img />Permalink Panel</div>\n\n\n\n\nWordPress 5.0 Beta 5 <a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-5/\">is available</a> for testing and includes all of the block editor changes that are in <a href=\"https://make.wordpress.org/core/2018/11/15/whats-new-in-gutenberg-15th-november-2/\">Gutenberg 4.4</a>. One of the major changes in this release is the addition of a Permalink panel that is in the Document sidebar. \n\n\n\nThe <a href=\"https://github.com/WordPress/gutenberg/pull/11874\">panel was added</a> based on user feedback  that the UI for editing the permalink is difficult to discover and buggy. This method of editing the permalink does not replace the existing method of clicking the title block. \n\n\n\nIn beta 5, developers can now <a href=\"https://github.com/WordPress/gutenberg/pull/11802\">remove panels</a> from the document sidebar. However, if you want to add panels to the sidebar, there is <a href=\"https://github.com/WordPress/gutenberg/pull/11802#issuecomment-439370494\">currently no way</a> to do it.\n\n\n\nHandling images has <a href=\"https://github.com/WordPress/gutenberg/pull/11846\">been improved</a> in beta 5 as images now take up the right amount of space in themes with wider editors. <a href=\"https://github.com/WordPress/gutenberg/pull/10333\">Hover styles</a> for mobile devices are disabled and the i18n module <a href=\"https://github.com/WordPress/gutenberg/pull/11493\">was refactored</a> to take advantage of performance improvements. \n\n\n\nIf WordPress 5.0 is released before the end of the year, it will include <a href=\"https://make.wordpress.org/core/2018/10/15/wordpress-and-php-7-3/\">PHP 7.3 compatibility fixes</a>. If 5.0 is delayed until next year, these compatibility fixes <a href=\"https://wptavern.com/wordpress-4-9-9-release-may-shift-focus-to-php-7-3-compatibility-gutenberg-merge-proposal-timeline-tbd\">will be released</a> in a minor WordPress update before the end of this year.\n\n\n\nWordPress 5.0 RC 1 is scheduled to be released on Monday, November 19th, with 5.0 final scheduled to be released November 27th. If you think you&#8217;ve discovered a bug, please report it in the  <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta support forums</a>. <br />\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 20:51:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:18;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:95:\"WPTavern: WordPress Accessibility Team to Host Hackathon with Deque Systems at WordCamp US 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85636\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:106:\"https://wptavern.com/wordpress-accessibility-team-to-host-hackathon-with-deque-systems-at-wordcamp-us-2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4651:\"<p>WordPress&#8217; Accessibility team will be <a href=\"https://make.wordpress.org/accessibility/2018/11/15/hackathon-automated-accessibility-testing-with-deque-on-the-wcus-contributor-day/\" rel=\"noopener noreferrer\" target=\"_blank\">hosting a hackathon at Contributor Day</a> on Sunday, December 9, at WordCamp US in Nashville. The team will be joined by lead developers from <a href=\"https://www.deque.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Deque Systems</a>, a widely respected accessibility firm in the industry, with the goal of setting up automated accessibility testing for WordPress core.</p>\n<p>The event has been in planning since JSconf EU 2018 in June when <a href=\"https://twitter.com/miss_jwo\" rel=\"noopener noreferrer\" target=\"_blank\">Jenny Wong</a> met with <a href=\"https://twitter.com/caitlinthefirst\" rel=\"noopener noreferrer\" target=\"_blank\">Caitlin Cashin</a> from Deque. They discussed how Deque could help WordPress with their accessibility expertise at WordCamp US. Rian Rietveld worked with Aaron Campbell, who is organizing the WCUS contributor day, to put the hackathon in motion.</p>\n<p>Deque&#8217;s site is built on WordPress and the company specializes in helping teams get hooked up with automation tools. The company created <a href=\"https://www.deque.com/axe/\" rel=\"noopener noreferrer\" target=\"_blank\">aXe</a>, an open source library and testing engine that can be customized to integrate with all modern browsers and testing frameworks. Deque <a href=\"https://wptavern.com/axe-an-open-source-javascript-library-for-automating-accessibility-testing\" rel=\"noopener noreferrer\" target=\"_blank\">open sourced aXe in 2015</a> and the team was invited to contribute the library to the <a href=\"http://www.w3.org/WAI/ER/2015/draft-charter-3\" rel=\"noopener noreferrer\" target=\"_blank\">W3C WAI Evaluation and Repair Tools Working Group</a>, when the group worked to develop a normative set of rules for evaluating WCAG 2.0 conformance.</p>\n<p>Deque is volunteering their lead developers to help WordPress make improvements to its development workflow. The company has hosted similar hackathons in the past.</p>\n<p>&#8220;By focusing primarily on projects with broad adoption, accessibility fixes have potential to trickle down to every website or web application including that library,&#8221; Deque Developer Advocate Marcy Sutton said after the <a href=\"https://www.deque.com/blog/highlights-takeaways-2nd-annual-axe-hackathon/\" rel=\"noopener noreferrer\" target=\"_blank\">2017 aXe hackathon in San Diego</a>. &#8220;Ultimately, this kind of work will have the most impact on the lives of people with disabilities, as it contributes to the creation of a more accessible workplace environment. A more accessible web also means a better user experience for everyone, part of the reason why digital accessibility is so important.&#8221;</p>\n<p>In order for the hackathon at WordCamp US to be successful, Deque will need to connect to contributors who can collaborate on setting up automated testing.</p>\n<p>&#8220;From the WordPress side we would like to invite core developers to join in and help find solutions to set this up,&#8221; Accessibility Team rep Jean-Baptiste Audras said. He and contributor Rachel Cherry will be representing the accessibility team during the hackathon and they need help from core committers who know their way around the automated testing system in WordPress core. Audras also said the team will need help from Gutenberg contributors.</p>\n<p>&#8220;The tools can/will provide automated tests for the block editor since it&#8217;s based on testing the DOM (Document Object Model) of each admin screen generated by WordPress,&#8221; he said. &#8220;But we have to build it together with the people involved in Gutenberg to see how we can handle it the best way.&#8221;</p>\n<p>Audras said the Gutenberg phase 2 release leads have already been in touch with the accessibility team and communication across teams is improving.</p>\n<p>&#8220;If we find a technical solution, there should ideally not be technical problems to implement it,&#8221; Audras said. &#8220;As usual, it will be a question of priority and communication. I am confident that Gutenberg developers will be interested to add some automated checks to the Gutenberg stack.&#8221;</p>\n<p>Audras said he doesn&#8217;t know when the automated tests for accessibility will be operational but he believes they will be very helpful in the future, especially in cases where new releases are being put out quickly. Anyone interested to contribute to the effort can get in touch on WordPress Slack&#8217;s #accessibility channel.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 15:39:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:19;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"BuddyPress: BuddyPress 4.0.0 Release Candidate 1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://buddypress.org/?p=281885\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:68:\"https://buddypress.org/2018/11/buddypress-4-0-0-release-candidate-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1216:\"<p>BP 4.0.0 Release Candidate 1 is now available. This package contains the code that we think we&#8217;ll ship as BuddyPress 4.0.0 later in November. If you build BuddyPress plugins or themes, you&#8217;re encouraged to give the RC a thorough look in a test environment.</p>\n<p>Important changes in 4.0.0 include:</p>\n<ul>\n<li>BuddyPress data exporters (for WP 4.9.6+), including a new &#8216;Export Data&#8217; Settings subtab, where users can request an export from the front end</li>\n<li>Integration into the WordPress privacy policy system (for WP 4.9.6+)</li>\n<li>Improvements to Nouveau and other BP interfaces on mobile devices</li>\n<li>Bug fixes for emails, Nouveau, BP&#8217;s nav tools</li>\n<li>Improved compatibility with WP 4.9.x and 5.0</li>\n</ul>\n<p>See the <a href=\"https://buddypress.trac.wordpress.org/query?group=status&milestone=4.0\">4.0.0 milestone</a> for more info.</p>\n<p>Download the 4.0.0 release candidate from wordpress.org: <a href=\"https://downloads.wordpress.org/plugin/buddypress.4.0.0-RC1.zip\">https://downloads.wordpress.org/plugin/buddypress.4.0.0-RC1.zip</a>. As always, remember that this is pre-release software, and we don&#8217;t recommend running it on a production site.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 03:05:55 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Boone Gorges\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:20;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Dev Blog: WordPress 5.0 Beta 5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6250\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-5/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4742:\"<p>WordPress 5.0 Beta 5 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test this WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta5.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p><strong>Reminder: the WordPress 5.0 release date has changed</strong>. It is now scheduled for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 27</a>, and we need your help to get there. Here are some of the big issues that we’ve fixed since Beta 4:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>The block editor has been updated to match the <a href=\"https://make.wordpress.org/core/2018/11/15/whats-new-in-gutenberg-15th-november-2/\">Gutenberg 4.4 release</a>, the major changes  include:</p>\n\n\n\n<ul><li>&nbsp;A <a href=\"https://github.com/WordPress/gutenberg/pull/11874\">permalink panel has been added to the document sidebar</a> to make it easier to find.</li><li>Editor document panels can now be <a href=\"https://github.com/WordPress/gutenberg/pull/11802\">programmatically removed</a>.</li><li>The uploading indicator for images and galleries has been replaced with a&nbsp;<a href=\"https://github.com/WordPress/gutenberg/pull/11876\">spinner and faded out image</a>.</li><li>The text and code editing blocks will now <a href=\"https://github.com/WordPress/gutenberg/pull/11750\">use the full width of the editor</a>.</li><li>Image handling has been improved. Images now  take up the right amount of space for <a href=\"https://github.com/WordPress/gutenberg/pull/11846\">themes with wider editors</a> (like Twenty Nineteen).<br /></li><li>Hover styles are now <a href=\"https://github.com/WordPress/gutenberg/pull/10333\">correctly disabled for mobile devices</a>.</li><li>The i18n module has been refactored to benefit from <a href=\"https://github.com/WordPress/gutenberg/pull/11493\">significant performance gains</a>.</li></ul>\n\n\n\n<p>Additionally, there have been some pesky bugs fixed:</p>\n\n\n\n<ul><li>Better handling for <a href=\"https://github.com/WordPress/gutenberg/pull/11590\">links without an href</a> attribute, which were showing as <code>undefined</code>.</li><li>Japanese text (double byte characters) are <a href=\"https://github.com/WordPress/gutenberg/pull/11908\">now usable in the list block</a>.</li><li>Better handling for different text encodings (e.g. emoji) within a block <a href=\"https://github.com/WordPress/gutenberg/pull/11771\">in block validation</a>.</li></ul>\n\n\n\n<p>A full list of changes can be found in the <a href=\"https://make.wordpress.org/core/2018/11/15/whats-new-in-gutenberg-15th-november-2/\">Gutenberg 4.4 release post</a>.<br /></p>\n\n\n\n<h2>PHP 7.3 Support</h2>\n\n\n\n<p>The final known PHP 7.3 compatibility issue has been fixed. You can brush up on what you need to know about PHP 7.3 and WordPress by checking out the <a href=\"https://make.wordpress.org/core/2018/10/15/wordpress-and-php-7-3/\">developer note on the Make WordPress Core blog</a>.<br /></p>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Work on making Twenty Nineteen ready for prime time continues on its <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>. This update includes <a href=\"https://core.trac.wordpress.org/changeset/43904\">a host of tweaks and bug fixes</a>, including:</p>\n\n\n\n<ul><li>Add <code>.button</code> class support.</li><li>Fix editor font-weights for headings.</li><li>Improve support for sticky toolbars in the editor.</li><li>Improve text-selection custom colors for better contrast and legibility.</li><li>Fix editor to prevent Gutenberg&#8217;s meta boxes area from overlapping the content.</li></ul>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 01:09:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Jonathan Desrosiers\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:21;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:135:\"WPTavern: Full Gutenberg Compatibility Coming Soon to Automattic’s Free Themes on WordPress.org, Including Storefront for WooCommerce\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85613\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:142:\"https://wptavern.com/full-gutenberg-compatibility-coming-soon-to-automattics-free-themes-on-wordpress-org-including-storefront-for-woocommerce\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3720:\"<p>If your site is hosted on <a href=\"http://WordPress.com\" rel=\"noopener noreferrer\" target=\"_blank\">WordPress.com</a> and you are trying out the new Gutenberg editor, there are currently <a href=\"https://github.com/Automattic/themes\" rel=\"noopener noreferrer\" target=\"_blank\">24 themes with full Gutenberg support</a> available and more on the way. In response to questions about how to find Gutenberg themes on WordPress.com, <a href=\"https://themeshaper.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Automattic&#8217;s Theme Team</a> has <a href=\"https://twitter.com/MRWweb/status/1062491404373356544\" rel=\"noopener noreferrer\" target=\"_blank\">given an update</a> about the status of the .com themes, as well as the company&#8217;s free themes on WordPress.org.</p>\n<p>There is currently no way to search for Gutenberg-ready themes on WordPress.com themes because there is no filter set up for this. However, the team said users should not any experience any issues with themes breaking with the new editor:</p>\n<blockquote><p>All existing themes should still work with Gutenberg. At worst styles in the editor might not exactly match styles on the site itself, and styling for individual blocks might cause conflicts if the theme treats that type of content in a specific way. But that is true of all WordPress themes, not just the ones on WordPress.com.</p></blockquote>\n<p>Users can activate any theme they want with Gutenberg. The new editor is not going to break any themes, but a theme does need to <a href=\"https://wordpress.org/gutenberg/handbook/extensibility/theme-support/\" rel=\"noopener noreferrer\" target=\"_blank\">add support</a> for users to take advantage of specific features like wide alignments and block color palettes. Gutenberg-ready themes also include editor styles to ensure a consistent editing experience between frontend and backend.</p>\n<p>Automattic is also working to bring some of those updates from its current set of Gutenberg-ready themes to its free themes hosted on WordPress.org. The company has <a href=\"https://wordpress.org/themes/author/automattic/\" rel=\"noopener noreferrer\" target=\"_blank\">109 themes</a> in the directory, which have cumulatively been downloaded more than <a href=\"http://wptally.com/?wpusername=automattic\" rel=\"noopener noreferrer\" target=\"_blank\">17 million times</a>. The majority of its more popular themes fall into the business category, such as <a href=\"https://wordpress.org/themes/dara/\" rel=\"noopener noreferrer\" target=\"_blank\">Dara</a> (10K active installs), <a href=\"https://wordpress.org/themes/argent/\" rel=\"noopener noreferrer\" target=\"_blank\">Argent</a> (10K), <a href=\"https://wordpress.org/themes/edin/\" rel=\"noopener noreferrer\" target=\"_blank\">Edin</a> (6K), and <a href=\"https://wordpress.org/themes/karuna/\" rel=\"noopener noreferrer\" target=\"_blank\">Karuna (5K)</a>. Several of these themes are already Gutenberg-ready with the code <a href=\"https://github.com/Automattic/themes\" rel=\"noopener noreferrer\" target=\"_blank\">available on GitHub</a>.</p>\n<p><a href=\"https://wordpress.org/themes/storefront/\" rel=\"noopener noreferrer\" target=\"_blank\">Storefront</a> is by far Automattic&#8217;s most popular free theme on WordPress.org with 200,000+ installs and is well on its way towards being ready to support Gutenberg&#8217;s new features. Development towards this goal is <a href=\"https://github.com/woocommerce/storefront/tree/feature/gutenberg\" rel=\"noopener noreferrer\" target=\"_blank\">happening on GitHub</a>. Users can run beta versions of the Storefront theme ahead of time using the <a href=\"https://github.com/seb86/Storefront-Beta-Tester\" rel=\"noopener noreferrer\" target=\"_blank\">Storefront Beta Tester</a> plugin.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Nov 2018 00:27:19 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:22;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"WPTavern: WPWeekly Episode 338 – Inflation, WordPress Release Dates, WP GDPR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"https://wptavern.com?p=85642&preview=true&preview_id=85642\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:83:\"https://wptavern.com/wpweekly-episode-338-inflation-wordpress-release-dates-wp-gdpr\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1871:\"<p>In this episode, <a href=\"http://jjj.me\">John James Jacoby</a> and I discuss the news of the week. We talk about the delayed release of WordPress 5.0 and which day would be a suitable release date. We share our opinions on Matt&#8217;s answers from his Q&amp;A appearance at WordCamp in Portland, Oregon. We also talk about the changes in WordPress core development, Automatticians in leadership roles, and last, but not least, WordCamp budgeting.</p>\n<h2>Stories Discussed:</h2>\n<p><a href=\"https://wptavern.com/wordpress-5-0-release-date-update-to-november-27\">WordPress 5.0 Release Date Update to November 27</a></p>\n<p><a href=\"https://wptavern.com/matt-mullenweg-addresses-controversies-surrounding-gutenberg-at-wordcamp-portland-qa\">Matt Mullenweg Addresses Controversies Surrounding Gutenberg at WordCamp Portland Q&amp;A</a></p>\n<p><a href=\"https://wptavern.com/wp-gdpr-compliance-plugin-patches-privilege-escalation-vulnerability\">WP GDPR Compliance Plugin Patches Privilege Escalation Vulnerability</a></p>\n<p><a href=\"https://wptavern.com/maximum-ticket-prices-for-wordcamps-will-increase-to-25-per-day-in-2019\">Maximum Ticket Prices for WordCamps Will Increase to $25 per Day in 2019</a></p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, November 21st 3:00 P.M. Eastern</p>\n<p>Subscribe to <a href=\"https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738\">WordPress Weekly via Itunes</a></p>\n<p>Subscribe to <a href=\"https://www.wptavern.com/feed/podcast\">WordPress Weekly via RSS</a></p>\n<p>Subscribe to <a href=\"http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr\">WordPress Weekly via Stitcher Radio</a></p>\n<p>Subscribe to <a href=\"https://play.google.com/music/listen?u=0#/ps/Ir3keivkvwwh24xy7qiymurwpbe\">WordPress Weekly via Google Play</a></p>\n<p><strong>Listen To Episode #338:</strong><br />\n</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 15 Nov 2018 17:23:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:23;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:80:\"WPTavern: NextGEN Gallery Plugin to Add Gutenberg Support Ahead of WordPress 5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85609\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:91:\"https://wptavern.com/nextgen-gallery-plugin-to-add-gutenberg-support-ahead-of-wordpress-5-0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4139:\"<p>If you&#8217;re a <a href=\"https://wordpress.org/plugins/nextgen-gallery/\" rel=\"noopener noreferrer\" target=\"_blank\">NextGEN Gallery plugin</a> user and have been wondering about Gutenberg compatibility, Imagely CEO Erick Danzer announced today that the plugin will ship a gallery block in a release planed for next week. The plugin is currently used on nearly a million WordPress sites (900,000+ active installs). NextGEN Gallery&#8217;s Gutenberg block has been in <a href=\"https://www.imagely.com/gutenberg-block/\" rel=\"noopener noreferrer\" target=\"_blank\">beta testing since May</a> and the plugin will support users who update to use the new editor as well as those who stick with the Classic Editor plugin.</p>\n<p>In a post titled &#8220;<a href=\"https://www.imagely.com/defer-gutenberg/\" rel=\"noopener noreferrer\" target=\"_blank\">A Plea to Defer the Release of Gutenberg</a>,&#8221; Danzer outlined his concerns with the timeline for WordPress 5.0. His thoughts echo many other prominent members of the development community who have written their own <a href=\"https://wptavern.com/calls-to-delay-wordpress-5-0-increase-developers-cite-usability-concerns-and-numerous-bugs-in-gutenberg\" rel=\"noopener noreferrer\" target=\"_blank\">calls to delay the release</a>. He cites feedback on WordPress.org and urges the Gutenberg team not to discount the validity of these reviews:</p>\n<blockquote><p>Some people have been dismissive of those reviews and questioned whether they are a legitimate reflection of user experiences with Gutenberg. The reviews often lack detail and can be quite harsh.</p>\n<p>But that’s the experience of ALL plugin developers on the WordPress repository. Gutenberg is being reviewed in precisely the same way as every other plugin on the repository. If any other major plugin maintained a 2.3 star rating and refused to accept the feedback as legitimate, it would not be a major plugin for long.</p>\n<p>Even without detail, reviews on the repository represent a fair reflection of overall user feelings about a plugin. In the case of Gutenberg, it is clear the plugin is not ‘wowing’ potential users.</p></blockquote>\n<p>Danzer also referenced a release the NextGEN Gallery team shipped in 2013 that included &#8220;major and breaking changes&#8221; that had been &#8220;tested aggressively but in limited ways.&#8221; This release broke an estimated 10 percent of the plugin&#8217;s installations as well as compatibility with many extensions. It has had a lasting impact on NextGEN&#8217;s reputation for the past five years. Danzer said he fears WordPress may be headed in the same direction, except at a much larger scale.</p>\n<p>As a postscript to his plea, Danzer assured users reading his post that NextGEN Gallery will have support for Gutenberg in time for the WordPress 5.0 release:</p>\n<blockquote><p>Despite the concerns expressed in this post, I want to assure NextGEN Gallery users that we&#8217;ll be ready regardless of the final release decision for Gutenberg. We&#8217;ll be officially  in the next week. We&#8217;ve tested and ensured that your existing galleries will work when you update. We&#8217;ve developed our block so that if you add galleries via Gutenberg, they will continue to work if you roll back or install the classic editor. And we&#8217;ll have all hands on deck to deal with any issues that arise when Gutenberg is released.</p></blockquote>\n<p>NextGEN Gallery&#8217;s Gutenberg support includes a block that launches a modal where users can select a gallery to insert. Unless it has significantly changed from the <a href=\"https://www.youtube.com/watch?v=ZCazFfYz49s\" rel=\"noopener noreferrer\" target=\"_blank\">beta preview video</a> published, the gallery block doesn&#8217;t seem to offer a preview of the gallery inside the Gutenberg editor once it has been selected and placed within the content. Users who want to test the beta version of Gutenberg support in the plugin can download the latest from the <a href=\"https://www.imagely.com/wordpress-gallery-plugin/nextgen-gallery/beta/\" rel=\"noopener noreferrer\" target=\"_blank\">NextGEN Gallery beta page</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 14 Nov 2018 23:54:51 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:24;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"WPTavern: Drupal Gutenberg Showcased at DrupalCamp Oslo 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85542\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://wptavern.com/drupal-gutenberg-showcased-at-drupalcamp-oslo-2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4727:\"<p>Gutenberg appreciation is running high across the CMS pond in the Drupal world. DrupalCamp Oslo 2018, Norway&#8217;s biggest national camp to date, was held over the weekend. The event featured two sessions on Gutenberg &#8211; one for site builders and one for block developers. <a href=\"https://www.frontkom.no/\" rel=\"noopener noreferrer\" target=\"_blank\">Frontkom</a>, the team behind <a href=\"https://drupalgutenberg.org/\" rel=\"noopener noreferrer\" target=\"_blank\">Drupal Gutenberg</a>, took home two <a href=\"https://splashawards.org/\" rel=\"noopener noreferrer\" target=\"_blank\">Splash Awards</a> for &#8220;Best Module&#8221; and &#8220;Best Integration&#8221; for 2018.</p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">The Splash Awards for Best integration and Best module was awarded to Drupal Gutenberg this weekend @ <a href=\"https://twitter.com/hashtag/dcoslo?src=hash&ref_src=twsrc%5Etfw\">#dcoslo</a>! Big smile from <a href=\"https://twitter.com/perandre?ref_src=twsrc%5Etfw\">@perandre</a> on behalf of the <a href=\"https://twitter.com/frontkom?ref_src=twsrc%5Etfw\">@frontkom</a> team. <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f3c6.png\" alt=\"🏆\" class=\"wp-smiley\" /><img src=\"https://s.w.org/images/core/emoji/11/72x72/1f3c6.png\" alt=\"🏆\" class=\"wp-smiley\" /> <a href=\"https://t.co/Sx0NLv3rWY\">pic.twitter.com/Sx0NLv3rWY</a></p>\n<p>&mdash; drupalgutenberg (@drupalgutenberg) <a href=\"https://twitter.com/drupalgutenberg/status/1061973657470337024?ref_src=twsrc%5Etfw\">November 12, 2018</a></p></blockquote>\n<p></p>\n<p>The <a href=\"https://wptavern.com/gutenberg-cloud-plugin-for-wordpress-is-now-in-beta\" rel=\"noopener noreferrer\" target=\"_blank\">Cloud Blocks plugin for WordPress</a> was released in beta two weeks ago to begin testing the Gutenberg Cloud API, which enables blocks to be shared across CMS&#8217;s. The Drupal version of this connector plugin was introduced at DrupalCamp Oslo. Frontkom&#8217;s Per André Rønsen and Thor Andre Gretland hosted a session called &#8220;Build your pages build with Drupal Gutenberg&#8221; where they gave attendees a look at Gutenberg Cloud for D8. It runs as submodule of Drupal Gutenberg.</p>\n<p><a href=\"https://cloudup.com/c5wZ7ylbkvN\"><img src=\"https://i2.wp.com/cldup.com/9giVOkXdC3.gif?resize=627%2C407&ssl=1\" alt=\"Drupal pagebuilder gutenberg\" width=\"627\" height=\"407\" /></a></p>\n<h3>Changes Coming to Gutenberg Cloud: All Blocks Will Undergo Code Review before Publishing</h3>\n<p>One of the speakers at the event was a member of the Drupal.org security team. Rønsen said after their session they had good participation during the Q&amp;A time.</p>\n<p>&#8220;There was some push back on Gutenberg Cloud for letting any developer add new blocks,&#8221; Rønsen said. &#8220;We explained that this is only during beta phase, and that we do code review of new blocks coming in. However, this led to the decision of switching to white listing instead. Starting next week, block authors will need to email us and ask for code review before we accept the blocks. This will go hand in hand with an upcoming browser on gutenbergcloud.org  – meaning each block will get it&#8217;s own little landing page online. We think this will be useful for people to see how Gutenberg Cloud can be useful for their site.&#8221;</p>\n<p>Overall, the Frontkom team saw a positive reception to Gutenberg Cloud at DrupalCamp Oslo and they are working to incorporate some of the valuable feedback they received.</p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">Totally impressed by <a href=\"https://twitter.com/drupalgutenberg?ref_src=twsrc%5Etfw\">@drupalgutenberg</a> demo at <a href=\"https://twitter.com/hashtag/dcoslo?src=hash&ref_src=twsrc%5Etfw\">#dcoslo</a>. Good work <a href=\"https://twitter.com/frontkomtech?ref_src=twsrc%5Etfw\">@frontkomtech</a> <a href=\"https://twitter.com/hashtag/drupalgutenberg?src=hash&ref_src=twsrc%5Etfw\">#drupalgutenberg</a> <a href=\"https://twitter.com/hashtag/drupalnorge?src=hash&ref_src=twsrc%5Etfw\">#drupalnorge</a> <a href=\"https://t.co/qXbX8mXhnp\">pic.twitter.com/qXbX8mXhnp</a></p>\n<p>&mdash; Baddy Sonja Breidert (@baddysonja) <a href=\"https://twitter.com/baddysonja/status/1060881025813934085?ref_src=twsrc%5Etfw\">November 9, 2018</a></p></blockquote>\n<p></p>\n<p>&#8220;The interest was amazing,&#8221; Rønsen said. &#8220;This week, we&#8217;ve been in contact with two big dev teams who wants to help out getting the Drupal module a stable release.&#8221;</p>\n<p>The session for site builders was not filmed but there is an unofficial video from the developer day where Frontkom&#8217;s Marco Fernandes and Frank Gjertsen gave a technical session on how to build custom blocks.</p>\n<p></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 14 Nov 2018 19:56:06 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:25;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"WPTavern: Maximum Ticket Prices for WordCamps Will Increase to $25 per Day in 2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85570\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"https://wptavern.com/maximum-ticket-prices-for-wordcamps-will-increase-to-25-per-day-in-2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4485:\"<p>For the last seven years, the maximum amount of money WordCamp organizers could charge for ticket prices was $20 per day. In 2019, this <a href=\"https://make.wordpress.org/community/2018/11/12/increase-in-wordcamp-maximum-ticket-price-for-2019/\">will increase</a> to $25 per day.</p>\n<p>The new amount accounts for inflation and provides breathing room for organizers. According to the Bureau of Labor Statistics <a href=\"https://data.bls.gov/cgi-bin/cpicalc.pl?cost1=20.00&year1=200601&year2=201808\">inflation calculator</a>, $20 in January of 2006 is equal to $25.51 in October of 2018.</p>\n<p>Organizers don&#8217;t have to charge this amount and are encouraged to keep the ticket price as low as possible. The increase is also part of a delicate balancing act between not being a financial burden and getting 80% or more of attendees to show up.</p>\n<p>&#8220;The ticket price does not reflect on the value of the event,&#8221; Andrea Middleton, Community organizer said.</p>\n<p>&#8220;In an ideal world, all WordCamp tickets would be free just like WordPress is free but to avoid organizing a conference for 500 registrants and only having 50 people show up on the day of the event, we <a href=\"https://make.wordpress.org/community/handbook/wordcamp-organizer/planning-details/selling-tickets/#the-reasons-behind-pricing-tickets-as-low-as-possible\">charge as little as we possibly can</a> for tickets, but just enough that people will show up for the event if they’re sleepy that morning or got a last-minute invitation to a pool party or something.&#8221;</p>\n<p>When the <a href=\"https://make.wordpress.org/community/2018/09/17/proposal-to-increase-the-maximum-ticket-price-for-wordcamps/\">proposal </a>to increase the maximum ticket price was published in September, many commenters approved of the increase with <a href=\"https://make.wordpress.org/community/2018/09/17/proposal-to-increase-the-maximum-ticket-price-for-wordcamps/#comment-25918\">some suggesting</a> an even higher amount to account for inflation for the next few years. <a href=\"https://make.wordpress.org/community/2018/09/17/proposal-to-increase-the-maximum-ticket-price-for-wordcamps/#comment-25885\">Ian Dunn questioned</a> whether or not budget shortfalls were due to organizing teams spending money on extra things.</p>\n<p>&#8220;Beyond that, though, I’m curious why camps are having more trouble today than they were 5 or even 10 years ago?&#8221; Dunn said.</p>\n<p>&#8220;Is it harder to get sponsorships? It seems like the opposite is true, especially given how much the global sponsorship program covers.</p>\n<p>&#8220;Based on experiences in my local community, I suspect that the primary reason for budget shortfalls is that the organizing team is choosing to do extra things, beyond what’s necessary to meet the goals of a WordCamp. For example, holding after-parties at trendy venues, expensive speaker gifts, professional A/V (which I’ve advocated for in the past, but not at the cost of higher ticket prices), etc.&#8221;</p>\n<p>It is interesting to ponder how much money WordCamps could save globally by eliminating the materialistic aspects of the event such as t-shirts, speaker gifts, lanyards, badges, signs, etc.</p>\n<p>At there core, WordCamps are about gathering the local community together in a physical location to share knowledge. Not every WordPress event needs to mimic WordCamp US or WordCamp Europe, two of the largest events in the world.</p>\n<p>Although the WordPress Community team tracks data such as how much each WordCamp charges for ticket prices, the information is not readily available. This is because of the large volume of data that would need to be calculated and displayed. It would be interesting to see an info-graphic of this data where you can compare the average ticket price for WordCamps per country.</p>\n<p>Hugh Lashbrooke, a WordPress Community team contributor who has access to the data says that, &#8220;globally the majority of camps have lower prices.&#8221;</p>\n<p>WordCamp organizers are highly encouraged to <a href=\"https://make.wordpress.org/community/handbook/wordcamp-organizer/first-steps/web-presence/using-camptix-event-ticketing-plugin/#tracking-attendance\">keep track</a> of attendance as the data is used to help make better informed decisions. The team will review the no-show rates at WordCamps at the end of 2019 to determine if the price increase had any effect. If not, the team may increase the price again for 2020.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 14 Nov 2018 19:25:47 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:26;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"WPTavern: Google Developers Demo AMP Stories Integration with Gutenberg at Chrome Dev Summit\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85548\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:103:\"https://wptavern.com/google-developers-demo-amp-stories-integration-with-gutenberg-at-chrome-dev-summit\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2929:\"<p><a href=\"https://i2.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-13-at-1.18.48-PM.png?ssl=1\"><img /></a></p>\n<p>Alberto Medina and Weston Ruter gave a presentation on Progressive Content Management Systems yesterday at <a href=\"https://developer.chrome.com/devsummit/\" rel=\"noopener noreferrer\" target=\"_blank\">Chrome Dev Summit 2018</a> in San Francisco. Medina is a developer advocate at Google and Ruter recently transitioned into a new role as a Developer Programs Engineer after eight years at XWP.</p>\n<p>Medina began the session with a quick overview of the increasingly complex CMS space, which is growing, according to figures he cited from w3techs: 54% of sites are built with some kind of CMS (11% YoY growth). Many CMS&#8217;s face common challenges when it comes to integrating modern web technologies into their platforms, such as large code bases, legacy code, and technical debt.</p>\n<p>In addressing the challenges that WordPress faces, Google is looking to make an impact on a large swath of the web. Medina outlined the two-part approach Google is using with the WordPress ecosystem. This includes AMP integration via the AMP plugin for WordPress. It&#8217;s currently at <a href=\"https://make.xwp.co/2018/11/05/amp-plugin-release-v1-0-rc2/\" rel=\"noopener noreferrer\" target=\"_blank\">version 1.0 RC2</a> and the stable version is scheduled for release at the end of this month.</p>\n<p>The second part of the approach is integration of modern web capabilities and APIs in core, so that things like service workers and background sync are supported natively in a way that the entire ecosystem can take advantage of them. Google has invested resources to get these features added to core.</p>\n<p>Ruter demonstrated a single page application built in WordPress using a standard theme as the basis and the AMP plugin as a foundation. Medina said the team plans to continue expanding this work integrating AMP content into WordPress, specifically in the context of Gutenberg. He gave a quick demo of how they are working to help content creators easily take advantage of features like <a href=\"https://www.ampproject.org/stories/\" rel=\"noopener noreferrer\" target=\"_blank\">AMP stories</a> via a Gutenberg integration.</p>\n<p><a href=\"https://i2.wp.com/wptavern.com/wp-content/uploads/2018/11/Screen-Shot-2018-11-13-at-2.08.41-PM.png?ssl=1\"><img /></a></p>\n<p>Medina said AMP stories are formed by components and work well with Gutenberg, since everything in the new editor corresponds to a block.</p>\n<p>&#8220;We want powerful components like these to become available across all CMS&#8217;s,&#8221; Medina said. &#8220;The CMS space is moving steadily along the progressive web road.&#8221;</p>\n<p>Check out the video below to learn more about Google&#8217;s experience integrating modern web capabilities and progressive technologies into the WordPress platform and ecosystem.</p>\n<p></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 14 Nov 2018 00:27:58 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:27;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Dev Blog: WordPress 5.0 Beta 4\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6241\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-4/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3706:\"<p>WordPress 5.0 Beta 4 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test the WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta4.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p><strong>The WordPress 5.0 release date has changed</strong>, it is now scheduled for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 27</a>, and we need your help to get there. Here are some of the big issues that we’ve fixed since Beta 3:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>The block editor has been updated to match the <a href=\"https://make.wordpress.org/core/2018/11/12/whats-new-in-gutenberg-12th-november/\">Gutenberg 4.3 release</a>, the major changes  include:</p>\n\n\n\n<ul><li>An <a href=\"https://github.com/WordPress/gutenberg/pull/7718\">Annotations API</a>, allowing plugins to add  contextual data as you write.</li><li>More consistent keyboard navigation between blocks, as well as back-and-forth between different areas of the interface.</li><li>Improved accessibility, with additional  labelling and speech announcements.</li></ul>\n\n\n\n<p>Additionally, there have been some bugs fixed that popped up in beta 3:</p>\n\n\n\n<ul><li>Better support for plugins that have more advanced meta box usage.</li><li>Script concatenation is now supported.</li><li>Ajax calls could occasionally cause PHP errors.</li></ul>\n\n\n\n<h2>Internationalisation</h2>\n\n\n\n<p>We&#8217;ve added an API for translating your plugin and theme strings in JavaScript files! The block editor is now using this, and you can start using it, too. Check out the <a href=\"https://make.wordpress.org/core/2018/11/09/new-javascript-i18n-support-in-wordpress/\">developer note</a>&nbsp;to get started.</p>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Twenty Nineteen is being polished over on its <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>. This update includes <a href=\"https://core.trac.wordpress.org/changeset/43892\">a host of tweaks and bug fixes</a>, including:</p>\n\n\n\n<ul><li>Menus now  properly support keyboard and touch interactions.</li><li>A footer menu has been added for secondary page links.</li><li>Improved backwards compatibility with older versions of WordPress.</li></ul>\n\n\n\n<h2>Default Themes</h2>\n\n\n\n<p>All of the older default themes—from Twenty Ten through to Twenty Seventeen—have polished  styling in the block editor.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p><em>International-<br />isation is a word with<br />many syllables.</em></p>\n\n\n\n<p><em>Meta boxes are<br />the original style block.<br />Old is new again.</em></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 13 Nov 2018 01:27:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Gary Pendergast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:28;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"WPTavern: WordCamp Nordic Tickets Now on Sale, Sponsorship Packages Sold Out in Minutes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85193\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:97:\"https://wptavern.com/wordcamp-nordic-tickets-now-on-sale-sponsorship-packages-sold-out-in-minutes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2086:\"<p><a href=\"https://2019.nordic.wordcamp.org/tickets/\" rel=\"noopener noreferrer\" target=\"_blank\">Tickets</a> for the first ever <a href=\"https://wptavern.com/wordcamp-nordic-2019-to-be-held-in-helsinki-march-7-8\" rel=\"noopener noreferrer\" target=\"_blank\">WordCamp Nordic</a> went on sale today and 100 seats sold within 20 minutes. The event is scheduled to be held in Helsinki, Finland, March 7-8, 2019. There are currently 97 regular tickets and 59 micro-sponsor tickets remaining in the first batch, but more will be released in another round.</p>\n<p>If there was any question about whether this new regional WordCamp would gain support, the record-setting buy up of all the <a href=\"https://2019.nordic.wordcamp.org/call-for-sponsors/\" rel=\"noopener noreferrer\" target=\"_blank\">sponsor packages</a> has put them to rest. All of the Gold packages (3000 €) were purchased within one minute. Silver packages (1500 €) and Bronze packages (750 €) were all purchased within four minutes and 35 minutes, respectively.</p>\n<p>&#8220;Sponsor packages tend to go in a few hours whenever there’s a WordCamp in Finland, largely thanks to our communications team and the fact that most companies involved with WordPress follow the conversations on our local Slack/Twitter where these things get announced,&#8221; co-organizer Niko Pettersen said. &#8220;But this must have been a record even for us. WordCamp Nordic seems to be drawing a lot of interest.&#8221;</p>\n<p>The <a href=\"https://2019.nordic.wordcamp.org/call-for-speakers/\" rel=\"noopener noreferrer\" target=\"_blank\">call for speakers</a> opened on November 7 and submissions close January 7, 2019. All of the sessions will be held in English and the camp is planning to have two tracks. Those interested to speak may apply for a long talk (40 minutes) or a lightning talk (15 minutes). Selections will be made by mid-January and speakers will be announced in February. Follow <a href=\"https://twitter.com/WordCampNordic\" rel=\"noopener noreferrer\" target=\"_blank\">@WordCampNordic</a> for all the latest news from the event.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 13 Nov 2018 00:30:56 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:29;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"WPTavern: WP GDPR Compliance Plugin Patches Privilege Escalation Vulnerability\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85459\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://wptavern.com/wp-gdpr-compliance-plugin-patches-privilege-escalation-vulnerability\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5052:\"<p>At the end of last week, a plugin called <a href=\"https://wordpress.org/plugins/wp-gdpr-compliance/\" rel=\"noopener noreferrer\" target=\"_blank\">WP GDPR Compliance</a> sent out a security update for a privilege escalation vulnerability that was reported to the WordPress Plugin Directory team on November 6. The plugin was temporarily removed and then reinstated after the issues were patched within 24 hours by its creators, <a href=\"https://www.van-ons.nl/\" rel=\"noopener noreferrer\" target=\"_blank\">Van Ons</a>, a WordPress development shop based in Amsterdam.</p>\n<p>The changelog for the most recent release states that previous versions are vulnerable to SQL injection due to &#8220;wrong handling of possible user input in combination with unsafe unserialization.&#8221; The fixes are in version 1.4.3, which includes the following:</p>\n<ul>\n<li>Security fix: Removed base64_decode() function</li>\n<li>Security fix: Correctly escape input in $wpdb->prepare() function</li>\n<li>Security fix: Only allow modifying WordPress options used by the plugin and by the user capabilities</li>\n</ul>\n<p>Van Ons said they requested the Plugin Directory team do a forced update but they said it was not an option in this case.</p>\n<p><a href=\"https://wordpress.org/plugins/wp-gdpr-compliance/\" rel=\"noopener noreferrer\" target=\"_blank\">WP GDPR Compliance</a> has more than 100,000 active installs. According to Wordfence, the vulnerability is being actively exploited in the wild and many users are reporting new administrator accounts being created on their affected sites. The <a href=\"https://www.wordfence.com/blog/2018/11/privilege-escalation-flaw-in-wp-gdpr-compliance-plugin-exploited-in-the-wild/\">Wordfence blog</a> has a breakdown of how attackers are taking advantage of these sites:</p>\n<blockquote><p>We’ve already begun seeing cases of live sites infected through this attack vector. In these cases, the ability to update arbitrary options values is being used to install new administrator accounts onto the impacted sites.</p>\n<p>By leveraging this flaw to set the users_can_register option to 1, and changing the default_role of new users to “administrator”, attackers can simply fill out the form at /wp-login.php?action=register and immediately access a privileged account. From this point, they can change these options back to normal and install a malicious plugin or theme containing a web shell or other malware to further infect the victim site.</p></blockquote>\n<p>Wordfence has seen multiple malicious administrator accounts present on sites that have been compromised, with variations of the username t2trollherten. Several WP GDPR Compliance plugin users have commented on the Wordfence post saying they were victims of the exploit, having found new admin users with a backdoor and file injections added.</p>\n<p>The plugin has its own <a href=\"https://www.wpgdprc.com/\" rel=\"noopener noreferrer\" target=\"_blank\">website</a> where the vulnerability was announced. Its creators recommend that anyone who didn&#8217;t update right away on November 7, 2018, should look for changes in their databases. The most obvious symptom of attack is likely to be new users with administrator privileges. Any unrecognized users should be deleted. They also recommend restoring a complete backup of the site before November 6 and then updating to version 1.4.3 right away.</p>\n<p>The WP GDPR Compliance plugin lets users add a GDPR checkbox to Contact Form 7, Gravity Forms, WooCommerce, and WordPress comments. It allows visitors and customers to opt into allowing the site to handle their personal data for a defined purpose. It also allows visitors to request data stored in the website&#8217;s database through a Data Request page that allows them to request data to be deleted.</p>\n<p>While the name of the plugin includes the word &#8220;compliance,&#8221; users should note that the plugin details includes a disclaimer:</p>\n<p>&#8220;ACTIVATING THIS PLUGIN DOES NOT GUARANTEE YOU FULLY COMPLY WITH GDPR. PLEASE CONTACT A GDPR CONSULTANT OR LAW FIRM TO ASSESS NECESSARY MEASURES.&#8221;</p>\n<p>A relatively new amendment to <a href=\"https://developer.wordpress.org/plugins/wordpress-org/detailed-plugin-guidelines/#9-developers-and-their-plugins-must-not-do-anything-illegal-dishonest-or-morally-offensive\" rel=\"noopener noreferrer\" target=\"_blank\">section 9 of the plugin development guidelines</a> restricts plugin authors from implying that a plugin can create, provide, automate, or guarantee legal compliance. Heather Burns, a member of WordPress Privacy team, worked together with Mika Epstein last April to <a href=\"https://make.wordpress.org/plugins/2018/04/12/legal-compliance-added-to-guidelines/\" rel=\"noopener noreferrer\" target=\"_blank\">put this change into effect</a>. This guideline is especially important for users to remember when a plugin author uses GDPR Compliance in the name of the plugin. It isn&#8217;t a guarantee of compliance, just a useful tool as part of larger plan to protect users&#8217; privacy.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 12 Nov 2018 20:20:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:30;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"Akismet: Version 4.1 of the Akismet WordPress Plugin Is Now Available\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"http://blog.akismet.com/?p=2031\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:97:\"https://blog.akismet.com/2018/11/12/version-4-1-of-the-akismet-wordpress-plugin-is-now-available/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:826:\"<p>Version 4.1 of <a href=\"http://wordpress.org/plugins/akismet/\">the Akismet plugin for WordPress</a> is now available and contains the following changes:</p>\n\n<ul><li>We added a WP-CLI method for retrieving Akismet stats: <code>wp akismet stats</code><br /></li><li>Akismet now hooks into the  new &#8220;Personal Data Eraser&#8221; functionality from WordPress 4.9.6 to ensure that any personal data stored by Akismet is erased when requested.<br /></li><li>We&#8217;ve updated the plugin to more quickly clear outdated alert messages.</li></ul>\n\n<p>To upgrade, visit the Updates page of your WordPress dashboard and follow the instructions. If you need to download the plugin zip file directly, links to all versions are available in <a href=\"http://wordpress.org/plugins/akismet/\">the WordPress plugins directory</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 12 Nov 2018 19:51:28 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:17:\"Christopher Finke\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:31;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:99:\"WPTavern: Matt Mullenweg Addresses Controversies Surrounding Gutenberg at WordCamp Portland Q&amp;A\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85433\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:105:\"https://wptavern.com/matt-mullenweg-addresses-controversies-surrounding-gutenberg-at-wordcamp-portland-qa\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:8531:\"<p>Matt Mullenweg joined attendees at WordCamp Portland, OR, for a Q&amp;A session last weekend and the recording is now <a href=\"https://wordpress.tv/2018/11/08/matt-mullenweg-qa-at-wordcamp-portland-2018/\" rel=\"noopener noreferrer\" target=\"_blank\">available on WordPress.tv</a>.</p>\n<p>The first question came from a user who tried Gutenberg and turned it off because of a plugin conflict. She asked if users will have to use Gutenberg when 5.0 is released. Mullenweg said one of the reasons Gutenberg has been tested so early is to give plugin developers time to get their products compatible. He also said that it has been the fastest growing plugin in WordPress&#8217; history, with more than 600,000 installations since it was first made available.</p>\n<p>In response to her question he said users will have the option to use the Classic Editor and that the team is considering updating it to include per-user controls and the possibility to turn it on/off for different post types.</p>\n<p>Subsequent questions went deeper into recent controversies surrounding Gutenberg, which Mullenweg addressed more in depth.</p>\n<p>&#8220;The tough part of any open source project &#8211; there&#8217;s kind of a crucible of open source development which can sometimes be more adversarial and sometimes even acrimonious,&#8221; he said. &#8220;Working within the same company, you can kind of assume everyone is rowing in the same direction. In a wide open source ecosystem, some people might actually want the opposite of what you&#8217;re doing, because it might be in their own economic self-interest, or for any number of reasons.</p>\n<p>&#8220;I liken it much more to being a mayor of a city than being a CEO of a company. I&#8217;ve done WordPress now for 15 years so I&#8217;m pretty used to it. It might seem kind of controversial if you&#8217;re just coming in, but this is not the most controversial thing we have ever brought into WordPress. The last time we had a big fork of WordPress was actually when we brought in WYSIWYG the first time. Maybe there&#8217;s something about messing with the editor that sets people off.&#8221;</p>\n<p>Mullenweg commented on how polarizing Twitter can be as a medium and how that can impact conversations in negatives ways. He said people tend to read the worst into things that have been said and that has been a new challenge during this particular time in WordPress&#8217; history. WordPress tweets are sprinkled into timelines along with politics and current events in a way that can cause people to react differently than if the discussion was held in a trac ticket, for example.</p>\n<p>One attendee asked, &#8220;With Gutenberg there&#8217;s a lot of uncertainty. Where do you see the tipping point where you see people become more favorable to Gutenberg than the Classic Editor?&#8221;</p>\n<p>&#8220;Part of getting these two plugins, Gutenberg and Classic Editor, out early, was that it could remove uncertainty for people,&#8221; Mullenweg said. &#8220;Months before they were released you could kind of choose your path. The hope is that the 5.0 release day is the most anti-climactic thing ever. Because we have over a million sites that have either chosen to not use Gutenberg, which is totally ok, or have already opted in and have been getting these sometimes weekly updates. We have hosts that have been actually been pre-installing, pre-activating Gutenberg with all of their sites.&#8221;</p>\n<p>Mullenweg said hosts that have pre-installed Gutenberg have not reported a higher than normal support load and that it has basically been &#8220;a non-event.&#8221; It&#8217;s the users who are updating to 5.0 after many years of using WordPress who will have the most to learn.</p>\n<p>&#8220;Gutenberg does by some measures five or ten measures more than what you could really accomplish in the classic editor,&#8221; Mullenweg said. &#8220;That also means there&#8217;s more buttons, there&#8217;s more blocks. That is part of the idea &#8211; to open up people&#8217;s flexibility and creativity to do things they would either need code or a crazy theme to do in the past. And now we&#8217;re going to open that up to do WordPress&#8217; mission, which is to democratize publishing and make it accessible to everyone.&#8221;</p>\n<p>Gutenberg&#8217;s current state of accessibility has been a hot topic lately and one attendee asked for his thoughts about the recent discussions. Mullenweg said there is room for improvement in how this aspect of the project was handled and that WordPress can work better across teams in the future:</p>\n<blockquote><p>Accessibility has been core to WordPress from the very beginning. It&#8217;s part of why we started &#8211; adoption of web standards and accessibility things. We&#8217;ve been a member of the web standards project for many many years. We did kind of have some project management fails in this process where we had a team of volunteers that felt like they were disconnected from the rapid development that was happening with Gutenberg. Definitely there were some things we could do better there. In the future I think that we need &#8211; I don&#8217;t know if it makes sense to have separate accessibility as a separate kind of process from the core development. It really needs to be integrated at every single stage. We did do a lot, as Matias did a big long post on it. We&#8217;ve done a ton of keyboard accessibility stuff, there&#8217;s ARIA elements on everything. One of their feedbacks was that we did it wrong, but we did it the best that we knew how to and it&#8217;s been in there for awhile. There&#8217;s been over 200 closed issues from really the very beginning. We also took the opportunity to fix some things that had been poorly accessible in WordPress from the beginning. It&#8217;s not that WordPress is perfectly accessible and all WCAG AA and it&#8217;s reverting. It&#8217;s actually that huge swaths of WP are inaccessible &#8211; they just might not be considered core paths from the current accessibility team but I consider them core.</p></blockquote>\n<p>In response to a question about the future of React in WordPress, Mullenweg went more in depth on the vision he had when he urged the WordPress community to <a href=\"https://wptavern.com/state-of-the-word-2015-javascript-and-api-driven-interfaces-are-the-future-of-wordpress\">learn JavaScript deeply in 2015</a>. At that time he said &#8220;it is the future of the web.&#8221; He described how each block can be a launching point for something else &#8211; via a modal, such as updating settings, doing advanced things with an e-commerce store, zooming in and out of those screens from the editor. This was perhaps the most inspirational part of the Q&amp;A where the potential of Gutenberg shines as bright as it did in the early demos.</p>\n<p>&#8220;The other beautiful thing is that because Gutenberg essentially allows for translation into many different formats,&#8221; Mullenweg said. &#8220;It can publish to your web page, your RSS feed, AMP, blocks can be translated into email for newsletters, there&#8217;s so much that the structured nature of Gutenberg and the semantic HTML it creates and the grammar that&#8217;s used to parse it, can enable for other applications. It becomes a little bit like a lingua franca that perhaps even crosses CMS&#8217;s. There&#8217;s now these new cross-CMS Gutenberg blocks will be possible. It&#8217;s not just WordPress anymore. It may be a JavaScript block that was written for Drupal that you install on your WordPress site. I mean, hot diggity! How would that have ever happened before? That&#8217;s why we took two years off; it&#8217;s why we&#8217;ve had everyone in the world working on this thing.&#8221;</p>\n<p>JavaScript is what makes this cross-platform collaboration possible and it&#8217;s already evident in the work the Drupal Gutenberg contributors are doing, as well as the platform-agnostic Gutenberg Cloud project. When Gutenberg is released in 5.0, it will enable more for WordPress and the web than we can predict right now.</p>\n<p>&#8220;This is not the finish line,&#8221; Mullenweg said. &#8220;5.0 is almost like the starting point. Expect just as much time invested into Gutenberg after the 5.0 release as before &#8211; to get it to that place where we don&#8217;t think it&#8217;s just better than what we have today but it&#8217;s actually like a world-class web-defining experience, which is what we want to create and what you all deserve.&#8221;</p>\n<p></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 10 Nov 2018 15:30:46 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:32;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"WPTavern: WordPress 5.0 Release Date Update to November 27\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85475\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wptavern.com/wordpress-5-0-release-date-update-to-november-27\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2548:\"<p>The WordPress 5.0 release date has been pushed back to November 27. The <a href=\"https://make.wordpress.org/core/2018/10/03/proposed-wordpress-5-0-scope-and-schedule/\" rel=\"noopener noreferrer\" target=\"_blank\">previous schedule</a> outlined the possibility of a slip date where the first target date could slip by up to eight days if necessary.</p>\n<p>&#8220;As discussed during the Core devchat this week, the initial November 19th target date is looking a bit too soon for a release date,&#8221; Gutenberg technical lead Matias Ventura said in today&#8217;s announcement on the <a href=\"https://make.wordpress.org/core/2018/11/09/update-on-5-0-release-schedule/\" rel=\"noopener noreferrer\" target=\"_blank\">make.wordpress.org/core</a> blog. &#8220;After listening to a lot of feedback — as well as looking at current issues, ongoing pull requests, and general progress — we’re going to take an extra week to make sure everything is fully dialed in and the release date is now targeted for November 27th.&#8221;</p>\n<p>Ventura outlined a new plan where beta 4 and beta 5 releases will coincide with Gutenberg 4.3 and 4.4 releases. RC1 is expected to be released November 19. He said contributors will be posting daily high level updates on the current status of the release, including things like open pull requests to be reviewed and outstanding bugs, to the #core-editor channel.</p>\n<p>The announcement also includes a short video demonstration of Gutenberg fully integrated with the new default Twenty Nineteen theme.</p>\n<p></p>\n<p>Given the recent <a href=\"https://wptavern.com/calls-to-delay-wordpress-5-0-increase-developers-cite-usability-concerns-and-numerous-bugs-in-gutenberg\" rel=\"noopener noreferrer\" target=\"_blank\">pushback on the timeline</a> from prominent WordPress developers and business owners, the updated November 27 timeline may still not offer enough time to resolve the issues remaining and allow the ecosystem to prepare training materials that accurately reflect late stage UI changes.</p>\n<p>At a spontaneous Q&amp;A session at WordCamp Portland this weekend, Matt Mullenweg said WordPress 5.0 was branched from 4.9.8 so this release has been tightly wound to the previous one to allow for a more seamless transition.</p>\n<p>The next targeted release day falls on the Tuesday after Cyber Monday, which should be a relief to anyone running a WordPress-powered e-commerce site. If WordPress misses the updated November 27 release date, it will be pushed back to the secondary target date of January 22, 2019.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Nov 2018 20:06:54 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:33;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"WPTavern: WPWeekly Episode 337 – Gutenberg User Experiences, Release Timelines, and the Classic Editor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"https://wptavern.com?p=85470&preview=true&preview_id=85470\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:109:\"https://wptavern.com/wpweekly-episode-337-gutenberg-user-experiences-release-timelines-and-the-classic-editor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2142:\"<p>In this episode, <a href=\"http://jjj.me\">John James Jacoby</a> and I break down what&#8217;s happening with Gutenberg. We discuss our trials and tribulations with the editor, the release timeline, and calls from members of the community to delay WordPress 5.0 until January. We also share details on how long the Classic Editor plugin will be supported. Last but not least, we talk about the possible release strategy of shipping point releases every two weeks after WordPress 5.0 is released.</p>\n<h2>Stories Discussed:</h2>\n<p><a href=\"https://wptavern.com/how-to-add-an-image-to-a-paragraph-block-in-gutenberg\">How to Add an Image to A Paragraph Block in Gutenberg</a></p>\n<p><a href=\"https://wptavern.com/adding-aligned-images-to-paragraphs-in-gutenberg-is-not-as-tough-as-i-thought\">Adding Aligned Images to Paragraphs in Gutenberg Is Not as Tough as I Thought</a></p>\n<p><a href=\"https://wptavern.com/wordpress-5-0-beta-3-released-rc-1-expected-november-12\">WordPress 5.0 Beta 3 Released, RC 1 Expected November 12</a></p>\n<p><a href=\"https://joost.blog/wordpress-5-0-needs-a-different-timeline/\">WordPress 5.0 needs a different timeline    </a></p>\n<p><a href=\"https://mrwweb.com/wordpress-5-0-is-not-ready/\">WordPress 5.0 is Not Ready</a></p>\n<p><a href=\"https://wptavern.com/classic-editor-plugin-may-be-included-with-5-0-updates-support-window-set-to-end-in-2021\">Classic Editor Plugin May Be Included with 5.0 Updates, Support Window Set to End in 2021</a></p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, November 14th 3:00 P.M. Eastern</p>\n<p>Subscribe to <a href=\"https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738\">WordPress Weekly via Itunes</a></p>\n<p>Subscribe to <a href=\"https://www.wptavern.com/feed/podcast\">WordPress Weekly via RSS</a></p>\n<p>Subscribe to <a href=\"http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr\">WordPress Weekly via Stitcher Radio</a></p>\n<p>Subscribe to <a href=\"https://play.google.com/music/listen?u=0#/ps/Ir3keivkvwwh24xy7qiymurwpbe\">WordPress Weekly via Google Play</a></p>\n<p><strong>Listen To Episode #337:</strong><br />\n</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Nov 2018 17:21:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:34;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"Matt: Gutenberg in Portland Oregon and Podcasts\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:22:\"https://ma.tt/?p=48589\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://ma.tt/2018/11/gutenberg-in-portland-oregon-and-podcasts/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1192:\"<p>I&#8217;ve had the opportunity to talk about Gutenberg at two great venues recently. The first was at WordCamp Portland which graciously allowed me to join for a Q&amp;A at the end of the event. The questions were great and covered a lot of the latest and greatest about Gutenberg and WordPress 5.0:</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n\n</div>\n\n\n\n<p>Last week I also joined <a href=\"https://wpbuilds.com/2018/11/08/episode-101-matt-mullenweg-why-gutenberg-and-why-now/\">Episode 101 of the WP Builds podcast</a>, where as Nathan put it: &#8220;We talk about Gutenberg, why Matt thinks that we need it, and why we need it now. We go on to chat about how it’s divided the WordPress community, especially from the perspective of users with accessibility needs.&#8221;</p>\n\n\n\n<p>They may be out of seats already, but <a href=\"https://www.meetup.com/Southern-Maine-WordPress-Meetup/events/256212528/\">I&#8217;ll be on the other coast to do a small meetup in Portland, Maine</a> this week. As we lead up to release and <a href=\"https://2018.us.wordcamp.org/\">WordCamp US</a> I&#8217;m really enjoying the opportunity to hear from WordPress users of all levels all over the country.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Nov 2018 04:45:33 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"Matt\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:35;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:114:\"WPTavern: Calls to Delay WordPress 5.0 Increase, Developers Cite Usability Concerns and Numerous Bugs in Gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85371\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:124:\"https://wptavern.com/calls-to-delay-wordpress-5-0-increase-developers-cite-usability-concerns-and-numerous-bugs-in-gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:9585:\"<p>Developers and business owners are waiting anxiously in the wings, as Gutenberg is 11 days away from its debut in WordPress 5.0. There is still a chance that the release could be delayed to the secondary date (January 22, 2019), but the decision has not yet been announced.</p>\n<p>&#8220;I am lukewarm on the 19th, but not because of the number of open issues (which isn&#8217;t a good measure or target) — more that we&#8217;ve been a day or two behind a few times now,&#8221; 5.0 release lead Matt Mullenweg said during yesterday&#8217;s dev chat. He said that reports &#8220;from the field&#8221; continue to be good and companies that have already installed and activated the plugin haven&#8217;t reported a higher than normal support burden.</p>\n<p>&#8220;My concern can be summed up as this,&#8221; Aaron Jorbin said. &#8220;There are approximately 400 issues that need either code or a decision to punt. Assuming five minutes per issue, that means there are about 33 hours worth of bug scrubs that need to take place between now and RC.&#8221;</p>\n<p>&#8220;I don’t think we can make a decision on moving the date in the next 45 minutes,&#8221; Gary Pendergast said in response to concerns raised at the meeting. &#8220;I do think it’s fair to say that the Gutenberg and 5.0 leadership teams are hearing all the feedback, and are actively looking whether the timeline is still correct.&#8221;</p>\n<p>Mullenweg said open issues are not a good measure of whether the release is on target but the numerous bugs the community is encountering has precipitated a flurry of posts advocating for the release to be delayed.</p>\n<p>In a post titled &#8220;<a href=\"https://joost.blog/wordpress-5-0-needs-a-different-timeline/\" rel=\"noopener noreferrer\" target=\"_blank\">WordPress 5.0 needs a different timeline</a>,&#8221; Joost de Valk, author of <a href=\"https://wordpress.org/plugins/wordpress-seo/\" rel=\"noopener noreferrer\" target=\"_blank\">Yoast SEO</a>, cites accessibility concerns and the stability of the project as reasons for a delay. de Valk identifies himself a strong supporter of Gutenberg and his team has already built compatibility and <a href=\"https://wptavern.com/yoast-seo-8-2-adds-how-to-and-faq-gutenberg-blocks-with-structured-data\" rel=\"noopener noreferrer\" target=\"_blank\">Gutenberg-first features</a> into their plugin, which has more than 5 million active installs.</p>\n<p>&#8220;It’s arguably one of the biggest leaps forward in WordPress’ editing experience and its developer experience in this decade,&#8221; de Valk said. &#8220;It’s also not done yet, and if we keep striving for its planned November 19th release date, we are setting ourselves up for failure.&#8221;</p>\n<p>de Valk gave two reasons for why he believes the November 19th timeline to be untenable:</p>\n<blockquote><p>There are some <a href=\"https://make.wordpress.org/accessibility/2018/10/29/report-on-the-accessibility-status-of-gutenberg/\" rel=\"noopener noreferrer\" target=\"_blank\">severe accessibility concerns</a>. While these aren’t new and a few people are working hard on them, I actually think we can get a better handle on fixing them if we push the release back. Right now it looks to me as though keyboard accessibility has regressed in the last few releases of Gutenberg.</p>\n<p>The most important reason: the overall stability of the project isn’t where it needs to be yet. There are so many open issues for the 5.0 milestone that even fixing all the blockers before we’d get to Release Candidate stage next week is going to prove impossible. We have, at time of writing <a href=\"https://github.com/wordpress/gutenberg/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+no%3Amilestone+label%3A%22%5BType%5D+Bug%22+-label%3A%22future%22+\" rel=\"noopener noreferrer\" target=\"_blank\">212 untriaged bugs</a> and <a href=\"https://github.com/wordpress/gutenberg/issues?q=is%3Aopen+is%3Aissue+milestone%3A%22WordPress+5.0%22\" rel=\"noopener noreferrer\" target=\"_blank\">165 issues on the WordPress 5.0 milestone</a>.</p></blockquote>\n<p>WordPress developer Mark Root-Wiley published a post the same day titled &#8220;<a href=\"https://mrwweb.com/wordpress-5-0-is-not-ready/\" rel=\"noopener noreferrer\" target=\"_blank\">WordPress 5.0 is Not Ready</a>.&#8221; He outlined why he believes the release needs to be delayed and suggested the project pursue more auditing and quality assurance testing before shipping it out.</p>\n<p>&#8220;WordPress 5.0 can and should be a positive change to WordPress, but if it is released in late November as planned, it won’t be,&#8221; Root-Wiley said. &#8220;There are simply too many bugs in the editor, and the experience is not polished enough. This is because the rate of development has prevented systematic quality assurance (QA) and user testing. Both types of testing are required to ensure the editor is ready and to increase the community’s confidence in the update.&#8221;</p>\n<p>Root-Wiley describes a buggy experience when attempting to write blog posts with the new editor, which echoes many others&#8217; <a href=\"https://jjj.blog/2018/10/wordpress-5-0-beta-1/\" rel=\"noopener noreferrer\" target=\"_blank\">recent</a> <a href=\"https://twitter.com/mor10/status/1060255182552854528\" rel=\"noopener noreferrer\" target=\"_blank\">experiences</a>.</p>\n<p>&#8220;I’m doing my best to give feedback, but it’s exhausting and there are so many little bugs that I struggle to isolate and replicate the one I’m reporting without running into another,&#8221; Root-Wiley said. &#8220;How is it possible for me to find so many bugs without trying from just writing 1.5 blog posts?&#8221;</p>\n<p>Root-Wiley also suggested removing what he deemed to be unnecessary features in order to streamline the editing experience and focus on the fundamentals. These features include the tables block, paragraph background colors, spotlight and fullscreen mode, dropcaps, verse block, among others.</p>\n<p>&#8220;The pace of development has been blistering,&#8221; Root-Wiley said. &#8220;That speed has been great for developing a lot of features and iterating on those features quickly, but it hasn’t allowed for sufficient testing. What’s needed now is more time for people to find and report bugs with the editor features in their proposed final state.&#8221;</p>\n<p>Gutenberg criticism is often characterized as coming from people who are resistant to change, but these strong messages about delaying the release come from developers who believe the new editor is the future and have heavily invested in contributing to its success.</p>\n<p>Both de Valk and Root-Wiley&#8217;s posts seem to have resonated with many who have had similar experiences with the editor. Other core developers and committers have also publicly lent their voices to the call to delay the release.</p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">My thoughts are very much aligned here. I\'m super excited for the release &#8212; I think it\'s crucial for WordPress\' success. But I don\'t think it, nor the ecosystem, are quite ready following the shortened release cycle. <a href=\"https://t.co/R0nZt0mk41\">https://t.co/R0nZt0mk41</a></p>\n<p>&mdash; Mike Schroder (@GetSource) <a href=\"https://twitter.com/GetSource/status/1060238359660912640?ref_src=twsrc%5Etfw\">November 7, 2018</a></p></blockquote>\n<p></p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">This: <a href=\"https://t.co/wpcQ02qcTw\">https://t.co/wpcQ02qcTw</a>  They are missing almost every milestone on their release schedule, leaving me 1 week to test with RC before Thanksgiving, and plugin/theme authors no time to develop/test with stabler code. It should just come out with their backup January date.</p>\n<p>&mdash; Lisa Woodruff (@lisa_m_woodruff) <a href=\"https://twitter.com/lisa_m_woodruff/status/1060533833899171841?ref_src=twsrc%5Etfw\">November 8, 2018</a></p></blockquote>\n<p></p>\n<p>Opinions on Gutenberg&#8217;s readiness vary wildly depending on the person&#8217;s perspective and involvement in the project. Those who are working on it full-time have not publicly offered opinions indicating that it might not be ready for the November 19 timeline.</p>\n<p>&#8220;The 5.0 milestone is in a very manageable place, but if the volume becomes more worrying in the next couple days or it becomes clear milestones won’t be made, we’ll revise as needed,&#8221; Gutenberg technical lead Matias Ventura Ventura said during yesterday&#8217;s dev chat. He confirmed that the fast pace of development will continue.</p>\n<p>Regardless of when 5.0 is released, users can count on getting minor releases every two weeks to address bugs and issues that pop up after Gutenberg is in the hands of millions more users.</p>\n<p>&#8220;Hopefully as people get used to the more regular cadence they can plan around it, much like they used to complain a ton about, but then got used to, 3 major releases a year,&#8221; Mullenweg said during the dev chat.</p>\n<p>In 2016, Mullenweg began describing how WordPress could become &#8220;the operating system of the web,&#8221; with open APIs that others can build on. While that idea encompasses a lot more than just release schedules, WordPress seems to be moving in the direction of shipping updates that come more frequently and eventually more invisibly in the background, similar to how users update their browsers. Releasing Gutenberg in its current state, with frequent updates following, could prove to be a major testing ground to see if greater world of WordPress users are ready to embrace this new era of rapid iteration.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Nov 2018 00:03:55 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:36;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"WPTavern: Adding Aligned Images to Paragraphs in Gutenberg Is Not as Tough as I Thought\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85417\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:98:\"https://wptavern.com/adding-aligned-images-to-paragraphs-in-gutenberg-is-not-as-tough-as-i-thought\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4126:\"Last week, I published <a href=\"https://wptavern.com/how-to-add-an-image-to-a-paragraph-block-in-gutenberg\">an article</a> that describes the process I went through in Gutenberg to try to add an aligned image to a paragraph block. I concluded that performing the task in the Classic Editor was easier than in Gutenberg.\n\n\n\nIn response to the article, William Earnhardt <a href=\"https://wearnhardt.com/2018/11/the-gutenberg-complexity-fallacy/\">compared the process</a> and showed how it can be accomplished in two steps in Gutenberg.\n\n\n\n\n<ol><li>Drag an image into editor where you want it to go. </li><li>Click align right. </li></ol>\n\n\n\n\nDragging and dropping images into WordPress is not something I do. It&#8217;s not how I write. His method is simpler but I prefer to work within the interface. His second suggestion of accomplishing the task is the method I&#8217;ll use from now on.\n\n\n\n\n<ol><li>Click the block inserter above the paragraph you want to insert the image before.</li><li>Select the image block.</li><li>Drag the image onto the block.</li><li>Click align right.</li></ol>\n\n\n\n\nIn the last few months of using Gutenberg, I&#8217;ve become accustomed to adding new blocks by pressing enter at the end of a paragraph block or by clicking the plus sign to the left of a block. I haven&#8217;t used the plus sign between blocks but it makes sense and indeed, it&#8217;s quicker to accomplish the task.\n\n\n\nAccording to Earnhardt, there are even more ways to complete the task in Gutenberg. This brings up an important question, how many different ways and user interfaces should there be to accomplish a task? If you don&#8217;t do it a certain way, are you <a href=\"https://developer.wordpress.org/reference/functions/_doing_it_wrong/\">doing_it_wrong</a>?\n\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n\nTake for example, adding captions to images. In Gutenberg, there are at least two opportunities to add a caption. The first is the attachment details screen after uploading or selecting an image from the media library.\n\n\n\nThe second is the Image block user interface. When using the Image block interface, my cursor gets stuck in the caption area and I need to click outside of the block in order to continue. If I use the attachment details screen, it automatically puts the caption text into the image block, bypassing the hurdle. Which interface am I supposed to use and which method is considered doing_it_wrong?<br />\n\n\n\n\n<div class=\"wp-block-image\"><a href=\"https://i2.wp.com/wptavern.com/wp-content/uploads/2018/11/2018-11-08_00-56-29-1.gif?ssl=1\"><img /></a>Adding a Caption via the Image Block Interface</div>\n\n\n\n\n\n<h2>I&#8217;m Willing to Learn</h2>\n\n\n\n\nI understand the long vision of Gutenberg and what it means for the future of WordPress. For the past several months, I&#8217;ve used the plugin and interface exclusively to craft content.\n\n\n\nI&#8217;ve been learning things along the way and trying to readjust my workflows but the question I keep coming back to when doing things in Gutenberg is why?\n\n\n\nWhy is this button hidden? Why are there three differently located buttons to add blocks when it would be nice to memorize one? Why does this do that and vice versa? Where is all of the research and usability testing that explains the why behind so many of the interactions and flows? Am I just a moron or is it the interface that guides me in the wrong direction?\n\n\n\nMany of my experiences in using Gutenberg this past year have been <a href=\"https://mrwweb.com/wordpress-5-0-is-not-ready/\">echoed by Mark Root-Wiley</a>. He does a great job of saying what I&#8217;ve been feeling and thinking for a long time.\n\n\n\nWhen I and thousands of others watched Matías Ventura‏ perform a <a href=\"https://www.youtube.com/watch?v=XOY3ZUO6P0k&feature=youtu.be\">live demo</a> of Gutenberg at the 2017 State of Word, people were blown away. But this is someone who has been creating Gutenberg from the core and is proficient in all that it offers. Is this the level of Gutenberg proficiency I and others need in order to get things done? Probably not, but at times, it sure feels that way. <br />\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 08 Nov 2018 07:37:40 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:37;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:99:\"WPTavern: Classic Editor Plugin May Be Included with 5.0 Updates, Support Window Set to End in 2021\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85387\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:109:\"https://wptavern.com/classic-editor-plugin-may-be-included-with-5-0-updates-support-window-set-to-end-in-2021\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6806:\"<p>Gary Pendergast <a href=\"https://make.wordpress.org/core/2018/11/07/classic-editor-plugin-support-window/\" rel=\"noopener noreferrer\" target=\"_blank\">announced</a> this morning that the <a href=\"https://wordpress.org/plugins/classic-editor/\" rel=\"noopener noreferrer\" target=\"_blank\">Classic Editor</a> plugin will be officially supported until December 31, 2021. The plugin eases the transition for sites where plugins or themes are not yet compatible with Gutenberg and gives users the opportunity to preserve their existing workflows.</p>\n<p>&#8220;Since the Classic Editor plugin is central in this transition, we are considering including it with upgrades to WordPress 5.0,&#8221; Pendergast said. &#8220;New WordPress installs would still add it manually, and we’ve included it in the Featured Plugins list to increase visibility. If you have thoughts on this idea, please leave a comment.&#8221;</p>\n<p>Pendergast clarified that &#8220;officially supported&#8221; means that the plugin &#8220;will be guaranteed to work as expected in the most recent major release of WordPress, and the major release before it.&#8221; He also said the project will evaluate the continuing maintenance of the plugin in 2021 and may possibly extend the date.</p>\n<p>The post has already received quite a bit of feedback and generally positive reactions to the prospect of including the Classic Editor along with 5.0 updates for existing sites.</p>\n<p>WordPress Core Committer Pascal Birchler asked for a clarification on what &#8220;we&#8221; referred to in Pendergast&#8217;s post, and Pendergast clarified that he is speaking on behalf of the WordPress project. Other commenters pressed for more information, as the announcement was delivered as something that had already been decided and the conversation surrounding the decision was not public.</p>\n<p>&#8220;I’m grateful for the communication on a hard date for support of the classic editor,&#8221; Darren Ethier commented on the post. &#8220;It helps many people depending on WordPress for their livelihood to make plans surrounding things depending on it. But for volunteers who &#8216;show up&#8217; at meetings and in contributing, the process for arriving at these kinds of decisions in an open source project is very opaque and seems to be increasingly so.&#8221;</p>\n<p>This announcement highlights a trend in recent decision making for the project where decisions on important items appear to have been made behind closed doors without community input. Matthew MacPherson&#8217;s <a href=\"https://wptavern.com/gutenberg-accessibility-audit-postponed-indefinitely\" rel=\"noopener noreferrer\" target=\"_blank\">proposal for an independent accessibility audit</a>, which had broad support from the community, was shut down in a similar way. MacPherson was named WordPress 5.0&#8217;s accessibility lead but didn&#8217;t seem to be fully vested with the power to lead that aspect of the release in the community&#8217;s best interests. I asked MacPherson if he could further clarify how the decision to forego the audit was reached, as it seemed even a surprise to him in the GitHub issue thread. He said he had &#8220;no comment&#8221; on how the decision came about.</p>\n<p>WPCampus is now <a href=\"https://wptavern.com/wpcampus-is-pursuing-an-independent-accessibility-audit-of-gutenberg\" rel=\"noopener noreferrer\" target=\"_blank\">pursuing an accessibility audit</a> in order to better serve its community of more than 800 web professionals, educators, and others who work with WordPress in higher education.</p>\n<p>&#8220;We&#8217;re receiving a lot of interest and I&#8217;m holding meetings with potential vendors to answer their questions,&#8221; WPCampus director Rachel Cherry said. &#8220;We&#8217;ve received a lot of messages from individuals and organizations wanting to contribute financially.&#8221;</p>\n<p>The <a href=\"https://wptavern.com/wordpress-accessibility-team-delivers-sobering-assessment-of-gutenberg-we-have-to-draw-a-line\" rel=\"noopener noreferrer\" target=\"_blank\">recent report from the accessibility team</a> demonstrates critical issues that prevent the team from recommending Gutenberg to users of assistive technology. These issues also have a major impact on those using WordPress for higher education, as the law requires them to meet certain standards. Several in this particular industry commented on Pendergast&#8217;s post to advocate for shipping the Classic Editor plugin with new installs as well.</p>\n<p>&#8220;Many organizations who use WordPress are required by law to provide accessible software under Section 508,&#8221; Rachel Cherry said. &#8220;Until such a time when the accessibility of Gutenberg has been improved, and Section 508 compliance is clear, these organizations will require use of the Classic Editor.</p>\n<p>&#8220;Not to mention the users who will be dependent upon the Classic Editor to have an accessible publishing experience.</p>\n<p>&#8220;Please consider bundling Classic Editor with all versions of core, new and updated, going forward so that every end user has the easy and inclusive option of using it from day one.&#8221;</p>\n<p>Elaine Shannon, another WordPress user who works in academia, also commented on the Pendergast&#8217;s post to recommend having the Classic Editor bundled with new versions of WordPress, due to many education sites running on multisite installations.</p>\n<p>&#8220;Some institutions are on managed hosts, where they’ll receive 5.0 without initiating the update themselves,&#8221; Shannon said. &#8220;Others are managed by on-campus IT services, where one campus admin will push the update and affect thousands of users. In many cases, these are MultiSites where end users – the ones who need the choice of whether to use Gutenberg or Classic Editor – do not have the ability to add a plugin. So regardless of whether these users are in a brand-new shiny install or just an updated existing one, many users are going to need to fall back to the Classic Editor, and if it’s not bundled with Core there will be some folks left having to contact their administrator.&#8221;</p>\n<p>Pendergast&#8217;s post said the WordPress project is considering including the plugin with upgrades to 5.0 but did not identify where or when that decision will be made. However, users who depend on the plugin now have a clear idea of how long it will be supported.</p>\n<p>&#8220;As for the EOL on Classic Editor support, that’s probably more clarity than [the core team] has ever really given on a feature-to-plugin transition and I’m in favor of having that hard date,&#8221; WordPress core developer Drew Jaynes said. &#8220;It sets the right tone that the plugin is not intended as a long-term solution, rather a stopgap with a definitive EOL.&#8221;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 07 Nov 2018 20:13:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:38;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"WPTavern: Nidhi Jain Is Awarded the Kim Parsell Travel Scholarship\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85390\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://wptavern.com/nidhi-jain-is-awarded-the-kim-parsell-travel-scholarship\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1553:\"In 2015, the WordPress Foundation <a href=\"https://wptavern.com/the-wordpress-foundation-creates-a-traveling-scholarship-in-memory-of-kim-parsell\">created a travel scholarship</a> in memory of <a href=\"https://wptavern.com/kim-parsell-affectionately-known-as-wpmom-passes-away\">Kim Parsell</a>. The <a href=\"https://2018.us.wordcamp.org/kim-parsell-memorial-scholarship-2018/\">scholarship</a> covers travel expenses, lodging, and a ticket to the event. This year&#8217;s recipient is <a href=\"https://twitter.com/jainnidhi03\">Nidhi Jain</a> from Udaipur, Rajasthan, India. \n\n\n\nJain is a volunteer organizer for WordCamp Udaipur, a WordPress developer, contributor, and a seasoned traveler. <br />\n\n\n\n&#8220;Being selected for the Kim Parsell Memorial Scholarship is an honor, achievement and a proud moment for me,&#8221; Jain told the WordCamp US organizing team when asked what it means to be selected.  \n\n\n\n&#8220;I will try my best to make the most out of it and give back to the community in all possible ways. Since I have been a WordCamp volunteer and organizer in the last few years, I am excited to see and learn from WordCamp US. I am sure, I will have a lot of sweet memories and wonderful learnings to take back home.&#8221;\n\n\n\nPrevious winners include Elizabeth Shilling in 2016 and Bianca Welds in 2017. If you&#8217;re not familiar with who Kim Parsell is, I recommend reading <a href=\"https://heropress.com/essays/family-well-loved/\">this essay</a> which provides some context as to why the scholarship was created in her memory. <br />\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 07 Nov 2018 13:59:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:39;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"HeroPress: Accidental Activist\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://heropress.com/?post_type=heropress-essays&p=2648\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:112:\"https://heropress.com/essays/accidental-activist/#utm_source=rss&utm_medium=rss&utm_campaign=accidental-activist\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:12230:\"<img width=\"960\" height=\"480\" src=\"https://s20094.pcdn.co/wp-content/uploads/2019/11/110618-1024x512.jpg\" class=\"attachment-large size-large wp-post-image\" alt=\"Pull Quote: Imagine a world where more kinds of people are speaking up. That\'s a world I\'m excited to see.\" /><p>I never meant to become an activist. I swear. It was an accident.</p>\n<p>And yet here I am, celebrating my one year anniversary of leading the Diversity Outreach Speaker Training working group in the WordPress Community team. We are causing waves in the number of women and other underrepresented groups who are stepping up to become speakers at WordPress Meetups, WordCamps, and events. Pretty cool, right?</p>\n<p>How did this happen?</p>\n<p>Let’s start this story with how I got into WordPress. Back in 2011, I was looking for a practicum placement for the New Media Design and Web Development college program I was in in Vancouver, BC. We had touched on WordPress only briefly in class. I was curious about it, so I got a Practicum placement working on a higher education website that was built in WordPress. (It was in BuddyPress, even! Ooh. Aah.) As a thank you, my practicum advisor bought me a ticket to WordCamp Vancouver 2011: Developer’s Edition. That event was the start of my love affair with WordPress and I began taking on freelancing gigs. I’ve been a WordPress solopreneur for most of the time since.</p>\n<p>The following year my practicum advisor, who had become a client, was creating the first ever BuddyCamp for BuddyPress. He asked me to be on his organizing team. (Side note: I was especially excited to moderate a panel with Matt Mullenweg and other big names on it!) I was noticed and I was invited to be on the core organizing team for the next year’s WordCamp Vancouver by the lead organizer. I was thrilled. It was quite an honour!</p>\n<p>This is where the real story begins… after an important disclaimer.</p>\n<blockquote><p>Disclaimer: For simplicity in this story, I’ll be using the terms women and men, though in reality gender is not a simple binary and is actually a wide spectrum of different identities.</p></blockquote>\n<h3>The Real Beginning</h3>\n<p>There were three of us—myself and two men—and it was our first time any of us were organizing a WordCamp. We were having dinner in one of our apartments and we had 40 speaker applications spread out before us. The plan was to pick 14 to speak. It was hard. They were all really good.</p>\n<p>The lead organizer grabbed 6 out of the 7 that came from the women and said, &#8220;Well, we are accepting all of these.&#8221;</p>\n<p>At this point I didn’t know that not many women were applying to speak at tech conferences at the time.</p>\n<blockquote><p>So I was the one saying, &#8220;Wait, wait. Who cares what gender they are? Let’s go through them and pick based on the topics that would fit the conference’s flow.&#8221;</p></blockquote>\n<p>They both said that the 6 of the women’s pitches were really good, fit with the flow, and frankly, we needed to accept as many as we could or we’d get called out. (This is embarrassing to say now, but that was the conversation back in 2013.)</p>\n<p>Here’s how it went down:</p>\n<p>After we accepted the six, two of the women dropped out for family emergencies. (Guess how many men dropped out for family emergencies?) Also we had added a third speakers’ track. Now there were only 4 women out of 28 speakers. Only 1 in 7. That is 14%, my friends. That is not great.</p>\n<p>So not great, in fact, that we did get called out. People did talk about it, question us about it, and even wrote blog posts about it.</p>\n<h3>More Experience</h3>\n<p>So when later that year I went to WordCamp San Francisco—the biggest WordCamp at the time (before there was a WordCamp US)—I took the opportunity to chat with other organizers at a WordCamp organizer brunch.</p>\n<blockquote><p>I found out that many of the organizers had trouble getting enough women presenters.</p></blockquote>\n<p>I was surprised to find that we actually had a high number of women applicants in comparison to others, as many of them had zero! They were asking me how we got such a high number. They all said they would happily accept more if only more would apply.</p>\n<p>So then I needed to know, why was this happening? Why weren’t we getting more women applicants? I started researching, reading, and talking to people.</p>\n<p>Though this issue is complex, one thing that came up over and over was that when we would ask the question, &#8220;Hey, will you speak at my conference?&#8221; we would get two answers:</p>\n<ul>\n<li>&#8220;What would I talk about?&#8221;</li>\n<li>&#8220;I’m not an expert on anything. I don’t know enough about anything to give a talk on it.&#8221;</li>\n</ul>\n<p>That’s when the idea happened.</p>\n<h3>The Idea</h3>\n<p>As it goes, the idea happened while I was at a feminist blanket-fort slumber party. Yes, you heard right. And as one does at all feminist blanket-fort slumber parties, we talked about feminist issues.</p>\n<p>When I brought up my issue about the responses we were getting, one of the ladies said, &#8220;Why don’t you get them in a room and have them brainstorm topics?&#8221;</p>\n<blockquote><p>And that was it. That set me on the path.</p></blockquote>\n<p>I became the lead of a small group creating a workshop in Vancouver. In one of the exercises, we invited the participants to brainstorm ideas and show them that they have literally a hundred ideas. (Then the biggest problem becomes picking one. <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f642.png\" alt=\"🙂\" class=\"wp-smiley\" /> )</p>\n<p>In our first iteration, we covered:</p>\n<ul>\n<li>Why it matters that women (<em>added later: diverse groups</em>) are in the front of the room</li>\n<li>The myths of what it takes to be the speaker at the front of the room (aka beating impostor syndrome)</li>\n<li>Different speaking formats, especially story-telling</li>\n<li>Finding and refining a topic</li>\n<li>Tips to becoming a better speaker</li>\n<li>Practising leveling up speaking in front of the group throughout the afternoon</li>\n</ul>\n<p>Other cities across North America got wind of our workshop and started running it as well, and they added their own material.</p>\n<p>Our own participants wanted more support, so the next year we added material created from the other cities as well as generated more of our own:</p>\n<ul>\n<li>Coming up with a great title</li>\n<li>Writing a pitch that is more likely to get accepted</li>\n<li>Writing a bio</li>\n<li>Creating an outline</li>\n<li>Creating better slides</li>\n</ul>\n<p>We did it! In 2014—in only one year since we started—we had 50% women speakers and 3 times the number of women applicants! Not only that, but it was a Developer’s Edition. It&#8217;s more challenging it is to find women developers in general, let alone those who will step up to speak.</p>\n<h3>Building On</h3>\n<p>Impressive as that is, the reason I am truly passionate about this work is because of what happened next:</p>\n<ul>\n<li>Some of the women who did our workshop and started publicly speaking stepped up to be leaders in our community and created new things for us. For example, a couple of them created a new Meetup track with a User focus.</li>\n<li>A handful of others became WordCamp organizers. One year Vancouver had an almost all-female organizing team – 5 out of 6!</li>\n<li>It also influenced local businesses. One local business owner loved what one of the women speakers said so much that he hired her immediately. She was the first woman developer on the team, and soon after she became the Senior Developer.</li>\n</ul>\n<p>It is results like these that ignited my passion. I’ve now seen time and again what happens when different kinds of folks speak in the front of the room. More kinds of people feel welcome in the community. The speakers and the new community members bring new ideas and new passions that help to make the technology we are creating more inclusive as well as generate new ideas that benefit everyone.</p>\n<p>This workshop has been so successful, with typical results of 40-60% women speakers at WordCamps, that the WordPress Community Team asked me to promote it and train it for women and all diverse groups around the world. We created the Diversity Outreach Speaker Training working group. I started creating and leading it in late 2017.</p>\n<blockquote><p>Thanks to our group, our workshop has been run in 17 cities so far this year, 32 have been trained to run it, and 53 have expressed interest in 24 countries. Incredible!</p></blockquote>\n<p>I love this work so much that I’m now looking at how to do this for a living. I’m proud of how the human diversity represented on the stage adds value not only to the brand but also in the long-term will lead to the creation of a better product. I’m inspired by seeing the communities change as a result of the new voices and new ideas at the WordPress events.</p>\n<p><strong>&#8220;Jill’s leadership in the development and growth of the Diversity Outreach Speaker Training initiative has had a positive, measurable impact on WordPress community events worldwide. When WordPress events are more diverse, the WordPress project gets more diverse — which makes WordPress better for more people.&#8221;</strong></p>\n<p><em>&#8211; Andrea Middleton, Community organizer on the WordPress open source project</em></p>\n<p>I’m exploring sponsorships, giving conference and corporate trainings, and looking at other options so that I can be an Accidental Activist full-time and make a bigger impact. Imagine a world where more kinds of people are speaking up. That’s a world I’m excited to see.</p>\n<h3>Resources:</h3>\n<p>Workshop: <a href=\"http://diversespeakers.info/\">http://diversespeakers.info/</a></p>\n<p>More info and please let us know if you use it or would like help using it: <a href=\"https://tiny.cc/wpwomenspeak\">https://tiny.cc/wpwomenspeak</a></p>\n<p>Diversity Outreach Speaker Training Team—Join us! <a href=\"https://make.wordpress.org/community/2017/11/13/call-for-volunteers-diversity-outreach-speaker-training/\">https://make.wordpress.org/community/2017/11/13/call-for-volunteers-diversity-outreach-speaker-training/</a></p>\n<p>How to build a diverse speaker roster: Coming soon. Contact Jill for it.</p>\n<div class=\"rtsocial-container rtsocial-container-align-right rtsocial-horizontal\"><div class=\"rtsocial-twitter-horizontal\"><div class=\"rtsocial-twitter-horizontal-button\"><a title=\"Tweet: Accidental Activist\" class=\"rtsocial-twitter-button\" href=\"https://twitter.com/share?text=Accidental%20Activist&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Faccidental-activist%2F\" rel=\"nofollow\" target=\"_blank\"></a></div></div><div class=\"rtsocial-fb-horizontal fb-light\"><div class=\"rtsocial-fb-horizontal-button\"><a title=\"Like: Accidental Activist\" class=\"rtsocial-fb-button rtsocial-fb-like-light\" href=\"https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Faccidental-activist%2F\" rel=\"nofollow\" target=\"_blank\"></a></div></div><div class=\"rtsocial-linkedin-horizontal\"><div class=\"rtsocial-linkedin-horizontal-button\"><a class=\"rtsocial-linkedin-button\" href=\"https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Faccidental-activist%2F&title=Accidental+Activist\" rel=\"nofollow\" target=\"_blank\" title=\"Share: Accidental Activist\"></a></div></div><div class=\"rtsocial-pinterest-horizontal\"><div class=\"rtsocial-pinterest-horizontal-button\"><a class=\"rtsocial-pinterest-button\" href=\"https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/accidental-activist/&media=https://heropress.com/wp-content/uploads/2019/11/110618-150x150.jpg&description=Accidental Activist\" rel=\"nofollow\" target=\"_blank\" title=\"Pin: Accidental Activist\"></a></div></div><a rel=\"nofollow\" class=\"perma-link\" href=\"https://heropress.com/essays/accidental-activist/\" title=\"Accidental Activist\"></a></div><p>The post <a rel=\"nofollow\" href=\"https://heropress.com/essays/accidental-activist/\">Accidental Activist</a> appeared first on <a rel=\"nofollow\" href=\"https://heropress.com\">HeroPress</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 07 Nov 2018 12:00:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Jill Binder\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:40;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:114:\"WPTavern: Authors of Popular WordPress.org Themes Rolling Out Gutenberg Compatibility Updates Ahead of 5.0 Release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85247\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:125:\"https://wptavern.com/authors-of-popular-wordpress-org-themes-rolling-out-gutenberg-compatibility-updates-ahead-of-5-0-release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5506:\"<p><a href=\"https://wordpress.org/themes/astra/\" rel=\"noopener noreferrer\" target=\"_blank\">Astra</a>, a free theme that has steadily been growing in popularity, is now <a href=\"https://wpastra.com/gutenberg-compatible/\" rel=\"noopener noreferrer\" target=\"_blank\">fully compatible with Gutenberg</a>. The theme was first released in May 2017 and has more than 100,000 active installations. It was downloaded approximately 2,000 &#8211; 4,500 times per day over the past month and currently maintains a 5-star average rating on WordPress.org after 844 reviews.</p>\n<p>Astra&#8217;s creators advertise the theme as fast, lightweight (less than 50KB on frontend), and compatible with many page builders. These features have been key to its rapid growth. Last week they announced full Gutenberg compatibility, which means sites built with Astra will be able to take advantage of all the new features in the editor when 5.0 is released.  </p>\n<p>Astra&#8217;s Gutenberg compatibility update includes front-end styles displayed in the editor and support for the full-width alignment option. The width of the content in the editor matches that of the frontend, and the same is true for the typography, colors, and background.</p>\n<p><a href=\"https://i0.wp.com/wptavern.com/wp-content/uploads/2018/11/gutenberg-full-width.gif?ssl=1\"><img /></a></p>\n<p>The theme also ensures that the default Gutenberg blocks, i.e. quotes and galleries, will inherit Astra customizer styles to match the rest of the site. </p>\n<p>Astra&#8217;s creators support the theme by offering commercial <a href=\"https://wpastra.com/pricing/\" rel=\"noopener noreferrer\" target=\"_blank\">packages</a> that include additional features and plugins, <a href=\"https://wpastra.com/ready-websites/\" rel=\"noopener noreferrer\" target=\"_blank\">starter sites</a>, add-ons for page builders, and support. They plan to offer additional Gutenberg features in commercial add-ons. Astra&#8217;s Ultimate Addons product will introduce custom blocks, such as Section, Heading, Info Box, Post Grid, Google Map, Table, Social Share, Menu, Buttons, along with pre-made starter templates.</p>\n<p>After two months of weekend work, Anders Norén reported that <a href=\"https://wordpress.org/themes/author/anlino/\" rel=\"noopener noreferrer\" target=\"_blank\">all 18 of his free themes on WordPress.org</a> have been <a href=\"http://www.andersnoren.se/the-gutenberg-update/\" rel=\"noopener noreferrer\" target=\"_blank\">updated to be compatible with Gutenberg</a>. Norén&#8217;s popular minimalist style themes have a cumulative rating of 4.97 out of 5 stars and have been downloaded more than <a href=\"http://wptally.com/?wpusername=anlino\" rel=\"noopener noreferrer\" target=\"_blank\">2.2 million times</a>. They are active on an estimated 100,000 WordPress installations.</p>\n<p>&#8220;There are no custom blocks or other fancy stuff to be found in the updates, but if you’re running one of my themes, you should be able to update to WordPress 5.0 and start using Gutenberg without any hitches, in the editor or on the front-end,&#8221; Norén said. &#8220;If you plan to keep using the classic editor, things should look mostly the same after you install the update.&#8221;</p>\n<p>The Gutenberg compatibility update for Norén&#8217;s themes includes editor styles, with layout, typography and colors matching the theme, styles for core blocks and new alignment options, and custom font sizes and color palette in the editor. Norén also took the opportunity to do an overall code cleanup and add improvements for older versions of PHP, accessibility and localization improvements, and bug fixes, amounting to 17,525 lines of code added or modified.</p>\n<p>&#8220;The past couple of weekends have been grueling, but knowing that my themes will be ready for WordPress 5.0 – whether it hits the November 20th release date or not – was worth it,&#8221; Norén said.</p>\n<p>Themeisle has updated <a href=\"https://wordpress.org/themes/hestia/\" rel=\"noopener noreferrer\" target=\"_blank\">Hestia</a> with Gutenberg compatibility in the theme&#8217;s <a href=\"https://themeisle.com/blog/hestia-2-0/\" rel=\"noopener noreferrer\" target=\"_blank\">2.0 release</a>. The popular Material Design WordPress theme is the company&#8217;s flagship product and is installed on more than 100,000 WordPress sites. The company is planning to release a brand new theme that will be fully Gutenberg compatible. They have not yet announced if <a href=\"https://wordpress.org/themes/zerif-lite/\" rel=\"noopener noreferrer\" target=\"_blank\">Zerif Lite</a> (100,000+ installs) will be updated for the new editor.</p>\n<p>Six weeks ago, <a href=\"https://wordpress.org/themes/search/Gutenberg/\" rel=\"noopener noreferrer\" target=\"_blank\">searching the WordPress.org Theme Directory for “Gutenberg”</a> produced 26 results where compatibility is mentioned in the theme descriptions. That number has jumped to 53. Support for the new editor seems to have happened much faster in the commercial theme space where <a href=\"https://themeforest.net/category/wordpress?term=Gutenberg\" rel=\"noopener noreferrer\" target=\"_blank\">searching for Gutenberg on Envato</a> already turns up hundreds of results before the editor has even landed in core. Authors of free themes on WordPress.org don&#8217;t always have the same motivation. Those who support popular themes are more likely to have their themes compatible by the time WordPress 5.0 arrives, especially if the free theme is connected to a paid product.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Nov 2018 04:34:25 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:41;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"WPTavern: WordPress 5.0 Beta 3 Released, RC 1 Expected November 12\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85224\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"https://wptavern.com/wordpress-5-0-beta-3-released-rc-1-expected-november-12\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6909:\"<p><a href=\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-3/\" rel=\"noopener noreferrer\" target=\"_blank\">WordPress 5.0 Beta 3</a> was released this morning. This beta incorporates all the changes from <a href=\"https://make.wordpress.org/core/2018/10/31/whats-new-in-gutenberg-31st-october-2/\" rel=\"noopener noreferrer\" target=\"_blank\">Gutenberg 4.2 RC1</a>, which was released last week. It fixes a bug with the display of the custom fields meta box and also improves REST API requests.</p>\n<p>Gutenberg has undergone a few UI tweaks and introduces a <a href=\"https://github.com/WordPress/gutenberg/pull/10209\" rel=\"noopener noreferrer\" target=\"_blank\">Formatting API</a> for adding new RichText components. The inserter between blocks was updated to provide a more consistent experience that matches the other “add block” buttons. Version 4.2 also adds support for displaying icons in new block categories to better organize groups of blocks. The example pictured in the release post shows the Jetpack icon. The Jetpack team has been <a href=\"https://wptavern.com/jetpack-6-6-improves-site-verification-tools-asset-cdn-module-now-in-beta-gutenberg-blocks-coming-soon\" rel=\"noopener noreferrer\" target=\"_blank\">working on a number of blocks for existing features</a> and is expected to release those soon.</p>\n<p><a href=\"https://i0.wp.com/wptavern.com/wp-content/uploads/2018/11/block-categories.png?ssl=1\"><img /></a></p>\n<p>WordPress 5.0 Beta 3 brings in updates from Twenty Nineteen&#8217;s GitHub repository, including support for selective refresh widgets in the customizer, support for responsive embeds, and tweaks to improve the experience on mobile devices.</p>\n<h3>Updates to WordPress 5.0 Schedule: More Beta Releases and a Shortened RC Period</h3>\n<p>WordPress 5.0 is now two weeks away from its <a href=\"https://make.wordpress.org/core/5-0/\" rel=\"noopener noreferrer\" target=\"_blank\">projected release date</a> of November 19. Last week Gary Pendergast announced some <a href=\"https://make.wordpress.org/core/2018/10/31/wordpress-5-0-schedule-updates/\" rel=\"noopener noreferrer\" target=\"_blank\">updates to the 5.0 release schedule</a> that build in extra time for betas. After pushing out Beta 3 Pendergast said he expects to release Beta 4 later this week. He also offered an explanation for why RC1 is scheduled for release on November 12, allowing for just one week of last-minute testing following RC.</p>\n<p>&#8220;The block editor has been available for over a year,&#8221; Pendergast said. &#8220;It’s already had a longer testing period, with 30 times the number of sites using it, than any previous WordPress release. The primary purpose of the beta and release candidate periods is to ensure that it’s been correctly merged into Core.&#8221;</p>\n<p>Initial feedback on the schedule changes indicate that some user would appreciate a longer RC period, since the code being tested has changed so often. </p>\n<p>&#8220;The API freeze just happened in version 4.2, so saying the editor has been available for over a year in anywhere near its current state doesn’t make sense for a 7-day RC period on such a major change,&#8221; WordPress trainer and developer Brian Hogg <a href=\"https://make.wordpress.org/core/2018/10/31/wordpress-5-0-schedule-updates/#comment-34292\" rel=\"noopener noreferrer\" target=\"_blank\">said</a>.</p>\n<p>&#8220;As an example, just in the last version or two the hover-over menu to remove a block has been taken out and tucked away at the top menu (which was available as shown in <a href=\"https://youtu.be/yjqW_IS6Q7w?t=80\" rel=\"noopener noreferrer\" target=\"_blank\">https://youtu.be/yjqW_IS6Q7w?t=80</a>), with little time for anyone to provide usability feedback on changes like this.&#8221;</p>\n<p>Those who are creating training materials and videos have been waiting for a bit of a reprieve in Gutenberg development to make sure their materials are accurate and ready for 5.0.</p>\n<p>&#8220;Knowing it’s an RC means we can assume a level of &#8216;this is how it will be&#8217; that just isn’t necessarily with pre-RC versions,&#8221; Modern Tribe developer George Gecewicz <a href=\"https://make.wordpress.org/core/2018/10/31/wordpress-5-0-schedule-updates/#comment-34278\" rel=\"noopener noreferrer\" target=\"_blank\">commented</a> on the post. &#8220;That relative certainty is useful for testing aggressively, finalizing design/UI stuff, and revealing post-merge bugs.&#8221;</p>\n<p>Gutenberg 4.1 was supposed to be the &#8220;<a href=\"https://github.com/WordPress/gutenberg/milestone/66\" rel=\"noopener noreferrer\" target=\"_blank\">UI freeze</a>&#8221; milestone, but that hasn&#8217;t happened yet with several changes introduced in 4.2. </p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">The \"freeze\" in \"UI freeze\" doesn\'t mean you can thaw it and change it willy nilly. Some of us rely on such landmarks to do our work.</p>\n<p>&mdash; Morten Rand-Hendriksen (@mor10) <a href=\"https://twitter.com/mor10/status/1059269623944642560?ref_src=twsrc%5Etfw\">November 5, 2018</a></p></blockquote>\n<p></p>\n<p>There should be short window of time before 5.0 is released where training materials can be finalized. However, the Gutenberg team plans to continue on from there with its same pace of development.</p>\n<p>&#8220;Over the past six months, there has been a release every two weeks,&#8221; Pendergast said. &#8220;We’ll plan to continue that over the first few WordPress 5.0.x releases, to ensure that bug fixes are available as quickly as possible. How soon should we expect WordPress 5.0.1? Approximately two weeks after WordPress 5.0, unless we see bug reports that indicate a need for a faster release.&#8221;</p>\n<p>WordPress 5.0 is on schedule for its original release date, but there is still a possibility for the the release to be delayed. Matt Mullenweg, <a href=\"https://wptavern.com/wordpress-accessibility-team-delivers-sobering-assessment-of-gutenberg-we-have-to-draw-a-line#comment-266997\" rel=\"noopener noreferrer\" target=\"_blank\">commenting</a> on responses to the accessibility team&#8217;s assessment of Gutenberg, said that delaying the release has &#8220;definitely been considered&#8221; and that it may still happen. His response also indicates that WordPress users can expect the pace of core development to continue along the path Gutenberg has carved. </p>\n<p>&#8220;Despite some differences that still need be resolved, there’s general consensus that the long-term way to create the best WP experience for all types of users is not something you can tack on with 5-6 weeks at the end, but will be the result of continuing the continuous iteration we’ve had with the 42 public releases of Gutenberg so far,&#8221; Mullenweg said. &#8220;It means we can get improvements into the hands of users within weeks following a release, not months (or years) as was the old model with WordPress.&#8221;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Nov 2018 18:39:49 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:42;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Dev Blog: WordPress 5.0 Beta 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6236\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2018/11/wordpress-5-0-beta-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3164:\"<p>WordPress 5.0 Beta 3 is now available!</p>\n\n\n\n<p><strong>This software is still in development,</strong>&nbsp;so we don’t recommend you run it on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p>There are two ways to test the WordPress 5.0 Beta: try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (you’ll want “bleeding edge nightlies”), or you can&nbsp;<a href=\"https://wordpress.org/wordpress-5.0-beta3.zip\">download the beta here</a>&nbsp;(zip).</p>\n\n\n\n<p>WordPress 5.0 is slated for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-0/\">November 19</a>, and we need your help to get there. Here are some of the big issues that we&#8217;ve fixed since Beta 2:</p>\n\n\n\n<h2>Block Editor</h2>\n\n\n\n<p>The block editor has been updated to include all of the features and bug fixes from the upcoming <a href=\"https://make.wordpress.org/core/2018/10/31/whats-new-in-gutenberg-31st-october-2/\">Gutenberg 4.2 release</a>. Additionally, there are some newer bug fixes and features, such as:</p>\n\n\n\n<ul><li>Adding support for the &#8220;Custom Fields&#8221; meta box.</li><li>Improving the reliability of REST API requests.</li><li>A myriad of minor tweaks and improvements.</li></ul>\n\n\n\n<h2>Twenty Nineteen</h2>\n\n\n\n<p>Twenty Nineteen has been updated from its <a href=\"https://github.com/WordPress/twentynineteen\">GitHub repository</a>, this version is full of new goodies to check out:</p>\n\n\n\n<ul><li>Adds support for Selective Refresh Widgets in the Customiser.</li><li>Adds support for Responsive Embeds.</li><li>Tweaks to improve readability and functionality on mobile devices.</li><li>Fixes nested blocks appearing wider than they should be.</li><li>Fixes some errors in older PHP versions, and in IE11.</li></ul>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English? <a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a> </p>\n\n\n\n<p>If you&#8217;re able to contribute with coding or testing changes, we have <a href=\"https://make.wordpress.org/core/2018/11/02/upcoming-5-0-bug-scrubs/\">a multitude of bug scrubs</a> scheduled this week, we&#8217;d love to have as many people as we can ensuring all bugs reported get the attention they deserve.</p>\n\n\n\n<p><strong><em>If you think you’ve found a bug</em></strong><em>, you can post to the&nbsp;</em><a href=\"https://wordpress.org/support/forum/alphabeta\"><em>Alpha/Beta area</em></a><em>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;</em><a href=\"https://make.wordpress.org/core/reports/\"><em>file one on WordPress Trac</em></a><em>, where you can also find&nbsp;</em><a href=\"https://core.trac.wordpress.org/tickets/major\"><em>a list of known bugs</em></a><em>.</em></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<p><em>WordPress Five Point Oh<br />is just two short weeks away.<br />Thank you for helping!</em> <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f496.png\" alt=\"💖\" class=\"wp-smiley\" /><em><br /></em></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Nov 2018 00:20:08 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Gary Pendergast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:43;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:80:\"WPTavern: GitHub Rolls Out More Small Improvements as Part of Project Paper Cuts\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85245\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:91:\"https://wptavern.com/github-rolls-out-more-small-improvements-as-part-of-project-paper-cuts\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4625:\"<p>In August, GitHub <a href=\"https://blog.github.com/2018-08-28-announcing-paper-cuts/\" rel=\"noopener noreferrer\" target=\"_blank\">announced</a> Project Paper Cuts, an effort aimed at bringing small improvements to the developer and project maintainer experiences. These are fixes for issues that don&#8217;t generally fall within larger initiatives. Some of the first improvements that have already been implemented include the following:</p>\n<ul>\n<li>Unselect markers when copying and pasting the contents of a diff</li>\n<li>Edit a repository’s README from the repository root</li>\n<li>Access your repositories straight from the profile dropdown</li>\n<li>Highlight permalinked comments</li>\n<li>Remove files from a pull request with a button</li>\n<li>Branch names in merge notification emails</li>\n<li>Create new pull requests from your repository’s Pull Requests Page</li>\n<li>Add a teammate from the team discussions page</li>\n<li>Collapse all diffs in a pull request at once</li>\n<li>Copy the URL of a comment</li>\n</ul>\n<p>One of the latest improvements allows repository admins to transfer an issue that has been misfiled to another repository where it belongs. At the moment it only works within the same GitHub organization account. Initial <a href=\"https://twitter.com/asmeurer/status/1057741387108560897\" rel=\"noopener noreferrer\" target=\"_blank\">feedback</a> from users indicates many would appreciate this feature require push permissions, instead of admin permissions, as there are likely more users who can help in the bug tracker with moving issues, setting labels, and closing bugs.</p>\n<blockquote class=\"twitter-tweet\">\n<p lang=\"en\" dir=\"ltr\">Issue filed in the wrong repo? </p>\n<p>We know your pain! And now we\'ve got a fix. </p>\n<p>Repo admins can transfer issues to wherever they belong. <img src=\"https://s.w.org/images/core/emoji/11/72x72/1f3d8.png\" alt=\"🏘\" class=\"wp-smiley\" /> <a href=\"https://t.co/rPwNng7ZOl\">pic.twitter.com/rPwNng7ZOl</a></p>\n<p>&mdash; GitHub (@github) <a href=\"https://twitter.com/github/status/1057678791764467712?ref_src=twsrc%5Etfw\">October 31, 2018</a></p></blockquote>\n<p></p>\n<p>The &#8220;<a href=\"https://blog.github.com/2018-11-01-suggested-changes-update/\" rel=\"noopener noreferrer\" target=\"_blank\">suggested changes</a>&#8221; feature GitHub introduced in beta two weeks ago seems to have been adopted fairly quickly by users. Suggested Changes lets users suggest a change to code in a pull request. These changes can be accepted by the author or assignees with one click and then committed.</p>\n<p><a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2018/11/suggested-changes.png?ssl=1\"><img /></a></p>\n<p>GitHub reports more than 10 percent of all reviewers suggested at least one change. They have received 100,000 suggestions and estimate that 4% of all review commits created have included a suggestion. Based on feedback so far, GitHub put the following improvements on the roadmap for the Suggested Changes feature: </p>\n<ul>\n<li>The ability to suggest changes to multiple lines at once</li>\n<li>The ability to accept multiple changes in a single commit</li>\n</ul>\n<p>Project Paper Cuts is borrowing heavily from <a href=\"https://github.com/sindresorhus/refined-github/\" rel=\"noopener noreferrer\" target=\"_blank\">Refined GitHub</a>, a browser extension that simplifies the GitHub interface and adds useful features. </p>\n<p>&#8220;Full-time open source developer <a href=\"https://github.com/sindresorhus/\" rel=\"noopener noreferrer\" target=\"_blank\">Sindre Sorhus</a> has built a great browser extension that builds on and improves the GitHub experience, along with a fantastic community that has come together to discuss workflows and build their favorite features,&#8221; GitHub product manager Luke Hefson said. &#8220;Project Paper Cuts has taken inspiration from a lot of Refined GitHub’s additions, and we’re building some of the most-loved features right into GitHub itself.&#8221;</p>\n<p>GitHub is aiming to be more open and transparent with user feedback after the <a href=\"https://wptavern.com/open-source-project-maintainers-confront-github-with-open-letter-on-issue-management\" rel=\"noopener noreferrer\" target=\"_blank\">2016 fiasco with disgruntled open source project maintainers</a>. These fixes for small annoyances add up in the grand scheme of things to improve project workflow for millions of developers and project maintainers. The improvements are shipping out regularly and are all outlined in <a href=\"https://blog.github.com/changelog/\" rel=\"noopener noreferrer\" target=\"_blank\">GitHub&#8217;s public changelog</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Nov 2018 18:58:42 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:44;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"WPTavern: WPWeekly Episode 336 – Interview With Andrew Roberts, CEO and Co-founder of Tiny\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"https://wptavern.com?p=85267&preview=true&preview_id=85267\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:98:\"https://wptavern.com/wpweekly-episode-336-interview-with-andrew-roberts-ceo-and-co-founder-of-tiny\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2772:\"<p>In this episode, <a href=\"http://jjj.me\">John James Jacoby</a> and I are joined by <a href=\"https://twitter.com/andrew_roberts?lang=en\">Andrew Roberts</a>, CEO and Co-founder of <a href=\"https://www.tiny.cloud/\">Tiny</a>. Tiny is the company behind the popular open source library <a href=\"https://www.tiny.cloud/features/\">TinyMCE</a>. Roberts shares his entrepreneurial journey, what the company plans on doing with its recent <a href=\"https://wptavern.com/tiny-raises-4m-in-series-a-funding-publishes-gutenberg-faq\">round of funding</a>, and the relationship between TinyMCE and Gutenberg.</p>\n<p>Here is an excerpt from the show on what Roberts thinks about Gutenberg.</p>\n<blockquote><p>I think that ultimately Gutenberg will be more innovative than just incrementally changing from the old editor experience toward block-based editing.</p>\n<p>I think you know Matt&#8217;s probably had a tough year with some of the criticisms around Gutenberg but I admire his courage and leadership because if he hadn&#8217;t put his brand equity on the line, if he hadn&#8217;t invested his goodwill in doing this, this would never be launching in a month from now.</p>\n<p>There may be a painful year or two but in the grand scheme of things this will turn out for the better. It&#8217;s taken a lot of courage and bravery for him to do that. He&#8217;s taken a lot of shots in the back, but you know that&#8217;s why he gets paid the big bucks as they say.</p></blockquote>\n<h2>Stories Discussed:</h2>\n<p><a href=\"https://jjj.blog/2018/10/wordpress-5-0-beta-1/\">WordPress 5.0 Beta 1</a><br />\n<a href=\"https://wptavern.com/wordpress-accessibility-team-delivers-sobering-assessment-of-gutenberg-we-have-to-draw-a-line\">WordPress Accessibility Team Delivers Sobering Assessment of Gutenberg: “We have to draw a line.”</a><br />\n<a href=\"https://wptavern.com/woocommerce-3-5-introduces-rest-api-v3-improves-transactional-emails\">WooCommerce 3.5 Introduces REST API v3, Improves Transactional Emails</a><br />\n<a href=\"https://wptavern.com/wp-engine-acquires-array-themes\">WP Engine Acquires Array Themes</a></p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, November 7th 3:00 P.M. Eastern</p>\n<p>Subscribe to <a href=\"https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738\">WordPress Weekly via Itunes</a></p>\n<p>Subscribe to <a href=\"https://www.wptavern.com/feed/podcast\">WordPress Weekly via RSS</a></p>\n<p>Subscribe to <a href=\"http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr\">WordPress Weekly via Stitcher Radio</a></p>\n<p>Subscribe to <a href=\"https://play.google.com/music/listen?u=0#/ps/Ir3keivkvwwh24xy7qiymurwpbe\">WordPress Weekly via Google Play</a></p>\n<p><strong>Listen To Episode #336:</strong><br />\n</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Nov 2018 13:25:36 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:45;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:63:\"WPTavern: How to Add an Image to A Paragraph Block in Gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85201\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:74:\"https://wptavern.com/how-to-add-an-image-to-a-paragraph-block-in-gutenberg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2393:\"<p>WordPress 5.0 is on the horizon and with it comes a number of opportunities to explain how to get things done in the new editor. <br /></p>\n\n\n\n<h2>Testing Scenario<br /></h2>\n\n\n\n<p>A user has written three paragraphs and decides to add an image to the second paragraph. This user wants the image to be aligned to the right. </p>\n\n\n\n<h2>Accomplishing the Task in the Classic Editor</h2>\n\n\n\n<p>The classic editor is essentially one big block. Adding media to a paragraph is as quick as placing the mouse cursor at the beginning of a paragraph, clicking the add new media button, selecting or uploading an image, and choosing its alignment. </p>\n\n\n\n<h2 id=\"mce_6\">Accomplishing the Task in Gutenberg</h2>\n\n\n\n<p>In Gutenberg, each paragraph is a block and each block has its own toolbar. This is important because after writing three paragraphs, you can&#8217;t click on an add media button. Instead, you need to create an image block. </p>\n\n\n\n<p>Once you&#8217;ve selected an image, you need to move the image block above the paragraph block where you want to insert it. At first, you might try to drag and drop the image into the paragraph but that doesn&#8217;t work. You need to use the up and down arrows or drag the block into position. </p>\n\n\n\n<p>Once the image block is in the correct location, click the align right icon. The image will be inserted into the right side of the paragraph block. </p>\n\n\n\n<img />A Right Aligned Image Inside of A Paragraph Block\n\n\n\n<p>If you want to move the image to a different paragraph block, you&#8217;ll need to click the Align center button which turns the image back into its own block and repeat the process described above. </p>\n\n\n\n<h2>Adding Images to Paragraphs in the Classic Editor Is Easier<br /></h2>\n\n\n\n<p>The task I described above is one I think millions of users will have trouble completing when WordPress 5.0 is released. In the Classic editor, the writing flow doesn&#8217;t feel disjointed when you want to add images or embed content into posts. </p>\n\n\n\n<p>In Gutenberg, everything is a block which in many cases, causes the flow to be disrupted as you need to figure out what block you need, how to manipulate it, where to move it, find where the options are, etc. </p>\n\n\n\n<p>The process of adding images to paragraphs will likely improve after WordPress 5.0 is released but until then, the Classic editor wins this use case. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Nov 2018 11:35:29 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jeff Chandler\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:46;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"WPTavern: Google’s reCAPTCHA v3 Promises a “Frictionless User Experience”\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85145\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://wptavern.com/googles-recaptcha-v3-promises-a-frictionless-user-experience\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3218:\"<p>Google <a href=\"https://webmasters.googleblog.com/2018/10/introducing-recaptcha-v3-new-way-to.html\" rel=\"noopener noreferrer\" target=\"_blank\">introduced reCAPTCHA v3</a> this week, which promises a new &#8220;frictionless user experience.&#8221; Earlier versions of the API stopped bots but also drew the ire of internet users across the globe. Users were regularly inconvenienced with distorted text challenges, street sign puzzles, click requirements, and other actions to prove their humanity. </p>\n<p>v3 offers a marked improvement by detecting bots in the background and returning a score that tells the admin if the interaction is suspicious. It scores traffic with its <a href=\"https://patents.google.com/patent/US20110054961A1/en\">Adaptive Risk Analysis Engine</a> instead of forcing human users to perform interactive challenges. The score can be used three different ways:</p>\n<ul>\n<li>Set a threshold that determines when a user is let through or when further verification needs to be done, i.e. two-factor authentication or phone verification.</li>\n<li>Combine the score with your own signals that reCAPTCHA can’t access, such as user profiles or transaction histories.</li>\n<li>Use the reCAPTCHA score as one of the signals to train your machine learning model to fight abuse.</li>\n</ul>\n<p>v3 give site owners more options to customize the thresholds and actions for different types of traffic. The video below explains how it works and the <a href=\"https://developers.google.com/recaptcha/docs/v3\" rel=\"noopener noreferrer\" target=\"_blank\">developer docs</a> have more information on frontend integration and score interpretation.</p>\n<p></p>\n<p>Site owners can view their traffic in the <a href=\"https://www.google.com/recaptcha/admin\" rel=\"noopener noreferrer\" target=\"_blank\">reCAPTCHA admin console</a>. It also displays a list of all of your sites and what version of the API they are using.</p>\n<p><a href=\"https://i1.wp.com/wptavern.com/wp-content/uploads/2018/10/Screen-Shot-2018-11-01-at-5.08.11-PM.png?ssl=1\"><img /></a></p>\n<p>The admin console also has a form for registering new sites:</p>\n<p><a href=\"https://i2.wp.com/wptavern.com/wp-content/uploads/2018/10/Screen-Shot-2018-11-01-at-5.09.18-PM.png?ssl=1\"><img /></a></p>\n<p>The WordPress Plugin Directory has <a href=\"https://wordpress.org/plugins/search/reCAPTCHA/\" rel=\"noopener noreferrer\" target=\"_blank\">dozens of standalone plugins and contact forms</a> that make use of reCAPTCHA in some way. Sites that are already set up to use v2 or the Invisible CAPTCHA, will not automatically update to use v3. There&#8217;s a different signup and implementation process that the site owner has to perform before having it integrated on the site.</p>\n<p>WordPress plugin developers who offer reCAPTCHA will have to decide if they want to update existing plugins to use v3 or package a v3 offering in a new plugin. The reCAPTCHA v1 API was shut down earlier this year in March. Google&#8217;s <a href=\"https://github.com/google/recaptcha/\" rel=\"noopener noreferrer\" target=\"_blank\">reCAPTCHA PHP client library on GitHub</a> is still actively encouraging use of both v2 and v3. A date has not been announced for v2 to be deprecated. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Nov 2018 00:09:59 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:47;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:37:\"Dev Blog: Quarterly Updates | Q3 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6206\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:61:\"https://wordpress.org/news/2018/11/quarterly-updates-q3-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:14624:\"<p><em>To keep everyone aware of big projects and efforts across WordPress contributor teams, I&#8217;ve reached out to each team&#8217;s <a href=\"https://make.wordpress.org/updates/team-reps/\">listed representatives</a>. I asked each of them to share their Top Priority (and when they hope for it to be completed), as well as their biggest Wins and Worries. Have questions? I&#8217;ve included a link to each team&#8217;s site in the headings.</em></p>\n\n\n<h2><a href=\"https://make.wordpress.org/accessibility/\">Accessibility</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/joedolson/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>joedolson</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>audrasjb</a>, <a href=\"https://profiles.wordpress.org/arush/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>arush</a></li>\n<li><strong>Priority</strong>: Work on authoring a manual for assistive technology users on Gutenberg, led by Claire Brotherton (<a href=\"https://profiles.wordpress.org/abrightclearweb/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>abrightclearweb</a>). Continue to work on improving the overall user experience in Gutenberg. Update and organize the WP A11y handbook.</li>\n<li><strong>Struggle</strong>: Lack of developers and accessibility experts to help test and code the milestone issues. Still over 100 outstanding issues, and developing the Gutenberg AT manual helps expose additional issues. The announcement of an accessibility focus on 4.9.9 derailed our planning for Gutenberg in September with minimal productivity, as that goal was quickly withdrawn from the schedule.</li>\n<li><strong>Big Win</strong>: Getting focus constraint implemented in popovers and similar components in Gutenberg.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/cli/\">CLI</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: @danielbachhuber, <a href=\"https://profiles.wordpress.org/schlessera/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>schlessera</a></li>\n<li><strong>Priority</strong>: Current priority is v2.1.0 of WP-CLI, to polish the major refactoring v2.0.0 introduced. You can <a href=\"https://make.wordpress.org/cli/good-first-issues/\">join in or follow progress</a> on their site.</li>\n<li><strong>Struggle</strong>: Getting enough contributors to make peer-review possible/manageable.</li>\n<li><strong>Big Win</strong>: The major refactoring of v2 was mostly without any negative impacts on existing installs. It provided substantial improvements to maintainability including: faster and more reliable testing, more straight-forward changes to individual packages, and simpler contributor on-boarding.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/community/\">Community</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/francina/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>francina</a>, <a href=\"https://profiles.wordpress.org/hlashbrooke/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>hlashbrooke</a></li>\n<li><strong>Priority</strong>: Supporting contributors of all levels via: monthly <a href=\"https://make.wordpress.org/community/2018/10/08/announcement-monthly-chat-for-wordcamp-organisers/\">WordCamp Organizers chat</a>, better onboarding with a translated <a href=\"https://make.wordpress.org/community/2017/08/11/global-community-team-welcome-pack/\">welcome pack</a>, and Contribution Drive documentation.</li>\n<li><strong>Struggle</strong>: Fewer contributors than usual.</li>\n<li><strong>Big Win</strong>: <a href=\"https://make.wordpress.org/community/2018/09/21/meetup-application-vetting-sprint-26-27-september/\">Meetup Vetting Sprint</a>! </li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/core/\">Core</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/jeffpaul/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>jeffpaul</a></li>\n<li><strong>Priority</strong>: Continued preparation for the 5.0 release cycle and Gutenberg.</li>\n<li><strong>Struggle</strong>: Identifying tasks for first time contributors, as well as for new-to-JS contributors.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/design/\">Design</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/melchoyce/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>melchoyce</a>, <a href=\"https://profiles.wordpress.org/karmatosed/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>karmatosed</a>, <a href=\"https://profiles.wordpress.org/boemedia/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>boemedia</a>, <a href=\"https://profiles.wordpress.org/joshuawold/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>joshuawold</a>, <a href=\"https://profiles.wordpress.org/mizejewski/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>mizejewski</a></li>\n<li><strong>Priority</strong>: Preparing for WordPress 5.0 and continuing to work on better onboarding practices.</li>\n<li><strong>Struggle</strong>: Identifying tasks for contributor days, especially for small- to medium-sized tasks that can be fit into a single day.</li>\n<li><strong>Big Win</strong>: Regular contributions are starting to build up.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/docs/\">Documentation</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/kenshino/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>kenshino</a></li>\n<li><strong>Priority</strong>: Getting HelpHub out before WordPress 5.0&#8217;s launch to make sure Gutenberg User Docs have a permanent position to reside</li>\n<li><strong>Struggle</strong>: Getting the documentation from HelpHub into WordPress.org/support is more manual than initially anticipated.</li>\n<li><strong>Big Win</strong>: Had a good discussion with the Gutenberg team about their docs and how WordPress.org expects documentation to be distributed (via DevHub, Make and HelpHub). Getting past the code blocks to release HelpHub (soon)</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/hosting/\">Hosting</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/mikeschroder/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>mikeschroder</a>, <a href=\"https://profiles.wordpress.org/jadonn/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>jadonn</a></li>\n<li><strong>Priority</strong>: Helping Gutenberg land well at hosts for users in 5.0.</li>\n<li><strong>Struggle</strong>: Short time frame with few resources to accomplish priority items.</li>\n<li><strong>Big Win</strong>: Preparing Try Gutenberg support guide for hosts during the rollout and good reception from users following it.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/marketing/\">Marketing</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/bridgetwillard/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>bridgetwillard</a></li>\n<li><strong>Priority</strong>: Continuing to write and publish case studies from the community.</li>\n<li><strong>Big Win</strong>: Onboarding guide is going well and is currently being <a href=\"https://translate.wordpress.org/projects/meta/get-involved\">translated</a>.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/meta/\">Meta</a> (WordPress.org Site)</h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/tellyworth/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>tellyworth</a>, <a href=\"https://profiles.wordpress.org/coffee2code/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>coffee2code</a></li>\n<li><strong>Priority</strong>: Support for other teams in the lead up to, and the follow-up of, the release of WP 5.0. ETA is the WP 5.0 release date (Nov 19) and thereafter, unless it gets bumped to next quarter.</li>\n<li><strong>Struggle</strong>: Maintaining momentum on tickets (still).</li>\n<li><strong>Big Win</strong>: Launch of front-end demo of Gutenberg on https://wordpress.org/gutenberg/</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/mobile/\">Mobile</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/elibud/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>elibud</a></li>\n<li><strong>Priority</strong>: Have an alpha version of Gutenberg in the WordPress apps, ETA end of year 2018.</li>\n<li><strong>Struggle</strong>: Unfamiliar tech stack and the goal of reusing as much of Gutenberg-web&#8217;s code as possible.</li>\n<li><strong>Big Win</strong>: Running mobile tests on web&#8217;s PRs.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/plugins/\">Plugins</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/ipstenu/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>ipstenu</a></li>\n<li><strong>Priority</strong>: Cleaning up &#8216;inactive&#8217; users, which was supposed to be complete but some work preparing for 5.0 was necessary.</li>\n<li><strong>Struggles</strong>: Devnotes are lacking for the upcoming release which slows progress.</li>\n<li><strong>Big Win</strong>: No backlog even though a lot were out!</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/polyglots/\">Polyglots</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/petya/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>petya</a>, <a href=\"https://profiles.wordpress.org/ocean90/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>ocean90</a>, <a href=\"https://profiles.wordpress.org/nao/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>nao</a>, <a href=\"https://profiles.wordpress.org/chantalc/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>chantalc</a>, <a href=\"https://profiles.wordpress.org/deconf/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>deconf</a>, <a href=\"https://profiles.wordpress.org/casiepa/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>casiepa</a></li>\n<li><strong>Priority</strong>: Help re-activating inactive locale teams.</li>\n<li><strong>Struggle</strong>: Many GTEs are having a hard time keeping up with incoming translation <a href=\"https://make.wordpress.org/polyglots/?resolved=unresolved&tags=editor-requests\">validation and PTE requests</a>.</li>\n<li><strong>Big Win</strong>: Made some progress in locale research and reassigning new GTEs.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/support/\">Support</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/clorith/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>clorith</a></li>\n<li><strong>Priority:</strong> Preparing for the upcoming 5.0 release</li>\n<li><strong>Struggle</strong>: Finding a good balance between how much we want to help people and how much we are able to help people. Also, contributor recruitment (always a crowd favorite!)</li>\n<li><strong>Big Win</strong>: How well the team, on a global level, has managed to maintain a good flow of user engagement through support.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/themes/\">Theme Review</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/acosmin/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>acosmin</a>, <a href=\"https://profiles.wordpress.org/rabmalin/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>rabmalin</a>, <a href=\"https://profiles.wordpress.org/thinkupthemes/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>thinkupthemes</a>, <a href=\"https://profiles.wordpress.org/williampatton/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>williampatton</a></li>\n<li><strong>Priority</strong>: Implementing the Theme Sniffer plugin on WordPress.org which is one step forward towards automation. ETA early 2019</li>\n<li><strong>Struggle</strong>: Not having so many contributors/reviewers.</li>\n<li><strong>Big Win</strong>: Implementing <a href=\"https://make.wordpress.org/themes/2018/10/25/new-requirements/\">multiple requirements</a> into our review flow, like screenshots and readme.txt requirements.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<p><!-- /wp:list --><!-- wp:heading --></p>\n<h2><a href=\"https://make.wordpress.org/training/\">Training</a></h2>\n<p><!-- /wp:heading --><!-- wp:list --></p>\n<ul>\n<li><strong>Contacted</strong>: <a href=\"https://profiles.wordpress.org/bethsoderberg/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>bethsoderberg</a>, <a href=\"https://profiles.wordpress.org/juliek/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>juliek</a></li>\n<li><strong>Priority:</strong> Getting the learn.wordpress.org site designed, developed, and being able to publish lesson plans to it.</li>\n<li><strong>Struggle:</strong> Getting contributors onboard and continually contributing. Part of that is related to the learn.wordpress.org site. People like to see their contributions.</li>\n<li><strong>Big Win</strong>: We have our new workflow and tools in place. We are also streamlining that process to help things go from idea to publication more quickly.</li>\n</ul>\n<p><!-- /wp:list --><!-- wp:paragraph --></p>\n<p><em>Interested in updates from the last quarter? You can find those here: <a href=\"https://wordpress.org/news/2018/07/quarterly-updates-q2-2018/\">https://wordpress.org/news/2018/07/quarterly-updates-q2-2018/</a></em></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Nov 2018 16:46:16 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Josepha\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:48;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:46:\"Dev Blog: The Month in WordPress: October 2018\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=6230\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://wordpress.org/news/2018/11/the-month-in-wordpress-october-2018/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:8136:\"<p>Teams across the WordPress project are working hard to make sure everything is ready for the upcoming release of WordPress 5.0. Find out what’s going on and how you can get involved.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>The Plan for WordPress 5.0</h2>\n\n\n\n<p>Early this month, <a href=\"https://make.wordpress.org/core/2018/10/03/proposed-wordpress-5-0-scope-and-schedule/\">the planned release schedule was announced</a> for WordPress 5.0, which was <a href=\"https://make.wordpress.org/core/2018/10/31/wordpress-5-0-schedule-updates/\">updated</a> a few weeks later. WordPress 5.0 is a highly anticipated release, as it’s the official &nbsp;launch of Gutenberg &#8212; the new block editor for WordPress Core. For more detail, check out this <a href=\"https://make.wordpress.org/core/2018/10/12/granular-timeline/\">&nbsp;granular timeline</a>.<br /></p>\n\n\n\n<p>Along with the planned release schedule, <a href=\"https://profiles.wordpress.org/matt/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>matt</a>, who is heading up this release, <a href=\"https://make.wordpress.org/core/2018/10/03/a-plan-for-5-0/\">announced leads for critical focuses on the project</a>, including <a href=\"https://profiles.wordpress.org/matveb/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>matveb</a>, <a href=\"https://profiles.wordpress.org/karmatosed/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>karmatosed</a>, <a href=\"https://profiles.wordpress.org/laurelfulford/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>laurelfulford</a>, <a href=\"https://profiles.wordpress.org/allancole/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>allancole</a>, <a href=\"https://profiles.wordpress.org/lonelyvegan/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>lonelyvegan</a>, <a href=\"https://profiles.wordpress.org/omarreiss/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>omarreiss</a>, <a href=\"https://profiles.wordpress.org/antpb/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>antpb</a>, <a href=\"https://profiles.wordpress.org/pento/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>pento</a>, <a href=\"https://profiles.wordpress.org/chanthaboune/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>chanthaboune</a>, <a href=\"https://profiles.wordpress.org/danielbachhuber/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>danielbachhuber</a>, and <a href=\"https://profiles.wordpress.org/mcsf/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>mcsf</a>.<br /></p>\n\n\n\n<p><a href=\"https://wordpress.org/news/2018/10/wordpress-5-0-beta-2/\">WordPress 5.0 is currently in its second beta phase</a> and will soon move to the release candidate status. Help test this release right now by installing the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester plugin</a> on your site.<br /></p>\n\n\n\n<p>Want to get involved in building WordPress Core? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a> and join the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>. You can also help out by <a href=\"https://make.wordpress.org/test/\">testing</a> or <a href=\"https://make.wordpress.org/polyglots/2018/10/24/wordpress-5-0-gutenberg-and-twenty-nineteen/\">translating</a> the release into a local language.</p>\n\n\n\n<h2>New Editor for WordPress Core</h2>\n\n\n\n<p>Active development continues on <a href=\"https://wordpress.org/gutenberg\">Gutenberg</a>, the new editing experience for WordPress Core. <a href=\"https://make.wordpress.org/core/2018/10/31/whats-new-in-gutenberg-31st-october-2/\">The latest release</a> is feature complete, meaning that all further development on it will be to improve existing features and fix outstanding bugs.<br /></p>\n\n\n\n<p>Some have raised concerns about Gutenberg’s accessibility, prompting the development team <a href=\"https://make.wordpress.org/core/2018/10/18/regarding-accessibility-in-gutenberg/\">to detail some areas</a> in which the new editor is accessible. To help improve things further, the team has made <a href=\"https://make.wordpress.org/core/2018/10/19/call-for-testers-community-gutenberg-accessibility-tests/\">a public call for accessibility testers</a> to assist.<br /></p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/tag/gutenberg\">the Gutenberg tag</a> on the Core team blog and join the #core-editor channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>. Read <a href=\"https://make.wordpress.org/test/2018/10/19/gutenberg-needs-testing-areas/\">this guide</a> to find areas where you can have the most impact.</p>\n\n\n\n<h2>Migrating HelpHub to WordPress.org</h2>\n\n\n\n<p>HelpHub is an ongoing project to move all of WordPress’ user documentation from the <a href=\"https://codex.wordpress.org/\">Codex</a> to the <a href=\"https://wordpress.org/support/\">WordPress Support portal</a>.<br /></p>\n\n\n\n<p>HelpHub has been developed on <a href=\"https://wp-helphub.com/\">a separate staging server</a> and it’s now time to migrate the new documentation to its home on WordPress.org. The plan is to have everything moved over &nbsp;before WordPress 5.0 is released, so that all the new documentation will be available on the new platform from the start.<br /></p>\n\n\n\n<p>The HelpHub team has published <a href=\"https://make.wordpress.org/docs/2018/11/01/call-for-volunteers-helphub-migration/\">a call for volunteers</a> to help with the migration. If you would like to get involved, join the #docs channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>, and contact <a href=\"https://profiles.wordpress.org/atachibana/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>atachibana</a> to get started.</p>\n\n\n\n<h2>A New Default Theme for WordPress</h2>\n\n\n\n<p><a href=\"https://make.wordpress.org/core/2018/10/16/introducing-twenty-nineteen/\">A brand new default theme &#8212; Twenty Nineteen &#8212; has been announced</a>&nbsp;with development being led by <a href=\"https://profiles.wordpress.org/allancole/\" class=\"mention\"><span class=\"mentions-prefix\">@</span>allancole</a>. The theme is packaged with WordPress 5.0, so it will be following the same release schedule as Core.<br /></p>\n\n\n\n<p>The new theme is designed to integrate seamlessly with Gutenberg and showcase how you can build a theme alongside the new block editor and take advantage of the creative freedom that it offers.<br /></p>\n\n\n\n<p>Want to help build Twenty Nineteen? Join in on <a href=\"https://github.com/WordPress/twentynineteen\">the theme’s GitHub repo</a> and join the #core-themes channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.<br /></p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>The Support team are putting together more formal <a href=\"https://github.com/Clorith/wporg-support-guidelines\">Support Guidelines</a> for the WordPress Support Forums.</li><li>The group focused on privacy tools in Core <a href=\"https://make.wordpress.org/core/2018/10/11/whats-new-in-core-privacy/\">has released some details</a> on the work they have been doing recently, with a roadmap for their plans over the next few months.</li><li>The Core team <a href=\"https://make.wordpress.org/core/2018/10/15/wordpress-and-php-7-3/\">released an update</a> about how WordPress will be compatible with PHP 7.3.</li><li>The Theme Review Team have published <a href=\"https://make.wordpress.org/themes/2018/10/25/new-requirements/\">some new requirements</a> regarding child themes, readme files and trusted authors in the Theme Directory.</li><li>The WordCamp Europe team <a href=\"https://make.wordpress.org/community/2018/10/23/progressive-web-app-for-wordcamps/\">are working on a PWA service</a> for all WordCamp websites.</li></ul>\n\n\n\n<p><em>If you have a story we should consider including in the next “Month in WordPress” post, please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em><br /></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Nov 2018 08:40:03 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Hugh Lashbrooke\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:49;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:61:\"WPTavern: Gutenberg Cloud Plugin for WordPress is Now in Beta\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://wptavern.com/?p=85115\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"https://wptavern.com/gutenberg-cloud-plugin-for-wordpress-is-now-in-beta\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5938:\"<p><a href=\"https://www.frontkom.no/\" rel=\"noopener noreferrer\" target=\"_blank\">Frontkom</a>, the team behind the <a href=\"https://gutenbergcloud.org/\" rel=\"noopener noreferrer\" target=\"_blank\">Gutenberg Cloud</a> project, has published the beta version of its WordPress plugin to the official repository. <a href=\"https://wordpress.org/plugins/cloud-blocks/\" rel=\"noopener noreferrer\" target=\"_blank\">Cloud Blocks</a> serves as a connector, allowing WordPress users to browse and install open source blocks from Gutenberg Cloud. The blocks are hosted on NPM and their assets are served from CloudFlare using <a href=\"https://unpkg.com\" rel=\"noopener noreferrer\" target=\"_blank\">unpkg.com</a>.</p>\n<p><a href=\"https://i0.wp.com/wptavern.com/wp-content/uploads/2018/10/gutenberg-cloud-wp-plugin.gif?ssl=1\"><img /></a></p>\n<p>Gutenberg Cloud&#8217;s online library of blocks is CMS agnostic, offering blocks for both Drupal and WordPress sites, and more CMSs in the future. The service advertises three key benefits for developers who host blocks on Gutenberg Cloud:</p>\n<ul>\n<li>Wider adoption: Your blocks can be used outside of WP</li>\n<li>Discoverability: Your blocks will pop up in the Cloud Blocks UI</li>\n<li>Faster development: No plugin/SVN needed, just publish to NPM</li>\n</ul>\n<p>Frontkom is actively recruiting WordPress developers to add blocks to the cloud to test the process. Documentation for <a href=\"https://github.com/front/cloud-blocks/blob/master/docs/migrate-block.md\" rel=\"noopener noreferrer\" target=\"_blank\">migrating blocks from a plugin</a> is available on GitHub. Frontkom has also produced a new <a href=\"https://github.com/front/create-cloud-block\" rel=\"noopener noreferrer\" target=\"_blank\">boilerplate generator for building Gutenberg Cloud blocks</a>.</p>\n<p>Users should note that the team is still ironing out the experience for developers adding blocks to the cloud, so the plugin isn&#8217;t yet ready for general use. It&#8217;s currently under active development. </p>\n<h3>WordPress Developers Say Gutenberg Cloud May Not be the Best Way to Release Blocks but Platform has Potential</h3>\n<p>I contacted some WordPress developers who have tested sending their blocks to Gutenberg Cloud to get their initial reactions to the platform. </p>\n<p>&#8220;The idea that folks will be able to install blocks a la carte is interesting,&#8221; <a href=\"https://coblocks.com/\" rel=\"noopener noreferrer\" target=\"_blank\">CoBlocks</a> author and ThemeBeans founder Rich Tabor said. &#8220;It’s pretty much as easy as installing plugins.&#8221;</p>\n<p>Tabor experimented with migrating his Block Gallery blocks and said the process was not difficult but he foresees difficulties in maintaining blocks across parent plugins and Gutenberg Cloud.</p>\n<p>&#8220;As a developer, I’m still not entirely convinced Gutenberg Cloud is the best way to release blocks, aside from relatively simple blocks,&#8221; Tabor said. &#8220;I personally lean towards building suites of blocks that share a relative purpose, instead of one plugin (or one Cloud Block instance) per block. For one, it cuts down on maintenance quite a bit, as custom components can be shared between blocks. And there’s much better discoverability on getting relative blocks in the hands of users — if they’re grouped together.&#8221;</p>\n<p>Block collections have been criticized for making it difficult to search for and discover individual blocks, but Tabor makes some good arguments for improving block discoverability by grouping together features users often need. That is the whole point of successful plugins like Jetpack, but this type of packaging also lends itself to criticism about bloat.</p>\n<p>&#8220;It’s a similar conundrum when we look at grouped/not grouped shortcode plugins,&#8221; Tabor said. &#8220;I suppose the main difference is that the nature of blocks is much more complicated than that of shortcodes. History seems to repeat itself.&#8221;</p>\n<p>Tabor said he is considering distributing a few of his free blocks through Gutenberg Cloud but he hasn&#8217;t fully decided yet.</p>\n<p>WordPress core contributor, <a href=\"https://joshpress.net/\" rel=\"noopener noreferrer\" target=\"_blank\">Josh Pollock</a>, who has worked extensively with React and Gutenberg, also tested the Gutenberg Cloud platform. He said he thinks it has a lot of potential for developers who write blocks that are mainly JavaScript already.</p>\n<p>&#8220;I could see how an agency that builds WordPress sites could save a lot of time and hassle building out a block library,&#8221; Pollock said. &#8220;As a plugin developer with a lot of little ideas, the pain and time of setting up a block and block environment, which no one has gotten right yet, makes me very excited about this.&#8221;</p>\n<p>Pollock also reported a positive experience with the <a href=\"https://github.com/front/create-cloud-block\" rel=\"noopener noreferrer\" target=\"_blank\">create-cloud-block</a> generator.</p>\n<p>&#8220;The code that create-cloud-block generates is well-written, but not too opinionated,&#8221; Pollock said. &#8220;The developer experience is both really cool &#8212; you preview your block in a functional Gutenberg-powered editor with no WordPress site attached &#8212; and a little frustrating as there is no live reload yet. I know they are just getting started and the tool doesn&#8217;t lock you into any structure, which is great. I&#8217;ll be keeping my eye on this project.&#8221;</p>\n<p>Frontkom CTO Per André Rønsen said his team will continue testing the cloud internally until they get more developer feedback on the corresponding WordPress plugin. For Drupal users, Gutenberg Cloud will be shipped as a submodule of Gutenberg, which means all sites that install Gutenberg will also get the Cloud module. It can, however, be disabled. Rønsen said his team plans to showcase Gutenberg Cloud for D8 at DrupalCamp Oslo in November.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 31 Oct 2018 23:12:09 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Fri, 30 Nov 2018 09:07:36 GMT\";s:12:\"content-type\";s:8:\"text/xml\";s:4:\"vary\";s:15:\"Accept-Encoding\";s:13:\"last-modified\";s:29:\"Fri, 30 Nov 2018 09:00:29 GMT\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";s:16:\"content-encoding\";s:4:\"gzip\";}}s:5:\"build\";s:14:\"20130910210210\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(966, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1543612057', 'no'),
(967, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1543568857', 'no'),
(968, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1543612057', 'no'),
(969, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2018/11/wordpress-5-0-release-candidate/\'>WordPress 5.0 Release Candidate</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wptavern.com/gutenberg-times-to-host-live-qa-with-gutenberg-leads-on-friday-november-30\'>WPTavern: Gutenberg Times to Host Live Q&amp;A with Gutenberg Leads on Friday, November 30</a></li><li><a class=\'rsswidget\' href=\'https://ma.tt/2018/11/a-gutenberg-faq/\'>Matt: WordPress 5.0: A Gutenberg FAQ</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/wpcampus-seeks-to-raise-30k-for-gutenberg-accessibility-audit\'>WPTavern: WPCampus Seeks to Raise $30K for Gutenberg Accessibility Audit</a></li></ul></div>', 'no'),
(971, '_transient_timeout_plugin_slugs', '1543656283', 'no'),
(972, '_transient_plugin_slugs', 'a:3:{i:0;s:21:\"manage-major/main.php\";i:1;s:27:\"js_composer/js_composer.php\";i:2;s:35:\"zozothemes-core/zozothemes-core.php\";}', 'no'),
(979, '_site_transient_timeout_theme_roots', '1543588776', 'no'),
(980, '_site_transient_theme_roots', 'a:2:{s:11:\"metal-child\";s:7:\"/themes\";s:5:\"metal\";s:7:\"/themes\";}', 'no'),
(981, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1543586980;s:7:\"checked\";a:3:{s:21:\"manage-major/main.php\";s:5:\"1.0.0\";s:27:\"js_composer/js_composer.php\";s:5:\"5.4.5\";s:35:\"zozothemes-core/zozothemes-core.php\";s:5:\"1.0.0\";}s:8:\"response\";a:1:{s:27:\"js_composer/js_composer.php\";O:8:\"stdClass\":5:{s:4:\"slug\";s:11:\"js_composer\";s:11:\"new_version\";s:3:\"5.6\";s:3:\"url\";s:0:\"\";s:7:\"package\";b:0;s:4:\"name\";s:21:\"WPBakery Page Builder\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(9, 7, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(10, 7, '_edit_last', '1'),
(11, 7, '_edit_lock', '1541184965:1'),
(12, 7, '_wp_page_template', 'index.php'),
(13, 7, 'zozo_page_top_padding', '10px'),
(14, 7, 'zozo_page_bottom_padding', '10px'),
(15, 7, 'zozo_slider_position', 'default'),
(16, 7, 'zozo_revolutionslider', ''),
(17, 7, 'zozo_show_header', 'yes'),
(18, 7, 'zozo_show_header_top_bar', 'yes'),
(19, 7, 'zozo_show_header_sliding_bar', 'default'),
(20, 7, 'zozo_header_layout', 'default'),
(21, 7, 'zozo_header_type', 'default'),
(22, 7, 'zozo_header_toggle_position', 'default'),
(23, 7, 'zozo_header_transparency', 'default'),
(24, 7, 'zozo_header_skin', 'light'),
(25, 7, 'zozo_header_menu_skin', 'light'),
(26, 7, 'zozo_custom_nav_menu', 'default'),
(27, 7, 'zozo_custom_mobile_menu', 'default'),
(28, 7, 'zozo_header_bg_image', ''),
(29, 7, 'zozo_header_bg_image_attach_id', ''),
(30, 7, 'zozo_header_bg_color', ''),
(31, 7, 'zozo_header_bg_opacity', '0'),
(32, 7, 'zozo_header_bg_repeat', ''),
(33, 7, 'zozo_header_bg_attachment', ''),
(34, 7, 'zozo_header_bg_postion', ''),
(35, 7, 'zozo_header_bg_full', '0'),
(36, 7, 'zozo_show_footer_widgets', 'default'),
(37, 7, 'zozo_show_footer_menu', 'default'),
(38, 7, 'zozo_primary_sidebar', '0'),
(39, 7, 'zozo_secondary_sidebar', '0'),
(40, 7, 'zozo_hide_page_title_bar', 'yes'),
(41, 7, 'zozo_hide_page_title', 'yes'),
(42, 7, 'zozo_page_title_type', 'default'),
(43, 7, 'zozo_page_title_skin', 'default'),
(44, 7, 'zozo_page_title_align', 'default'),
(45, 7, 'zozo_display_breadcrumbs', 'default'),
(46, 7, 'zozo_show_page_slogan', 'yes'),
(47, 7, 'zozo_page_slogan', ''),
(48, 7, 'zozo_page_title_height', ''),
(49, 7, 'zozo_page_title_mobile_height', ''),
(50, 7, 'zozo_page_title_bar_title_color', ''),
(51, 7, 'zozo_page_title_bar_slogan_color', ''),
(52, 7, 'zozo_page_breadcrumbs_color', ''),
(53, 7, 'zozo_page_title_bar_border_color', ''),
(54, 7, 'zozo_page_title_bar_bg', ''),
(55, 7, 'zozo_page_title_bar_bg_attach_id', ''),
(56, 7, 'zozo_page_title_bar_bg_color', ''),
(57, 7, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(58, 7, 'zozo_page_title_bar_bg_position', 'left top'),
(59, 7, 'zozo_page_title_bar_bg_parallax', 'no'),
(60, 7, 'zozo_page_title_bar_bg_full', '0'),
(61, 7, 'zozo_page_title_video_bg', '0'),
(62, 7, 'zozo_page_title_video_id', ''),
(63, 7, 'zozo_page_bg_image', ''),
(64, 7, 'zozo_page_bg_image_attach_id', ''),
(65, 7, 'zozo_page_bg_repeat', ''),
(66, 7, 'zozo_page_bg_attachment', ''),
(67, 7, 'zozo_page_bg_position', ''),
(68, 7, 'zozo_page_bg_color', ''),
(69, 7, 'zozo_page_bg_opacity', '0'),
(70, 7, 'zozo_page_bg_full', '0'),
(71, 7, 'zozo_body_bg_image', ''),
(72, 7, 'zozo_body_bg_image_attach_id', ''),
(73, 7, 'zozo_body_bg_repeat', ''),
(74, 7, 'zozo_body_bg_attachment', ''),
(75, 7, 'zozo_body_bg_position', ''),
(76, 7, 'zozo_body_bg_color', ''),
(77, 7, 'zozo_body_bg_opacity', '0'),
(78, 7, 'zozo_body_bg_full', '0'),
(79, 7, 'zozo_section_header_status', 'show'),
(80, 7, 'zozo_section_title', ''),
(81, 7, 'zozo_section_slogan', ''),
(82, 7, 'zozo_section_padding_top', ''),
(83, 7, 'zozo_section_padding_bottom', ''),
(84, 7, 'zozo_section_header_padding', ''),
(85, 7, 'zozo_section_title_color', ''),
(86, 7, 'zozo_section_slogan_color', ''),
(87, 7, 'zozo_section_text_color', ''),
(88, 7, 'zozo_section_content_heading_color', ''),
(89, 7, 'zozo_section_bg_color', ''),
(90, 7, 'zozo_parallax_status', 'no'),
(91, 7, 'zozo_parallax_bg_image', ''),
(92, 7, 'zozo_parallax_bg_image_attach_id', ''),
(93, 7, 'zozo_parallax_bg_repeat', ''),
(94, 7, 'zozo_parallax_bg_attachment', ''),
(95, 7, 'zozo_parallax_bg_postion', ''),
(96, 7, 'zozo_parallax_bg_size', ''),
(97, 7, 'zozo_parallax_bg_overlay', 'no'),
(98, 7, 'zozo_overlay_pattern_status', 'no'),
(99, 7, 'zozo_section_overlay_color', ''),
(100, 7, 'zozo_overlay_color_opacity', '0'),
(101, 7, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(102, 7, 'zozo_parallax_additional_sections_order', ''),
(103, 7, '_wpb_vc_js_status', 'false'),
(104, 7, 'zozo_theme_layout', 'wide'),
(105, 9, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(106, 9, '_menu_item_type', 'post_type'),
(107, 9, '_menu_item_menu_item_parent', '0'),
(108, 9, '_menu_item_object_id', '7'),
(109, 9, '_menu_item_object', 'page'),
(110, 9, '_menu_item_target', ''),
(111, 9, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(112, 9, '_menu_item_xfn', ''),
(113, 9, '_menu_item_url', ''),
(115, 9, '_menu_item_zozo_megamenu_menutype', 'page'),
(116, 9, '_menu_item_zozo_megamenu_status', ''),
(117, 9, '_menu_item_zozo_megamenu_fullwidth', ''),
(118, 9, '_menu_item_zozo_megamenu_columns', 'auto'),
(119, 9, '_menu_item_zozo_megamenu_title', ''),
(120, 9, '_menu_item_zozo_megamenu_link', ''),
(121, 9, '_menu_item_zozo_megamenu_widgetarea', '0'),
(122, 9, '_menu_item_zozo_megamenu_content', ''),
(123, 9, '_menu_item_zozo_megamenu_icon', ''),
(128, 1, '_edit_lock', '1541395640:1'),
(129, 13, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(130, 13, '_edit_last', '1'),
(131, 13, '_edit_lock', '1543600919:1'),
(132, 13, '_wp_page_template', 'g-callback.php'),
(133, 13, 'zozo_page_top_padding', ''),
(134, 13, 'zozo_page_bottom_padding', ''),
(135, 13, 'zozo_slider_position', 'default'),
(136, 13, 'zozo_revolutionslider', ''),
(137, 13, 'zozo_show_header', 'yes'),
(138, 13, 'zozo_show_header_top_bar', 'default'),
(139, 13, 'zozo_show_header_sliding_bar', 'default'),
(140, 13, 'zozo_header_layout', 'default'),
(141, 13, 'zozo_header_type', 'default'),
(142, 13, 'zozo_header_toggle_position', 'default'),
(143, 13, 'zozo_header_transparency', 'default'),
(144, 13, 'zozo_header_skin', 'default'),
(145, 13, 'zozo_header_menu_skin', 'default'),
(146, 13, 'zozo_custom_nav_menu', 'default'),
(147, 13, 'zozo_custom_mobile_menu', 'default'),
(148, 13, 'zozo_header_bg_image', ''),
(149, 13, 'zozo_header_bg_image_attach_id', ''),
(150, 13, 'zozo_header_bg_color', ''),
(151, 13, 'zozo_header_bg_opacity', '0'),
(152, 13, 'zozo_header_bg_repeat', ''),
(153, 13, 'zozo_header_bg_attachment', ''),
(154, 13, 'zozo_header_bg_postion', ''),
(155, 13, 'zozo_header_bg_full', '0'),
(156, 13, 'zozo_show_footer_widgets', 'default'),
(157, 13, 'zozo_show_footer_menu', 'default'),
(158, 13, 'zozo_primary_sidebar', '0'),
(159, 13, 'zozo_secondary_sidebar', '0'),
(160, 13, 'zozo_hide_page_title_bar', 'no'),
(161, 13, 'zozo_hide_page_title', 'no'),
(162, 13, 'zozo_page_title_type', 'default'),
(163, 13, 'zozo_page_title_skin', 'default'),
(164, 13, 'zozo_page_title_align', 'default'),
(165, 13, 'zozo_display_breadcrumbs', 'default'),
(166, 13, 'zozo_show_page_slogan', 'yes'),
(167, 13, 'zozo_page_slogan', ''),
(168, 13, 'zozo_page_title_height', ''),
(169, 13, 'zozo_page_title_mobile_height', ''),
(170, 13, 'zozo_page_title_bar_title_color', ''),
(171, 13, 'zozo_page_title_bar_slogan_color', ''),
(172, 13, 'zozo_page_breadcrumbs_color', ''),
(173, 13, 'zozo_page_title_bar_border_color', ''),
(174, 13, 'zozo_page_title_bar_bg', ''),
(175, 13, 'zozo_page_title_bar_bg_attach_id', ''),
(176, 13, 'zozo_page_title_bar_bg_color', ''),
(177, 13, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(178, 13, 'zozo_page_title_bar_bg_position', 'left top'),
(179, 13, 'zozo_page_title_bar_bg_parallax', 'no'),
(180, 13, 'zozo_page_title_bar_bg_full', '0'),
(181, 13, 'zozo_page_title_video_bg', '0'),
(182, 13, 'zozo_page_title_video_id', ''),
(183, 13, 'zozo_page_bg_image', ''),
(184, 13, 'zozo_page_bg_image_attach_id', ''),
(185, 13, 'zozo_page_bg_repeat', ''),
(186, 13, 'zozo_page_bg_attachment', ''),
(187, 13, 'zozo_page_bg_position', ''),
(188, 13, 'zozo_page_bg_color', ''),
(189, 13, 'zozo_page_bg_opacity', '0'),
(190, 13, 'zozo_page_bg_full', '0'),
(191, 13, 'zozo_body_bg_image', ''),
(192, 13, 'zozo_body_bg_image_attach_id', ''),
(193, 13, 'zozo_body_bg_repeat', ''),
(194, 13, 'zozo_body_bg_attachment', ''),
(195, 13, 'zozo_body_bg_position', ''),
(196, 13, 'zozo_body_bg_color', ''),
(197, 13, 'zozo_body_bg_opacity', '0'),
(198, 13, 'zozo_body_bg_full', '0'),
(199, 13, 'zozo_section_header_status', 'show'),
(200, 13, 'zozo_section_title', ''),
(201, 13, 'zozo_section_slogan', ''),
(202, 13, 'zozo_section_padding_top', ''),
(203, 13, 'zozo_section_padding_bottom', ''),
(204, 13, 'zozo_section_header_padding', ''),
(205, 13, 'zozo_section_title_color', ''),
(206, 13, 'zozo_section_slogan_color', ''),
(207, 13, 'zozo_section_text_color', ''),
(208, 13, 'zozo_section_content_heading_color', ''),
(209, 13, 'zozo_section_bg_color', ''),
(210, 13, 'zozo_parallax_status', 'no'),
(211, 13, 'zozo_parallax_bg_image', ''),
(212, 13, 'zozo_parallax_bg_image_attach_id', ''),
(213, 13, 'zozo_parallax_bg_repeat', ''),
(214, 13, 'zozo_parallax_bg_attachment', ''),
(215, 13, 'zozo_parallax_bg_postion', ''),
(216, 13, 'zozo_parallax_bg_size', ''),
(217, 13, 'zozo_parallax_bg_overlay', 'no'),
(218, 13, 'zozo_overlay_pattern_status', 'no'),
(219, 13, 'zozo_section_overlay_color', ''),
(220, 13, 'zozo_overlay_color_opacity', '0'),
(221, 13, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(222, 13, 'zozo_parallax_additional_sections_order', ''),
(223, 13, '_wpb_vc_js_status', 'false'),
(224, 15, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(225, 15, '_edit_last', '1'),
(226, 15, '_edit_lock', '1540872857:1'),
(227, 15, '_wp_page_template', 'login.php'),
(228, 15, 'zozo_page_top_padding', ''),
(229, 15, 'zozo_page_bottom_padding', ''),
(230, 15, 'zozo_slider_position', 'default'),
(231, 15, 'zozo_revolutionslider', ''),
(232, 15, 'zozo_show_header', 'yes'),
(233, 15, 'zozo_show_header_top_bar', 'default'),
(234, 15, 'zozo_show_header_sliding_bar', 'default'),
(235, 15, 'zozo_header_layout', 'default'),
(236, 15, 'zozo_header_type', 'default'),
(237, 15, 'zozo_header_toggle_position', 'default'),
(238, 15, 'zozo_header_transparency', 'default'),
(239, 15, 'zozo_header_skin', 'default'),
(240, 15, 'zozo_header_menu_skin', 'dark'),
(241, 15, 'zozo_custom_nav_menu', 'default'),
(242, 15, 'zozo_custom_mobile_menu', 'default'),
(243, 15, 'zozo_header_bg_image', ''),
(244, 15, 'zozo_header_bg_image_attach_id', ''),
(245, 15, 'zozo_header_bg_color', ''),
(246, 15, 'zozo_header_bg_opacity', '0'),
(247, 15, 'zozo_header_bg_repeat', ''),
(248, 15, 'zozo_header_bg_attachment', ''),
(249, 15, 'zozo_header_bg_postion', ''),
(250, 15, 'zozo_header_bg_full', '0'),
(251, 15, 'zozo_show_footer_widgets', 'default'),
(252, 15, 'zozo_show_footer_menu', 'default'),
(253, 15, 'zozo_primary_sidebar', '0'),
(254, 15, 'zozo_secondary_sidebar', '0'),
(255, 15, 'zozo_hide_page_title_bar', 'yes'),
(256, 15, 'zozo_hide_page_title', 'yes'),
(257, 15, 'zozo_page_title_type', 'default'),
(258, 15, 'zozo_page_title_skin', 'default'),
(259, 15, 'zozo_page_title_align', 'default'),
(260, 15, 'zozo_display_breadcrumbs', 'default'),
(261, 15, 'zozo_show_page_slogan', 'yes'),
(262, 15, 'zozo_page_slogan', ''),
(263, 15, 'zozo_page_title_height', ''),
(264, 15, 'zozo_page_title_mobile_height', ''),
(265, 15, 'zozo_page_title_bar_title_color', ''),
(266, 15, 'zozo_page_title_bar_slogan_color', ''),
(267, 15, 'zozo_page_breadcrumbs_color', ''),
(268, 15, 'zozo_page_title_bar_border_color', ''),
(269, 15, 'zozo_page_title_bar_bg', ''),
(270, 15, 'zozo_page_title_bar_bg_attach_id', ''),
(271, 15, 'zozo_page_title_bar_bg_color', ''),
(272, 15, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(273, 15, 'zozo_page_title_bar_bg_position', 'left top'),
(274, 15, 'zozo_page_title_bar_bg_parallax', 'no'),
(275, 15, 'zozo_page_title_bar_bg_full', '0'),
(276, 15, 'zozo_page_title_video_bg', '0'),
(277, 15, 'zozo_page_title_video_id', ''),
(278, 15, 'zozo_page_bg_image', ''),
(279, 15, 'zozo_page_bg_image_attach_id', ''),
(280, 15, 'zozo_page_bg_repeat', ''),
(281, 15, 'zozo_page_bg_attachment', ''),
(282, 15, 'zozo_page_bg_position', ''),
(283, 15, 'zozo_page_bg_color', ''),
(284, 15, 'zozo_page_bg_opacity', '0'),
(285, 15, 'zozo_page_bg_full', '0'),
(286, 15, 'zozo_body_bg_image', ''),
(287, 15, 'zozo_body_bg_image_attach_id', ''),
(288, 15, 'zozo_body_bg_repeat', ''),
(289, 15, 'zozo_body_bg_attachment', ''),
(290, 15, 'zozo_body_bg_position', ''),
(291, 15, 'zozo_body_bg_color', ''),
(292, 15, 'zozo_body_bg_opacity', '0'),
(293, 15, 'zozo_body_bg_full', '0'),
(294, 15, 'zozo_section_header_status', 'show'),
(295, 15, 'zozo_section_title', ''),
(296, 15, 'zozo_section_slogan', ''),
(297, 15, 'zozo_section_padding_top', ''),
(298, 15, 'zozo_section_padding_bottom', ''),
(299, 15, 'zozo_section_header_padding', ''),
(300, 15, 'zozo_section_title_color', ''),
(301, 15, 'zozo_section_slogan_color', ''),
(302, 15, 'zozo_section_text_color', ''),
(303, 15, 'zozo_section_content_heading_color', ''),
(304, 15, 'zozo_section_bg_color', ''),
(305, 15, 'zozo_parallax_status', 'no'),
(306, 15, 'zozo_parallax_bg_image', ''),
(307, 15, 'zozo_parallax_bg_image_attach_id', ''),
(308, 15, 'zozo_parallax_bg_repeat', ''),
(309, 15, 'zozo_parallax_bg_attachment', ''),
(310, 15, 'zozo_parallax_bg_postion', ''),
(311, 15, 'zozo_parallax_bg_size', ''),
(312, 15, 'zozo_parallax_bg_overlay', 'no'),
(313, 15, 'zozo_overlay_pattern_status', 'no'),
(314, 15, 'zozo_section_overlay_color', ''),
(315, 15, 'zozo_overlay_color_opacity', '0'),
(316, 15, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(317, 15, 'zozo_parallax_additional_sections_order', ''),
(318, 15, '_wpb_vc_js_status', 'false'),
(319, 17, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(320, 17, '_edit_last', '1'),
(321, 17, '_edit_lock', '1540873003:1'),
(322, 17, '_wp_page_template', 'profile.php'),
(323, 17, 'zozo_page_top_padding', ''),
(324, 17, 'zozo_page_bottom_padding', ''),
(325, 17, 'zozo_slider_position', 'default'),
(326, 17, 'zozo_revolutionslider', ''),
(327, 17, 'zozo_show_header', 'yes'),
(328, 17, 'zozo_show_header_top_bar', 'default'),
(329, 17, 'zozo_show_header_sliding_bar', 'default'),
(330, 17, 'zozo_header_layout', 'default'),
(331, 17, 'zozo_header_type', 'default'),
(332, 17, 'zozo_header_toggle_position', 'default'),
(333, 17, 'zozo_header_transparency', 'default'),
(334, 17, 'zozo_header_skin', 'default'),
(335, 17, 'zozo_header_menu_skin', 'dark'),
(336, 17, 'zozo_custom_nav_menu', 'default'),
(337, 17, 'zozo_custom_mobile_menu', 'default'),
(338, 17, 'zozo_header_bg_image', ''),
(339, 17, 'zozo_header_bg_image_attach_id', ''),
(340, 17, 'zozo_header_bg_color', ''),
(341, 17, 'zozo_header_bg_opacity', '0'),
(342, 17, 'zozo_header_bg_repeat', ''),
(343, 17, 'zozo_header_bg_attachment', ''),
(344, 17, 'zozo_header_bg_postion', ''),
(345, 17, 'zozo_header_bg_full', '0'),
(346, 17, 'zozo_show_footer_widgets', 'default'),
(347, 17, 'zozo_show_footer_menu', 'default'),
(348, 17, 'zozo_primary_sidebar', '0'),
(349, 17, 'zozo_secondary_sidebar', '0'),
(350, 17, 'zozo_hide_page_title_bar', 'yes'),
(351, 17, 'zozo_hide_page_title', 'yes'),
(352, 17, 'zozo_page_title_type', 'default'),
(353, 17, 'zozo_page_title_skin', 'default'),
(354, 17, 'zozo_page_title_align', 'default'),
(355, 17, 'zozo_display_breadcrumbs', 'default'),
(356, 17, 'zozo_show_page_slogan', 'yes'),
(357, 17, 'zozo_page_slogan', ''),
(358, 17, 'zozo_page_title_height', ''),
(359, 17, 'zozo_page_title_mobile_height', ''),
(360, 17, 'zozo_page_title_bar_title_color', ''),
(361, 17, 'zozo_page_title_bar_slogan_color', ''),
(362, 17, 'zozo_page_breadcrumbs_color', ''),
(363, 17, 'zozo_page_title_bar_border_color', ''),
(364, 17, 'zozo_page_title_bar_bg', ''),
(365, 17, 'zozo_page_title_bar_bg_attach_id', ''),
(366, 17, 'zozo_page_title_bar_bg_color', ''),
(367, 17, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(368, 17, 'zozo_page_title_bar_bg_position', 'left top'),
(369, 17, 'zozo_page_title_bar_bg_parallax', 'no'),
(370, 17, 'zozo_page_title_bar_bg_full', '0'),
(371, 17, 'zozo_page_title_video_bg', '0'),
(372, 17, 'zozo_page_title_video_id', ''),
(373, 17, 'zozo_page_bg_image', ''),
(374, 17, 'zozo_page_bg_image_attach_id', ''),
(375, 17, 'zozo_page_bg_repeat', ''),
(376, 17, 'zozo_page_bg_attachment', ''),
(377, 17, 'zozo_page_bg_position', ''),
(378, 17, 'zozo_page_bg_color', ''),
(379, 17, 'zozo_page_bg_opacity', '0'),
(380, 17, 'zozo_page_bg_full', '0'),
(381, 17, 'zozo_body_bg_image', ''),
(382, 17, 'zozo_body_bg_image_attach_id', ''),
(383, 17, 'zozo_body_bg_repeat', ''),
(384, 17, 'zozo_body_bg_attachment', ''),
(385, 17, 'zozo_body_bg_position', ''),
(386, 17, 'zozo_body_bg_color', ''),
(387, 17, 'zozo_body_bg_opacity', '0'),
(388, 17, 'zozo_body_bg_full', '0'),
(389, 17, 'zozo_section_header_status', 'show'),
(390, 17, 'zozo_section_title', ''),
(391, 17, 'zozo_section_slogan', ''),
(392, 17, 'zozo_section_padding_top', ''),
(393, 17, 'zozo_section_padding_bottom', ''),
(394, 17, 'zozo_section_header_padding', ''),
(395, 17, 'zozo_section_title_color', ''),
(396, 17, 'zozo_section_slogan_color', ''),
(397, 17, 'zozo_section_text_color', ''),
(398, 17, 'zozo_section_content_heading_color', ''),
(399, 17, 'zozo_section_bg_color', ''),
(400, 17, 'zozo_parallax_status', 'no'),
(401, 17, 'zozo_parallax_bg_image', ''),
(402, 17, 'zozo_parallax_bg_image_attach_id', ''),
(403, 17, 'zozo_parallax_bg_repeat', ''),
(404, 17, 'zozo_parallax_bg_attachment', ''),
(405, 17, 'zozo_parallax_bg_postion', ''),
(406, 17, 'zozo_parallax_bg_size', ''),
(407, 17, 'zozo_parallax_bg_overlay', 'no'),
(408, 17, 'zozo_overlay_pattern_status', 'no'),
(409, 17, 'zozo_section_overlay_color', ''),
(410, 17, 'zozo_overlay_color_opacity', '0'),
(411, 17, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(412, 17, 'zozo_parallax_additional_sections_order', ''),
(413, 17, '_wpb_vc_js_status', 'false'),
(414, 15, 'zozo_theme_layout', 'wide'),
(415, 17, 'zozo_theme_layout', 'wide'),
(435, 20, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(436, 20, '_menu_item_type', 'post_type'),
(437, 20, '_menu_item_menu_item_parent', '0'),
(438, 20, '_menu_item_object_id', '7'),
(439, 20, '_menu_item_object', 'page'),
(440, 20, '_menu_item_target', ''),
(441, 20, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(442, 20, '_menu_item_xfn', ''),
(443, 20, '_menu_item_url', ''),
(444, 20, '_menu_item_orphaned', '1539451910'),
(445, 20, '_menu_item_zozo_megamenu_menutype', ''),
(446, 20, '_menu_item_zozo_megamenu_status', ''),
(447, 20, '_menu_item_zozo_megamenu_fullwidth', ''),
(448, 20, '_menu_item_zozo_megamenu_columns', ''),
(449, 20, '_menu_item_zozo_megamenu_title', ''),
(450, 20, '_menu_item_zozo_megamenu_link', ''),
(451, 20, '_menu_item_zozo_megamenu_widgetarea', ''),
(452, 20, '_menu_item_zozo_megamenu_content', ''),
(453, 20, '_menu_item_zozo_megamenu_icon', ''),
(577, 27, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(578, 27, '_edit_last', '1'),
(579, 27, '_wp_page_template', 'view-profile.php'),
(580, 27, 'zozo_page_top_padding', ''),
(581, 27, 'zozo_page_bottom_padding', ''),
(582, 27, 'zozo_slider_position', 'default'),
(583, 27, 'zozo_revolutionslider', ''),
(584, 27, 'zozo_show_header', 'yes'),
(585, 27, 'zozo_show_header_top_bar', 'default'),
(586, 27, 'zozo_show_header_sliding_bar', 'default'),
(587, 27, 'zozo_header_layout', 'default'),
(588, 27, 'zozo_header_type', 'default'),
(589, 27, 'zozo_header_toggle_position', 'default'),
(590, 27, 'zozo_header_transparency', 'default'),
(591, 27, 'zozo_header_skin', 'default'),
(592, 27, 'zozo_header_menu_skin', 'dark'),
(593, 27, 'zozo_custom_nav_menu', 'default'),
(594, 27, 'zozo_custom_mobile_menu', 'default'),
(595, 27, 'zozo_header_bg_image', ''),
(596, 27, 'zozo_header_bg_image_attach_id', ''),
(597, 27, 'zozo_header_bg_color', ''),
(598, 27, 'zozo_header_bg_opacity', '0'),
(599, 27, 'zozo_header_bg_repeat', ''),
(600, 27, 'zozo_header_bg_attachment', ''),
(601, 27, 'zozo_header_bg_postion', ''),
(602, 27, 'zozo_header_bg_full', '0'),
(603, 27, 'zozo_show_footer_widgets', 'default'),
(604, 27, 'zozo_show_footer_menu', 'default'),
(605, 27, 'zozo_primary_sidebar', '0'),
(606, 27, 'zozo_secondary_sidebar', '0'),
(607, 27, 'zozo_hide_page_title_bar', 'yes'),
(608, 27, 'zozo_hide_page_title', 'yes'),
(609, 27, 'zozo_page_title_type', 'default'),
(610, 27, 'zozo_page_title_skin', 'default'),
(611, 27, 'zozo_page_title_align', 'default'),
(612, 27, 'zozo_display_breadcrumbs', 'default'),
(613, 27, 'zozo_show_page_slogan', 'yes'),
(614, 27, 'zozo_page_slogan', ''),
(615, 27, 'zozo_page_title_height', ''),
(616, 27, 'zozo_page_title_mobile_height', ''),
(617, 27, 'zozo_page_title_bar_title_color', ''),
(618, 27, 'zozo_page_title_bar_slogan_color', ''),
(619, 27, 'zozo_page_breadcrumbs_color', ''),
(620, 27, 'zozo_page_title_bar_border_color', ''),
(621, 27, 'zozo_page_title_bar_bg', ''),
(622, 27, 'zozo_page_title_bar_bg_attach_id', ''),
(623, 27, 'zozo_page_title_bar_bg_color', ''),
(624, 27, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(625, 27, 'zozo_page_title_bar_bg_position', 'left top'),
(626, 27, 'zozo_page_title_bar_bg_parallax', 'no'),
(627, 27, 'zozo_page_title_bar_bg_full', '0'),
(628, 27, 'zozo_page_title_video_bg', '0'),
(629, 27, 'zozo_page_title_video_id', ''),
(630, 27, 'zozo_page_bg_image', ''),
(631, 27, 'zozo_page_bg_image_attach_id', ''),
(632, 27, 'zozo_page_bg_repeat', ''),
(633, 27, 'zozo_page_bg_attachment', ''),
(634, 27, 'zozo_page_bg_position', ''),
(635, 27, 'zozo_page_bg_color', ''),
(636, 27, 'zozo_page_bg_opacity', '0'),
(637, 27, 'zozo_page_bg_full', '0'),
(638, 27, 'zozo_body_bg_image', ''),
(639, 27, 'zozo_body_bg_image_attach_id', ''),
(640, 27, 'zozo_body_bg_repeat', ''),
(641, 27, 'zozo_body_bg_attachment', ''),
(642, 27, 'zozo_body_bg_position', ''),
(643, 27, 'zozo_body_bg_color', ''),
(644, 27, 'zozo_body_bg_opacity', '0'),
(645, 27, 'zozo_body_bg_full', '0'),
(646, 27, 'zozo_section_header_status', 'show'),
(647, 27, 'zozo_section_title', ''),
(648, 27, 'zozo_section_slogan', ''),
(649, 27, 'zozo_section_padding_top', ''),
(650, 27, 'zozo_section_padding_bottom', ''),
(651, 27, 'zozo_section_header_padding', ''),
(652, 27, 'zozo_section_title_color', ''),
(653, 27, 'zozo_section_slogan_color', ''),
(654, 27, 'zozo_section_text_color', ''),
(655, 27, 'zozo_section_content_heading_color', ''),
(656, 27, 'zozo_section_bg_color', ''),
(657, 27, 'zozo_parallax_status', 'no'),
(658, 27, 'zozo_parallax_bg_image', ''),
(659, 27, 'zozo_parallax_bg_image_attach_id', ''),
(660, 27, 'zozo_parallax_bg_repeat', ''),
(661, 27, 'zozo_parallax_bg_attachment', ''),
(662, 27, 'zozo_parallax_bg_postion', ''),
(663, 27, 'zozo_parallax_bg_size', ''),
(664, 27, 'zozo_parallax_bg_overlay', 'no'),
(665, 27, 'zozo_overlay_pattern_status', 'no'),
(666, 27, 'zozo_section_overlay_color', ''),
(667, 27, 'zozo_overlay_color_opacity', '0'),
(668, 27, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(669, 27, 'zozo_parallax_additional_sections_order', ''),
(670, 27, '_wpb_vc_js_status', 'false'),
(671, 27, '_edit_lock', '1540872857:1'),
(672, 27, 'zozo_theme_layout', 'wide'),
(675, 30, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(676, 30, '_menu_item_type', 'post_type'),
(677, 30, '_menu_item_menu_item_parent', '0'),
(678, 30, '_menu_item_object_id', '17'),
(679, 30, '_menu_item_object', 'page'),
(680, 30, '_menu_item_target', ''),
(681, 30, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(682, 30, '_menu_item_xfn', ''),
(683, 30, '_menu_item_url', ''),
(685, 30, '_menu_item_zozo_megamenu_menutype', 'page'),
(686, 30, '_menu_item_zozo_megamenu_status', ''),
(687, 30, '_menu_item_zozo_megamenu_fullwidth', ''),
(688, 30, '_menu_item_zozo_megamenu_columns', 'auto'),
(689, 30, '_menu_item_zozo_megamenu_title', ''),
(690, 30, '_menu_item_zozo_megamenu_link', ''),
(691, 30, '_menu_item_zozo_megamenu_widgetarea', '0'),
(692, 30, '_menu_item_zozo_megamenu_content', ''),
(693, 30, '_menu_item_zozo_megamenu_icon', ''),
(713, 32, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(714, 32, '_menu_item_type', 'post_type'),
(715, 32, '_menu_item_menu_item_parent', '0'),
(716, 32, '_menu_item_object_id', '7'),
(717, 32, '_menu_item_object', 'page'),
(718, 32, '_menu_item_target', ''),
(719, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(720, 32, '_menu_item_xfn', ''),
(721, 32, '_menu_item_url', ''),
(723, 32, '_menu_item_zozo_megamenu_menutype', 'page'),
(724, 32, '_menu_item_zozo_megamenu_status', ''),
(725, 32, '_menu_item_zozo_megamenu_fullwidth', ''),
(726, 32, '_menu_item_zozo_megamenu_columns', 'auto'),
(727, 32, '_menu_item_zozo_megamenu_title', ''),
(728, 32, '_menu_item_zozo_megamenu_link', ''),
(729, 32, '_menu_item_zozo_megamenu_widgetarea', '0'),
(730, 32, '_menu_item_zozo_megamenu_content', ''),
(731, 32, '_menu_item_zozo_megamenu_icon', ''),
(732, 34, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(733, 34, '_edit_lock', '1540873003:1'),
(734, 34, '_edit_last', '1'),
(735, 34, '_wp_page_template', 'form-detail.php'),
(736, 34, 'zozo_page_top_padding', ''),
(737, 34, 'zozo_page_bottom_padding', ''),
(738, 34, 'zozo_slider_position', 'default'),
(739, 34, 'zozo_revolutionslider', ''),
(740, 34, 'zozo_show_header', 'yes'),
(741, 34, 'zozo_show_header_top_bar', 'default'),
(742, 34, 'zozo_show_header_sliding_bar', 'default'),
(743, 34, 'zozo_header_layout', 'default'),
(744, 34, 'zozo_header_type', 'default'),
(745, 34, 'zozo_header_toggle_position', 'default'),
(746, 34, 'zozo_header_transparency', 'default'),
(747, 34, 'zozo_header_skin', 'default'),
(748, 34, 'zozo_header_menu_skin', 'dark'),
(749, 34, 'zozo_custom_nav_menu', 'default'),
(750, 34, 'zozo_custom_mobile_menu', 'default'),
(751, 34, 'zozo_header_bg_image', ''),
(752, 34, 'zozo_header_bg_image_attach_id', ''),
(753, 34, 'zozo_header_bg_color', ''),
(754, 34, 'zozo_header_bg_opacity', '0'),
(755, 34, 'zozo_header_bg_repeat', ''),
(756, 34, 'zozo_header_bg_attachment', ''),
(757, 34, 'zozo_header_bg_postion', ''),
(758, 34, 'zozo_header_bg_full', '0'),
(759, 34, 'zozo_show_footer_widgets', 'default'),
(760, 34, 'zozo_show_footer_menu', 'default'),
(761, 34, 'zozo_primary_sidebar', '0'),
(762, 34, 'zozo_secondary_sidebar', '0'),
(763, 34, 'zozo_hide_page_title_bar', 'yes'),
(764, 34, 'zozo_hide_page_title', 'yes'),
(765, 34, 'zozo_page_title_type', 'default'),
(766, 34, 'zozo_page_title_skin', 'default'),
(767, 34, 'zozo_page_title_align', 'default'),
(768, 34, 'zozo_display_breadcrumbs', 'default'),
(769, 34, 'zozo_show_page_slogan', 'yes'),
(770, 34, 'zozo_page_slogan', ''),
(771, 34, 'zozo_page_title_height', ''),
(772, 34, 'zozo_page_title_mobile_height', ''),
(773, 34, 'zozo_page_title_bar_title_color', ''),
(774, 34, 'zozo_page_title_bar_slogan_color', ''),
(775, 34, 'zozo_page_breadcrumbs_color', ''),
(776, 34, 'zozo_page_title_bar_border_color', ''),
(777, 34, 'zozo_page_title_bar_bg', ''),
(778, 34, 'zozo_page_title_bar_bg_attach_id', ''),
(779, 34, 'zozo_page_title_bar_bg_color', ''),
(780, 34, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(781, 34, 'zozo_page_title_bar_bg_position', 'left top'),
(782, 34, 'zozo_page_title_bar_bg_parallax', 'no'),
(783, 34, 'zozo_page_title_bar_bg_full', '0'),
(784, 34, 'zozo_page_title_video_bg', '0'),
(785, 34, 'zozo_page_title_video_id', ''),
(786, 34, 'zozo_page_bg_image', ''),
(787, 34, 'zozo_page_bg_image_attach_id', ''),
(788, 34, 'zozo_page_bg_repeat', ''),
(789, 34, 'zozo_page_bg_attachment', ''),
(790, 34, 'zozo_page_bg_position', ''),
(791, 34, 'zozo_page_bg_color', ''),
(792, 34, 'zozo_page_bg_opacity', '0'),
(793, 34, 'zozo_page_bg_full', '0'),
(794, 34, 'zozo_body_bg_image', ''),
(795, 34, 'zozo_body_bg_image_attach_id', ''),
(796, 34, 'zozo_body_bg_repeat', ''),
(797, 34, 'zozo_body_bg_attachment', ''),
(798, 34, 'zozo_body_bg_position', ''),
(799, 34, 'zozo_body_bg_color', ''),
(800, 34, 'zozo_body_bg_opacity', '0'),
(801, 34, 'zozo_body_bg_full', '0'),
(802, 34, 'zozo_section_header_status', 'show'),
(803, 34, 'zozo_section_title', ''),
(804, 34, 'zozo_section_slogan', ''),
(805, 34, 'zozo_section_padding_top', ''),
(806, 34, 'zozo_section_padding_bottom', ''),
(807, 34, 'zozo_section_header_padding', ''),
(808, 34, 'zozo_section_title_color', ''),
(809, 34, 'zozo_section_slogan_color', ''),
(810, 34, 'zozo_section_text_color', ''),
(811, 34, 'zozo_section_content_heading_color', ''),
(812, 34, 'zozo_section_bg_color', ''),
(813, 34, 'zozo_parallax_status', 'no'),
(814, 34, 'zozo_parallax_bg_image', ''),
(815, 34, 'zozo_parallax_bg_image_attach_id', ''),
(816, 34, 'zozo_parallax_bg_repeat', ''),
(817, 34, 'zozo_parallax_bg_attachment', ''),
(818, 34, 'zozo_parallax_bg_postion', ''),
(819, 34, 'zozo_parallax_bg_size', ''),
(820, 34, 'zozo_parallax_bg_overlay', 'no'),
(821, 34, 'zozo_overlay_pattern_status', 'no'),
(822, 34, 'zozo_section_overlay_color', ''),
(823, 34, 'zozo_overlay_color_opacity', '0'),
(824, 34, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(825, 34, 'zozo_parallax_additional_sections_order', ''),
(826, 34, '_wpb_vc_js_status', 'false'),
(827, 34, 'zozo_theme_layout', 'wide'),
(830, 39, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(831, 39, '_edit_lock', '1540872926:1'),
(832, 39, '_edit_last', '1'),
(833, 39, '_wp_page_template', 'default'),
(834, 39, 'zozo_theme_layout', 'wide'),
(835, 39, 'zozo_page_top_padding', ''),
(836, 39, 'zozo_page_bottom_padding', ''),
(837, 39, 'zozo_slider_position', 'default'),
(838, 39, 'zozo_revolutionslider', ''),
(839, 39, 'zozo_show_header', 'yes'),
(840, 39, 'zozo_show_header_top_bar', 'default'),
(841, 39, 'zozo_show_header_sliding_bar', 'default'),
(842, 39, 'zozo_header_layout', 'default'),
(843, 39, 'zozo_header_type', 'default'),
(844, 39, 'zozo_header_toggle_position', 'left'),
(845, 39, 'zozo_header_transparency', 'default'),
(846, 39, 'zozo_header_skin', 'default'),
(847, 39, 'zozo_header_menu_skin', 'dark'),
(848, 39, 'zozo_custom_nav_menu', 'default'),
(849, 39, 'zozo_custom_mobile_menu', 'default'),
(850, 39, 'zozo_header_bg_image', ''),
(851, 39, 'zozo_header_bg_image_attach_id', ''),
(852, 39, 'zozo_header_bg_color', ''),
(853, 39, 'zozo_header_bg_opacity', '0'),
(854, 39, 'zozo_header_bg_repeat', ''),
(855, 39, 'zozo_header_bg_attachment', ''),
(856, 39, 'zozo_header_bg_postion', 'left center'),
(857, 39, 'zozo_header_bg_full', '0'),
(858, 39, 'zozo_show_footer_widgets', 'default'),
(859, 39, 'zozo_show_footer_menu', 'default'),
(860, 39, 'zozo_primary_sidebar', '0'),
(861, 39, 'zozo_secondary_sidebar', '0'),
(862, 39, 'zozo_hide_page_title_bar', 'yes'),
(863, 39, 'zozo_hide_page_title', 'yes'),
(864, 39, 'zozo_page_title_type', 'default'),
(865, 39, 'zozo_page_title_skin', 'default'),
(866, 39, 'zozo_page_title_align', 'default'),
(867, 39, 'zozo_display_breadcrumbs', 'default'),
(868, 39, 'zozo_show_page_slogan', 'yes'),
(869, 39, 'zozo_page_slogan', ''),
(870, 39, 'zozo_page_title_height', ''),
(871, 39, 'zozo_page_title_mobile_height', ''),
(872, 39, 'zozo_page_title_bar_title_color', ''),
(873, 39, 'zozo_page_title_bar_slogan_color', ''),
(874, 39, 'zozo_page_breadcrumbs_color', ''),
(875, 39, 'zozo_page_title_bar_border_color', ''),
(876, 39, 'zozo_page_title_bar_bg', ''),
(877, 39, 'zozo_page_title_bar_bg_attach_id', ''),
(878, 39, 'zozo_page_title_bar_bg_color', ''),
(879, 39, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(880, 39, 'zozo_page_title_bar_bg_position', 'left top'),
(881, 39, 'zozo_page_title_bar_bg_parallax', 'no'),
(882, 39, 'zozo_page_title_bar_bg_full', '0'),
(883, 39, 'zozo_page_title_video_bg', '0'),
(884, 39, 'zozo_page_title_video_id', ''),
(885, 39, 'zozo_page_bg_image', ''),
(886, 39, 'zozo_page_bg_image_attach_id', ''),
(887, 39, 'zozo_page_bg_repeat', ''),
(888, 39, 'zozo_page_bg_attachment', ''),
(889, 39, 'zozo_page_bg_position', ''),
(890, 39, 'zozo_page_bg_color', ''),
(891, 39, 'zozo_page_bg_opacity', '0'),
(892, 39, 'zozo_page_bg_full', '0'),
(893, 39, 'zozo_body_bg_image', ''),
(894, 39, 'zozo_body_bg_image_attach_id', ''),
(895, 39, 'zozo_body_bg_repeat', ''),
(896, 39, 'zozo_body_bg_attachment', ''),
(897, 39, 'zozo_body_bg_position', ''),
(898, 39, 'zozo_body_bg_color', ''),
(899, 39, 'zozo_body_bg_opacity', '0'),
(900, 39, 'zozo_body_bg_full', '0'),
(901, 39, 'zozo_section_header_status', 'show'),
(902, 39, 'zozo_section_title', ''),
(903, 39, 'zozo_section_slogan', ''),
(904, 39, 'zozo_section_padding_top', ''),
(905, 39, 'zozo_section_padding_bottom', ''),
(906, 39, 'zozo_section_header_padding', ''),
(907, 39, 'zozo_section_title_color', ''),
(908, 39, 'zozo_section_slogan_color', ''),
(909, 39, 'zozo_section_text_color', ''),
(910, 39, 'zozo_section_content_heading_color', ''),
(911, 39, 'zozo_section_bg_color', ''),
(912, 39, 'zozo_parallax_status', 'no'),
(913, 39, 'zozo_parallax_bg_image', ''),
(914, 39, 'zozo_parallax_bg_image_attach_id', ''),
(915, 39, 'zozo_parallax_bg_repeat', ''),
(916, 39, 'zozo_parallax_bg_attachment', ''),
(917, 39, 'zozo_parallax_bg_postion', ''),
(918, 39, 'zozo_parallax_bg_size', ''),
(919, 39, 'zozo_parallax_bg_overlay', 'no'),
(920, 39, 'zozo_overlay_pattern_status', 'no'),
(921, 39, 'zozo_section_overlay_color', ''),
(922, 39, 'zozo_overlay_color_opacity', '0'),
(923, 39, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(924, 39, 'zozo_parallax_additional_sections_order', ''),
(925, 39, '_wpb_vc_js_status', 'false'),
(926, 42, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(927, 42, '_menu_item_type', 'post_type'),
(928, 42, '_menu_item_menu_item_parent', '0'),
(929, 42, '_menu_item_object_id', '39'),
(930, 42, '_menu_item_object', 'page'),
(931, 42, '_menu_item_target', ''),
(932, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(933, 42, '_menu_item_xfn', ''),
(934, 42, '_menu_item_url', ''),
(936, 42, '_menu_item_zozo_megamenu_menutype', 'page'),
(937, 42, '_menu_item_zozo_megamenu_status', ''),
(938, 42, '_menu_item_zozo_megamenu_fullwidth', ''),
(939, 42, '_menu_item_zozo_megamenu_columns', 'auto'),
(940, 42, '_menu_item_zozo_megamenu_title', ''),
(941, 42, '_menu_item_zozo_megamenu_link', ''),
(942, 42, '_menu_item_zozo_megamenu_widgetarea', '0'),
(943, 42, '_menu_item_zozo_megamenu_content', ''),
(944, 42, '_menu_item_zozo_megamenu_icon', ''),
(945, 43, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(946, 43, '_menu_item_type', 'post_type'),
(947, 43, '_menu_item_menu_item_parent', '0'),
(948, 43, '_menu_item_object_id', '39'),
(949, 43, '_menu_item_object', 'page'),
(950, 43, '_menu_item_target', ''),
(951, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(952, 43, '_menu_item_xfn', ''),
(953, 43, '_menu_item_url', ''),
(955, 43, '_menu_item_zozo_megamenu_menutype', 'page'),
(956, 43, '_menu_item_zozo_megamenu_status', ''),
(957, 43, '_menu_item_zozo_megamenu_fullwidth', ''),
(958, 43, '_menu_item_zozo_megamenu_columns', 'auto'),
(959, 43, '_menu_item_zozo_megamenu_title', ''),
(960, 43, '_menu_item_zozo_megamenu_link', ''),
(961, 43, '_menu_item_zozo_megamenu_widgetarea', '0'),
(962, 43, '_menu_item_zozo_megamenu_content', ''),
(963, 43, '_menu_item_zozo_megamenu_icon', ''),
(967, 50, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(968, 50, '_edit_lock', '1541332132:1'),
(969, 50, '_edit_last', '1'),
(970, 50, '_wp_page_template', 'result-filter.php'),
(971, 50, 'zozo_theme_layout', 'wide'),
(972, 50, 'zozo_page_top_padding', ''),
(973, 50, 'zozo_page_bottom_padding', ''),
(974, 50, 'zozo_slider_position', 'default'),
(975, 50, 'zozo_revolutionslider', ''),
(976, 50, 'zozo_show_header', 'yes'),
(977, 50, 'zozo_show_header_top_bar', 'default'),
(978, 50, 'zozo_show_header_sliding_bar', 'default'),
(979, 50, 'zozo_header_layout', 'default'),
(980, 50, 'zozo_header_type', 'default'),
(981, 50, 'zozo_header_toggle_position', 'default'),
(982, 50, 'zozo_header_transparency', 'default'),
(983, 50, 'zozo_header_skin', 'default'),
(984, 50, 'zozo_header_menu_skin', 'dark'),
(985, 50, 'zozo_custom_nav_menu', 'default'),
(986, 50, 'zozo_custom_mobile_menu', 'default'),
(987, 50, 'zozo_header_bg_image', ''),
(988, 50, 'zozo_header_bg_image_attach_id', ''),
(989, 50, 'zozo_header_bg_color', ''),
(990, 50, 'zozo_header_bg_opacity', '0'),
(991, 50, 'zozo_header_bg_repeat', ''),
(992, 50, 'zozo_header_bg_attachment', ''),
(993, 50, 'zozo_header_bg_postion', ''),
(994, 50, 'zozo_header_bg_full', '0'),
(995, 50, 'zozo_show_footer_widgets', 'default'),
(996, 50, 'zozo_show_footer_menu', 'default'),
(997, 50, 'zozo_primary_sidebar', '0'),
(998, 50, 'zozo_secondary_sidebar', '0'),
(999, 50, 'zozo_hide_page_title_bar', 'yes'),
(1000, 50, 'zozo_hide_page_title', 'yes'),
(1001, 50, 'zozo_page_title_type', 'default'),
(1002, 50, 'zozo_page_title_skin', 'default'),
(1003, 50, 'zozo_page_title_align', 'default'),
(1004, 50, 'zozo_display_breadcrumbs', 'default'),
(1005, 50, 'zozo_show_page_slogan', 'yes'),
(1006, 50, 'zozo_page_slogan', ''),
(1007, 50, 'zozo_page_title_height', ''),
(1008, 50, 'zozo_page_title_mobile_height', ''),
(1009, 50, 'zozo_page_title_bar_title_color', ''),
(1010, 50, 'zozo_page_title_bar_slogan_color', ''),
(1011, 50, 'zozo_page_breadcrumbs_color', ''),
(1012, 50, 'zozo_page_title_bar_border_color', ''),
(1013, 50, 'zozo_page_title_bar_bg', ''),
(1014, 50, 'zozo_page_title_bar_bg_attach_id', ''),
(1015, 50, 'zozo_page_title_bar_bg_color', ''),
(1016, 50, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(1017, 50, 'zozo_page_title_bar_bg_position', 'left top'),
(1018, 50, 'zozo_page_title_bar_bg_parallax', 'no'),
(1019, 50, 'zozo_page_title_bar_bg_full', '0'),
(1020, 50, 'zozo_page_title_video_bg', '0'),
(1021, 50, 'zozo_page_title_video_id', ''),
(1022, 50, 'zozo_page_bg_image', ''),
(1023, 50, 'zozo_page_bg_image_attach_id', ''),
(1024, 50, 'zozo_page_bg_repeat', ''),
(1025, 50, 'zozo_page_bg_attachment', ''),
(1026, 50, 'zozo_page_bg_position', ''),
(1027, 50, 'zozo_page_bg_color', ''),
(1028, 50, 'zozo_page_bg_opacity', '0'),
(1029, 50, 'zozo_page_bg_full', '0'),
(1030, 50, 'zozo_body_bg_image', ''),
(1031, 50, 'zozo_body_bg_image_attach_id', ''),
(1032, 50, 'zozo_body_bg_repeat', ''),
(1033, 50, 'zozo_body_bg_attachment', ''),
(1034, 50, 'zozo_body_bg_position', ''),
(1035, 50, 'zozo_body_bg_color', ''),
(1036, 50, 'zozo_body_bg_opacity', '0'),
(1037, 50, 'zozo_body_bg_full', '0'),
(1038, 50, 'zozo_section_header_status', 'show'),
(1039, 50, 'zozo_section_title', ''),
(1040, 50, 'zozo_section_slogan', ''),
(1041, 50, 'zozo_section_padding_top', ''),
(1042, 50, 'zozo_section_padding_bottom', ''),
(1043, 50, 'zozo_section_header_padding', ''),
(1044, 50, 'zozo_section_title_color', ''),
(1045, 50, 'zozo_section_slogan_color', ''),
(1046, 50, 'zozo_section_text_color', ''),
(1047, 50, 'zozo_section_content_heading_color', ''),
(1048, 50, 'zozo_section_bg_color', ''),
(1049, 50, 'zozo_parallax_status', 'no'),
(1050, 50, 'zozo_parallax_bg_image', ''),
(1051, 50, 'zozo_parallax_bg_image_attach_id', ''),
(1052, 50, 'zozo_parallax_bg_repeat', ''),
(1053, 50, 'zozo_parallax_bg_attachment', ''),
(1054, 50, 'zozo_parallax_bg_postion', ''),
(1055, 50, 'zozo_parallax_bg_size', ''),
(1056, 50, 'zozo_parallax_bg_overlay', 'no'),
(1057, 50, 'zozo_overlay_pattern_status', 'no'),
(1058, 50, 'zozo_section_overlay_color', ''),
(1059, 50, 'zozo_overlay_color_opacity', '0'),
(1060, 50, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(1061, 50, 'zozo_parallax_additional_sections_order', ''),
(1062, 50, '_wpb_vc_js_status', 'false'),
(1065, 54, '_wp_attached_file', '2018/11/banner.jpg'),
(1066, 54, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:1000;s:4:\"file\";s:18:\"2018/11/banner.jpg\";s:5:\"sizes\";a:12:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"banner-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"banner-300x188.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"banner-768x480.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:480;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"banner-600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-large\";a:4:{s:4:\"file\";s:19:\"banner-1170x500.jpg\";s:5:\"width\";i:1170;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"blog-medium\";a:4:{s:4:\"file\";s:18:\"banner-570x370.jpg\";s:5:\"width\";i:570;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:16:\"banner-85x85.jpg\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"theme-mid\";a:4:{s:4:\"file\";s:18:\"banner-500x320.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"team\";a:4:{s:4:\"file\";s:18:\"banner-500x500.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"portfolio-large\";a:4:{s:4:\"file\";s:19:\"banner-1000x695.jpg\";s:5:\"width\";i:1000;s:6:\"height\";i:695;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:16:\"portfolio-single\";a:4:{s:4:\"file\";s:19:\"banner-1300x500.jpg\";s:5:\"width\";i:1300;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"portfolio-mid\";a:4:{s:4:\"file\";s:18:\"banner-560x385.jpg\";s:5:\"width\";i:560;s:6:\"height\";i:385;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1067, 54, '_edit_lock', '1541089180:1'),
(1068, 55, '_wp_attached_file', '2018/11/ES.jpg'),
(1069, 55, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:3100;s:6:\"height\";i:2059;s:4:\"file\";s:14:\"2018/11/ES.jpg\";s:5:\"sizes\";a:12:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"ES-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"ES-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:14:\"ES-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:14:\"ES-600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-large\";a:4:{s:4:\"file\";s:15:\"ES-1170x500.jpg\";s:5:\"width\";i:1170;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"blog-medium\";a:4:{s:4:\"file\";s:14:\"ES-570x370.jpg\";s:5:\"width\";i:570;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:12:\"ES-85x85.jpg\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"theme-mid\";a:4:{s:4:\"file\";s:14:\"ES-500x320.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"team\";a:4:{s:4:\"file\";s:14:\"ES-500x500.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"portfolio-large\";a:4:{s:4:\"file\";s:15:\"ES-1000x695.jpg\";s:5:\"width\";i:1000;s:6:\"height\";i:695;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:16:\"portfolio-single\";a:4:{s:4:\"file\";s:15:\"ES-1300x500.jpg\";s:5:\"width\";i:1300;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"portfolio-mid\";a:4:{s:4:\"file\";s:14:\"ES-560x385.jpg\";s:5:\"width\";i:560;s:6:\"height\";i:385;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1070, 56, '_wp_attached_file', '2018/11/IS.jpg'),
(1071, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:555;s:6:\"height\";i:300;s:4:\"file\";s:14:\"2018/11/IS.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"IS-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"IS-300x162.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:162;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:12:\"IS-85x85.jpg\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"theme-mid\";a:4:{s:4:\"file\";s:14:\"IS-500x300.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"team\";a:4:{s:4:\"file\";s:14:\"IS-500x300.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1072, 57, '_wp_attached_file', '2018/11/JS.png'),
(1073, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:225;s:6:\"height\";i:225;s:4:\"file\";s:14:\"2018/11/JS.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"JS-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:10:\"blog-thumb\";a:4:{s:4:\"file\";s:12:\"JS-85x85.png\";s:5:\"width\";i:85;s:6:\"height\";i:85;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1074, 56, '_edit_lock', '1541185200:1'),
(1075, 55, '_edit_lock', '1541185200:1'),
(1076, 57, '_edit_lock', '1541185201:1'),
(1078, 59, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(1079, 59, '_edit_lock', '1541332623:1'),
(1080, 59, '_edit_last', '1'),
(1081, 59, '_wp_page_template', 'result-filter.php'),
(1082, 59, 'zozo_theme_layout', 'wide'),
(1083, 59, 'zozo_page_top_padding', ''),
(1084, 59, 'zozo_page_bottom_padding', ''),
(1085, 59, 'zozo_slider_position', 'default'),
(1086, 59, 'zozo_revolutionslider', ''),
(1087, 59, 'zozo_show_header', 'yes'),
(1088, 59, 'zozo_show_header_top_bar', 'yes'),
(1089, 59, 'zozo_show_header_sliding_bar', 'default'),
(1090, 59, 'zozo_header_layout', 'default'),
(1091, 59, 'zozo_header_type', 'default'),
(1092, 59, 'zozo_header_toggle_position', 'default'),
(1093, 59, 'zozo_header_transparency', 'default'),
(1094, 59, 'zozo_header_skin', 'default'),
(1095, 59, 'zozo_header_menu_skin', 'light'),
(1096, 59, 'zozo_custom_nav_menu', 'default'),
(1097, 59, 'zozo_custom_mobile_menu', 'default'),
(1098, 59, 'zozo_header_bg_image', ''),
(1099, 59, 'zozo_header_bg_image_attach_id', ''),
(1100, 59, 'zozo_header_bg_color', ''),
(1101, 59, 'zozo_header_bg_opacity', '0'),
(1102, 59, 'zozo_header_bg_repeat', ''),
(1103, 59, 'zozo_header_bg_attachment', ''),
(1104, 59, 'zozo_header_bg_postion', ''),
(1105, 59, 'zozo_header_bg_full', '0'),
(1106, 59, 'zozo_show_footer_widgets', 'default'),
(1107, 59, 'zozo_show_footer_menu', 'default'),
(1108, 59, 'zozo_primary_sidebar', '0'),
(1109, 59, 'zozo_secondary_sidebar', '0'),
(1110, 59, 'zozo_hide_page_title_bar', 'yes'),
(1111, 59, 'zozo_hide_page_title', 'yes'),
(1112, 59, 'zozo_page_title_type', 'default'),
(1113, 59, 'zozo_page_title_skin', 'default'),
(1114, 59, 'zozo_page_title_align', 'default'),
(1115, 59, 'zozo_display_breadcrumbs', 'default'),
(1116, 59, 'zozo_show_page_slogan', 'yes'),
(1117, 59, 'zozo_page_slogan', ''),
(1118, 59, 'zozo_page_title_height', ''),
(1119, 59, 'zozo_page_title_mobile_height', ''),
(1120, 59, 'zozo_page_title_bar_title_color', ''),
(1121, 59, 'zozo_page_title_bar_slogan_color', ''),
(1122, 59, 'zozo_page_breadcrumbs_color', ''),
(1123, 59, 'zozo_page_title_bar_border_color', ''),
(1124, 59, 'zozo_page_title_bar_bg', ''),
(1125, 59, 'zozo_page_title_bar_bg_attach_id', ''),
(1126, 59, 'zozo_page_title_bar_bg_color', ''),
(1127, 59, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(1128, 59, 'zozo_page_title_bar_bg_position', 'left top'),
(1129, 59, 'zozo_page_title_bar_bg_parallax', 'no'),
(1130, 59, 'zozo_page_title_bar_bg_full', '0'),
(1131, 59, 'zozo_page_title_video_bg', '0'),
(1132, 59, 'zozo_page_title_video_id', ''),
(1133, 59, 'zozo_page_bg_image', ''),
(1134, 59, 'zozo_page_bg_image_attach_id', ''),
(1135, 59, 'zozo_page_bg_repeat', ''),
(1136, 59, 'zozo_page_bg_attachment', ''),
(1137, 59, 'zozo_page_bg_position', ''),
(1138, 59, 'zozo_page_bg_color', ''),
(1139, 59, 'zozo_page_bg_opacity', '0'),
(1140, 59, 'zozo_page_bg_full', '0'),
(1141, 59, 'zozo_body_bg_image', ''),
(1142, 59, 'zozo_body_bg_image_attach_id', ''),
(1143, 59, 'zozo_body_bg_repeat', ''),
(1144, 59, 'zozo_body_bg_attachment', ''),
(1145, 59, 'zozo_body_bg_position', ''),
(1146, 59, 'zozo_body_bg_color', ''),
(1147, 59, 'zozo_body_bg_opacity', '0'),
(1148, 59, 'zozo_body_bg_full', '0'),
(1149, 59, 'zozo_section_header_status', 'show'),
(1150, 59, 'zozo_section_title', ''),
(1151, 59, 'zozo_section_slogan', ''),
(1152, 59, 'zozo_section_padding_top', ''),
(1153, 59, 'zozo_section_padding_bottom', ''),
(1154, 59, 'zozo_section_header_padding', ''),
(1155, 59, 'zozo_section_title_color', ''),
(1156, 59, 'zozo_section_slogan_color', ''),
(1157, 59, 'zozo_section_text_color', ''),
(1158, 59, 'zozo_section_content_heading_color', ''),
(1159, 59, 'zozo_section_bg_color', ''),
(1160, 59, 'zozo_parallax_status', 'no'),
(1161, 59, 'zozo_parallax_bg_image', ''),
(1162, 59, 'zozo_parallax_bg_image_attach_id', ''),
(1163, 59, 'zozo_parallax_bg_repeat', ''),
(1164, 59, 'zozo_parallax_bg_attachment', ''),
(1165, 59, 'zozo_parallax_bg_postion', ''),
(1166, 59, 'zozo_parallax_bg_size', ''),
(1167, 59, 'zozo_parallax_bg_overlay', 'no'),
(1168, 59, 'zozo_overlay_pattern_status', 'no'),
(1169, 59, 'zozo_section_overlay_color', ''),
(1170, 59, 'zozo_overlay_color_opacity', '0'),
(1171, 59, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(1172, 59, 'zozo_parallax_additional_sections_order', ''),
(1173, 59, '_wpb_vc_js_status', 'false'),
(1174, 50, '_wp_trash_meta_status', 'publish'),
(1175, 50, '_wp_trash_meta_time', '1541332282'),
(1176, 50, '_wp_desired_post_slug', 'results'),
(1177, 61, '_wp_trash_meta_status', 'publish'),
(1178, 61, '_wp_trash_meta_time', '1541480224'),
(1179, 62, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-10-13 14:08:58', '2018-10-13 14:08:58', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-10-13 14:08:58', '2018-10-13 14:08:58', '', 0, 'http://localhost/studentservice/?p=1', 0, 'post', '', 1),
(7, 1, '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-10-30 04:06:24', '2018-10-30 04:06:24', '', 0, 'http://localhost/studentservice/?page_id=7', 0, 'page', '', 0),
(8, 1, '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 7, 'http://localhost/studentservice/index.php/2018/10/13/7-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2018-10-13 14:23:25', '2018-10-13 14:23:25', ' ', '', '', 'publish', 'closed', 'closed', '', '9', '', '', '2018-10-30 02:06:45', '2018-10-30 02:06:45', '', 0, 'http://localhost/studentservice/?p=9', 1, 'nav_menu_item', '', 0),
(13, 1, '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 'callback', '', 'publish', 'closed', 'closed', '', 'callback', '', '', '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 0, 'http://localhost/studentservice/?page_id=13', 0, 'page', '', 0),
(14, 1, '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 'callback', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 13, 'http://localhost/studentservice/index.php/2018/10/13/13-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 'login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2018-10-30 04:16:36', '2018-10-30 04:16:36', '', 0, 'http://localhost/studentservice/?page_id=15', 0, 'page', '', 0),
(16, 1, '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 'login', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 15, 'http://localhost/studentservice/index.php/2018/10/13/15-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 'profile', '', 'publish', 'closed', 'closed', '', 'profile', '', '', '2018-10-30 04:16:12', '2018-10-30 04:16:12', '', 0, 'http://localhost/studentservice/?page_id=17', 0, 'page', '', 0),
(18, 1, '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 'profile', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 17, 'http://localhost/studentservice/17-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2018-10-13 17:31:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-13 17:31:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=20', 1, 'nav_menu_item', '', 0),
(27, 1, '2018-10-24 01:14:22', '2018-10-24 01:14:22', '', 'user', '', 'publish', 'closed', 'closed', '', 'user', '', '', '2018-10-30 04:16:24', '2018-10-30 04:16:24', '', 0, 'http://localhost/studentservice/?page_id=27', 0, 'page', '', 0),
(28, 1, '2018-10-24 01:13:23', '2018-10-24 01:13:23', '', 'user-profile', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2018-10-24 01:13:23', '2018-10-24 01:13:23', '', 27, 'http://localhost/studentservice/27-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2018-10-24 01:20:34', '2018-10-24 01:20:34', ' ', '', '', 'publish', 'closed', 'closed', '', '30', '', '', '2018-10-29 15:58:23', '2018-10-29 15:58:23', '', 0, 'http://localhost/studentservice/?p=30', 2, 'nav_menu_item', '', 0),
(32, 1, '2018-10-24 01:20:34', '2018-10-24 01:20:34', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2018-10-29 15:58:23', '2018-10-29 15:58:23', '', 0, 'http://localhost/studentservice/?p=32', 1, 'nav_menu_item', '', 0),
(33, 1, '2018-10-26 06:23:42', '2018-10-26 06:23:42', '', 'user', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2018-10-26 06:23:42', '2018-10-26 06:23:42', '', 27, 'http://localhost/studentservice/27-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2018-10-26 06:23:57', '2018-10-26 06:23:57', '', 'Form Detail', '', 'publish', 'closed', 'closed', '', 'form-detail', '', '', '2018-10-30 04:16:00', '2018-10-30 04:16:00', '', 0, 'http://localhost/studentservice/?page_id=34', 0, 'page', '', 0),
(35, 1, '2018-10-26 06:23:57', '2018-10-26 06:23:57', '', 'form', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2018-10-26 06:23:57', '2018-10-26 06:23:57', '', 34, 'http://localhost/studentservice/34-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2018-10-26 07:02:59', '2018-10-26 07:02:59', '', 'Form Detail', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2018-10-26 07:02:59', '2018-10-26 07:02:59', '', 34, 'http://localhost/studentservice/34-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2018-10-29 15:53:44', '2018-10-29 15:53:44', '', 'Forum', '', 'publish', 'closed', 'closed', '', 'forum', '', '', '2018-10-30 04:15:22', '2018-10-30 04:15:22', '', 0, 'http://localhost/studentservice/?page_id=39', 0, 'page', '', 0),
(40, 1, '2018-10-29 15:53:44', '2018-10-29 15:53:44', '', 'Forum', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2018-10-29 15:53:44', '2018-10-29 15:53:44', '', 39, 'http://localhost/studentservice/39-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2018-10-29 15:54:31', '2018-10-29 15:54:31', '', 'Forum', '', 'inherit', 'closed', 'closed', '', '39-autosave-v1', '', '', '2018-10-29 15:54:31', '2018-10-29 15:54:31', '', 39, 'http://localhost/studentservice/39-autosave-v1/', 0, 'revision', '', 0),
(42, 1, '2018-10-29 15:58:23', '2018-10-29 15:58:23', ' ', '', '', 'publish', 'closed', 'closed', '', '42', '', '', '2018-10-29 15:58:23', '2018-10-29 15:58:23', '', 0, 'http://localhost/studentservice/?p=42', 3, 'nav_menu_item', '', 0),
(43, 1, '2018-10-29 15:58:47', '2018-10-29 15:58:47', ' ', '', '', 'publish', 'closed', 'closed', '', '43', '', '', '2018-10-30 02:06:45', '2018-10-30 02:06:45', '', 0, 'http://localhost/studentservice/?p=43', 2, 'nav_menu_item', '', 0),
(49, 1, '2018-10-30 04:06:10', '2018-10-30 04:06:10', '', 'Home', '', 'inherit', 'closed', 'closed', '', '7-autosave-v1', '', '', '2018-10-30 04:06:10', '2018-10-30 04:06:10', '', 7, 'http://localhost/studentservice/7-autosave-v1/', 0, 'revision', '', 0),
(50, 1, '2018-10-30 06:02:10', '2018-10-30 06:02:10', '', 'Result Search', '', 'trash', 'closed', 'closed', '', 'results__trashed', '', '', '2018-11-04 11:51:22', '2018-11-04 11:51:22', '', 0, 'http://localhost/studentservice/?page_id=50', 0, 'page', '', 0),
(51, 1, '2018-10-30 06:02:10', '2018-10-30 06:02:10', '', 'Result Search', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2018-10-30 06:02:10', '2018-10-30 06:02:10', '', 50, 'http://localhost/studentservice/50-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2018-10-30 06:03:25', '2018-10-30 06:03:25', '', 'Result Search', '', 'inherit', 'closed', 'closed', '', '50-autosave-v1', '', '', '2018-10-30 06:03:25', '2018-10-30 06:03:25', '', 50, 'http://localhost/studentservice/50-autosave-v1/', 0, 'revision', '', 0),
(54, 1, '2018-11-01 11:39:14', '2018-11-01 11:39:14', '', 'banner', '', 'inherit', 'open', 'closed', '', 'banner', '', '', '2018-11-01 11:39:14', '2018-11-01 11:39:14', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/banner.jpg', 0, 'attachment', 'image/jpeg', 0),
(55, 1, '2018-11-02 18:53:09', '2018-11-02 18:53:09', '', 'ES', '', 'inherit', 'open', 'closed', '', 'es', '', '', '2018-11-02 18:53:09', '2018-11-02 18:53:09', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/ES.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2018-11-02 18:53:17', '2018-11-02 18:53:17', '', 'IS', '', 'inherit', 'open', 'closed', '', 'is', '', '', '2018-11-02 18:53:17', '2018-11-02 18:53:17', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/IS.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2018-11-02 18:53:22', '2018-11-02 18:53:22', '', 'JS', '', 'inherit', 'open', 'closed', '', 'js', '', '', '2018-11-02 18:53:22', '2018-11-02 18:53:22', '', 0, 'http://localhost/studentservice/wp-content/uploads/2018/11/JS.png', 0, 'attachment', 'image/png', 0),
(59, 1, '2018-11-03 02:58:51', '2018-11-03 02:58:51', '', 'search-form', '', 'publish', 'closed', 'closed', '', 'search-form', '', '', '2018-11-04 11:51:33', '2018-11-04 11:51:33', '', 0, 'http://localhost/studentservice/?page_id=59', 0, 'page', '', 0),
(60, 1, '2018-11-03 02:58:51', '2018-11-03 02:58:51', '', 'search-form', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2018-11-03 02:58:51', '2018-11-03 02:58:51', '', 59, 'http://localhost/studentservice/59-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2018-11-06 04:57:04', '2018-11-06 04:57:04', '{\n    \"metal-child::zozo_options[zozo_menu_type]\": {\n        \"value\": \"standard\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-11-06 04:57:04\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'eef07ea8-3b85-4deb-9aab-48e43e9b5f3c', '', '', '2018-11-06 04:57:04', '2018-11-06 04:57:04', '', 0, 'http://localhost/studentservice/eef07ea8-3b85-4deb-9aab-48e43e9b5f3c/', 0, 'customize_changeset', '', 0),
(62, 1, '2018-11-30 09:07:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-11-30 09:07:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=62', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_request`
--

CREATE TABLE `wp_request` (
  `ID` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `request` int(1) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time_request` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_request`
--

INSERT INTO `wp_request` (`ID`, `form_id`, `member_id`, `request`, `message`, `time_request`) VALUES
(119, 61, 123, 1, 'Hello , I\'m Trang. Let me join !!!', '2018-11-22 03:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `wp_semester`
--

CREATE TABLE `wp_semester` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_semester`
--

INSERT INTO `wp_semester` (`ID`, `name`, `start`, `end`, `status`) VALUES
(1, 'SPRING 2018', '2018-01-01', '2018-12-30', 1),
(2, 'SUMMER 2018', '2018-04-01', '2018-08-30', 0),
(3, 'FALL 2018', '2018-09-01', '2018-12-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_skill_major`
--

CREATE TABLE `wp_skill_major` (
  `ID` bigint(20) NOT NULL,
  `major_id` bigint(20) NOT NULL,
  `subject_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_skill_major`
--

INSERT INTO `wp_skill_major` (`ID`, `major_id`, `subject_code`, `name`) VALUES
(1, 1, 'PM', 'Project Manager'),
(2, 1, 'QA', 'Quantity Assurance'),
(3, 1, 'DEV', 'Developer'),
(4, 1, 'DOC', 'Document writer'),
(5, 2, 'PM', 'Project Manager'),
(6, 2, 'QA', 'Quantity Assurance'),
(7, 2, 'DEV', 'Developer'),
(8, 2, 'DOC', 'Document writer'),
(9, 3, 'PM', 'Project Manager'),
(10, 3, 'QA', 'Quantity Assurance'),
(11, 3, 'DEV', 'Developer'),
(12, 3, 'DOC', 'Document writer');

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'My_menu', 'my_menu', 0),
(3, 'mobile version', 'mobile-version', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(9, 2, 0),
(30, 3, 0),
(32, 3, 0),
(42, 3, 0),
(43, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 2),
(3, 3, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,vc_pointers_backend_editor,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_user-settings', 'editor=tinymce&post_dfw=off'),
(18, 1, 'wp_user-settings-time', '1540918066'),
(19, 1, 'wp_dashboard_quick_press_last_post_id', '62'),
(20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:11:{i:0;s:28:\"add-post-type-zozo_portfolio\";i:1;s:27:\"add-post-type-zozo_services\";i:2;s:30:\"add-post-type-zozo_testimonial\";i:3;s:30:\"add-post-type-zozo_team_member\";i:4;s:12:\"add-post_tag\";i:5;s:15:\"add-post_format\";i:6;s:24:\"add-portfolio_categories\";i:7;s:18:\"add-portfolio_tags\";i:8;s:22:\"add-service_categories\";i:9;s:26:\"add-testimonial_categories\";i:10;s:19:\"add-team_categories\";}'),
(40, 1, 'nav_menu_recently_edited', '2'),
(311, 1, 'wp_media_library_mode', 'list'),
(312, 122, 'nickname', 'huylvse03982'),
(313, 122, 'first_name', ''),
(314, 122, 'last_name', ''),
(315, 122, 'description', ''),
(316, 122, 'rich_editing', 'true'),
(317, 122, 'syntax_highlighting', 'true'),
(318, 122, 'comment_shortcuts', 'false'),
(319, 122, 'admin_color', 'fresh'),
(320, 122, 'use_ssl', '0'),
(321, 122, 'show_admin_bar_front', 'true'),
(322, 122, 'locale', ''),
(323, 122, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(324, 122, 'wp_user_level', '0'),
(325, 122, 'session_tokens', 'a:6:{s:64:\"e058b9b9413094eceb9ea08a1d6939359e0fdb7d4dc5a67876850f667adc44ce\";a:4:{s:10:\"expiration\";i:1542862822;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541653222;}s:64:\"4f53ea37e40f2f19f1f67350d46f816ac67305b97b3504d6020b73faf7cdc8da\";a:4:{s:10:\"expiration\";i:1542914792;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541705192;}s:64:\"76dce11952ef1c80d451bf11e63b96e866f8822bff12676357c1312762da5b13\";a:4:{s:10:\"expiration\";i:1542915930;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541706330;}s:64:\"6be3f702a9c18f65516e50221fe8f202664f9e57a33af4c5ec418a1c54492e90\";a:4:{s:10:\"expiration\";i:1542937797;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541728197;}s:64:\"2d91948cbe98b70d79282a7481237786bb4e9d6ecc9f69561b44add7b2d780e1\";a:4:{s:10:\"expiration\";i:1543940539;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36\";s:5:\"login\";i:1542730939;}s:64:\"30a6368bb433a5b5dfb906c9faf924e1fce95fbc612fa5e6a49eb092988ff73c\";a:4:{s:10:\"expiration\";i:1544067939;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36\";s:5:\"login\";i:1542858339;}}'),
(326, 123, 'nickname', 'trangntksb02397'),
(327, 123, 'first_name', ''),
(328, 123, 'last_name', ''),
(329, 123, 'description', ''),
(330, 123, 'rich_editing', 'true'),
(331, 123, 'syntax_highlighting', 'true'),
(332, 123, 'comment_shortcuts', 'false'),
(333, 123, 'admin_color', 'fresh'),
(334, 123, 'use_ssl', '0'),
(335, 123, 'show_admin_bar_front', 'true'),
(336, 123, 'locale', ''),
(337, 123, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(338, 123, 'wp_user_level', '0'),
(340, 112, 'session_tokens', 'a:2:{s:64:\"019f14a07829399a8ca1ff1b4c747a0847247e0414229f7f88ec844b20f493c2\";a:4:{s:10:\"expiration\";i:1542077182;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541904382;}s:64:\"676540e6f45b10a0aa48e836f12db04dae7a538f5da4b0c1925f4c45e1253b99\";a:4:{s:10:\"expiration\";i:1542080288;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541907488;}}'),
(341, 1, 'session_tokens', 'a:1:{s:64:\"f769acbe984cc0f353171bb7c1643315e60c3fabaee45afcfb916c29376f9b0e\";a:4:{s:10:\"expiration\";i:1543741649;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36\";s:5:\"login\";i:1543568849;}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermetaData`
--

CREATE TABLE `wp_usermetaData` (
  `ID` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_usermetaData`
--

INSERT INTO `wp_usermetaData` (`ID`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 10, 'username', 'doan my duyen'),
(2, 10, 'gender', 'female'),
(3, 10, 'address', '253 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(4, 10, 'phone', '0026561107'),
(5, 10, 'role', '1'),
(6, 10, 'major', 'Information System'),
(7, 10, 'mail', 'duyendmia03554@fpt.edu.vn'),
(8, 10, 'biography', ''),
(9, 11, 'username', 'hoang dieu thuy'),
(10, 11, 'gender', 'female'),
(11, 11, 'address', '932 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(12, 11, 'phone', '7507313401'),
(13, 11, 'role', '1'),
(14, 11, 'major', 'Information System'),
(15, 11, 'mail', 'thuyhdia03555@fpt.edu.vn'),
(16, 11, 'biography', ''),
(17, 12, 'username', 'ngu kieu anh'),
(18, 12, 'gender', 'female'),
(19, 12, 'address', '160 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(20, 12, 'phone', '0868943181'),
(21, 12, 'role', '1'),
(22, 12, 'major', 'Information System'),
(23, 12, 'mail', 'anhnkia03556@fpt.edu.vn'),
(24, 12, 'biography', ''),
(25, 13, 'username', 'ho yen my'),
(26, 13, 'gender', 'female'),
(27, 13, 'address', '608 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(28, 13, 'phone', '9817470598'),
(29, 13, 'role', '1'),
(30, 13, 'major', 'Information System'),
(31, 13, 'mail', 'myhyia03557@fpt.edu.vn'),
(32, 13, 'biography', ''),
(33, 14, 'username', 'ho thi xuan'),
(34, 14, 'gender', 'male'),
(35, 14, 'address', '766 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(36, 14, 'phone', '3650178282'),
(37, 14, 'role', '1'),
(38, 14, 'major', 'Information System'),
(39, 14, 'mail', 'xuanhtha03558@fpt.edu.vn'),
(40, 14, 'biography', ''),
(41, 15, 'username', 'pho to quyen'),
(42, 15, 'gender', 'female'),
(43, 15, 'address', '373  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(44, 15, 'phone', '6854202726'),
(45, 15, 'role', '1'),
(46, 15, 'major', 'Information System'),
(47, 15, 'mail', 'quyenptia03559@fpt.edu.vn'),
(48, 15, 'biography', ''),
(49, 16, 'username', 'nguyen thuy oanh'),
(50, 16, 'gender', 'male'),
(51, 16, 'address', '705 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(52, 16, 'phone', '2706835204'),
(53, 16, 'role', '1'),
(54, 16, 'major', 'Information System'),
(55, 16, 'mail', 'oanhntsb03560@fpt.edu.vn'),
(56, 16, 'biography', ''),
(57, 17, 'username', 'huynh thuy uyen'),
(58, 17, 'gender', 'female'),
(59, 17, 'address', '411 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(60, 17, 'phone', '5245454001'),
(61, 17, 'role', '1'),
(62, 17, 'major', 'Information System'),
(63, 17, 'mail', 'uyenhtse03561@fpt.edu.vn'),
(64, 17, 'biography', ''),
(65, 18, 'username', 'dao minh xuan'),
(66, 18, 'gender', 'male'),
(67, 18, 'address', '238  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(68, 18, 'phone', '9285922651'),
(69, 18, 'role', '1'),
(70, 18, 'major', 'Information System'),
(71, 18, 'mail', 'xuandmha03562@fpt.edu.vn'),
(72, 18, 'biography', ''),
(73, 19, 'username', 'pham khanh thuy'),
(74, 19, 'gender', 'male'),
(75, 19, 'address', '164 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(76, 19, 'phone', '0982047543'),
(77, 19, 'role', '1'),
(78, 19, 'major', 'Information System'),
(79, 19, 'mail', 'thuypkha03563@fpt.edu.vn'),
(80, 19, 'biography', ''),
(81, 20, 'username', 'luc thai duong'),
(82, 20, 'gender', 'male'),
(83, 20, 'address', '444 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(84, 20, 'phone', '7057751726'),
(85, 20, 'role', '1'),
(86, 20, 'major', 'Information System'),
(87, 20, 'mail', 'duongltse03564@fpt.edu.vn'),
(88, 20, 'biography', ''),
(89, 21, 'username', 'vo duc an'),
(90, 21, 'gender', 'female'),
(91, 21, 'address', '216 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(92, 21, 'phone', '7979934609'),
(93, 21, 'role', '1'),
(94, 21, 'major', 'Information System'),
(95, 21, 'mail', 'anvdse03565@fpt.edu.vn'),
(96, 21, 'biography', ''),
(97, 22, 'username', 'vu tuong lan'),
(98, 22, 'gender', 'female'),
(99, 22, 'address', '23 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(100, 22, 'phone', '0187569412'),
(101, 22, 'role', '1'),
(102, 22, 'major', 'Information System'),
(103, 22, 'mail', 'lanvtha03566@fpt.edu.vn'),
(104, 22, 'biography', ''),
(105, 23, 'username', 'mai son quan'),
(106, 23, 'gender', 'male'),
(107, 23, 'address', '816 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(108, 23, 'phone', '5770903746'),
(109, 23, 'role', '1'),
(110, 23, 'major', 'Information System'),
(111, 23, 'mail', 'quanmsia03567@fpt.edu.vn'),
(112, 23, 'biography', ''),
(113, 24, 'username', 'pho nam phuong'),
(114, 24, 'gender', 'male'),
(115, 24, 'address', '255 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(116, 24, 'phone', '1581187536'),
(117, 24, 'role', '1'),
(118, 24, 'major', 'Information System'),
(119, 24, 'mail', 'phuongpnia03568@fpt.edu.vn'),
(120, 24, 'biography', ''),
(121, 25, 'username', 'banh hung dung'),
(122, 25, 'gender', 'male'),
(123, 25, 'address', '17 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(124, 25, 'phone', '0757714414'),
(125, 25, 'role', '1'),
(126, 25, 'major', 'Information System'),
(127, 25, 'mail', 'dungbhse03569@fpt.edu.vn'),
(128, 25, 'biography', ''),
(129, 26, 'username', 'thach thanh loi'),
(130, 26, 'gender', 'female'),
(131, 26, 'address', '482 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(132, 26, 'phone', '3195907357'),
(133, 26, 'role', '1'),
(134, 26, 'major', 'Information System'),
(135, 26, 'mail', 'loittia03570@fpt.edu.vn'),
(136, 26, 'biography', ''),
(137, 27, 'username', 'nguyen quang thang'),
(138, 27, 'gender', 'male'),
(139, 27, 'address', '777 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(140, 27, 'phone', '4306091332'),
(141, 27, 'role', '1'),
(142, 27, 'major', 'Information System'),
(143, 27, 'mail', 'thangnqsb03571@fpt.edu.vn'),
(144, 27, 'biography', ''),
(145, 28, 'username', 'luc thien duc'),
(146, 28, 'gender', 'male'),
(147, 28, 'address', '321 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(148, 28, 'phone', '2243525960'),
(149, 28, 'role', '1'),
(150, 28, 'major', 'Information System'),
(151, 28, 'mail', 'ducltia03572@fpt.edu.vn'),
(152, 28, 'biography', ''),
(153, 29, 'username', 'ta duong anh'),
(154, 29, 'gender', 'male'),
(155, 29, 'address', '48  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(156, 29, 'phone', '2111217945'),
(157, 29, 'role', '1'),
(158, 29, 'major', 'Information System'),
(159, 29, 'mail', 'anhtdia03573@fpt.edu.vn'),
(160, 29, 'biography', ''),
(161, 30, 'username', 'tran mai nhi'),
(162, 30, 'gender', 'male'),
(163, 30, 'address', '471  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(164, 30, 'phone', '8112606429'),
(165, 30, 'role', '1'),
(166, 30, 'major', 'Information System'),
(167, 30, 'mail', 'nhitmsb03574@fpt.edu.vn'),
(168, 30, 'biography', ''),
(169, 31, 'username', 'vuu nguyet anh'),
(170, 31, 'gender', 'female'),
(171, 31, 'address', '345 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(172, 31, 'phone', '3724281812'),
(173, 31, 'role', '1'),
(174, 31, 'major', 'Information System'),
(175, 31, 'mail', 'anhvnia03575@fpt.edu.vn'),
(176, 31, 'biography', ''),
(177, 32, 'username', 'le le quynh'),
(178, 32, 'gender', 'male'),
(179, 32, 'address', '698 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(180, 32, 'phone', '7977767403'),
(181, 32, 'role', '1'),
(182, 32, 'major', 'Information System'),
(183, 32, 'mail', 'quynhllsb03576@fpt.edu.vn'),
(184, 32, 'biography', ''),
(185, 33, 'username', 'phung hanh dung'),
(186, 33, 'gender', 'female'),
(187, 33, 'address', '361 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(188, 33, 'phone', '8503537236'),
(189, 33, 'role', '1'),
(190, 33, 'major', 'Information System'),
(191, 33, 'mail', 'dungphia03577@fpt.edu.vn'),
(192, 33, 'biography', ''),
(193, 34, 'username', 'hoang trang anh'),
(194, 34, 'gender', 'female'),
(195, 34, 'address', '69 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(196, 34, 'phone', '0368354470'),
(197, 34, 'role', '1'),
(198, 34, 'major', 'Information System'),
(199, 34, 'mail', 'anhhtha03578@fpt.edu.vn'),
(200, 34, 'biography', ''),
(201, 35, 'username', 'chu thuc quyen'),
(202, 35, 'gender', 'female'),
(203, 35, 'address', '257 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(204, 35, 'phone', '7664791291'),
(205, 35, 'role', '1'),
(206, 35, 'major', 'Information System'),
(207, 35, 'mail', 'quyenctha03579@fpt.edu.vn'),
(208, 35, 'biography', ''),
(209, 36, 'username', 'tram hoa lien'),
(210, 36, 'gender', 'female'),
(211, 36, 'address', '268 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(212, 36, 'phone', '0317607351'),
(213, 36, 'role', '1'),
(214, 36, 'major', 'Information System'),
(215, 36, 'mail', 'lienthse03580@fpt.edu.vn'),
(216, 36, 'biography', ''),
(217, 37, 'username', 'ma giang ngoc'),
(218, 37, 'gender', 'male'),
(219, 37, 'address', '486 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(220, 37, 'phone', '7596173910'),
(221, 37, 'role', '1'),
(222, 37, 'major', 'Information System'),
(223, 37, 'mail', 'ngocmgsb03581@fpt.edu.vn'),
(224, 37, 'biography', ''),
(225, 38, 'username', 'ngo thu minh'),
(226, 38, 'gender', 'male'),
(227, 38, 'address', '915  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(228, 38, 'phone', '2827759713'),
(229, 38, 'role', '1'),
(230, 38, 'major', 'Information System'),
(231, 38, 'mail', 'minhntsb03582@fpt.edu.vn'),
(232, 38, 'biography', ''),
(233, 39, 'username', 'bui thuy ngan'),
(234, 39, 'gender', 'female'),
(235, 39, 'address', '210 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(236, 39, 'phone', '5836259796'),
(237, 39, 'role', '1'),
(238, 39, 'major', 'Information System'),
(239, 39, 'mail', 'nganbtse03583@fpt.edu.vn'),
(240, 39, 'biography', ''),
(241, 40, 'username', 'luu hai long'),
(242, 40, 'gender', 'female'),
(243, 40, 'address', '97 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(244, 40, 'phone', '8044278460'),
(245, 40, 'role', '1'),
(246, 40, 'major', 'Information System'),
(247, 40, 'mail', 'longlhia03584@fpt.edu.vn'),
(248, 40, 'biography', ''),
(249, 41, 'username', 'trieu viet cuong'),
(250, 41, 'gender', 'female'),
(251, 41, 'address', '20  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(252, 41, 'phone', '3509943513'),
(253, 41, 'role', '1'),
(254, 41, 'major', 'Information System'),
(255, 41, 'mail', 'cuongtvse03585@fpt.edu.vn'),
(256, 41, 'biography', ''),
(257, 42, 'username', 'phan thanh doan'),
(258, 42, 'gender', 'female'),
(259, 42, 'address', '385 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(260, 42, 'phone', '2010205817'),
(261, 42, 'role', '1'),
(262, 42, 'major', 'Information System'),
(263, 42, 'mail', 'doanptia03586@fpt.edu.vn'),
(264, 42, 'biography', ''),
(265, 43, 'username', 'dang tung anh'),
(266, 43, 'gender', 'male'),
(267, 43, 'address', '455 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(268, 43, 'phone', '7324670981'),
(269, 43, 'role', '1'),
(270, 43, 'major', 'Information System'),
(271, 43, 'mail', 'anhdtha03587@fpt.edu.vn'),
(272, 43, 'biography', ''),
(273, 44, 'username', 'dang chi vinh'),
(274, 44, 'gender', 'male'),
(275, 44, 'address', '320 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(276, 44, 'phone', '0254883385'),
(277, 44, 'role', '1'),
(278, 44, 'major', 'Information System'),
(279, 44, 'mail', 'vinhdcse03588@fpt.edu.vn'),
(280, 44, 'biography', ''),
(281, 45, 'username', 'nguyen quang danh'),
(282, 45, 'gender', 'female'),
(283, 45, 'address', '746 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(284, 45, 'phone', '7152122397'),
(285, 45, 'role', '1'),
(286, 45, 'major', 'Information System'),
(287, 45, 'mail', 'danhnqha03589@fpt.edu.vn'),
(288, 45, 'biography', ''),
(289, 46, 'username', 'ly xuan khoa'),
(290, 46, 'gender', 'female'),
(291, 46, 'address', '88 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(292, 46, 'phone', '6959926531'),
(293, 46, 'role', '1'),
(294, 46, 'major', 'Information System'),
(295, 46, 'mail', 'khoalxse03590@fpt.edu.vn'),
(296, 46, 'biography', ''),
(297, 47, 'username', 'bui ba phuoc'),
(298, 47, 'gender', 'female'),
(299, 47, 'address', '947 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(300, 47, 'phone', '5078610217'),
(301, 47, 'role', '1'),
(302, 47, 'major', 'Information System'),
(303, 47, 'mail', 'phuocbbia03591@fpt.edu.vn'),
(304, 47, 'biography', ''),
(305, 48, 'username', 'banh thuy vi'),
(306, 48, 'gender', 'male'),
(307, 48, 'address', '556 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(308, 48, 'phone', '3670097656'),
(309, 48, 'role', '1'),
(310, 48, 'major', 'Information System'),
(311, 48, 'mail', 'vibtia03592@fpt.edu.vn'),
(312, 48, 'biography', ''),
(313, 49, 'username', 'uat dieu linh'),
(314, 49, 'gender', 'male'),
(315, 49, 'address', '885  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(316, 49, 'phone', '3940188870'),
(317, 49, 'role', '1'),
(318, 49, 'major', 'Information System'),
(319, 49, 'mail', 'linhudse03593@fpt.edu.vn'),
(320, 49, 'biography', ''),
(321, 50, 'username', 'dang ban mai'),
(322, 50, 'gender', 'male'),
(323, 50, 'address', '627 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(324, 50, 'phone', '6562418399'),
(325, 50, 'role', '1'),
(326, 50, 'major', 'Information System'),
(327, 50, 'mail', 'maidbsb03594@fpt.edu.vn'),
(328, 50, 'biography', ''),
(329, 51, 'username', 'doan ai thi'),
(330, 51, 'gender', 'male'),
(331, 51, 'address', '68 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(332, 51, 'phone', '6625899862'),
(333, 51, 'role', '1'),
(334, 51, 'major', 'Information System'),
(335, 51, 'mail', 'thidase03595@fpt.edu.vn'),
(336, 51, 'biography', ''),
(337, 52, 'username', 'dang bao lan'),
(338, 52, 'gender', 'female'),
(339, 52, 'address', '84 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(340, 52, 'phone', '6651576462'),
(341, 52, 'role', '1'),
(342, 52, 'major', 'Information System'),
(343, 52, 'mail', 'landbia03596@fpt.edu.vn'),
(344, 52, 'biography', ''),
(345, 53, 'username', 'nghiem yen oanh'),
(346, 53, 'gender', 'female'),
(347, 53, 'address', '368 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(348, 53, 'phone', '4291342462'),
(349, 53, 'role', '1'),
(350, 53, 'major', 'Information System'),
(351, 53, 'mail', 'oanhnyia03597@fpt.edu.vn'),
(352, 53, 'biography', ''),
(353, 54, 'username', 'quyen huong tien'),
(354, 54, 'gender', 'female'),
(355, 54, 'address', '903 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(356, 54, 'phone', '4574530857'),
(357, 54, 'role', '1'),
(358, 54, 'major', 'Information System'),
(359, 54, 'mail', 'tienqhha03598@fpt.edu.vn'),
(360, 54, 'biography', ''),
(361, 55, 'username', 'hoang diem thao'),
(362, 55, 'gender', 'male'),
(363, 55, 'address', '931 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(364, 55, 'phone', '4594281016'),
(365, 55, 'role', '1'),
(366, 55, 'major', 'Information System'),
(367, 55, 'mail', 'thaohdha03599@fpt.edu.vn'),
(368, 55, 'biography', ''),
(369, 56, 'username', 'ngo tu nguyet'),
(370, 56, 'gender', 'male'),
(371, 56, 'address', '408 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(372, 56, 'phone', '9116568521'),
(373, 56, 'role', '1'),
(374, 56, 'major', 'Information System'),
(375, 56, 'mail', 'nguyetntha03600@fpt.edu.vn'),
(376, 56, 'biography', ''),
(377, 57, 'username', 'mach quynh thanh'),
(378, 57, 'gender', 'female'),
(379, 57, 'address', '747 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(380, 57, 'phone', '0918760734'),
(381, 57, 'role', '1'),
(382, 57, 'major', 'Information System'),
(383, 57, 'mail', 'thanhmqha03601@fpt.edu.vn'),
(384, 57, 'biography', ''),
(385, 58, 'username', 'vinh quang vu'),
(386, 58, 'gender', 'female'),
(387, 58, 'address', '109  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(388, 58, 'phone', '6774492993'),
(389, 58, 'role', '1'),
(390, 58, 'major', 'Information System'),
(391, 58, 'mail', 'vuvqia03602@fpt.edu.vn'),
(392, 58, 'biography', ''),
(393, 59, 'username', 'vu manh quynh'),
(394, 59, 'gender', 'male'),
(395, 59, 'address', '448 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(396, 59, 'phone', '8101575608'),
(397, 59, 'role', '1'),
(398, 59, 'major', 'Information System'),
(399, 59, 'mail', 'quynhvmha03603@fpt.edu.vn'),
(400, 59, 'biography', ''),
(401, 60, 'username', 'le vu uy'),
(402, 60, 'gender', 'male'),
(403, 60, 'address', '47 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(404, 60, 'phone', '0945313256'),
(405, 60, 'role', '1'),
(406, 60, 'major', 'Information System'),
(407, 60, 'mail', 'uylvsb03604@fpt.edu.vn'),
(408, 60, 'biography', ''),
(409, 61, 'username', 'chu tuong lam'),
(410, 61, 'gender', 'male'),
(411, 61, 'address', '134 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(412, 61, 'phone', '1888466789'),
(413, 61, 'role', '1'),
(414, 61, 'major', 'Information System'),
(415, 61, 'mail', 'lamctse03605@fpt.edu.vn'),
(416, 61, 'biography', ''),
(417, 62, 'username', 'huynh quang dung'),
(418, 62, 'gender', 'female'),
(419, 62, 'address', '761  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(420, 62, 'phone', '4534442796'),
(421, 62, 'role', '1'),
(422, 62, 'major', 'Information System'),
(423, 62, 'mail', 'dunghqia03606@fpt.edu.vn'),
(424, 62, 'biography', ''),
(425, 63, 'username', 'chau hung dao'),
(426, 63, 'gender', 'female'),
(427, 63, 'address', '17  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(428, 63, 'phone', '0087886851'),
(429, 63, 'role', '1'),
(430, 63, 'major', 'Information System'),
(431, 63, 'mail', 'daochse03607@fpt.edu.vn'),
(432, 63, 'biography', ''),
(433, 64, 'username', 'le quang huy'),
(434, 64, 'gender', 'male'),
(435, 64, 'address', '721 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(436, 64, 'phone', '1698898242'),
(437, 64, 'role', '1'),
(438, 64, 'major', 'Information System'),
(439, 64, 'mail', 'huylqia03608@fpt.edu.vn'),
(440, 64, 'biography', ''),
(441, 65, 'username', 'quang huu bao'),
(442, 65, 'gender', 'male'),
(443, 65, 'address', '86 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(444, 65, 'phone', '7788492324'),
(445, 65, 'role', '1'),
(446, 65, 'major', 'Information System'),
(447, 65, 'mail', 'baoqhse03609@fpt.edu.vn'),
(448, 65, 'biography', ''),
(449, 66, 'username', 'ly minh dat'),
(450, 66, 'gender', 'male'),
(451, 66, 'address', '771 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(452, 66, 'phone', '4431759247'),
(453, 66, 'role', '1'),
(454, 66, 'major', 'Information System'),
(455, 66, 'mail', 'datlmha03610@fpt.edu.vn'),
(456, 66, 'biography', ''),
(457, 67, 'username', 'vu viet son'),
(458, 67, 'gender', 'male'),
(459, 67, 'address', '333 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(460, 67, 'phone', '2032724175'),
(461, 67, 'role', '1'),
(462, 67, 'major', 'Information System'),
(463, 67, 'mail', 'sonvvse03611@fpt.edu.vn'),
(464, 67, 'biography', ''),
(465, 68, 'username', 'ly xuan thuy'),
(466, 68, 'gender', 'female'),
(467, 68, 'address', '739 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(468, 68, 'phone', '7946096822'),
(469, 68, 'role', '1'),
(470, 68, 'major', 'Information System'),
(471, 68, 'mail', 'thuylxia03612@fpt.edu.vn'),
(472, 68, 'biography', ''),
(473, 69, 'username', 'vuong thuc dao'),
(474, 69, 'gender', 'male'),
(475, 69, 'address', '168 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(476, 69, 'phone', '2569508160'),
(477, 69, 'role', '1'),
(478, 69, 'major', 'Information System'),
(479, 69, 'mail', 'daovtsb03613@fpt.edu.vn'),
(480, 69, 'biography', ''),
(481, 70, 'username', 'than bao quyen'),
(482, 70, 'gender', 'female'),
(483, 70, 'address', '145 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(484, 70, 'phone', '0391709479'),
(485, 70, 'role', '1'),
(486, 70, 'major', 'Information System'),
(487, 70, 'mail', 'quyentbia03614@fpt.edu.vn'),
(488, 70, 'biography', ''),
(489, 71, 'username', 'than tam nhu'),
(490, 71, 'gender', 'female'),
(491, 71, 'address', '540 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(492, 71, 'phone', '9571698034'),
(493, 71, 'role', '1'),
(494, 71, 'major', 'Information System'),
(495, 71, 'mail', 'nhuttia03615@fpt.edu.vn'),
(496, 71, 'biography', ''),
(497, 72, 'username', 'bui mai loan'),
(498, 72, 'gender', 'male'),
(499, 72, 'address', '436  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(500, 72, 'phone', '7741337993'),
(501, 72, 'role', '1'),
(502, 72, 'major', 'Information System'),
(503, 72, 'mail', 'loanbmha03616@fpt.edu.vn'),
(504, 72, 'biography', ''),
(505, 73, 'username', 'ho anh tho'),
(506, 73, 'gender', 'female'),
(507, 73, 'address', '162 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(508, 73, 'phone', '1507934772'),
(509, 73, 'role', '1'),
(510, 73, 'major', 'Information System'),
(511, 73, 'mail', 'thohasb03617@fpt.edu.vn'),
(512, 73, 'biography', ''),
(513, 74, 'username', 'huynh mong nguyet'),
(514, 74, 'gender', 'male'),
(515, 74, 'address', '901 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(516, 74, 'phone', '9120654492'),
(517, 74, 'role', '1'),
(518, 74, 'major', 'Information System'),
(519, 74, 'mail', 'nguyethmia03618@fpt.edu.vn'),
(520, 74, 'biography', ''),
(521, 75, 'username', 'quang tu anh'),
(522, 75, 'gender', 'male'),
(523, 75, 'address', '494 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(524, 75, 'phone', '4077457514'),
(525, 75, 'role', '1'),
(526, 75, 'major', 'Information System'),
(527, 75, 'mail', 'anhqtsb03619@fpt.edu.vn'),
(528, 75, 'biography', ''),
(529, 76, 'username', 'nguyen bich lien'),
(530, 76, 'gender', 'female'),
(531, 76, 'address', '662 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(532, 76, 'phone', '4162038480'),
(533, 76, 'role', '1'),
(534, 76, 'major', 'Information System'),
(535, 76, 'mail', 'liennbia03620@fpt.edu.vn'),
(536, 76, 'biography', ''),
(537, 77, 'username', 'duong hiep vu'),
(538, 77, 'gender', 'male'),
(539, 77, 'address', '433 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(540, 77, 'phone', '7585562378'),
(541, 77, 'role', '1'),
(542, 77, 'major', 'Information System'),
(543, 77, 'mail', 'vudhse03621@fpt.edu.vn'),
(544, 77, 'biography', ''),
(545, 78, 'username', 'trang quang minh'),
(546, 78, 'gender', 'male'),
(547, 78, 'address', '841 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(548, 78, 'phone', '1928338760'),
(549, 78, 'role', '1'),
(550, 78, 'major', 'Information System'),
(551, 78, 'mail', 'minhtqia03622@fpt.edu.vn'),
(552, 78, 'biography', ''),
(553, 79, 'username', 'vinh kim phu'),
(554, 79, 'gender', 'female'),
(555, 79, 'address', '953  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(556, 79, 'phone', '2885302409'),
(557, 79, 'role', '1'),
(558, 79, 'major', 'Information System'),
(559, 79, 'mail', 'phuvkia03623@fpt.edu.vn'),
(560, 79, 'biography', ''),
(561, 80, 'username', 'do ngoc dung'),
(562, 80, 'gender', 'female'),
(563, 80, 'address', '968 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(564, 80, 'phone', '1894999053'),
(565, 80, 'role', '1'),
(566, 80, 'major', 'Information System'),
(567, 80, 'mail', 'dungdnse03624@fpt.edu.vn'),
(568, 80, 'biography', ''),
(569, 81, 'username', 'nguyen anh tai'),
(570, 81, 'gender', 'female'),
(571, 81, 'address', '689 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(572, 81, 'phone', '5787427678'),
(573, 81, 'role', '1'),
(574, 81, 'major', 'Information System'),
(575, 81, 'mail', 'tainase03625@fpt.edu.vn'),
(576, 81, 'biography', ''),
(577, 82, 'username', 'ngo trung anh'),
(578, 82, 'gender', 'female'),
(579, 82, 'address', '210 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(580, 82, 'phone', '5609260519'),
(581, 82, 'role', '1'),
(582, 82, 'major', 'Information System'),
(583, 82, 'mail', 'anhntha03626@fpt.edu.vn'),
(584, 82, 'biography', ''),
(585, 83, 'username', 'nguyen hung ngoc'),
(586, 83, 'gender', 'female'),
(587, 83, 'address', '96 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(588, 83, 'phone', '7528936562'),
(589, 83, 'role', '1'),
(590, 83, 'major', 'Information System'),
(591, 83, 'mail', 'ngocnhse03627@fpt.edu.vn'),
(592, 83, 'biography', ''),
(593, 84, 'username', 'nguyen phuong nam'),
(594, 84, 'gender', 'female'),
(595, 84, 'address', '65 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(596, 84, 'phone', '1493512101'),
(597, 84, 'role', '1'),
(598, 84, 'major', 'Information System'),
(599, 84, 'mail', 'namnpia03628@fpt.edu.vn'),
(600, 84, 'biography', ''),
(601, 85, 'username', 'kieu huu luong'),
(602, 85, 'gender', 'female'),
(603, 85, 'address', '477  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(604, 85, 'phone', '8135182650'),
(605, 85, 'role', '1'),
(606, 85, 'major', 'Information System'),
(607, 85, 'mail', 'luongkhsb03629@fpt.edu.vn'),
(608, 85, 'biography', ''),
(609, 86, 'username', 'chau huu minh'),
(610, 86, 'gender', 'male'),
(611, 86, 'address', '840  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(612, 86, 'phone', '1705574508'),
(613, 86, 'role', '1'),
(614, 86, 'major', 'Information System'),
(615, 86, 'mail', 'minhchia03630@fpt.edu.vn'),
(616, 86, 'biography', ''),
(617, 87, 'username', 'bui minh thao'),
(618, 87, 'gender', 'female'),
(619, 87, 'address', '153 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(620, 87, 'phone', '9996432756'),
(621, 87, 'role', '1'),
(622, 87, 'major', 'Information System'),
(623, 87, 'mail', 'thaobmia03631@fpt.edu.vn'),
(624, 87, 'biography', ''),
(625, 88, 'username', 'tram thien thanh'),
(626, 88, 'gender', 'female'),
(627, 88, 'address', '931 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(628, 88, 'phone', '8625236447'),
(629, 88, 'role', '1'),
(630, 88, 'major', 'Information System'),
(631, 88, 'mail', 'thanhttia03632@fpt.edu.vn'),
(632, 88, 'biography', ''),
(633, 89, 'username', 'hoang thuy kieu'),
(634, 89, 'gender', 'female'),
(635, 89, 'address', '500 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(636, 89, 'phone', '5636790184'),
(637, 89, 'role', '1'),
(638, 89, 'major', 'Information System'),
(639, 89, 'mail', 'kieuhtia03633@fpt.edu.vn'),
(640, 89, 'biography', ''),
(641, 90, 'username', 'ly kim tuyen'),
(642, 90, 'gender', 'female'),
(643, 90, 'address', '795 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(644, 90, 'phone', '2883853632'),
(645, 90, 'role', '1'),
(646, 90, 'major', 'Information System'),
(647, 90, 'mail', 'tuyenlksb03634@fpt.edu.vn'),
(648, 90, 'biography', ''),
(649, 91, 'username', 'cao uyen my'),
(650, 91, 'gender', 'male'),
(651, 91, 'address', '229  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(652, 91, 'phone', '4704674538'),
(653, 91, 'role', '1'),
(654, 91, 'major', 'Information System'),
(655, 91, 'mail', 'mycuha03635@fpt.edu.vn'),
(656, 91, 'biography', ''),
(657, 92, 'username', 'dao tinh nhi'),
(658, 92, 'gender', 'male'),
(659, 92, 'address', '808 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(660, 92, 'phone', '7844930068'),
(661, 92, 'role', '1'),
(662, 92, 'major', 'Information System'),
(663, 92, 'mail', 'nhidtsb03636@fpt.edu.vn'),
(664, 92, 'biography', ''),
(665, 93, 'username', 'bui ngan truc'),
(666, 93, 'gender', 'male'),
(667, 93, 'address', '700 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(668, 93, 'phone', '0292747064'),
(669, 93, 'role', '1'),
(670, 93, 'major', 'Information System'),
(671, 93, 'mail', 'trucbnha03637@fpt.edu.vn'),
(672, 93, 'biography', ''),
(673, 94, 'username', 'nguyen bich nga'),
(674, 94, 'gender', 'female'),
(675, 94, 'address', '731  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(676, 94, 'phone', '9228338181'),
(677, 94, 'role', '1'),
(678, 94, 'major', 'Information System'),
(679, 94, 'mail', 'nganbsb03638@fpt.edu.vn'),
(680, 94, 'biography', ''),
(681, 95, 'username', 'nguyen my phuong'),
(682, 95, 'gender', 'male'),
(683, 95, 'address', '552 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(684, 95, 'phone', '1630932730'),
(685, 95, 'role', '1'),
(686, 95, 'major', 'Information System'),
(687, 95, 'mail', 'phuongnmsb03639@fpt.edu.vn'),
(688, 95, 'biography', ''),
(689, 96, 'username', 'ho nguyet anh'),
(690, 96, 'gender', 'male'),
(691, 96, 'address', '54 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(692, 96, 'phone', '5355532082'),
(693, 96, 'role', '1'),
(694, 96, 'major', 'Information System'),
(695, 96, 'mail', 'anhhnsb03640@fpt.edu.vn'),
(696, 96, 'biography', ''),
(697, 97, 'username', 'nguyen thai minh'),
(698, 97, 'gender', 'female'),
(699, 97, 'address', '379 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(700, 97, 'phone', '6240056675'),
(701, 97, 'role', '1'),
(702, 97, 'major', 'Information System'),
(703, 97, 'mail', 'minhntia03641@fpt.edu.vn'),
(704, 97, 'biography', ''),
(705, 98, 'username', 'nguyen dai hanh'),
(706, 98, 'gender', 'female'),
(707, 98, 'address', '722 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(708, 98, 'phone', '3673105430'),
(709, 98, 'role', '1'),
(710, 98, 'major', 'Information System'),
(711, 98, 'mail', 'hanhndsb03642@fpt.edu.vn'),
(712, 98, 'biography', ''),
(713, 99, 'username', 'ho chieu minh'),
(714, 99, 'gender', 'male'),
(715, 99, 'address', '698 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(716, 99, 'phone', '7676445909'),
(717, 99, 'role', '1'),
(718, 99, 'major', 'Information System'),
(719, 99, 'mail', 'minhhcia03643@fpt.edu.vn'),
(720, 99, 'biography', ''),
(721, 100, 'username', 'dang anh quan'),
(722, 100, 'gender', 'male'),
(723, 100, 'address', '618 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(724, 100, 'phone', '5888327127'),
(725, 100, 'role', '1'),
(726, 100, 'major', 'Information System'),
(727, 100, 'mail', 'quandase03644@fpt.edu.vn'),
(728, 100, 'biography', ''),
(729, 101, 'username', 'duong xuan hieu'),
(730, 101, 'gender', 'male'),
(731, 101, 'address', '275 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(732, 101, 'phone', '6450807879'),
(733, 101, 'role', '1'),
(734, 101, 'major', 'Information System'),
(735, 101, 'mail', 'hieudxsb03645@fpt.edu.vn'),
(736, 101, 'biography', ''),
(737, 102, 'username', 'duu duy quang'),
(738, 102, 'gender', 'male'),
(739, 102, 'address', '472 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(740, 102, 'phone', '0366377354'),
(741, 102, 'role', '1'),
(742, 102, 'major', 'Information System'),
(743, 102, 'mail', 'quangddha03646@fpt.edu.vn'),
(744, 102, 'biography', ''),
(745, 103, 'username', 'quyen tan thanh'),
(746, 103, 'gender', 'female'),
(747, 103, 'address', '421  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(748, 103, 'phone', '0795075684'),
(749, 103, 'role', '1'),
(750, 103, 'major', 'Information System'),
(751, 103, 'mail', 'thanhqtha03647@fpt.edu.vn'),
(752, 103, 'biography', ''),
(753, 104, 'username', 'an quang ha'),
(754, 104, 'gender', 'female'),
(755, 104, 'address', '787 Phố Hai Bà Trưng, Phường Trần Hưng Đạo, Quận Hoàn Kiếm'),
(756, 104, 'phone', '7737402027'),
(757, 104, 'role', '1'),
(758, 104, 'major', 'Information System'),
(759, 104, 'mail', 'haaqse03648@fpt.edu.vn'),
(760, 104, 'biography', ''),
(761, 105, 'username', 'quach duc khang'),
(762, 105, 'gender', 'female'),
(763, 105, 'address', '164 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(764, 105, 'phone', '4805228305'),
(765, 105, 'role', '1'),
(766, 105, 'major', 'Information System'),
(767, 105, 'mail', 'khangqdse03649@fpt.edu.vn'),
(768, 105, 'biography', ''),
(769, 106, 'username', 'ta bao chau'),
(770, 106, 'gender', 'female'),
(771, 106, 'address', '554 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(772, 106, 'phone', '8909462648'),
(773, 106, 'role', '1'),
(774, 106, 'major', 'Information System'),
(775, 106, 'mail', 'chautbha03650@fpt.edu.vn'),
(776, 106, 'biography', ''),
(777, 107, 'username', 'bui hue an'),
(778, 107, 'gender', 'male'),
(779, 107, 'address', '414 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(780, 107, 'phone', '8948324454'),
(781, 107, 'role', '1'),
(782, 107, 'major', 'Information System'),
(783, 107, 'mail', 'anbhia03651@fpt.edu.vn'),
(784, 107, 'biography', ''),
(785, 108, 'username', 'phi kim thuy'),
(786, 108, 'gender', 'female'),
(787, 108, 'address', '787  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(788, 108, 'phone', '2139245480'),
(789, 108, 'role', '1'),
(790, 108, 'major', 'Information System'),
(791, 108, 'mail', 'thuypkse03652@fpt.edu.vn'),
(792, 108, 'biography', ''),
(793, 109, 'username', 'vinh thuc van'),
(794, 109, 'gender', 'female'),
(795, 109, 'address', '886 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(796, 109, 'phone', '9371615289'),
(797, 109, 'role', '1'),
(798, 109, 'major', 'Information System'),
(799, 109, 'mail', 'vanvtse03653@fpt.edu.vn'),
(800, 109, 'biography', ''),
(801, 110, 'username', 'tong duy hieu'),
(802, 110, 'gender', 'male'),
(803, 110, 'address', '860  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(804, 110, 'phone', '3971571600'),
(805, 110, 'role', '1'),
(806, 110, 'major', 'Information System'),
(807, 110, 'mail', 'hieutdsb03654@fpt.edu.vn'),
(808, 110, 'biography', ''),
(809, 111, 'username', 'dam thanh khiem'),
(810, 111, 'gender', 'male'),
(811, 111, 'address', '671 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(812, 111, 'phone', '1297079352'),
(813, 111, 'role', '1'),
(814, 111, 'major', 'Information System'),
(815, 111, 'mail', 'khiemdtse03655@fpt.edu.vn'),
(816, 111, 'biography', ''),
(817, 112, 'username', 'dao trong duy'),
(818, 112, 'gender', 'male'),
(819, 112, 'address', '469 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(820, 112, 'phone', '2806680768'),
(821, 112, 'role', '0'),
(822, 112, 'major', ''),
(823, 112, 'mail', 'duydt@fpt.edu.vn'),
(824, 112, 'biography', ''),
(825, 113, 'username', 'phan truong lam'),
(826, 113, 'gender', 'male'),
(827, 113, 'address', '903 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(828, 113, 'phone', '8667872272'),
(829, 113, 'role', '0'),
(830, 113, 'major', ''),
(831, 113, 'mail', 'lampt@fpt.edu.vn'),
(832, 113, 'biography', ''),
(833, 114, 'username', 'phan dang cau'),
(834, 114, 'gender', 'male'),
(835, 114, 'address', '425 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(836, 114, 'phone', '5860801074'),
(837, 114, 'role', '0'),
(838, 114, 'major', ''),
(839, 114, 'mail', 'caupd@fpt.edu.vn'),
(840, 114, 'biography', ''),
(841, 115, 'username', 'tran quy ban'),
(842, 115, 'gender', 'male'),
(843, 115, 'address', '267 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(844, 115, 'phone', '7754409916'),
(845, 115, 'role', '0'),
(846, 115, 'major', ''),
(847, 115, 'mail', 'bantq3@fpt.edu.vn'),
(848, 115, 'biography', ''),
(849, 116, 'username', 'luong trung kien'),
(850, 116, 'gender', 'male'),
(851, 116, 'address', '991  Phố Đinh Tiên Hoàng, Phường Tràng Tiền, Quận Hoàn Kiếm'),
(852, 116, 'phone', '2560237964'),
(853, 116, 'role', '0'),
(854, 116, 'major', ''),
(855, 116, 'mail', 'kienlt@fpt.edu.vn'),
(856, 116, 'biography', ''),
(857, 117, 'username', 'tran binh duong'),
(858, 117, 'gender', 'male'),
(859, 117, 'address', '877 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(860, 117, 'phone', '1828328743'),
(861, 117, 'role', '0'),
(862, 117, 'major', ''),
(863, 117, 'mail', 'duongtb@fpt.edu.vn'),
(864, 117, 'biography', ''),
(865, 118, 'username', 'pham ngoc anh'),
(866, 118, 'gender', 'male'),
(867, 118, 'address', '75 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(868, 118, 'phone', '3484238711'),
(869, 118, 'role', '0'),
(870, 118, 'major', ''),
(871, 118, 'mail', 'anhpn@fpt.edu.vn'),
(872, 118, 'biography', ''),
(873, 119, 'username', 'phung duy khuong'),
(874, 119, 'gender', 'male'),
(875, 119, 'address', '325 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(876, 119, 'phone', '2000287976'),
(877, 119, 'role', '0'),
(878, 119, 'major', ''),
(879, 119, 'mail', 'khuongpd@fpt.edu.vn'),
(880, 119, 'biography', ''),
(881, 120, 'username', 'tran dinh tri'),
(882, 120, 'gender', 'male'),
(883, 120, 'address', '708 Đường Lạc Long Quân, Phường Xuân La, Quận Tây Hồ'),
(884, 120, 'phone', '9309114843'),
(885, 120, 'role', '0'),
(886, 120, 'major', ''),
(887, 120, 'mail', 'tritd@fpt.edu.vn'),
(888, 120, 'biography', ''),
(889, 121, 'username', 'nguyet tat trung'),
(890, 121, 'gender', 'male'),
(891, 121, 'address', '881 Đường Nguyễn Hoàng Tôn, Phường Xuân La, Quận Tây Hồ'),
(892, 121, 'phone', '6292104345'),
(893, 121, 'role', '0'),
(894, 121, 'major', ''),
(895, 121, 'mail', 'trungnt@fpt.edu.vn'),
(896, 121, 'biography', ''),
(897, 122, 'username', 'asume sama'),
(898, 122, 'gender', 'male'),
(899, 122, 'address', ''),
(900, 122, 'phone', ''),
(901, 122, 'role', '1'),
(902, 122, 'major', 'Information System'),
(903, 122, 'email', 'huylvse03982@fpt.edu.vn'),
(904, 122, 'biography', ''),
(905, 123, 'username', '(K12_HN) Nguyen Thi Kieu Trang'),
(906, 123, 'gender', 'Male'),
(907, 123, 'address', '51B khu Hồ Văn Hóa, Yên Viên, Gia Lâm, Hà Nôi.'),
(908, 123, 'phone', ''),
(909, 123, 'role', '1'),
(910, 123, 'major', 'Information System'),
(911, 123, 'email', 'trangntksb02397@fpt.edu.vn'),
(912, 123, 'biography', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BBScbWYKpRa3KsQm1ZUIdRdW8K5pjQ/', 'admin', 'admin@gmail.com', '', '2018-10-13 14:08:58', '', 0, 'admin'),
(10, 'duyendmia03554', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duyendmia03554', 'duyendmia03554@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duyendmia03554'),
(11, 'thuyhdia03555', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuyhdia03555', 'thuyhdia03555@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuyhdia03555'),
(12, 'anhnkia03556', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhnkia03556', 'anhnkia03556@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhnkia03556'),
(13, 'myhyia03557', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'myhyia03557', 'myhyia03557@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'myhyia03557'),
(14, 'xuanhtha03558', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'xuanhtha03558', 'xuanhtha03558@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'xuanhtha03558'),
(15, 'quyenptia03559', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quyenptia03559', 'quyenptia03559@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quyenptia03559'),
(16, 'oanhntsb03560', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'oanhntsb03560', 'oanhntsb03560@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'oanhntsb03560'),
(17, 'uyenhtse03561', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'uyenhtse03561', 'uyenhtse03561@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'uyenhtse03561'),
(18, 'xuandmha03562', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'xuandmha03562', 'xuandmha03562@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'xuandmha03562'),
(19, 'thuypkha03563', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuypkha03563', 'thuypkha03563@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuypkha03563'),
(20, 'duongltse03564', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duongltse03564', 'duongltse03564@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duongltse03564'),
(21, 'anvdse03565', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anvdse03565', 'anvdse03565@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anvdse03565'),
(22, 'lanvtha03566', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lanvtha03566', 'lanvtha03566@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lanvtha03566'),
(23, 'quanmsia03567', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quanmsia03567', 'quanmsia03567@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quanmsia03567'),
(24, 'phuongpnia03568', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuongpnia03568', 'phuongpnia03568@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuongpnia03568'),
(25, 'dungbhse03569', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dungbhse03569', 'dungbhse03569@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dungbhse03569'),
(26, 'loittia03570', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'loittia03570', 'loittia03570@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'loittia03570'),
(27, 'thangnqsb03571', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thangnqsb03571', 'thangnqsb03571@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thangnqsb03571'),
(28, 'ducltia03572', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'ducltia03572', 'ducltia03572@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'ducltia03572'),
(29, 'anhtdia03573', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhtdia03573', 'anhtdia03573@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhtdia03573'),
(30, 'nhitmsb03574', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nhitmsb03574', 'nhitmsb03574@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nhitmsb03574'),
(31, 'anhvnia03575', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhvnia03575', 'anhvnia03575@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhvnia03575'),
(32, 'quynhllsb03576', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quynhllsb03576', 'quynhllsb03576@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quynhllsb03576'),
(33, 'dungphia03577', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dungphia03577', 'dungphia03577@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dungphia03577'),
(34, 'anhhtha03578', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhhtha03578', 'anhhtha03578@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhhtha03578'),
(35, 'quyenctha03579', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quyenctha03579', 'quyenctha03579@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quyenctha03579'),
(36, 'lienthse03580', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lienthse03580', 'lienthse03580@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lienthse03580'),
(37, 'ngocmgsb03581', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'ngocmgsb03581', 'ngocmgsb03581@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'ngocmgsb03581'),
(38, 'minhntsb03582', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhntsb03582', 'minhntsb03582@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhntsb03582'),
(39, 'nganbtse03583', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nganbtse03583', 'nganbtse03583@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nganbtse03583'),
(40, 'longlhia03584', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'longlhia03584', 'longlhia03584@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'longlhia03584'),
(41, 'cuongtvse03585', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'cuongtvse03585', 'cuongtvse03585@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'cuongtvse03585'),
(42, 'doanptia03586', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'doanptia03586', 'doanptia03586@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'doanptia03586'),
(43, 'anhdtha03587', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhdtha03587', 'anhdtha03587@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhdtha03587'),
(44, 'vinhdcse03588', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vinhdcse03588', 'vinhdcse03588@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vinhdcse03588'),
(45, 'danhnqha03589', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'danhnqha03589', 'danhnqha03589@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'danhnqha03589'),
(46, 'khoalxse03590', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khoalxse03590', 'khoalxse03590@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khoalxse03590'),
(47, 'phuocbbia03591', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuocbbia03591', 'phuocbbia03591@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuocbbia03591'),
(48, 'vibtia03592', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vibtia03592', 'vibtia03592@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vibtia03592'),
(49, 'linhudse03593', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'linhudse03593', 'linhudse03593@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'linhudse03593'),
(50, 'maidbsb03594', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'maidbsb03594', 'maidbsb03594@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'maidbsb03594'),
(51, 'thidase03595', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thidase03595', 'thidase03595@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thidase03595'),
(52, 'landbia03596', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'landbia03596', 'landbia03596@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'landbia03596'),
(53, 'oanhnyia03597', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'oanhnyia03597', 'oanhnyia03597@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'oanhnyia03597'),
(54, 'tienqhha03598', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tienqhha03598', 'tienqhha03598@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tienqhha03598'),
(55, 'thaohdha03599', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thaohdha03599', 'thaohdha03599@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thaohdha03599'),
(56, 'nguyetntha03600', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nguyetntha03600', 'nguyetntha03600@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nguyetntha03600'),
(57, 'thanhmqha03601', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thanhmqha03601', 'thanhmqha03601@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thanhmqha03601'),
(58, 'vuvqia03602', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vuvqia03602', 'vuvqia03602@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vuvqia03602'),
(59, 'quynhvmha03603', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quynhvmha03603', 'quynhvmha03603@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quynhvmha03603'),
(60, 'uylvsb03604', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'uylvsb03604', 'uylvsb03604@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'uylvsb03604'),
(61, 'lamctse03605', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lamctse03605', 'lamctse03605@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lamctse03605'),
(62, 'dunghqia03606', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dunghqia03606', 'dunghqia03606@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dunghqia03606'),
(63, 'daochse03607', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'daochse03607', 'daochse03607@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'daochse03607'),
(64, 'huylqia03608', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'huylqia03608', 'huylqia03608@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'huylqia03608'),
(65, 'baoqhse03609', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'baoqhse03609', 'baoqhse03609@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'baoqhse03609'),
(66, 'datlmha03610', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'datlmha03610', 'datlmha03610@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'datlmha03610'),
(67, 'sonvvse03611', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'sonvvse03611', 'sonvvse03611@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'sonvvse03611'),
(68, 'thuylxia03612', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuylxia03612', 'thuylxia03612@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuylxia03612'),
(69, 'daovtsb03613', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'daovtsb03613', 'daovtsb03613@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'daovtsb03613'),
(70, 'quyentbia03614', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quyentbia03614', 'quyentbia03614@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quyentbia03614'),
(71, 'nhuttia03615', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nhuttia03615', 'nhuttia03615@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nhuttia03615'),
(72, 'loanbmha03616', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'loanbmha03616', 'loanbmha03616@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'loanbmha03616'),
(73, 'thohasb03617', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thohasb03617', 'thohasb03617@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thohasb03617'),
(74, 'nguyethmia03618', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nguyethmia03618', 'nguyethmia03618@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nguyethmia03618'),
(75, 'anhqtsb03619', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhqtsb03619', 'anhqtsb03619@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhqtsb03619'),
(76, 'liennbia03620', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'liennbia03620', 'liennbia03620@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'liennbia03620'),
(77, 'vudhse03621', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vudhse03621', 'vudhse03621@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vudhse03621'),
(78, 'minhtqia03622', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhtqia03622', 'minhtqia03622@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhtqia03622'),
(79, 'phuvkia03623', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuvkia03623', 'phuvkia03623@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuvkia03623'),
(80, 'dungdnse03624', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'dungdnse03624', 'dungdnse03624@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'dungdnse03624'),
(81, 'tainase03625', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tainase03625', 'tainase03625@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tainase03625'),
(82, 'anhntha03626', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhntha03626', 'anhntha03626@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhntha03626'),
(83, 'ngocnhse03627', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'ngocnhse03627', 'ngocnhse03627@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'ngocnhse03627'),
(84, 'namnpia03628', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'namnpia03628', 'namnpia03628@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'namnpia03628'),
(85, 'luongkhsb03629', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'luongkhsb03629', 'luongkhsb03629@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'luongkhsb03629'),
(86, 'minhchia03630', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhchia03630', 'minhchia03630@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhchia03630'),
(87, 'thaobmia03631', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thaobmia03631', 'thaobmia03631@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thaobmia03631'),
(88, 'thanhttia03632', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thanhttia03632', 'thanhttia03632@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thanhttia03632'),
(89, 'kieuhtia03633', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'kieuhtia03633', 'kieuhtia03633@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'kieuhtia03633'),
(90, 'tuyenlksb03634', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tuyenlksb03634', 'tuyenlksb03634@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tuyenlksb03634'),
(91, 'mycuha03635', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'mycuha03635', 'mycuha03635@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'mycuha03635'),
(92, 'nhidtsb03636', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nhidtsb03636', 'nhidtsb03636@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nhidtsb03636'),
(93, 'trucbnha03637', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'trucbnha03637', 'trucbnha03637@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'trucbnha03637'),
(94, 'nganbsb03638', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'nganbsb03638', 'nganbsb03638@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'nganbsb03638'),
(95, 'phuongnmsb03639', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'phuongnmsb03639', 'phuongnmsb03639@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'phuongnmsb03639'),
(96, 'anhhnsb03640', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhhnsb03640', 'anhhnsb03640@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhhnsb03640'),
(97, 'minhntia03641', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhntia03641', 'minhntia03641@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhntia03641'),
(98, 'hanhndsb03642', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'hanhndsb03642', 'hanhndsb03642@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'hanhndsb03642'),
(99, 'minhhcia03643', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'minhhcia03643', 'minhhcia03643@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'minhhcia03643'),
(100, 'quandase03644', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quandase03644', 'quandase03644@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quandase03644'),
(101, 'hieudxsb03645', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'hieudxsb03645', 'hieudxsb03645@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'hieudxsb03645'),
(102, 'quangddha03646', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'quangddha03646', 'quangddha03646@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'quangddha03646'),
(103, 'thanhqtha03647', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thanhqtha03647', 'thanhqtha03647@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thanhqtha03647'),
(104, 'haaqse03648', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'haaqse03648', 'haaqse03648@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'haaqse03648'),
(105, 'khangqdse03649', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khangqdse03649', 'khangqdse03649@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khangqdse03649'),
(106, 'chautbha03650', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'chautbha03650', 'chautbha03650@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'chautbha03650'),
(107, 'anbhia03651', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anbhia03651', 'anbhia03651@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anbhia03651'),
(108, 'thuypkse03652', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'thuypkse03652', 'thuypkse03652@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'thuypkse03652'),
(109, 'vanvtse03653', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'vanvtse03653', 'vanvtse03653@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'vanvtse03653'),
(110, 'hieutdsb03654', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'hieutdsb03654', 'hieutdsb03654@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'hieutdsb03654'),
(111, 'khiemdtse03655', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khiemdtse03655', 'khiemdtse03655@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khiemdtse03655'),
(112, 'duydt', '$P$BBScbWYKpRa3KsQm1ZUIdRdW8K5pjQ/', 'duydt', 'duydt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duydt'),
(113, 'lampt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'lampt', 'lampt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'lampt'),
(114, 'caupd', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'caupd', 'caupd@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'caupd'),
(115, 'bantq3', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'bantq3', 'bantq3@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'bantq3'),
(116, 'kienlt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'kienlt', 'kienlt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'kienlt'),
(117, 'duongtb', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duongtb', 'duongtb@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'duongtb'),
(118, 'anhpn', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'anhpn', 'anhpn@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'anhpn'),
(119, 'khuongpd', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'khuongpd', 'khuongpd@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'khuongpd'),
(120, 'tritd', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'tritd', 'tritd@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'tritd'),
(121, 'trungnt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'trungnt', 'trungnt@fpt.edu.vn', '', '0000-00-00 00:00:00', '', 0, 'trungnt'),
(122, 'huylvse03982', '$P$BgnLp2T4ab86wWnjG23WjjH0AKq0D41', 'huylvse03982', 'huylvse03982@fpt.edu.vn', '', '2018-11-01 16:42:10', '', 0, 'huylvse03982'),
(123, 'trangntksb02397', '$P$BxZ1lohhg/9M.ozORBv2PFC33uCRo51', 'trangntksb02397', 'trangntksb02397@fpt.edu.vn', '', '2018-11-01 16:43:06', '', 0, 'trangntksb02397');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_chatting`
--
ALTER TABLE `wp_chatting`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_finder_form`
--
ALTER TABLE `wp_finder_form`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_form_skill`
--
ALTER TABLE `wp_form_skill`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_groups`
--
ALTER TABLE `wp_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_major`
--
ALTER TABLE `wp_major`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_members`
--
ALTER TABLE `wp_members`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_request`
--
ALTER TABLE `wp_request`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_semester`
--
ALTER TABLE `wp_semester`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_skill_major`
--
ALTER TABLE `wp_skill_major`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_usermetaData`
--
ALTER TABLE `wp_usermetaData`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_chatting`
--
ALTER TABLE `wp_chatting`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_finder_form`
--
ALTER TABLE `wp_finder_form`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `wp_form_skill`
--
ALTER TABLE `wp_form_skill`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_groups`
--
ALTER TABLE `wp_groups`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_major`
--
ALTER TABLE `wp_major`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_members`
--
ALTER TABLE `wp_members`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=988;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1180;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `wp_request`
--
ALTER TABLE `wp_request`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `wp_semester`
--
ALTER TABLE `wp_semester`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_skill_major`
--
ALTER TABLE `wp_skill_major`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `wp_usermetaData`
--
ALTER TABLE `wp_usermetaData`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=913;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
