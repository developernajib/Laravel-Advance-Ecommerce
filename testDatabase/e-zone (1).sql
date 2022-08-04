-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 06:12 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-zone`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` int(11) DEFAULT 0,
  `category` int(11) DEFAULT 0,
  `product` int(11) DEFAULT 0,
  `slider` int(11) DEFAULT 0,
  `coupons` int(11) DEFAULT 0,
  `shipping` int(11) DEFAULT 0,
  `blog` int(11) DEFAULT 0,
  `setting` int(11) DEFAULT 0,
  `returnorder` int(11) DEFAULT 0,
  `review` int(11) DEFAULT 0,
  `orders` int(11) DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `reports` int(11) DEFAULT 0,
  `alluser` int(11) DEFAULT 0,
  `adminuserrole` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `type`, `phone`, `secret_code`, `email_verified_at`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `brand`, `category`, `product`, `slider`, `coupons`, `shipping`, `blog`, `setting`, `returnorder`, `review`, `orders`, `stock`, `reports`, `alluser`, `adminuserrole`, `created_at`, `updated_at`) VALUES
(1, 'Md Najib Islam', 'admin@gmail.com', '1', '01537500950', 'developer', '2022-07-26 03:58:34', '$2y$10$Pv9peNtvzbgcWMz9LQv8beBlASkhkqiMYQmag/YTRdUzYJWyZkfD.', 'ZYFYJck5w0ISOeCLUVPvC91HdjMqDXTwiPC1QHxZIHvIdKqMShlicqKoHfuM', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL),
(2, 'Salman Faruk', 'salman@gmail.com', '2', '01511967007', 'developer', '2022-07-26 03:58:34', '$2y$10$DGkpyZWkoyimxxX5MwiAu.YoKmhB0ZDc.c/eeZPGHAD.DcAFSHjeu', 'RmIajzc8l1IjTtou3ZxF1wcUThZLIE0cm8eP0734g3HxztH2vHz33I44bh7z', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(3, 'Md Foisal', 'foisal@gmail.com', '2', '01234567890', 'member', '2022-07-26 03:58:34', '$2y$10$QJA68SO2i/BrvTCWVw7JreQ/dWoiNX4oDhH7Aiuc4gc48NoWMOpu.', 'bCmsGQWUHX', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(4, 'Farjana Akter Ria', 'farjana@gmail.com', '2', '01234567890', 'member', '2022-07-26 03:58:34', '$2y$10$i5fOhCwu7qYXFl0ZuT/BOO2akVv.UCCEtiVy9NL1uCKaYtIBrpnHi', '3AcpDQiLWE', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_details_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_categories`
--

CREATE TABLE `blog_post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name_en`, `brand_slug_en`, `brand_image`, `created_at`, `updated_at`) VALUES
(3, 'Xiaomi', 'xiaomi', 'upload/brand/1739474639034790.png', NULL, NULL),
(4, 'Apple', 'apple', 'upload/brand/1739474664099193.png', NULL, NULL),
(5, 'Huawei', 'huawei', 'upload/brand/1739474689192259.png', NULL, NULL),
(6, 'Oppo', 'oppo', 'upload/brand/1739474699460067.png', NULL, NULL),
(7, 'Razer', 'razer', 'upload/brand/1739474711599397.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name_en`, `category_slug_en`, `category_icon`, `created_at`, `updated_at`) VALUES
(3, 'Electronics', 'electronics', 'fa fa-desktop', NULL, NULL),
(4, 'TV & Home Appliances', 'tv-&-home-appliances', 'fa fa-television', NULL, NULL),
(5, 'Babies Toys', 'babies-toys', 'fa fa-plane', NULL, NULL),
(7, 'Automotive & Motorbike', 'automotive-&-motorbike', 'fa fa-motorcycle', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_validity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `coupon_discount`, `coupon_validity`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NEW', 10, '2022-07-31', 1, '2022-07-26 22:09:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(681, '2014_10_12_000000_create_users_table', 1),
(682, '2014_10_12_100000_create_password_resets_table', 1),
(683, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(684, '2019_08_19_000000_create_failed_jobs_table', 1),
(685, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(686, '2022_07_16_113549_create_sessions_table', 1),
(687, '2022_07_16_130201_create_admins_table', 1),
(688, '2022_07_21_210245_create_brands_table', 1),
(689, '2022_07_22_090641_create_categories_table', 1),
(690, '2022_07_22_091456_create_sub_categories_table', 1),
(691, '2022_07_22_091545_create_sub_sub_categories_table', 1),
(692, '2022_07_22_160800_create_products_table', 1),
(693, '2022_07_23_060037_create_multi_imgs_table', 1),
(694, '2022_07_23_072913_create_sliders_table', 1),
(695, '2022_07_23_172329_create_blog_posts_table', 1),
(696, '2022_07_23_172710_create_coupons_table', 1),
(697, '2022_07_23_172726_create_orders_table', 1),
(698, '2022_07_23_172743_create_order_items_table', 1),
(699, '2022_07_23_172802_create_reviews_table', 1),
(700, '2022_07_23_172817_create_seos_table', 1),
(701, '2022_07_23_172841_create_ship_districts_table', 1),
(702, '2022_07_23_172859_create_ship_divisions_table', 1),
(703, '2022_07_23_172916_create_ship_states_table', 1),
(704, '2022_07_23_172947_create_site_settings_table', 1),
(705, '2022_07_23_173006_create_wishlists_table', 1),
(706, '2022_07_23_173104_create_blog_post_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(2, 3, 'upload/products/multi-image/1739476970953534.jpg', '2022-07-26 22:01:51', NULL),
(3, 3, 'upload/products/multi-image/1739476971250380.jpg', '2022-07-26 22:01:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picked_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) NOT NULL,
  `product_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_tags_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_size_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_color_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_descp_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_descp_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_thambnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot_deals` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `special_offer` int(11) DEFAULT NULL,
  `special_deals` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_name_en`, `product_slug_en`, `product_code`, `product_qty`, `product_tags_en`, `product_size_en`, `product_color_en`, `selling_price`, `discount_price`, `short_descp_en`, `long_descp_en`, `product_thambnail`, `hot_deals`, `featured`, `special_offer`, `special_deals`, `status`, `created_at`, `updated_at`) VALUES
(3, 3, 3, 9, 20, 'Xiaomi Mi 11 Lite', 'xiaomi-mi-11-lite', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'red,Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Factory Unlocked Smartphones are compatible with most GSM carriers. This phone is not compatible with CDMA carriers like Verizon or Sprint</li>\r\n	<li>International Model Phone. May come with a non-us standard power adapter. This phone is not covered by the manufacturers warranty</li>\r\n</ul>', 'upload/products/thambnail/1739477138945281.jpg', 1, 1, 1, 1, 1, NULL, '2022-07-26 22:04:31'),
(4, 3, 3, 9, 20, 'Xiaomi Mi', 'xiaomi-mi', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1>&nbsp;</h1>', 'upload/products/thambnail/1739477285787295.jpg', 1, 1, NULL, NULL, 1, '2022-07-26 22:04:15', '2022-07-26 22:06:51'),
(6, 3, 3, 9, 20, 'Xiaomi Mi 11 Lite', 'xiaomi-mi-11-lite', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'red,Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Factory Unlocked Smartphones are compatible with most GSM carriers. This phone is not compatible with CDMA carriers like Verizon or Sprint</li>\r\n	<li>International Model Phone. May come with a non-us standard power adapter. This phone is not covered by the manufacturers warranty</li>\r\n</ul>', 'upload/products/thambnail/1739477138945281.jpg', 1, 1, 1, 1, 1, NULL, '2022-07-26 22:04:31'),
(7, 3, 3, 9, 20, 'Xiaomi Mi', 'xiaomi-mi', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1>&nbsp;</h1>', 'upload/products/thambnail/1739477285787295.jpg', 1, 1, NULL, NULL, 1, '2022-07-26 22:04:15', '2022-07-26 22:06:51'),
(8, 3, 3, 9, 20, 'Xiaomi Mi 11 Lite', 'xiaomi-mi-11-lite', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'red,Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Factory Unlocked Smartphones are compatible with most GSM carriers. This phone is not compatible with CDMA carriers like Verizon or Sprint</li>\r\n	<li>International Model Phone. May come with a non-us standard power adapter. This phone is not covered by the manufacturers warranty</li>\r\n</ul>', 'upload/products/thambnail/1739477138945281.jpg', 1, 1, 1, 1, 1, NULL, '2022-07-26 22:04:31'),
(9, 3, 3, 9, 20, 'Xiaomi Mi', 'xiaomi-mi', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1>&nbsp;</h1>', 'upload/products/thambnail/1739477285787295.jpg', 1, 1, NULL, NULL, 1, '2022-07-26 22:04:15', '2022-07-26 22:06:51'),
(10, 3, 3, 9, 20, 'Xiaomi Mi 11 Lite', 'xiaomi-mi-11-lite', 'B088CL6DBB', '100', 'Lorem,Ipsum,Amet', '128GB,256GB', 'red,Black,silver', '469', '429', 'Xiaomi Mi 11 Lite | 128GB 8GB RAM | Factory Unlocked (GSM ONLY | Not Compatible with Verizon/Sprint) | International Model (Boba Black)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Xiaomi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>GSM, WCDMA, LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Boba Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Dimensions LxWxH</td>\r\n			<td>6 x 2 x 0.4 inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Factory Unlocked Smartphones are compatible with most GSM carriers. This phone is not compatible with CDMA carriers like Verizon or Sprint</li>\r\n	<li>International Model Phone. May come with a non-us standard power adapter. This phone is not covered by the manufacturers warranty</li>\r\n</ul>', 'upload/products/thambnail/1739477138945281.jpg', 1, 1, 1, 1, 1, NULL, '2022-07-26 22:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `meta_title`, `meta_author`, `meta_keyword`, `meta_description`, `google_analytics`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Md Najib Islam', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aTyxCwWm2992SeD1nefv4TID3yCh1DJMMulrZPJb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVzRLZTgwZERWOTc0WE9NWjRnZ1J2OHZRU2ZhRkRnME9uSks2c0NUVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoiY2FydCI7YTowOnt9czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkbWtxUXlMQ3R4cFNyeE45Zi5IUzF2ZXFKZVBPbVNqZFdDUEw3QnhXaDFMeTBwMVJpZ1VLdVMiO3M6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE5OiJwYXNzd29yZF9oYXNoX2FkbWluIjtzOjYwOiIkMnkkMTAkUHY5cGVOdHZ6YmdjV016OUxRdjhiZUJsQVNraGtxaU1ZUW1hZy9ZVFJkVXpZSld5WmtmRC4iO30=', 1658895030);

-- --------------------------------------------------------

--
-- Table structure for table `ship_districts`
--

CREATE TABLE `ship_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_districts`
--

INSERT INTO `ship_districts` (`id`, `division_id`, `district_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chittagong', '2022-07-26 10:39:42', NULL),
(2, 1, 'Rangamati', '2022-07-26 10:39:52', NULL),
(3, 2, 'Dhaka', '2022-07-26 10:40:01', NULL),
(4, 2, 'Puran Dhaka', '2022-07-26 10:40:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_divisions`
--

CREATE TABLE `ship_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_divisions`
--

INSERT INTO `ship_divisions` (`id`, `division_name`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh', '2022-07-26 10:39:25', NULL),
(2, 'Dhaka', '2022-07-26 10:39:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_states`
--

CREATE TABLE `ship_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_states`
--

INSERT INTO `ship_states` (`id`, `division_id`, `district_id`, `state_name`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 'a', '2022-07-26 22:09:21', NULL),
(5, 1, 1, 'b', '2022-07-26 22:09:28', NULL),
(6, 1, 1, 'b', '2022-07-26 22:09:34', NULL),
(7, 2, 3, 'a', '2022-07-26 22:09:43', NULL),
(8, 2, 3, 'b', '2022-07-26 22:09:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `phone_one`, `phone_two`, `email`, `company_name`, `company_address`, `facebook`, `twitter`, `linkedin`, `youtube`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 'E-Zone', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'upload/slider/1739477385658915.jpg', NULL, NULL, 1, NULL, NULL),
(2, 'upload/slider/1739477393911069.jpg', NULL, NULL, 1, NULL, NULL),
(3, 'upload/slider/1739477400979065.jpg', NULL, NULL, 1, NULL, NULL),
(4, 'upload/slider/1739477408911781.jpg', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subcategory_name_en`, `subcategory_slug_en`, `created_at`, `updated_at`) VALUES
(2, 7, 'Automobile', 'automobile', NULL, NULL),
(3, 7, 'Motorcycle', 'motorcycle', NULL, NULL),
(4, 7, 'Car Electronic Accessories', 'car-electronic-accessories', NULL, NULL),
(6, 5, 'Male Toys', 'male-toys', NULL, NULL),
(7, 5, 'Female Toys', 'female-toys', NULL, NULL),
(8, 5, 'Games', 'games', NULL, NULL),
(9, 3, 'Mobile', 'mobile', NULL, NULL),
(10, 3, 'Computer', 'computer', NULL, NULL),
(11, 3, 'Tablet', 'tablet', NULL, NULL),
(12, 4, 'Smart TVs', 'smart-tvs', NULL, NULL),
(13, 4, 'Android TVs', 'android-tvs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subsubcategory_slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `category_id`, `subcategory_id`, `subsubcategory_name_en`, `subsubcategory_slug_en`, `created_at`, `updated_at`) VALUES
(2, 7, 3, 'Scooter', 'scooter', NULL, NULL),
(3, 7, 3, 'Stander Bike', 'stander-bike', NULL, NULL),
(4, 7, 2, 'Imported Car', 'imported-car', NULL, NULL),
(5, 7, 2, 'SUVs', 'suvs', NULL, NULL),
(6, 7, 4, 'Music System', 'music-system', NULL, NULL),
(7, 7, 4, 'GPS', 'gps', NULL, NULL),
(8, 5, 8, 'Babies games', 'babies-games', NULL, NULL),
(9, 5, 7, 'Nothing', 'nothing', NULL, NULL),
(10, 5, 7, 'Something', 'something', NULL, NULL),
(11, 5, 8, 'More games', 'more-games', NULL, NULL),
(12, 5, 6, 'Nothing', 'nothing', NULL, NULL),
(13, 5, 6, 'Something', 'something', NULL, NULL),
(14, 5, 6, 'Many thing', 'many-thing', NULL, NULL),
(15, 3, 10, 'Desktop', 'desktop', NULL, NULL),
(16, 3, 10, 'Custom PC', 'custom-pc', NULL, NULL),
(17, 3, 10, 'Brand PC', 'brand-pc', NULL, NULL),
(18, 3, 9, 'Asus', 'asus', NULL, NULL),
(19, 3, 9, 'Apple', 'apple', NULL, NULL),
(20, 3, 9, 'Xiaomi', 'xiaomi', NULL, NULL),
(21, 3, 11, 'Asus', 'asus', NULL, NULL),
(22, 3, 11, 'Apple', 'apple', NULL, NULL),
(23, 4, 13, 'Samsung', 'samsung', NULL, NULL),
(24, 4, 13, 'LG', 'lg', NULL, NULL),
(25, 4, 12, 'Samsung', 'samsung', NULL, NULL),
(26, 4, 12, 'LG', 'lg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `last_seen`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Md Najib Islam', 'user@gmail.com', '01537500950', NULL, '2022-07-26 03:58:34', '$2y$10$mkqQyLCtxpSrxN9f.HS1veqJePOmSjdWCPL7BxWh1Ly0p1RigUKuS', NULL, NULL, 'sFz1R6shMgNr4T57RWWakljb1tgzR1I4XtfZk8BDswwNiPk6kNDWA76Dep1z', NULL, NULL, NULL, NULL),
(2, 'Salman Faruk', 'salman@gmail.com', '01511967007', NULL, '2022-07-26 03:58:34', '$2y$10$m9RgYFB15X0M5.Sz/0sM7uyGvHel7nyCRVhojhGTmx34D2fzSRqIC', NULL, NULL, 'gzESpXu5tz', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `ship_districts`
--
ALTER TABLE `ship_districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_divisions`
--
ALTER TABLE `ship_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_states`
--
ALTER TABLE `ship_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=707;

--
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ship_districts`
--
ALTER TABLE `ship_districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ship_divisions`
--
ALTER TABLE `ship_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ship_states`
--
ALTER TABLE `ship_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
