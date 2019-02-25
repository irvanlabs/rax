-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.7.24 - MySQL Community Server (GPL)
-- OS Server:                    Linux
-- HeidiSQL Versi:               9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk voyager
CREATE DATABASE IF NOT EXISTS `voyager` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `voyager`;

-- membuang struktur untuk table voyager.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel voyager.categories: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- membuang struktur untuk table voyager.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.data_rows: ~79 rows (lebih kurang)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
REPLACE INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, NULL, 12),
	(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(61, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(62, 8, 'deadline', 'date', 'Deadline', 1, 1, 1, 1, 1, 1, '{}', 2),
	(63, 8, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 3),
	(64, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(65, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(67, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
	(68, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(81, 15, 'nama_siswa', 'text', 'Nama Siswa', 1, 1, 1, 1, 1, 1, '{}', 2),
	(82, 15, 'nama_project', 'text', 'Nama Project', 1, 1, 1, 1, 1, 1, '{}', 3),
	(84, 15, 'description', 'rich_text_box', 'Deskripsi', 1, 1, 1, 1, 1, 1, '{}', 5),
	(85, 15, 'picture', 'image', 'Gambar', 1, 1, 1, 1, 1, 1, '{}', 6),
	(86, 15, 'repo_url', 'text', 'Repo Url', 1, 1, 1, 1, 1, 1, '{}', 7),
	(88, 15, 'verified', 'select_dropdown', 'Verified', 1, 1, 1, 1, 1, 1, '{"default":"Pending","options":{"Pending":"Pending","Verified":"Verified","Unverified":"Unverified"}}', 9),
	(89, 15, 'created_at', 'timestamp', 'Created', 0, 1, 0, 0, 0, 0, '{}', 10),
	(90, 15, 'updated_at', 'timestamp', 'Updated', 0, 0, 0, 0, 0, 0, '{}', 11),
	(91, 16, 'id_siswa', 'text', 'Id Siswa', 1, 0, 0, 0, 0, 0, '{}', 1),
	(92, 16, 'nama_siswa', 'text', 'Nama Siswa', 1, 1, 1, 1, 1, 1, '{}', 2),
	(93, 16, 'kejuruan', 'select_dropdown', 'Kejuruan', 1, 1, 1, 1, 1, 1, '{}', 3),
	(94, 16, 'jenis_kelamin', 'select_dropdown', 'Jenis Kelamin', 1, 1, 1, 1, 1, 1, '{}', 4),
	(95, 16, 'token', 'text', 'Token', 1, 1, 1, 1, 1, 1, '{}', 5),
	(96, 16, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 6),
	(97, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(99, 13, 'nama_kategori', 'text', 'Nama Kategori', 1, 1, 1, 1, 1, 1, '{}', 2),
	(100, 13, 'kejuruan', 'select_dropdown', 'Kejuruan', 0, 1, 1, 1, 1, 1, '{"options":{"RPL":"RPL","MM":"MM"}}', 5),
	(104, 15, 'project_mm_belongsto_kategori_relationship', 'relationship', 'Kategori', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Kategori","table":"kategori","type":"belongsTo","column":"id","key":"id","label":"nama_kategori","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 12),
	(105, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(106, 20, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
	(107, 20, 'excerpt', 'text_area', 'Excerpt', 0, 1, 1, 1, 1, 1, '{}', 3),
	(108, 20, 'body', 'rich_text_box', 'Body', 1, 1, 1, 1, 1, 1, '{}', 4),
	(109, 20, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true}}', 5),
	(110, 20, 'created_at', 'timestamp', 'Created', 0, 1, 1, 1, 0, 1, '{}', 6),
	(112, 15, 'excerpt', 'text', 'Deskripsi Singkat', 1, 1, 1, 1, 1, 1, '{}', 4),
	(114, 21, 'nama_siswa', 'text', 'Nama Siswa', 1, 1, 1, 1, 1, 1, '{}', 2),
	(115, 21, 'nama_project', 'text', 'Nama Project', 1, 1, 1, 1, 1, 1, '{}', 3),
	(116, 21, 'excerpt', 'text', 'Excerpt', 0, 1, 1, 1, 1, 1, '{}', 4),
	(117, 21, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 5),
	(118, 21, 'picture', 'image', 'Picture', 0, 1, 1, 1, 1, 1, '{}', 6),
	(119, 21, 'repo_url', 'text', 'Repo Url', 1, 1, 1, 1, 1, 1, '{}', 7),
	(121, 21, 'verified', 'select_dropdown', 'Verified', 1, 1, 1, 1, 1, 1, '{"default":"Pending","options":{"Pending":"Pending","Verified":"Verified","Unverified":"Unverified"}}', 9),
	(122, 21, 'created_at', 'timestamp', 'Created', 0, 0, 0, 0, 0, 0, '{}', 10),
	(123, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
	(124, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(126, 21, 'id_project', 'text', 'Id Project', 1, 0, 0, 0, 0, 0, '{}', 1),
	(127, 21, 'repo_password', 'text', 'Repo Password', 1, 1, 1, 0, 0, 0, '{}', 8),
	(128, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- membuang struktur untuk table voyager.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.data_types: ~10 rows (lebih kurang)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
REPLACE INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-12-07 14:40:14', '2018-12-07 14:40:14'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-12-07 14:40:14', '2018-12-07 14:40:14'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-12-07 14:40:14', '2018-12-07 14:40:14'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-12-07 14:40:27', '2018-12-07 14:40:27'),
	(8, 'deadline', 'deadline', 'Deadline', 'Deadline', NULL, 'App\\Deadline', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2019-01-20 10:57:02', '2019-01-20 12:48:22'),
	(13, 'kategori', 'kategori', 'Kategori', 'Category', 'voyager-categories', 'App\\Kategori', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2019-01-20 11:27:11', '2019-01-25 13:57:15'),
	(15, 'project_mm', 'project-mm', 'Project Mm', 'Project Mm', 'voyager-camera', 'App\\ProjectMm', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null}', '2019-01-20 12:09:40', '2019-02-13 04:06:32'),
	(16, 'siswa', 'siswa', 'Siswa', 'Students', 'voyager-study', 'App\\Siswa', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2019-01-20 12:46:35', '2019-01-20 12:46:35'),
	(20, 'posts', 'post', 'Post', 'Posts', 'voyager-news', 'App\\Post', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null}', '2019-01-26 02:59:02', '2019-02-07 02:56:59'),
	(21, 'project_rpl', 'project-rpl', 'Project Rpl', 'Project Rpls', NULL, 'App\\ProjectRpl', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null}', '2019-01-29 12:30:53', '2019-02-07 04:47:46');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- membuang struktur untuk table voyager.deadline
CREATE TABLE IF NOT EXISTS `deadline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deadline` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.deadline: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `deadline` DISABLE KEYS */;
REPLACE INTO `deadline` (`id`, `deadline`, `created_at`, `updated_at`) VALUES
	(1, '2019-02-21', '2019-01-20 10:57:00', '2019-02-11 12:38:06');
/*!40000 ALTER TABLE `deadline` ENABLE KEYS */;

-- membuang struktur untuk table voyager.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kejuruan` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_kategori` (`nama_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.kategori: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
REPLACE INTO `kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`, `kejuruan`) VALUES
	(1, 'WEB', '2019-01-20 11:27:32', '2019-01-25 13:40:19', 'RPL'),
	(2, 'Aplikasi Mobile', '2019-01-25 13:40:37', '2019-01-25 13:40:37', 'RPL'),
	(3, 'Aplikasi Desktop', '2019-01-25 13:41:01', '2019-01-25 13:41:01', 'RPL'),
	(4, 'Iklan Layanan Masyarakat', '2019-01-25 13:55:59', '2019-01-25 13:55:59', 'MM'),
	(5, 'Iklan Komersil', '2019-01-25 13:56:44', '2019-01-25 13:56:44', 'MM'),
	(6, 'Aplikasi Interaktif', '2019-01-25 13:59:14', '2019-01-25 13:59:14', 'MM');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;

-- membuang struktur untuk table voyager.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.menus: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
REPLACE INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2018-12-07 14:40:15', '2018-12-07 14:40:15'),
	(2, 'menu_nav', '2019-01-20 02:43:33', '2019-01-20 02:43:33');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- membuang struktur untuk table voyager.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.menu_items: ~25 rows (lebih kurang)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
REPLACE INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-home', '#000000', NULL, 1, '2018-12-07 14:40:15', '2019-01-20 11:30:47', 'voyager.dashboard', 'null'),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 10, '2018-12-07 14:40:15', '2019-01-20 12:17:41', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 9, '2018-12-07 14:40:15', '2019-01-20 12:17:41', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 8, '2018-12-07 14:40:15', '2019-01-20 12:17:41', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 11, '2018-12-07 14:40:15', '2019-01-20 12:17:41', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2018-12-07 14:40:15', '2019-01-20 10:58:40', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-12-07 14:40:15', '2019-01-20 10:58:41', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-12-07 14:40:15', '2019-01-20 10:58:41', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-12-07 14:40:16', '2019-01-20 10:58:41', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 12, '2018-12-07 14:40:16', '2019-01-20 12:17:41', 'voyager.settings.index', NULL),
	(13, 1, 'Halaman', '', '_self', 'voyager-file-text', '#000000', NULL, 7, '2018-12-07 14:40:28', '2019-01-20 12:17:41', 'voyager.pages.index', 'null'),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-12-07 14:40:31', '2019-01-20 10:58:41', 'voyager.hooks', NULL),
	(16, 1, 'Project', '#', '_self', 'voyager-archive', '#000000', NULL, 4, '2019-01-12 01:49:01', '2019-01-26 03:07:20', NULL, ''),
	(18, 2, 'Home', '/', '_self', 'voyager-home', '#000000', NULL, 13, '2019-01-20 02:44:33', '2019-01-20 02:44:33', NULL, ''),
	(19, 2, 'Kumpulkan', '/submit', '_blank', 'voyager-upload', '#000000', NULL, 14, '2019-01-20 02:46:14', '2019-01-20 02:46:14', NULL, ''),
	(20, 2, 'Jelajahi', '/explore', '_self', 'voyager-file-code', '#000000', NULL, 15, '2019-01-20 02:47:54', '2019-01-20 02:57:40', NULL, ''),
	(21, 2, 'Artikel', '/article', '_self', 'voyager-file-text', '#000000', NULL, 16, '2019-01-20 02:49:04', '2019-01-20 02:57:54', NULL, ''),
	(22, 2, 'Tentang', '/page/about', '_self', 'voyager-info-circled', '#000000', NULL, 17, '2019-01-20 02:50:17', '2019-01-25 13:31:21', NULL, ''),
	(24, 1, 'Deadline', '', '_self', 'voyager-alarm-clock', '#000000', NULL, 2, '2019-01-20 10:57:02', '2019-01-20 11:31:01', 'voyager.deadline.index', 'null'),
	(28, 1, 'Kategori', '', '_self', 'voyager-categories', '#000000', NULL, 5, '2019-01-20 11:27:12', '2019-01-26 03:07:20', 'voyager.kategori.index', 'null'),
	(29, 1, 'RPL', '', '_self', 'voyager-file-code', '#000000', 16, 1, '2019-01-20 12:04:36', '2019-01-20 12:18:07', 'voyager.project-rpl.index', 'null'),
	(30, 1, 'MM', '', '_self', 'voyager-camera', '#000000', 16, 2, '2019-01-20 12:09:40', '2019-01-20 12:32:30', 'voyager.project-mm.index', 'null'),
	(31, 1, 'Siswa', '', '_self', 'voyager-study', '#000000', NULL, 3, '2019-01-20 12:46:35', '2019-01-20 12:47:27', 'voyager.siswa.index', 'null'),
	(32, 1, 'Posts', '', '_self', 'voyager-news', '#000000', NULL, 6, '2019-01-26 02:59:03', '2019-02-07 02:58:22', 'voyager.post.index', 'null'),
	(33, 1, 'Project Rpls', '', '_self', NULL, NULL, NULL, 18, '2019-01-29 12:30:53', '2019-01-29 12:30:53', 'voyager.project-rpl.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- membuang struktur untuk table voyager.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.migrations: ~30 rows (lebih kurang)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(47, '2016_01_01_000000_create_pages_table', 2),
	(48, '2016_01_01_000000_create_posts_table', 2),
	(49, '2016_02_15_204651_create_categories_table', 2),
	(50, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
	(51, '2018_12_22_032920_create_table_siswa', 2),
	(52, '2018_12_22_034315_create_project_rpl', 2),
	(53, '2018_12_22_035111_create_project_mm', 2),
	(54, '2018_12_29_134126_create_deadline_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table voyager.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.pages: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
REPLACE INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Tentang RAX', 'sekilas tentang aplikasi rax', '<p>Ini contoh about rax sementara</p>', 'pages/January2019/FTkCk7GGD3kHICgATJhV.jpg', 'about', 'About rax', 'about', 'ACTIVE', '2019-01-20 02:42:36', '2019-01-20 04:15:12');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- membuang struktur untuk table voyager.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.password_resets: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- membuang struktur untuk table voyager.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.permissions: ~61 rows (lebih kurang)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
REPLACE INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(2, 'browse_bread', NULL, '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(3, 'browse_database', NULL, '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(4, 'browse_media', NULL, '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(5, 'browse_compass', NULL, '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(6, 'browse_menus', 'menus', '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(7, 'read_menus', 'menus', '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(8, 'edit_menus', 'menus', '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(9, 'add_menus', 'menus', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(10, 'delete_menus', 'menus', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(11, 'browse_roles', 'roles', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(12, 'read_roles', 'roles', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(13, 'edit_roles', 'roles', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(14, 'add_roles', 'roles', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(15, 'delete_roles', 'roles', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(16, 'browse_users', 'users', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(17, 'read_users', 'users', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(18, 'edit_users', 'users', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(19, 'add_users', 'users', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(20, 'delete_users', 'users', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(21, 'browse_settings', 'settings', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(22, 'read_settings', 'settings', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(23, 'edit_settings', 'settings', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(24, 'add_settings', 'settings', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(25, 'delete_settings', 'settings', '2018-12-07 14:40:17', '2018-12-07 14:40:17'),
	(36, 'browse_pages', 'pages', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(37, 'read_pages', 'pages', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(38, 'edit_pages', 'pages', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(39, 'add_pages', 'pages', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(40, 'delete_pages', 'pages', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(41, 'browse_hooks', NULL, '2018-12-07 14:40:31', '2018-12-07 14:40:31'),
	(47, 'browse_deadline', 'deadline', '2019-01-20 10:57:02', '2019-01-20 10:57:02'),
	(48, 'read_deadline', 'deadline', '2019-01-20 10:57:02', '2019-01-20 10:57:02'),
	(49, 'edit_deadline', 'deadline', '2019-01-20 10:57:02', '2019-01-20 10:57:02'),
	(50, 'add_deadline', 'deadline', '2019-01-20 10:57:02', '2019-01-20 10:57:02'),
	(51, 'delete_deadline', 'deadline', '2019-01-20 10:57:02', '2019-01-20 10:57:02'),
	(67, 'browse_kategori', 'kategori', '2019-01-20 11:27:11', '2019-01-20 11:27:11'),
	(68, 'read_kategori', 'kategori', '2019-01-20 11:27:11', '2019-01-20 11:27:11'),
	(69, 'edit_kategori', 'kategori', '2019-01-20 11:27:11', '2019-01-20 11:27:11'),
	(70, 'add_kategori', 'kategori', '2019-01-20 11:27:11', '2019-01-20 11:27:11'),
	(71, 'delete_kategori', 'kategori', '2019-01-20 11:27:11', '2019-01-20 11:27:11'),
	(77, 'browse_project_mm', 'project_mm', '2019-01-20 12:09:40', '2019-01-20 12:09:40'),
	(78, 'read_project_mm', 'project_mm', '2019-01-20 12:09:40', '2019-01-20 12:09:40'),
	(79, 'edit_project_mm', 'project_mm', '2019-01-20 12:09:40', '2019-01-20 12:09:40'),
	(80, 'add_project_mm', 'project_mm', '2019-01-20 12:09:40', '2019-01-20 12:09:40'),
	(81, 'delete_project_mm', 'project_mm', '2019-01-20 12:09:40', '2019-01-20 12:09:40'),
	(82, 'browse_siswa', 'siswa', '2019-01-20 12:46:35', '2019-01-20 12:46:35'),
	(83, 'read_siswa', 'siswa', '2019-01-20 12:46:35', '2019-01-20 12:46:35'),
	(84, 'edit_siswa', 'siswa', '2019-01-20 12:46:35', '2019-01-20 12:46:35'),
	(85, 'add_siswa', 'siswa', '2019-01-20 12:46:35', '2019-01-20 12:46:35'),
	(86, 'delete_siswa', 'siswa', '2019-01-20 12:46:35', '2019-01-20 12:46:35'),
	(87, 'browse_posts', 'posts', '2019-01-26 02:59:03', '2019-01-26 02:59:03'),
	(88, 'read_posts', 'posts', '2019-01-26 02:59:03', '2019-01-26 02:59:03'),
	(89, 'edit_posts', 'posts', '2019-01-26 02:59:03', '2019-01-26 02:59:03'),
	(90, 'add_posts', 'posts', '2019-01-26 02:59:03', '2019-01-26 02:59:03'),
	(91, 'delete_posts', 'posts', '2019-01-26 02:59:03', '2019-01-26 02:59:03'),
	(92, 'browse_project_rpl', 'project_rpl', '2019-01-29 12:30:53', '2019-01-29 12:30:53'),
	(93, 'read_project_rpl', 'project_rpl', '2019-01-29 12:30:53', '2019-01-29 12:30:53'),
	(94, 'edit_project_rpl', 'project_rpl', '2019-01-29 12:30:53', '2019-01-29 12:30:53'),
	(95, 'add_project_rpl', 'project_rpl', '2019-01-29 12:30:53', '2019-01-29 12:30:53'),
	(96, 'delete_project_rpl', 'project_rpl', '2019-01-29 12:30:53', '2019-01-29 12:30:53');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- membuang struktur untuk table voyager.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.permission_role: ~61 rows (lebih kurang)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
REPLACE INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(89, 1),
	(90, 1),
	(91, 1),
	(92, 1),
	(93, 1),
	(94, 1),
	(95, 1),
	(96, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- membuang struktur untuk table voyager.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` tinytext COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.posts: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
REPLACE INTO `posts` (`id`, `title`, `excerpt`, `body`, `slug`, `created_at`, `updated_at`) VALUES
	(2, 'Tutorial Git Pemula', 'berikut adalah contoh cara penggunaan git yang benar', '<h2 style="box-sizing: border-box; font-size: 2.8rem; line-height: 4.2rem; margin: 0px 0px 1.8rem; font-family: \'Open Sans\'; color: #333333;">Pengenalan</h2>\r\n<p style="box-sizing: border-box; margin: 0px 0px 2rem; font-family: \'Open Sans\'; font-size: 16px;">Version control system sangat bermanfaat untuk mencegah developer mengalami kesulitan dalam menganalisa perubahan &amp; bekerja dengan kode yang diakses bersama-sama. Sederhananya, VCS adalah prinsip penting dalam sistem manajemen konfigurasi software yang berkaitan dengan kebutuhan manajemen perubahan dalam project. Perubahan/revisi/update yang dibuat bisa dikenali melalui kode atau angka. Informasi seperti catatan waktu dan identitas yang membuat perubahan juga tetap ada. Dalam tutorial ini, kita akan membahas GIT, salah satu VCS yang paling sering digunakan. Selain cara menggunakan GIT, Anda juga akan mempelajari dasar GIT seperti cara install GIT di sistem yang berbeda dan bagaimana cara menggunakannya</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 2rem; font-family: \'Open Sans\'; font-size: 16px; text-align: center;"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/1280px-Git-logo.svg.png" alt="Hasil gambar untuk logo git" width="342" height="143" /></p>', 'tutorial-git-pemula', '2019-01-13 04:39:00', '2019-01-26 03:06:04'),
	(3, 'Pengertian dan Manfaat GIT bagi Developer', 'Git adalah version control system yang digunakan para developer untuk mengembangkan software secara bersama-bersama. Fungsi utama git yaitu...', '<p style="box-sizing: border-box; margin: 10px 0px 0px; padding: 0px; font-family: Lato, sans-serif; font-size: 16px; line-height: 24px; color: #333333;"><img style="display: block; margin-left: auto; margin-right: auto;" src="http://voyager.zxira.com/storage/post/February2019/1280px-Git-logo.svg.png" alt="git" width="603" height="252" /></p>\r\n<p style="box-sizing: border-box; margin: 10px 0px 0px; padding: 0px; font-family: Lato, sans-serif; font-size: 16px; line-height: 24px; color: #333333;">Git adalah&nbsp;<em style="box-sizing: border-box;">version control system</em>&nbsp;yang digunakan para developer untuk mengembangkan software secara bersama-bersama. Fungsi utama git yaitu mengatur versi dari source code program anda dengan mengasih tanda baris dan code mana yang ditambah atau diganti.</p>\r\n<p style="box-sizing: border-box; margin: 10px 0px 0px; padding: 0px; font-family: Lato, sans-serif; font-size: 16px; line-height: 24px; color: #333333;">Git ini sebenernya memudahkan programmer untuk mengetahui perubahan source codenya daripada harus membuat file baru seperti&nbsp;<em style="box-sizing: border-box;">Program.java, ProgramRevisi.java,&nbsp; ProgramRevisi2.java, ProgramFix.java</em>. Selain itu, dengan git kita tak perlu khawatir code yang kita kerjakan bentrok, karena setiap developer bias membuat branch sebagai&nbsp;<em style="box-sizing: border-box;">workspace</em>nya.Fitur yang tak kalah keren lagi, pada git kita bisa memberi komentar pada source code yang telah ditambah/diubah, hal ini mempermudah developer lain untuk tahu&nbsp; kendala apa yang dialami developer lain.</p>\r\n<p style="box-sizing: border-box; margin: 10px 0px 0px; padding: 0px; font-family: Lato, sans-serif; font-size: 16px; line-height: 24px; color: #333333;">Untuk mengetahui bagaimana menggunakan git, berikut perintah-perintah dasar git:</p>\r\n<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #333333; font-family: \'PT Sans\', sans-serif;">\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git init : untuk membuat&nbsp;<em style="box-sizing: border-box;">repository</em>&nbsp;pada file lokal yang nantinya ada folder .git</li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git status : untuk mengetahui status dari&nbsp;<em style="box-sizing: border-box;">repository</em>&nbsp;lokal</li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git add : menambahkan file baru pada&nbsp;<em style="box-sizing: border-box;">repository</em>&nbsp;yang dipilih</li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git commit : untuk menyimpan perubahan yang dilakukan, tetapi tidak ada perubahan pada&nbsp;<em style="box-sizing: border-box;">remote repository.</em></li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git push : untuk mengirimkan perubahan file setelah di commit ke&nbsp;<em style="box-sizing: border-box;">remote repository.</em></li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git branch : melihat seluruh&nbsp;<em style="box-sizing: border-box;">branch&nbsp;</em>yang ada pada repository</li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git checkout : menukar&nbsp;<em style="box-sizing: border-box;">branch&nbsp;</em>yang aktif dengan&nbsp;<em style="box-sizing: border-box;">branch</em>yang dipilih</li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">GIt merge : untuk menggabungkan&nbsp;<em style="box-sizing: border-box;">branch&nbsp;</em>yang aktif dan&nbsp;<em style="box-sizing: border-box;">branch&nbsp;</em>yang dipilih</li>\r\n<li style="box-sizing: border-box; font-size: 16px; font-family: Lato, sans-serif; line-height: 24px; margin: auto;">Git clone : membuat Salinan&nbsp;<em style="box-sizing: border-box;">repository&nbsp;</em>lokal</li>\r\n</ul>\r\n<p style="box-sizing: border-box; margin: 10px 0px 0px; padding: 0px; font-family: Lato, sans-serif; font-size: 16px; line-height: 24px; color: #333333;">Contoh dari&nbsp;<em style="box-sizing: border-box;">software version control system</em>&nbsp;adalah github, bitbucket, snowy evening, dan masih banyak lagi. Jika anda sebagai developer belum mengetahui fitur git ini, maka anda wajib mencoba dan memakainya. Karena banyak manfaat yang akan didapat dengan git ini.</p>', 'pengertian-dan-manfaat-git-bagi-developer', '2019-02-07 03:01:28', '2019-02-07 03:01:28');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- membuang struktur untuk table voyager.project_mm
CREATE TABLE IF NOT EXISTS `project_mm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_siswa` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_project` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` char(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `repo_url` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_mm_nama_project_unique` (`nama_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.project_mm: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `project_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_mm` ENABLE KEYS */;

-- membuang struktur untuk table voyager.project_rpl
CREATE TABLE IF NOT EXISTS `project_rpl` (
  `id_project` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_siswa` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_project` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repo_url` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `repo_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_project`),
  UNIQUE KEY `project_rpl_nama_project_unique` (`nama_project`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.project_rpl: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `project_rpl` DISABLE KEYS */;
REPLACE INTO `project_rpl` (`id_project`, `nama_siswa`, `nama_project`, `excerpt`, `description`, `picture`, `repo_url`, `repo_password`, `verified`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'Web music', 'DIni adalah aplikasi untuk membuat music secara online', '<p>ini adlah tes</p>', 'project-rpl/January2019/tO7oBdcxDWAbHHwWUHMl.jpg', 'slamet', '', 'Unverified', '2019-01-25 14:24:35', '2019-01-27 05:15:19'),
	(3, 'IRVAN NAUFAL ARIQ', 'Web Voting', 'Aliquip accumsan mnesarchum vel at, ut est alterum offendit. Ut aliquid praesent dissentias eum. Viris nihil congue pri te.', 'Aliquip accumsan mnesarchum vel at, ut est alterum offendit. Ut aliquid praesent dissentias eum. Viris nihil congue pri te.', NULL, 'irvannaufalariq', '', 'Pending', '2019-02-04 13:08:43', '2019-02-04 13:08:43');
/*!40000 ALTER TABLE `project_rpl` ENABLE KEYS */;

-- membuang struktur untuk table voyager.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.roles: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2018-12-07 14:40:16', '2018-12-07 14:40:16'),
	(2, 'user', 'Normal User', '2018-12-07 14:40:16', '2018-12-07 14:40:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- membuang struktur untuk table voyager.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.settings: ~10 rows (lebih kurang)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
REPLACE INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'RAX', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Rax merupakan sebuah aplikasi berbasis web yang mengatur agar siswa dan guru saling berkontribusi dalam hal pengerjaan tugas akhir', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', 'settings/January2019/tQuB8VOj8iYhuHiFJ8I0.png', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'RAX', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Selamat datang di  admin panel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- membuang struktur untuk table voyager.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_siswa` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kejuruan` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nama_siswa` (`nama_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.siswa: ~25 rows (lebih kurang)
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
REPLACE INTO `siswa` (`id`, `nama_siswa`, `kejuruan`, `jenis_kelamin`, `token`, `created_at`, `updated_at`) VALUES
	(54, 'ACHMAD TRI RAHADI', 'MM', 'Laki-laki', 'PF581071937265184000W', NULL, NULL),
	(55, 'AJENG HAFIZH AZIZAH', 'MM', 'Perempuan', 'BO474147295315906000Y', NULL, NULL),
	(56, 'AULIYA ANDINI NISAUL HUSNA', 'MM', 'Perempuan', 'ER80029222886256300N', NULL, NULL),
	(57, 'DIAN KHAFIFI ADI', 'MM', 'Laki-laki', 'NO711695224808006000W', NULL, NULL),
	(58, 'DION RAYA FIRMANSYAH', 'MM', 'Laki-laki', 'FU134739322776404000T', NULL, NULL),
	(59, 'M. RIFQI BAHARUDIN YUSUF', 'MM', 'Laki-laki', 'WO664362059551333000G', NULL, NULL),
	(60, 'MARATUL MARHAMAH', 'MM', 'Perempuan', 'OM341872222438573000Q', NULL, NULL),
	(61, 'MOHAMMAD NUR ROVICKY', 'MM', 'Laki-laki', 'OV63026069178322300G', NULL, NULL),
	(62, 'RISKY WAHYU RAMADHAN', 'MM', 'Laki-laki', 'DZ461147886012992000I', NULL, NULL),
	(63, 'SILVIA HARDIANTI', 'MM', 'Perempuan', 'DN596327315358898000N', NULL, NULL),
	(64, 'WAHYU BAGUS SAPUTRO', 'MM', 'Laki-laki', 'LA64565392250484000U', NULL, NULL),
	(65, 'ABDUL WAHAB', 'MM', 'Perempuan', 'HF841112012838205000P', NULL, NULL),
	(66, 'EMEYLDA DWI ELSA PUTRI', 'MM', 'Perempuan', 'LC610203158058259000G', NULL, NULL),
	(67, 'TIKA RATNASARI', 'MM', 'Perempuan', 'UU271008495682446000U', NULL, NULL),
	(68, 'ADJIE RAMADHANI', 'RPL', 'Laki-laki', 'EE155197803526044000O', NULL, NULL),
	(69, 'DIMAS PUJI WIDODO', 'RPL', 'Laki-laki', 'FP359156599520775000I', NULL, NULL),
	(70, 'IRVAN NAUFAL ARIQ', 'RPL', 'Laki-laki', 'QR684443363412478000K', NULL, NULL),
	(71, 'MOCH. AFIF ABDULLAH', 'RPL', 'Laki-laki', 'TS481858743193148000Z', NULL, NULL),
	(72, 'MUHAMMAD AZRIEL FAJAR RAMADHAN', 'RPL', 'Laki-laki', 'ZF908062109473026000G', NULL, NULL),
	(73, 'MUHAMMAD RIZKY FAJAR FIRDAUS', 'RPL', 'Laki-laki', 'PJ566364816831445000V', NULL, NULL),
	(74, 'YUSUF MUDZAKIR', 'RPL', 'Laki-laki', 'VC262368902827035000N', NULL, NULL),
	(75, 'AINUN', 'MM', 'Laki-laki', 'RY743345615525716000U', NULL, NULL),
	(76, 'M. WAHYU SAPUTRO', 'MM', 'Laki-laki', 'EU662332543643344000W', NULL, NULL),
	(77, 'ASYI NOVITASARI', 'MM', 'Perempuan', 'FD538565295700150000Y', NULL, NULL),
	(78, 'ALIEN RAMADHANI', 'MM', 'Perempuan', 'SL478576312521984000M', NULL, NULL);
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;

-- membuang struktur untuk table voyager.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.translations: ~40 rows (lebih kurang)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
REPLACE INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-12-07 14:40:28', '2018-12-07 14:40:28'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-12-07 14:40:29', '2018-12-07 14:40:29'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-12-07 14:40:30', '2018-12-07 14:40:30'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-12-07 14:40:30', '2018-12-07 14:40:30'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-12-07 14:40:30', '2018-12-07 14:40:30'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-12-07 14:40:30', '2018-12-07 14:40:30'),
	(31, 'menu_items', 'title', 22, 'en', 'Tentang', '2019-01-25 13:31:21', '2019-01-25 13:31:21'),
	(32, 'data_types', 'display_name_singular', 13, 'en', 'Kategori', '2019-01-25 13:39:58', '2019-01-25 13:39:58'),
	(33, 'data_types', 'display_name_plural', 13, 'en', 'Category', '2019-01-25 13:39:58', '2019-01-25 13:39:58'),
	(36, 'data_types', 'display_name_singular', 15, 'en', 'Project Mm', '2019-01-25 14:39:51', '2019-01-25 14:39:51'),
	(37, 'data_types', 'display_name_plural', 15, 'en', 'Project Mm', '2019-01-25 14:39:51', '2019-01-25 14:39:51'),
	(40, 'data_types', 'display_name_singular', 20, 'en', 'Post', '2019-01-26 03:03:02', '2019-01-26 03:03:02'),
	(41, 'data_types', 'display_name_plural', 20, 'en', 'Posts', '2019-01-26 03:03:03', '2019-01-26 03:03:03'),
	(42, 'menu_items', 'title', 32, 'en', 'Posts', '2019-01-26 03:06:43', '2019-01-26 03:06:43'),
	(43, 'data_types', 'display_name_singular', 21, 'en', 'Project Rpl', '2019-02-07 02:49:04', '2019-02-07 02:49:04'),
	(44, 'data_types', 'display_name_plural', 21, 'en', 'Project Rpls', '2019-02-07 02:49:04', '2019-02-07 02:49:04');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- membuang struktur untuk table voyager.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.users: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/January2019/uIYSYLKeCWze2aMUejlT.jpeg', NULL, '$2y$10$1IOB22ZEieLjIvlSYZAOOeXlN8/IB8RI/AU4ffey6EyKq2PoQnIzq', '1qOU0Dr46BfMMVsMslVUqvnJq5kFNucgZWWC0kFXQkjFF5A3gleEtdmsFwUO', '{"locale":"en"}', '2018-12-07 14:40:25', '2019-01-20 10:48:03'),
	(2, 1, 'Irvan Naufal', 'jombangfoss@gmail.com', 'users/default.png', NULL, '$2y$10$v2K5odnFd6LwtMvihmX6Iu9kTRTUWkYsAw1pSc7dwQiqLWu8102la', NULL, NULL, '2018-12-10 04:32:46', '2018-12-10 04:32:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- membuang struktur untuk table voyager.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel voyager.user_roles: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
