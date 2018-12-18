-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2018 at 08:43 AM
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
  `expiry_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `type` int(1) NOT NULL,
  `suppervisor_id` bigint(20) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wp_major`
--

INSERT INTO `wp_major` (`ID`, `code`, `name`) VALUES
(1, 'IS', 'Information system');

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
(33, 'active_plugins', 'a:2:{i:0;s:27:\"js_composer/js_composer.php\";i:1;s:35:\"zozothemes-core/zozothemes-core.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
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
(111, 'cron', 'a:5:{i:1539760138;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1539785338;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1539785378;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1539785926;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(112, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539439981;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(116, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1539743834;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(121, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1539743837;s:7:\"checked\";a:2:{s:11:\"metal-child\";s:5:\"1.0.1\";s:5:\"metal\";s:5:\"1.0.3\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(122, '_site_transient_timeout_browser_fdb6c4ce909c81a64e24489dbaee3a65', '1540044548', 'no'),
(123, '_site_transient_browser_fdb6c4ce909c81a64e24489dbaee3a65', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"69.0.3497.100\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(124, 'can_compress_scripts', '1', 'no'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(143, 'vc_version', '5.4.5', 'yes'),
(144, 'widget_zozo_tweets-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(145, 'current_theme', 'Metal Child', 'yes'),
(146, 'theme_mods_metal-child', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:12:\"primary-menu\";i:2;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539449207;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}}}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
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
(159, 'zozo_options', 'a:253:{s:24:\"zozo_disable_page_loader\";b:0;s:22:\"zozo_enable_responsive\";b:1;s:20:\"zozo_enable_rtl_mode\";b:0;s:23:\"zozo_enable_breadcrumbs\";b:1;s:22:\"zozo_disable_opengraph\";b:0;s:9:\"zozo_logo\";a:3:{s:3:\"url\";s:71:\"http://localhost/studentservice/wp-content/themes/metal/images/logo.png\";s:5:\"width\";s:3:\"197\";s:6:\"height\";s:2:\"86\";}s:19:\"zozo_logo_maxheight\";s:3:\"100\";s:16:\"zozo_sticky_logo\";a:3:{s:3:\"url\";s:78:\"http://localhost/studentservice/wp-content/themes/metal/images/sticky-logo.png\";s:5:\"width\";s:3:\"197\";s:6:\"height\";s:2:\"86\";}s:18:\"zozo_mailchimp_api\";s:0:\"\";s:15:\"zozo_custom_css\";s:0:\"\";s:23:\"zozo_enable_maintenance\";s:1:\"0\";s:26:\"zozo_maintenance_mode_page\";s:0:\"\";s:23:\"zozo_enable_coming_soon\";s:1:\"0\";s:21:\"zozo_coming_soon_page\";s:0:\"\";s:17:\"zozo_theme_layout\";s:9:\"fullwidth\";s:11:\"zozo_layout\";s:7:\"one-col\";s:25:\"zozo_fullwidth_site_width\";i:1200;s:21:\"zozo_boxed_site_width\";i:1200;s:18:\"zozo_header_layout\";s:9:\"fullwidth\";s:26:\"zozo_enable_header_top_bar\";b:1;s:18:\"zozo_sticky_header\";b:1;s:16:\"zozo_header_skin\";s:5:\"light\";s:24:\"zozo_header_transparency\";s:14:\"no-transparent\";s:23:\"zozo_header_search_type\";s:1:\"0\";s:16:\"zozo_header_type\";s:8:\"header-1\";s:21:\"zozo_header_menu_skin\";s:5:\"light\";s:27:\"zozo_header_elements_config\";a:2:{s:7:\"enabled\";a:4:{s:12:\"primary-menu\";s:12:\"Primary Menu\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";}s:8:\"disabled\";a:4:{s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:25:\"zozo_header_elements_text\";s:11:\"Header Text\";s:27:\"zozo_header_logo_bar_config\";a:2:{s:7:\"enabled\";a:2:{s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:6:{s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:25:\"zozo_header_logo_bar_text\";s:20:\"Header Logo Bar Text\";s:23:\"zozo_header_left_config\";a:2:{s:7:\"enabled\";a:1:{s:12:\"primary-menu\";s:12:\"Primary Menu\";}s:8:\"disabled\";a:7:{s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:21:\"zozo_header_left_text\";s:16:\"Header Left Text\";s:24:\"zozo_header_right_config\";a:2:{s:7:\"enabled\";a:3:{s:12:\"social-icons\";s:12:\"Social Icons\";s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:5:{s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"primary-menu\";s:12:\"Primary Menu\";s:12:\"contact-info\";s:12:\"Contact Info\";s:12:\"address-info\";s:21:\"Address / Store Hours\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:22:\"zozo_header_right_text\";s:17:\"Header Right Text\";s:28:\"zozo_header_right_alt_config\";a:2:{s:7:\"enabled\";a:2:{s:9:\"cart-icon\";s:4:\"Cart\";s:11:\"search-icon\";s:6:\"Search\";}s:8:\"disabled\";a:3:{s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:12:\"social-icons\";s:12:\"Social Icons\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:26:\"zozo_header_right_alt_text\";s:17:\"Header Right Text\";s:20:\"zozo_slider_position\";s:5:\"below\";s:27:\"zozo_header_toggle_position\";s:4:\"left\";s:22:\"zozo_header_side_width\";s:5:\"280px\";s:24:\"zozo_header_top_bar_left\";a:2:{s:7:\"enabled\";a:1:{s:12:\"contact-info\";s:12:\"Contact Info\";}s:8:\"disabled\";a:7:{s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";s:12:\"social-icons\";s:12:\"Social Icons\";s:11:\"search-icon\";s:6:\"Search\";s:9:\"cart-icon\";s:4:\"Cart\";s:8:\"top-menu\";s:8:\"Top Menu\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:11:\"welcome-msg\";s:15:\"Welcome Message\";}}s:29:\"zozo_header_top_bar_left_text\";s:17:\"Top Bar Left Text\";s:25:\"zozo_header_top_bar_right\";a:2:{s:7:\"enabled\";a:1:{s:12:\"social-icons\";s:12:\"Social Icons\";}s:8:\"disabled\";a:7:{s:12:\"contact-info\";s:12:\"Contact Info\";s:11:\"search-icon\";s:6:\"Search\";s:9:\"cart-icon\";s:4:\"Cart\";s:8:\"top-menu\";s:8:\"Top Menu\";s:14:\"secondary-menu\";s:14:\"Secondary Menu\";s:11:\"welcome-msg\";s:15:\"Welcome Message\";s:14:\"text-shortcode\";s:14:\"Text/Shortcode\";}}s:30:\"zozo_header_top_bar_right_text\";s:18:\"Top Bar Right Text\";s:16:\"zozo_welcome_msg\";s:16:\"Welcome to Metal\";s:17:\"zozo_header_phone\";s:15:\"+12 123 456 789\";s:17:\"zozo_header_email\";s:17:\"info@yoursite.com\";s:19:\"zozo_header_address\";s:78:\"<strong>No. 12, Ribon Building, </strong><span>Walse street, Australia.</span>\";s:26:\"zozo_header_business_hours\";s:81:\"<strong>Monday-Friday: 9am to 5pm </strong><span>Saturday / Sunday: Closed</span>\";s:23:\"zozo_enable_sliding_bar\";b:0;s:24:\"zozo_disable_sliding_bar\";b:1;s:24:\"zozo_sliding_bar_columns\";s:1:\"3\";s:14:\"zozo_menu_type\";s:8:\"megamenu\";s:19:\"zozo_menu_separator\";b:0;s:24:\"zozo_dropdown_menu_width\";a:2:{s:5:\"width\";i:200;s:5:\"units\";s:2:\"px\";}s:16:\"zozo_menu_height\";a:2:{s:6:\"height\";i:70;s:5:\"units\";s:2:\"px\";}s:23:\"zozo_sticky_menu_height\";a:2:{s:6:\"height\";i:60;s:5:\"units\";s:2:\"px\";}s:20:\"zozo_logo_bar_height\";a:2:{s:6:\"height\";i:76;s:5:\"units\";s:2:\"px\";}s:20:\"zozo_menu_height_alt\";a:2:{s:6:\"height\";i:60;s:5:\"units\";s:2:\"px\";}s:27:\"zozo_sticky_menu_height_alt\";a:2:{s:6:\"height\";i:60;s:5:\"units\";s:2:\"px\";}s:26:\"zozo_enable_secondary_menu\";b:0;s:28:\"zozo_secondary_menu_position\";s:5:\"right\";s:11:\"mobile_logo\";a:3:{s:3:\"url\";s:0:\"\";s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}s:20:\"sticky_mobile_header\";b:1;s:20:\"mobile_header_layout\";s:9:\"left-logo\";s:15:\"mobile_top_text\";s:0:\"\";s:18:\"mobile_show_search\";s:1:\"0\";s:23:\"mobile_show_translation\";s:1:\"0\";s:16:\"mobile_show_cart\";s:1:\"0\";s:19:\"zozo_copyright_text\";s:45:\"&copy; Copyright [year]. All Rights Reserved.\";s:26:\"zozo_footer_widgets_enable\";b:1;s:23:\"zozo_enable_back_to_top\";b:1;s:25:\"zozo_back_to_top_position\";s:13:\"copyright_bar\";s:23:\"zozo_enable_footer_menu\";b:0;s:27:\"zozo_footer_copyright_align\";s:4:\"left\";s:16:\"zozo_footer_skin\";s:5:\"light\";s:17:\"zozo_footer_style\";s:7:\"default\";s:16:\"zozo_footer_type\";s:8:\"footer-1\";s:14:\"zozo_body_font\";a:7:{s:5:\"color\";s:7:\"#333333\";s:9:\"font-size\";s:4:\"14px\";s:11:\"font-family\";s:5:\"Arimo\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"25px\";}s:19:\"zozo_h1_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"48px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"62px\";}s:19:\"zozo_h2_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"40px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"52px\";}s:19:\"zozo_h3_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"32px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"42px\";}s:19:\"zozo_h4_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"24px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"31px\";}s:19:\"zozo_h5_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"18px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"23px\";}s:19:\"zozo_h6_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"21px\";}s:25:\"zozo_top_menu_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"12px\";s:11:\"font-family\";s:5:\"Arimo\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"12px\";}s:21:\"zozo_menu_font_styles\";a:6:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"11px\";s:11:\"font-family\";s:5:\"Arimo\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";}s:24:\"zozo_submenu_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"14px\";s:11:\"font-family\";s:5:\"Arimo\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"20px\";}s:28:\"zozo_single_post_title_fonts\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"32px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"700\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"35px\";}s:27:\"zozo_post_title_font_styles\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"26px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:11:\"line-height\";s:4:\"41px\";}s:23:\"zozo_widget_title_fonts\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"42px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";}s:22:\"zozo_widget_text_fonts\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"13px\";s:11:\"line-height\";s:4:\"25px\";s:11:\"font-family\";s:5:\"Arimo\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";}s:30:\"zozo_footer_widget_title_fonts\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"42px\";s:11:\"font-family\";s:6:\"Oswald\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";}s:29:\"zozo_footer_widget_text_fonts\";a:7:{s:5:\"color\";s:0:\"\";s:9:\"font-size\";s:4:\"13px\";s:11:\"line-height\";s:4:\"25px\";s:11:\"font-family\";s:5:\"Arimo\";s:6:\"google\";b:1;s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";}s:17:\"zozo_color_scheme\";s:10:\"yellow.css\";s:15:\"zozo_theme_skin\";s:5:\"light\";s:22:\"zozo_custom_color_skin\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:15:\"zozo_link_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:20:\"zozo_header_bg_image\";s:0:\"\";s:20:\"zozo_sticky_bg_image\";s:0:\"\";s:32:\"zozo_header_top_background_color\";s:0:\"\";s:29:\"zozo_sliding_background_color\";s:0:\"\";s:20:\"zozo_top_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:21:\"zozo_main_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:24:\"zozo_submenu_show_border\";b:1;s:24:\"zozo_main_submenu_border\";a:6:{s:12:\"border-color\";s:0:\"\";s:12:\"border-style\";s:5:\"solid\";s:10:\"border-top\";s:3:\"3px\";s:12:\"border-right\";s:3:\"0px\";s:13:\"border-bottom\";s:3:\"0px\";s:11:\"border-left\";s:3:\"0px\";}s:21:\"zozo_submenu_bg_color\";s:7:\"#ffffff\";s:20:\"zozo_sub_menu_hcolor\";a:1:{s:5:\"hover\";s:0:\"\";}s:22:\"zozo_submenu_hbg_color\";s:0:\"\";s:20:\"zozo_social_bg_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:22:\"zozo_social_icon_color\";a:2:{s:7:\"regular\";s:0:\"\";s:5:\"hover\";s:0:\"\";}s:21:\"zozo_social_icon_type\";s:11:\"transparent\";s:18:\"zozo_facebook_link\";s:0:\"\";s:17:\"zozo_twitter_link\";s:0:\"\";s:18:\"zozo_linkedin_link\";s:0:\"\";s:19:\"zozo_pinterest_link\";s:0:\"\";s:20:\"zozo_googleplus_link\";s:0:\"\";s:17:\"zozo_youtube_link\";s:0:\"\";s:13:\"zozo_rss_link\";s:0:\"\";s:16:\"zozo_tumblr_link\";s:0:\"\";s:16:\"zozo_reddit_link\";s:0:\"\";s:18:\"zozo_dribbble_link\";s:0:\"\";s:14:\"zozo_digg_link\";s:0:\"\";s:16:\"zozo_flickr_link\";s:0:\"\";s:19:\"zozo_instagram_link\";s:0:\"\";s:15:\"zozo_vimeo_link\";s:0:\"\";s:15:\"zozo_skype_link\";s:0:\"\";s:17:\"zozo_blogger_link\";s:0:\"\";s:15:\"zozo_yahoo_link\";s:0:\"\";s:28:\"zozo_portfolio_archive_count\";s:2:\"10\";s:29:\"zozo_portfolio_archive_layout\";s:4:\"grid\";s:30:\"zozo_portfolio_archive_columns\";s:1:\"4\";s:29:\"zozo_portfolio_archive_gutter\";s:2:\"30\";s:24:\"zozo_portfolio_prev_next\";b:1;s:29:\"zozo_portfolio_related_slider\";b:1;s:28:\"zozo_portfolio_related_title\";s:0:\"\";s:21:\"zozo_portfolio_citems\";s:0:\"\";s:28:\"zozo_portfolio_citems_scroll\";s:0:\"\";s:22:\"zozo_portfolio_ctablet\";s:0:\"\";s:27:\"zozo_portfolio_cmobile_land\";s:0:\"\";s:22:\"zozo_portfolio_cmobile\";s:0:\"\";s:22:\"zozo_portfolio_cmargin\";s:2:\"20\";s:24:\"zozo_portfolio_cautoplay\";b:1;s:23:\"zozo_portfolio_ctimeout\";s:4:\"5000\";s:20:\"zozo_portfolio_cloop\";b:0;s:26:\"zozo_portfolio_cpagination\";b:1;s:26:\"zozo_portfolio_cnavigation\";b:0;s:26:\"zozo_service_archive_count\";s:2:\"10\";s:28:\"zozo_service_archive_columns\";s:1:\"4\";s:19:\"zozo_service_citems\";s:0:\"\";s:26:\"zozo_service_citems_scroll\";s:0:\"\";s:20:\"zozo_service_ctablet\";s:0:\"\";s:25:\"zozo_service_cmobile_land\";s:0:\"\";s:20:\"zozo_service_cmobile\";s:0:\"\";s:20:\"zozo_service_cmargin\";s:0:\"\";s:22:\"zozo_service_cautoplay\";b:1;s:21:\"zozo_service_ctimeout\";s:4:\"5000\";s:18:\"zozo_service_cloop\";b:0;s:24:\"zozo_service_cpagination\";b:1;s:24:\"zozo_service_cnavigation\";b:0;s:28:\"zozo_disable_blog_pagination\";b:0;s:24:\"zozo_blog_read_more_text\";s:0:\"\";s:30:\"zozo_blog_excerpt_length_large\";s:2:\"80\";s:29:\"zozo_blog_excerpt_length_grid\";s:2:\"40\";s:28:\"zozo_blog_slideshow_autoplay\";b:1;s:27:\"zozo_blog_slideshow_timeout\";s:4:\"5000\";s:21:\"zozo_blog_date_format\";s:5:\"d.m.Y\";s:26:\"zozo_blog_post_meta_author\";b:0;s:24:\"zozo_blog_post_meta_date\";b:0;s:30:\"zozo_blog_post_meta_categories\";b:0;s:28:\"zozo_blog_post_meta_comments\";b:0;s:19:\"zozo_blog_read_more\";b:0;s:24:\"zozo_blog_archive_layout\";s:7:\"one-col\";s:22:\"zozo_archive_blog_type\";s:5:\"large\";s:30:\"zozo_archive_blog_grid_columns\";s:3:\"two\";s:33:\"zozo_show_archive_featured_slider\";b:0;s:24:\"zozo_blog_page_title_bar\";b:1;s:15:\"zozo_blog_title\";s:0:\"\";s:16:\"zozo_blog_slogan\";s:0:\"\";s:16:\"zozo_blog_layout\";s:7:\"one-col\";s:14:\"zozo_blog_type\";s:5:\"large\";s:22:\"zozo_blog_grid_columns\";s:3:\"two\";s:30:\"zozo_show_blog_featured_slider\";b:0;s:23:\"zozo_single_post_layout\";s:7:\"one-col\";s:24:\"zozo_blog_social_sharing\";b:1;s:21:\"zozo_blog_author_info\";b:1;s:18:\"zozo_blog_comments\";b:1;s:23:\"zozo_show_related_posts\";b:1;s:23:\"zozo_related_blog_items\";s:1:\"3\";s:30:\"zozo_related_blog_items_scroll\";s:1:\"1\";s:26:\"zozo_related_blog_autoplay\";b:1;s:25:\"zozo_related_blog_timeout\";s:4:\"5000\";s:22:\"zozo_related_blog_loop\";b:0;s:24:\"zozo_related_blog_margin\";s:2:\"30\";s:24:\"zozo_related_blog_tablet\";s:1:\"3\";s:27:\"zozo_related_blog_landscape\";s:1:\"2\";s:26:\"zozo_related_blog_portrait\";s:1:\"1\";s:22:\"zozo_related_blog_dots\";b:0;s:21:\"zozo_related_blog_nav\";b:1;s:19:\"zozo_blog_prev_next\";b:1;s:25:\"zozo_single_blog_carousel\";b:0;s:23:\"zozo_single_blog_citems\";s:1:\"3\";s:30:\"zozo_single_blog_citems_scroll\";s:1:\"1\";s:26:\"zozo_single_blog_cautoplay\";b:1;s:25:\"zozo_single_blog_ctimeout\";s:4:\"5000\";s:22:\"zozo_single_blog_cloop\";b:0;s:24:\"zozo_single_blog_cmargin\";s:0:\"\";s:24:\"zozo_single_blog_ctablet\";s:1:\"3\";s:28:\"zozo_single_blog_cmlandscape\";s:1:\"2\";s:27:\"zozo_single_blog_cmportrait\";s:1:\"1\";s:22:\"zozo_single_blog_cdots\";b:0;s:21:\"zozo_single_blog_cnav\";b:1;s:25:\"zozo_featured_slider_type\";s:12:\"below_header\";s:25:\"zozo_featured_posts_limit\";s:1:\"6\";s:27:\"zozo_featured_slider_citems\";s:1:\"3\";s:34:\"zozo_featured_slider_citems_scroll\";s:1:\"1\";s:30:\"zozo_featured_slider_cautoplay\";b:1;s:29:\"zozo_featured_slider_ctimeout\";s:4:\"5000\";s:26:\"zozo_featured_slider_cloop\";b:0;s:28:\"zozo_featured_slider_cmargin\";s:0:\"\";s:28:\"zozo_featured_slider_ctablet\";s:1:\"3\";s:32:\"zozo_featured_slider_cmlandscape\";s:1:\"2\";s:31:\"zozo_featured_slider_cmportrait\";s:1:\"1\";s:26:\"zozo_featured_slider_cdots\";b:0;s:25:\"zozo_featured_slider_cnav\";b:1;s:21:\"zozo_search_page_type\";s:4:\"grid\";s:24:\"zozo_search_grid_columns\";s:3:\"two\";s:27:\"zozo_search_results_content\";s:4:\"both\";s:21:\"zozo_sharing_facebook\";b:1;s:20:\"zozo_sharing_twitter\";b:1;s:21:\"zozo_sharing_linkedin\";b:1;s:23:\"zozo_sharing_googleplus\";b:1;s:22:\"zozo_sharing_pinterest\";b:0;s:19:\"zozo_sharing_tumblr\";b:0;s:19:\"zozo_sharing_reddit\";b:0;s:17:\"zozo_sharing_digg\";b:0;s:18:\"zozo_sharing_email\";b:1;s:11:\"cpt_disable\";a:4:{s:14:\"zozo_portfolio\";s:1:\"0\";s:13:\"zozo_services\";s:1:\"0\";s:16:\"zozo_testimonial\";s:1:\"0\";s:9:\"zozo_team\";s:1:\"0\";}s:14:\"portfolio_slug\";s:9:\"portfolio\";s:25:\"portfolio_categories_slug\";s:20:\"portfolio-categories\";s:19:\"portfolio_tags_slug\";s:14:\"portfolio-tags\";s:13:\"services_slug\";s:8:\"services\";s:23:\"service_categories_slug\";s:18:\"service-categories\";s:28:\"zozo_woo_enable_catalog_mode\";b:0;s:23:\"zozo_woo_archive_layout\";s:7:\"one-col\";s:22:\"zozo_woo_single_layout\";s:13:\"two-col-right\";s:27:\"zozo_loop_products_per_page\";s:2:\"12\";s:22:\"zozo_loop_shop_columns\";s:1:\"4\";s:27:\"zozo_related_products_count\";s:1:\"3\";s:22:\"zozo_woo_shop_ordering\";b:1;s:23:\"zozo_woo_social_sharing\";b:1;s:27:\"zozo_remove_scripts_version\";b:1;s:15:\"zozo_minify_css\";b:1;s:14:\"zozo_minify_js\";b:1;}', 'yes'),
(160, 'zozo_options-transients', 'a:2:{s:14:\"changed_values\";a:0:{}s:9:\"last_save\";i:1539440234;}', 'yes'),
(164, 'theme_mods_metal', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539449720;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"primary\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"secondary\";a:0:{}s:14:\"secondary-menu\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:15:\"footer-widget-4\";a:0:{}}}}', 'yes'),
(167, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(288, '_site_transient_timeout_theme_roots', '1539745636', 'no'),
(289, '_site_transient_theme_roots', 'a:2:{s:11:\"metal-child\";s:7:\"/themes\";s:5:\"metal\";s:7:\"/themes\";}', 'no'),
(290, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1539743840;s:7:\"checked\";a:2:{s:27:\"js_composer/js_composer.php\";s:5:\"5.4.5\";s:35:\"zozothemes-core/zozothemes-core.php\";s:5:\"1.0.0\";}s:8:\"response\";a:1:{s:27:\"js_composer/js_composer.php\";O:8:\"stdClass\":5:{s:4:\"slug\";s:11:\"js_composer\";s:11:\"new_version\";s:5:\"5.5.5\";s:3:\"url\";s:0:\"\";s:7:\"package\";b:0;s:4:\"name\";s:21:\"WPBakery Page Builder\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}', 'no');

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
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 3, '_wp_trash_meta_status', 'draft'),
(4, 3, '_wp_trash_meta_time', '1539439783'),
(5, 3, '_wp_desired_post_slug', 'privacy-policy'),
(6, 2, '_wp_trash_meta_status', 'publish'),
(7, 2, '_wp_trash_meta_time', '1539439786'),
(8, 2, '_wp_desired_post_slug', 'sample-page'),
(9, 7, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(10, 7, '_edit_last', '1'),
(11, 7, '_edit_lock', '1539451675:1'),
(12, 7, '_wp_page_template', 'index.php'),
(13, 7, 'zozo_page_top_padding', ''),
(14, 7, 'zozo_page_bottom_padding', ''),
(15, 7, 'zozo_slider_position', 'default'),
(16, 7, 'zozo_revolutionslider', ''),
(17, 7, 'zozo_show_header', 'yes'),
(18, 7, 'zozo_show_header_top_bar', 'default'),
(19, 7, 'zozo_show_header_sliding_bar', 'default'),
(20, 7, 'zozo_header_layout', 'default'),
(21, 7, 'zozo_header_type', 'default'),
(22, 7, 'zozo_header_toggle_position', 'default'),
(23, 7, 'zozo_header_transparency', 'default'),
(24, 7, 'zozo_header_skin', 'dark'),
(25, 7, 'zozo_header_menu_skin', 'default'),
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
(124, 10, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(125, 11, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(126, 12, '_wp_trash_meta_status', 'publish'),
(127, 12, '_wp_trash_meta_time', '1539448071'),
(128, 1, '_edit_lock', '1539448948:1'),
(129, 13, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(130, 13, '_edit_last', '1'),
(131, 13, '_edit_lock', '1539564652:1'),
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
(226, 15, '_edit_lock', '1539451710:1'),
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
(321, 17, '_edit_lock', '1539621243:1'),
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
(334, 17, 'zozo_header_skin', 'dark'),
(335, 17, 'zozo_header_menu_skin', 'default'),
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
(416, 19, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(417, 19, '_menu_item_type', 'post_type'),
(418, 19, '_menu_item_menu_item_parent', '0'),
(419, 19, '_menu_item_object_id', '17'),
(420, 19, '_menu_item_object', 'page'),
(421, 19, '_menu_item_target', ''),
(422, 19, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(423, 19, '_menu_item_xfn', ''),
(424, 19, '_menu_item_url', ''),
(426, 19, '_menu_item_zozo_megamenu_menutype', 'page'),
(427, 19, '_menu_item_zozo_megamenu_status', ''),
(428, 19, '_menu_item_zozo_megamenu_fullwidth', ''),
(429, 19, '_menu_item_zozo_megamenu_columns', 'auto'),
(430, 19, '_menu_item_zozo_megamenu_title', ''),
(431, 19, '_menu_item_zozo_megamenu_link', ''),
(432, 19, '_menu_item_zozo_megamenu_widgetarea', '0'),
(433, 19, '_menu_item_zozo_megamenu_content', ''),
(434, 19, '_menu_item_zozo_megamenu_icon', ''),
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
(454, 21, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(455, 21, '_menu_item_type', 'post_type'),
(456, 21, '_menu_item_menu_item_parent', '0'),
(457, 21, '_menu_item_object_id', '15'),
(458, 21, '_menu_item_object', 'page'),
(459, 21, '_menu_item_target', ''),
(460, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(461, 21, '_menu_item_xfn', ''),
(462, 21, '_menu_item_url', ''),
(464, 21, '_menu_item_zozo_megamenu_menutype', 'page'),
(465, 21, '_menu_item_zozo_megamenu_status', ''),
(466, 21, '_menu_item_zozo_megamenu_fullwidth', ''),
(467, 21, '_menu_item_zozo_megamenu_columns', 'auto'),
(468, 21, '_menu_item_zozo_megamenu_title', ''),
(469, 21, '_menu_item_zozo_megamenu_link', ''),
(470, 21, '_menu_item_zozo_megamenu_widgetarea', '0'),
(471, 21, '_menu_item_zozo_megamenu_content', ''),
(472, 21, '_menu_item_zozo_megamenu_icon', ''),
(473, 22, '_vc_post_settings', 'a:1:{s:10:\"vc_grid_id\";a:0:{}}'),
(474, 22, '_edit_lock', '1539583144:1'),
(475, 22, '_edit_last', '1'),
(476, 22, '_wp_page_template', 'default'),
(477, 22, 'zozo_page_top_padding', ''),
(478, 22, 'zozo_page_bottom_padding', ''),
(479, 22, 'zozo_slider_position', 'default'),
(480, 22, 'zozo_revolutionslider', ''),
(481, 22, 'zozo_show_header', 'yes'),
(482, 22, 'zozo_show_header_top_bar', 'default'),
(483, 22, 'zozo_show_header_sliding_bar', 'default'),
(484, 22, 'zozo_header_layout', 'default'),
(485, 22, 'zozo_header_type', 'default'),
(486, 22, 'zozo_header_toggle_position', 'default'),
(487, 22, 'zozo_header_transparency', 'default'),
(488, 22, 'zozo_header_skin', 'default'),
(489, 22, 'zozo_header_menu_skin', 'default'),
(490, 22, 'zozo_custom_nav_menu', 'default'),
(491, 22, 'zozo_custom_mobile_menu', 'default'),
(492, 22, 'zozo_header_bg_image', ''),
(493, 22, 'zozo_header_bg_image_attach_id', ''),
(494, 22, 'zozo_header_bg_color', ''),
(495, 22, 'zozo_header_bg_opacity', '0'),
(496, 22, 'zozo_header_bg_repeat', ''),
(497, 22, 'zozo_header_bg_attachment', ''),
(498, 22, 'zozo_header_bg_postion', ''),
(499, 22, 'zozo_header_bg_full', '0'),
(500, 22, 'zozo_show_footer_widgets', 'default'),
(501, 22, 'zozo_show_footer_menu', 'default'),
(502, 22, 'zozo_primary_sidebar', '0'),
(503, 22, 'zozo_secondary_sidebar', '0'),
(504, 22, 'zozo_hide_page_title_bar', 'no'),
(505, 22, 'zozo_hide_page_title', 'no'),
(506, 22, 'zozo_page_title_type', 'default'),
(507, 22, 'zozo_page_title_skin', 'default'),
(508, 22, 'zozo_page_title_align', 'default'),
(509, 22, 'zozo_display_breadcrumbs', 'default'),
(510, 22, 'zozo_show_page_slogan', 'yes'),
(511, 22, 'zozo_page_slogan', ''),
(512, 22, 'zozo_page_title_height', ''),
(513, 22, 'zozo_page_title_mobile_height', ''),
(514, 22, 'zozo_page_title_bar_title_color', ''),
(515, 22, 'zozo_page_title_bar_slogan_color', ''),
(516, 22, 'zozo_page_breadcrumbs_color', ''),
(517, 22, 'zozo_page_title_bar_border_color', ''),
(518, 22, 'zozo_page_title_bar_bg', ''),
(519, 22, 'zozo_page_title_bar_bg_attach_id', ''),
(520, 22, 'zozo_page_title_bar_bg_color', ''),
(521, 22, 'zozo_page_title_bar_bg_repeat', 'repeat'),
(522, 22, 'zozo_page_title_bar_bg_position', 'left top'),
(523, 22, 'zozo_page_title_bar_bg_parallax', 'no'),
(524, 22, 'zozo_page_title_bar_bg_full', '0'),
(525, 22, 'zozo_page_title_video_bg', '0'),
(526, 22, 'zozo_page_title_video_id', ''),
(527, 22, 'zozo_page_bg_image', ''),
(528, 22, 'zozo_page_bg_image_attach_id', ''),
(529, 22, 'zozo_page_bg_repeat', ''),
(530, 22, 'zozo_page_bg_attachment', ''),
(531, 22, 'zozo_page_bg_position', ''),
(532, 22, 'zozo_page_bg_color', ''),
(533, 22, 'zozo_page_bg_opacity', '0'),
(534, 22, 'zozo_page_bg_full', '0'),
(535, 22, 'zozo_body_bg_image', ''),
(536, 22, 'zozo_body_bg_image_attach_id', ''),
(537, 22, 'zozo_body_bg_repeat', ''),
(538, 22, 'zozo_body_bg_attachment', ''),
(539, 22, 'zozo_body_bg_position', ''),
(540, 22, 'zozo_body_bg_color', ''),
(541, 22, 'zozo_body_bg_opacity', '0'),
(542, 22, 'zozo_body_bg_full', '0'),
(543, 22, 'zozo_section_header_status', 'show'),
(544, 22, 'zozo_section_title', ''),
(545, 22, 'zozo_section_slogan', ''),
(546, 22, 'zozo_section_padding_top', ''),
(547, 22, 'zozo_section_padding_bottom', ''),
(548, 22, 'zozo_section_header_padding', ''),
(549, 22, 'zozo_section_title_color', ''),
(550, 22, 'zozo_section_slogan_color', ''),
(551, 22, 'zozo_section_text_color', ''),
(552, 22, 'zozo_section_content_heading_color', ''),
(553, 22, 'zozo_section_bg_color', ''),
(554, 22, 'zozo_parallax_status', 'no'),
(555, 22, 'zozo_parallax_bg_image', ''),
(556, 22, 'zozo_parallax_bg_image_attach_id', ''),
(557, 22, 'zozo_parallax_bg_repeat', ''),
(558, 22, 'zozo_parallax_bg_attachment', ''),
(559, 22, 'zozo_parallax_bg_postion', ''),
(560, 22, 'zozo_parallax_bg_size', ''),
(561, 22, 'zozo_parallax_bg_overlay', 'no'),
(562, 22, 'zozo_overlay_pattern_status', 'no'),
(563, 22, 'zozo_section_overlay_color', ''),
(564, 22, 'zozo_overlay_color_opacity', '0'),
(565, 22, 'zozo_parallax_additional_sections', 'a:1:{i:0;s:2:\"-1\";}'),
(566, 22, 'zozo_parallax_additional_sections_order', ''),
(567, 22, '_wpb_vc_js_status', 'false'),
(568, 22, '_wp_trash_meta_status', 'publish'),
(569, 22, '_wp_trash_meta_time', '1539613955'),
(570, 22, '_wp_desired_post_slug', 'logout');

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
(2, 1, '2018-10-13 14:08:58', '2018-10-13 14:08:58', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/studentservice/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2018-10-13 14:09:46', '2018-10-13 14:09:46', '', 0, 'http://localhost/studentservice/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-10-13 14:08:58', '2018-10-13 14:08:58', '<h2>Who we are</h2><p>Our website address is: http://localhost/studentservice.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'trash', 'closed', 'open', '', 'privacy-policy__trashed', '', '', '2018-10-13 14:09:43', '2018-10-13 14:09:43', '', 0, 'http://localhost/studentservice/?page_id=3', 0, 'page', '', 0),
(4, 1, '2018-10-13 14:09:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-10-13 14:09:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=4', 0, 'post', '', 0),
(5, 1, '2018-10-13 14:09:43', '2018-10-13 14:09:43', '<h2>Who we are</h2><p>Our website address is: http://localhost/studentservice.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '3-revision-v1', '', '', '2018-10-13 14:09:43', '2018-10-13 14:09:43', '', 3, 'http://localhost/studentservice/index.php/2018/10/13/3-revision-v1/', 0, 'revision', '', 0),
(6, 1, '2018-10-13 14:09:46', '2018-10-13 14:09:46', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/studentservice/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-10-13 14:09:46', '2018-10-13 14:09:46', '', 2, 'http://localhost/studentservice/index.php/2018/10/13/2-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-10-13 16:55:53', '2018-10-13 16:55:53', '', 0, 'http://localhost/studentservice/?page_id=7', 0, 'page', '', 0),
(8, 1, '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 'Home', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2018-10-13 14:20:22', '2018-10-13 14:20:22', '', 7, 'http://localhost/studentservice/index.php/2018/10/13/7-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2018-10-13 14:23:25', '2018-10-13 14:23:25', ' ', '', '', 'publish', 'closed', 'closed', '', '9', '', '', '2018-10-13 17:33:02', '2018-10-13 17:33:02', '', 0, 'http://localhost/studentservice/?p=9', 1, 'nav_menu_item', '', 0),
(10, 1, '2018-10-13 16:25:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-13 16:25:44', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?page_id=10', 0, 'page', '', 0),
(11, 1, '2018-10-13 16:25:58', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-10-13 16:25:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?page_id=11', 0, 'page', '', 0),
(12, 1, '2018-10-13 16:27:51', '2018-10-13 16:27:51', '{\n    \"show_on_front\": {\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-13 16:27:51\"\n    },\n    \"page_on_front\": {\n        \"value\": \"7\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-13 16:27:51\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '6f6f8e82-56a8-4abf-9be8-d4a5e1a7e22c', '', '', '2018-10-13 16:27:51', '2018-10-13 16:27:51', '', 0, 'http://localhost/studentservice/index.php/2018/10/13/6f6f8e82-56a8-4abf-9be8-d4a5e1a7e22c/', 0, 'customize_changeset', '', 0),
(13, 1, '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 'callback', '', 'publish', 'closed', 'closed', '', 'callback', '', '', '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 0, 'http://localhost/studentservice/?page_id=13', 0, 'page', '', 0),
(14, 1, '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 'callback', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2018-10-13 16:57:11', '2018-10-13 16:57:11', '', 13, 'http://localhost/studentservice/index.php/2018/10/13/13-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 'login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2018-10-13 17:30:44', '2018-10-13 17:30:44', '', 0, 'http://localhost/studentservice/?page_id=15', 0, 'page', '', 0),
(16, 1, '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 'login', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2018-10-13 16:57:26', '2018-10-13 16:57:26', '', 15, 'http://localhost/studentservice/index.php/2018/10/13/15-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 'profile', '', 'publish', 'closed', 'closed', '', 'profile', '', '', '2018-10-15 14:33:14', '2018-10-15 14:33:14', '', 0, 'http://localhost/studentservice/?page_id=17', 0, 'page', '', 0),
(18, 1, '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 'profile', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-10-13 17:00:35', '2018-10-13 17:00:35', '', 17, 'http://localhost/studentservice/17-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2018-10-13 17:32:14', '2018-10-13 17:32:14', ' ', '', '', 'publish', 'closed', 'closed', '', '19', '', '', '2018-10-13 17:33:02', '2018-10-13 17:33:02', '', 0, 'http://localhost/studentservice/?p=19', 2, 'nav_menu_item', '', 0),
(20, 1, '2018-10-13 17:31:50', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-13 17:31:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/studentservice/?p=20', 1, 'nav_menu_item', '', 0),
(21, 1, '2018-10-13 17:32:14', '2018-10-13 17:32:14', ' ', '', '', 'publish', 'closed', 'closed', '', '21', '', '', '2018-10-13 17:33:02', '2018-10-13 17:33:02', '', 0, 'http://localhost/studentservice/?p=21', 3, 'nav_menu_item', '', 0),
(22, 1, '2018-10-15 05:30:15', '2018-10-15 05:30:15', '', 'Logout', '', 'trash', 'closed', 'closed', '', 'logout__trashed', '', '', '2018-10-15 14:32:35', '2018-10-15 14:32:35', '', 0, 'http://localhost/studentservice/?page_id=22', 0, 'page', '', 0),
(23, 1, '2018-10-15 05:30:15', '2018-10-15 05:30:15', '', 'Logout', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2018-10-15 05:30:15', '2018-10-15 05:30:15', '', 22, 'http://localhost/studentservice/22-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2018-10-15 14:33:18', '2018-10-15 14:33:18', '', 'profile', '', 'inherit', 'closed', 'closed', '', '17-autosave-v1', '', '', '2018-10-15 14:33:18', '2018-10-15 14:33:18', '', 17, 'http://localhost/studentservice/17-autosave-v1/', 0, 'revision', '', 0);

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
(1, 1, 'PRX301', 'Web Development (XML)'),
(2, 1, 'DBW301', 'Data warehouse'),
(3, 1, 'ISC301', 'e-Commerce'),
(4, 1, 'SWD391', 'Software Architecture and Design'),
(5, 1, 'SWM301', 'Software project management');

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
(2, 'My_menu', 'my_menu', 0);

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
(19, 2, 0),
(21, 2, 0);

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
(2, 2, 'nav_menu', '', 0, 3);

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
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,vc_pointers_backend_editor'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_user-settings', 'editor=tinymce'),
(18, 1, 'wp_user-settings-time', '1539439743'),
(19, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:11:{i:0;s:28:\"add-post-type-zozo_portfolio\";i:1;s:27:\"add-post-type-zozo_services\";i:2;s:30:\"add-post-type-zozo_testimonial\";i:3;s:30:\"add-post-type-zozo_team_member\";i:4;s:12:\"add-post_tag\";i:5;s:15:\"add-post_format\";i:6;s:24:\"add-portfolio_categories\";i:7;s:18:\"add-portfolio_tags\";i:8;s:22:\"add-service_categories\";i:9;s:26:\"add-testimonial_categories\";i:10;s:19:\"add-team_categories\";}'),
(23, 1, 'session_tokens', 'a:8:{s:64:\"297aa43fef2f2fb19c47da3a20ee914524fbd0d3708acc8b6178d347aae5f3d8\";a:4:{s:10:\"expiration\";i:1539622596;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539449796;}s:64:\"1a6d260fd326800d38b1ddd913bc5323d2deda323693cc0140466ecec7db6c98\";a:4:{s:10:\"expiration\";i:1539703573;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539530773;}s:64:\"6d6b385d48a948ddeee2d526dad0dd04037e9a076fb0514be881a1e2b7a4413a\";a:4:{s:10:\"expiration\";i:1539711638;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539538838;}s:64:\"c9cc7f85c55277a6c44c484a2493debbbf3644fd0441a6996310640ae63274a0\";a:4:{s:10:\"expiration\";i:1539754030;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539581230;}s:64:\"ef1fac8928df4aa9ce0c0447d4dd0eda6dca09987e7dc964f26054fc8071b13c\";a:4:{s:10:\"expiration\";i:1539761326;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539588526;}s:64:\"4a0659302308fc6eaf3beb932dec7934a41ad9d784a70a912b7caa17b0a0614f\";a:4:{s:10:\"expiration\";i:1539768020;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539595220;}s:64:\"9aa8370e69b574a406a8f697c0b4d45bbae1f36f1ed815d738e2bb746d030c70\";a:4:{s:10:\"expiration\";i:1539768474;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539595674;}s:64:\"b3bcf01478ab678a8b13ca785ab5c705702e638332ca2838154ef03d40a37ce5\";a:4:{s:10:\"expiration\";i:1539768480;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539595680;}}'),
(40, 1, 'nav_menu_recently_edited', '2'),
(193, 14, 'nickname', 'huylvse03982'),
(194, 14, 'first_name', ''),
(195, 14, 'last_name', ''),
(196, 14, 'description', ''),
(197, 14, 'rich_editing', 'true'),
(198, 14, 'syntax_highlighting', 'true'),
(199, 14, 'comment_shortcuts', 'false'),
(200, 14, 'admin_color', 'fresh'),
(201, 14, 'use_ssl', '0'),
(202, 14, 'show_admin_bar_front', 'true'),
(203, 14, 'locale', ''),
(204, 14, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(205, 14, 'wp_user_level', '0'),
(206, 14, 'session_tokens', 'a:5:{s:64:\"447a3b695493db6954268fc9491769e7b1bee1bd7cfe82b3fcfc97553a7b456d\";a:4:{s:10:\"expiration\";i:1540831455;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539621855;}s:64:\"ae9cdbf20c95b852a80fc42486e571b92407f18d0a3b945e455bade654c548f4\";a:4:{s:10:\"expiration\";i:1540881586;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539671986;}s:64:\"bfbaee6795f2ac71f93dc27c59ef5f64a305ffa0bb2d8f7adca1742de8372952\";a:4:{s:10:\"expiration\";i:1540933464;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539723864;}s:64:\"3d1b3bcfa07d9f022eac20932693127901380221737a3d2179147f6f2e1e8436\";a:4:{s:10:\"expiration\";i:1540935957;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539726357;}s:64:\"be89f8e88ff7e23ef01e95a76ed3d8ac4e818f9b5b3550e5903901c5594e3b29\";a:4:{s:10:\"expiration\";i:1540954036;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539744436;}}'),
(207, 15, 'nickname', 'duydt'),
(208, 15, 'first_name', ''),
(209, 15, 'last_name', ''),
(210, 15, 'description', ''),
(211, 15, 'rich_editing', 'true'),
(212, 15, 'syntax_highlighting', 'true'),
(213, 15, 'comment_shortcuts', 'false'),
(214, 15, 'admin_color', 'fresh'),
(215, 15, 'use_ssl', '0'),
(216, 15, 'show_admin_bar_front', 'true'),
(217, 15, 'locale', ''),
(218, 15, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(219, 15, 'wp_user_level', '0'),
(220, 15, 'session_tokens', 'a:1:{s:64:\"c4e366a717b076f706014212d358b75565a5bca44a345ed72a4d9b3e190b3fb1\";a:4:{s:10:\"expiration\";i:1540898293;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36\";s:5:\"login\";i:1539688693;}}');

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
(24, 14, 'username', 'asume sama'),
(25, 14, 'gender', 'male'),
(26, 14, 'address', ''),
(27, 14, 'phone', ''),
(28, 14, 'role', '1'),
(29, 14, 'major', 'Information system'),
(30, 14, 'email', 'huylvse03982@fpt.edu.vn'),
(31, 14, 'biography', ''),
(32, 15, 'username', 'Duy Dao Trong'),
(33, 15, 'gender', 'male'),
(34, 15, 'address', ''),
(35, 15, 'phone', ''),
(36, 15, 'role', '0'),
(37, 15, 'major', ''),
(38, 15, 'email', 'duydt@fpt.edu.vn'),
(39, 15, 'biography', '');

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
(14, 'huylvse03982', '$P$BNFMP0QKgMrs7xTJnynG2AL.k5joAJ1', 'huylvse03982', 'huylvse03982@fpt.edu.vn', '', '2018-10-15 16:44:15', '', 0, 'huylvse03982'),
(15, 'duydt', '$P$BbeLBnRrKmvbAQiYWZzmfkVmp7NvLc/', 'duydt', 'duydt@fpt.edu.vn', '', '2018-10-16 11:18:13', '', 0, 'duydt');

--
-- Indexes for dumped tables
--

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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_form_skill`
--
ALTER TABLE `wp_form_skill`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_groups`
--
ALTER TABLE `wp_groups`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_major`
--
ALTER TABLE `wp_major`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_members`
--
ALTER TABLE `wp_members`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wp_skill_major`
--
ALTER TABLE `wp_skill_major`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `wp_usermetaData`
--
ALTER TABLE `wp_usermetaData`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
