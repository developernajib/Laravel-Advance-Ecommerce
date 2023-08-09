-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 06:43 AM
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
-- Database: `ezone`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `secret_code` varchar(255) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
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
(1, 'Md Najib Islam', 'admin@gmail.com', '1', '01537500950', 'developer', '2022-07-26 03:58:34', '$2y$10$Pv9peNtvzbgcWMz9LQv8beBlASkhkqiMYQmag/YTRdUzYJWyZkfD.', '49H69XKvUMqZFEhQuui3axnaPrV6r9ALnQryLRbdXWnnsRXonLa9wOTso3IX', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL),
(2, 'Salman Faruk', 'salman@gmail.com', '2', '01511967007', 'developer', '2022-07-26 03:58:34', '$2y$10$DGkpyZWkoyimxxX5MwiAu.YoKmhB0ZDc.c/eeZPGHAD.DcAFSHjeu', 'RmIajzc8l1IjTtou3ZxF1wcUThZLIE0cm8eP0734g3HxztH2vHz33I44bh7z', NULL, 'upload/admin_images/1740310887037230.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 02:56:35', '2022-08-05 02:56:35'),
(3, 'Md Foisal', 'foisal@gmail.com', '2', '01234567890', 'member', '2022-07-26 03:58:34', '$2y$10$QJA68SO2i/BrvTCWVw7JreQ/dWoiNX4oDhH7Aiuc4gc48NoWMOpu.', 'bCmsGQWUHX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 02:56:59', '2022-08-05 02:56:59'),
(4, 'Farjana Akter Ria', 'farjana@gmail.com', '2', '01234567890', 'member', '2022-07-26 03:58:34', '$2y$10$i5fOhCwu7qYXFl0ZuT/BOO2akVv.UCCEtiVy9NL1uCKaYtIBrpnHi', '3AcpDQiLWE', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_title_en` varchar(255) NOT NULL,
  `post_slug_en` varchar(255) NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `post_details_en` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `category_id`, `post_title_en`, `post_slug_en`, `post_image`, `post_details_en`, `created_at`, `updated_at`) VALUES
(1, 2, 'How to Start Your Programming Blog? (2021 Ultimate Guide)', 'how-to-start-your-programming-blog?-(2021-ultimate-guide)', 'upload/post/1740309928423493.png', '<h1>How to Start Your Programming Blog? (2021 Ultimate Guide)</h1>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/How-to-Start-your-Programming-Blog_.png\" style=\"height:628px; width:1200px\" /></p>\r\n\r\n<p>So you want to create your first programming blog?</p>\r\n\r\n<p>This is an excellent idea. I believe that&nbsp;<strong>every developer should have a blog,</strong>&nbsp;and I will list the reasons why shortly.</p>\r\n\r\n<p>In this article, I am going to assume that you are an absolute beginner&nbsp;<em>who has never built a website before.</em></p>\r\n\r\n<p>I will teach you exactly how to build your programming blog step-by-step, starting from choosing a web host, registering a domain name, choosing a good blogging platform for developers, all the way up to how you start writing and promoting your articles.</p>\r\n\r\n<p>Without further ado, let&rsquo;s jump right into it.</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#why-create-programming-blog\">Why Every Programmer should have a Blog?</a>\r\n\r\n	<ul>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#improve-technical-skills\">Improve your technical skills</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#make-money\">Make some nice side income</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#market-yourself\">Market yourself</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#present-ideas\">Learn how to write and present your ideas</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#build-authority\">Build authority in your field</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#learn-online-marketing\">Learn about online marketing</a></li>\r\n	</ul>\r\n	</li>\r\n	<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#create-programming-blog\">How to Create a Programming Blog?</a>\r\n	<ul>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#step-one\">Step one: Choose a Web host</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#step-two\">Step two: Register your domain name</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#step-three\">Step three: Install WordPress</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#step-four\">Step four: Setup WordPress themes and plugins</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#step-five\">Step five: Outsource your logo and graphic design</a></li>\r\n		<li><a href=\"https://www.afternerd.com/blog/start-programming-blog/#step-six\">Step six: Market your programming blog</a></li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h2>Why Every Programmer should have a Blog?</h2>\r\n\r\n<p>First things first, why should you create your coding blog in the first place?</p>\r\n\r\n<p>I get it.</p>\r\n\r\n<p>Software engineers hate writing.</p>\r\n\r\n<p>It&rsquo;s even hard to get us to comment our own code.</p>\r\n\r\n<p>So why on Earth would you start a&nbsp;<em>programming blog</em>?</p>\r\n\r\n<p>Well actually, starting a programming blog will benefit you in numerous ways.</p>\r\n\r\n<p>Let&rsquo;s discuss some of those benefits.</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/comment.png\" style=\"height:624px; width:935px\" /></p>\r\n\r\n<h3>1. Improve your technical skills</h3>\r\n\r\n<p>There is a well known old Latin principle&nbsp;<em>&ldquo;The best way to learn something is to teach it&rdquo;</em>.</p>\r\n\r\n<p>I find this principle first-hand to be very true.</p>\r\n\r\n<p>For years, I used to teach&nbsp;<em>Computer Science</em>&nbsp;to undergrad students.</p>\r\n\r\n<p>I kid you not, every time I taught a course, I also became better at what I am teaching.</p>\r\n\r\n<p>Teaching pushes you to learn more about your topic which is good not only for your students but for your own self as well.</p>\r\n\r\n<p>Starting a Programming blog is very similar to teaching because in your blog you will be teaching the world about programming and computer science.</p>\r\n\r\n<p>And honestly, that&rsquo;s one of the main reasons why I started&nbsp;<strong>afternerd.com</strong></p>\r\n\r\n<p>I just love teaching.</p>\r\n\r\n<blockquote>\r\n<p>If you want to be a better programmer, teach programming through your blog</p>\r\n</blockquote>\r\n\r\n<h3>2. Make some nice side income</h3>\r\n\r\n<p>Having a blog allows you to have a nice side-income stream that you wouldn&rsquo;t otherwise have.</p>\r\n\r\n<p>I make an&nbsp;<strong>extra $1500~$2000</strong>&nbsp;per month from this blog. Not a ton, but it helps pay a big chunk of the expensive silicon valley rent.</p>\r\n\r\n<h3>3. Market yourself</h3>\r\n\r\n<p>Instead of me babbling about how you can use your blog to market yourself, let&rsquo;s look at REAL a real case study.</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-04-at-11.18.10-PM.png\" style=\"height:396px; width:1226px\" /></p>\r\n\r\n<p>Do you know who&nbsp;<a href=\"https://twitter.com/codinghorror\" rel=\"noopener noreferrer\" target=\"_blank\">Jeff Atwood</a>&nbsp;is?</p>\r\n\r\n<p>If you are in the software industry and you don&rsquo;t know who Jeff Atwood is, then you have been living under a rock.</p>\r\n\r\n<p>Just in case let me tell you that Atwood, along with&nbsp;<a href=\"https://www.joelonsoftware.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Joel Spolsky,</a>&nbsp;is the founder of&nbsp;<a href=\"https://www.stackoverflow.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Stack Overflow</a>.</p>\r\n\r\n<p>Now I am damn sure you know what Stack Overflow is.</p>\r\n\r\n<p>If not, then you are definitely not ready to start a programming blog 🙂</p>\r\n\r\n<p>But you know what Jeff Atwood is actually known for?</p>\r\n\r\n<p>His blog,&nbsp;<a href=\"https://blog.codinghorror.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Coding Horror</a>, which he created in 2004 is one of the most popular programming blogs on the internet.</p>\r\n\r\n<p>Not only that, but his blog was the reason how he met Spolsky in the first place!</p>\r\n\r\n<p>Don&rsquo;t take it from me,&nbsp;<a href=\"https://blog.codinghorror.com/about-me/\" rel=\"noopener noreferrer\" target=\"_blank\">look at what Atwood himself says</a>:</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-01-at-10.02.51-PM.png\" style=\"height:172px; width:1464px\" /></p>\r\n\r\n<p>Your blog will open the doors for various networking and business opportunities that you might not find otherwise.</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/heckoverflow.jpg\" style=\"height:429px; width:618px\" /></p>\r\n\r\n<p><a href=\"https://www.reddit.com/r/ProgrammerHumor/comments/83vsie/heckoverflow/\" rel=\"noopener noreferrer\" target=\"_blank\">source</a></p>\r\n\r\n<h3>4. Learn how to write and present your ideas</h3>\r\n\r\n<p>Believe it or not but your software career heavily relies on how good you are at communicating and presenting your ideas.</p>\r\n\r\n<p>Don&rsquo;t get me wrong, If you are a rockstar programmer you will still do well but your career potential will definitely be limited by your ability to present and communicate your ideas.</p>\r\n\r\n<p>One of the many ways you can improve your communication skills is through&nbsp;<em>writing</em>.</p>\r\n\r\n<p>If you feel that you suck at writing in the beginning, this is more common than you think.</p>\r\n\r\n<p>Just keep at it and over time you will improve and get better.</p>\r\n\r\n<h3>5. Be an authority in your field</h3>\r\n\r\n<p>Having a Programming blog helps you build authority in your field.</p>\r\n\r\n<p>And being an authority helps you stand out among other software engineers and opens the doors for leadership roles.</p>\r\n\r\n<h3>6. Learn about online marketing</h3>\r\n\r\n<p>In order to have a successful blog, you will need to market it.</p>\r\n\r\n<p>Marketing your blog is actually not an easy task and requires you to learn a lot about online marketing.</p>\r\n\r\n<p>I find online marketing to be an extremely valuable skill that software engineers need to have in their repertoire.</p>\r\n\r\n<p>This in itself makes starting a blog a worthy goal in my opinion.</p>\r\n\r\n<hr />\r\n<h2>OK, Now How Can You Create a Programming Blog?</h2>\r\n\r\n<p>Now let&rsquo;s talk specifically about what you need to do to get your blog up and running&nbsp;<em>fast</em>.</p>\r\n\r\n<p>The first course of action is&nbsp;<em>choosing a web host</em>.</p>\r\n\r\n<h2>Step One: Choose a Web Host</h2>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/webhosting.png\" style=\"height:315px; width:560px\" /></p>\r\n\r\n<p>You are a programmer so I am going to assume you know what web hosting is and what purpose it serves.</p>\r\n\r\n<p>But just in case you don&rsquo;t, web hosting is essentially the computer (or computers) that will host the files that make your blog.</p>\r\n\r\n<p>A blog (or any website for that matter) is nothing but some files (e.g. HTML, javascript, CSS) living in a machine that is accessible from the internet.</p>\r\n\r\n<p>And this machine has to be on 24/7 or otherwise your users won&rsquo;t be able to access your site all the time.</p>\r\n\r\n<p>There are literally a ton of options out there for services that can host your website but I will narrow them down for you to the two options that I personally use and am extremely happy with.</p>\r\n\r\n<h3><strong>Option 1 (Choose convenience with&nbsp;<a href=\"https://www.bluehost.com/track/afternerd/\" rel=\"noopener noreferrer\" target=\"_blank\">Bluehost</a>)</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If you want to get started writing your blog right away and you don&rsquo;t want to spend your time doing some&nbsp;<strong>cool</strong>&nbsp;<strong>technical stuff</strong>&nbsp;then I highly recommend&nbsp;<a href=\"https://www.bluehost.com/track/afternerd/\" rel=\"noopener noreferrer\" target=\"_blank\">Bluehost</a>.</p>\r\n\r\n<p>Bluehost will make the process of creating your website and your blog unbelievably easy because their main target is non-technical people; people who probably never coded a&nbsp;<a href=\"https://www.afternerd.com/blog/hello-world/\" rel=\"noopener noreferrer\" target=\"_blank\">hello world program</a>&nbsp;in their life.</p>\r\n\r\n<p>You can only imagine how simple it is going to be for you.</p>\r\n\r\n<p>Now let&rsquo;s take a look at what Bluehost actually offers you.</p>\r\n\r\n<p>Bluehost offers different types of hosting.</p>\r\n\r\n<p>The one I am specifically talking about is called&nbsp;<strong>shared hosting.</strong></p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/shared.png\" style=\"height:800px; width:2072px\" /></p>\r\n\r\n<p>But before I tell you why I recommend shared hosting from Bluehost, let me first explain what each of these options means:</p>\r\n\r\n<p><strong>Shared hosting&nbsp;</strong>means that your website will live side by side with other websites on the same&nbsp;<a href=\"https://en.wikipedia.org/wiki/Virtual_machine\">virtual machine</a>. In other words, One virtual machine will be serving your site along with other sites at the same time.</p>\r\n\r\n<p><strong>VPS or Virtual Private Server&nbsp;</strong>is just a fancy word for a virtual machine. In this offer, you basically own an entire virtual machine and you have root access to it. You can connect remotely to this virtual machine, install applications, and do whatever you want as if you were working on your own laptop. Needless to say, this virtual machine will be serving your website and your website only.</p>\r\n\r\n<p><strong>Dedicated&nbsp;</strong>means that you will be renting an entire&nbsp;<em>physical</em>&nbsp;(not virtual) machine.</p>\r\n\r\n<p>Now let&rsquo;s go back to&nbsp;<em>shared hosting</em>.</p>\r\n\r\n<p>Shared hosting definitely has its advantages and disadvantages.</p>\r\n\r\n<p>The biggest advantage is that it is ridiculously cheap so it is an excellent choice especially if you are starting out or if you just want to play around and get comfortable with creating websites.</p>\r\n\r\n<p>But there are some major disadvantages.</p>\r\n\r\n<p>First, you lose control because you don&rsquo;t own the virtual machine that your blog is running on.</p>\r\n\r\n<p>Second, shared hosting is not going to be a viable option when your blog starts growing and a larger number of people start coming to your website.</p>\r\n\r\n<p>So what is the best course of action?</p>\r\n\r\n<p>Here is my strategy: for every website idea that you have, you should always start with a cheap&nbsp;<a href=\"https://www.bluehost.com/track/afternerd/\" rel=\"noopener noreferrer\" target=\"_blank\">Bluehost shared hosting</a>&nbsp;solution and as soon as you notice that your website is starting to get&nbsp;<strong>significant</strong>&nbsp;traffic, think about upgrading to a higher tier solution.</p>\r\n\r\n<p>Since I am comfortable with tech, I usually move my high-performing websites to&nbsp;<a href=\"https://www.digitalocean.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Digital Ocean</a>.</p>\r\n\r\n<h3><strong>Option 2 (Choose more control with&nbsp;<a href=\"https://m.do.co/c/8a415b68854f\" rel=\"noopener noreferrer\" target=\"_blank\">Digital Ocean</a>)</strong></h3>\r\n\r\n<p>Case in point:&nbsp;<strong>afternerd.com</strong>&nbsp;and two other websites that I own are running right now on Digital Ocean.</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-04-at-10.55.22-PM.jpg\" style=\"height:544px; width:2446px\" /></p>\r\n\r\n<p>Digital Ocean gives you a virtual machine that you have complete control over.</p>\r\n\r\n<p>You can remotely connect to that virtual machine as root and do whatever you want with it.</p>\r\n\r\n<p><strong>One important point:</strong>&nbsp;this is only for those of you who are comfortable with Linux, installing and configuring web servers, databases, etc&hellip;</p>\r\n\r\n<p>If you are not already familiar with these topics and you are not willing to learn, then I highly recommend&nbsp;<em>against</em>&nbsp;the VPS option in general (whether on Bluehost or Digital Ocean). You are better off using a higher-tier shared hosting from Bluehost.</p>\r\n\r\n<p>At the same time, since you are a software engineer, I can&rsquo;t stress enough the importance of the skills you will learn by creating your website from the ground up on a pure virtual machine.</p>\r\n\r\n<p>Now that you have your web host in place, let&rsquo;s pick a name for your website!</p>\r\n\r\n<hr />\r\n<h2>Step Two: Register your Domain Name</h2>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/domain_name.png\" style=\"height:315px; width:560px\" /></p>\r\n\r\n<p>In this step, you will be registering your&nbsp;<a href=\"https://en.wikipedia.org/wiki/Domain_name\" rel=\"noopener noreferrer\" target=\"_blank\">domain name</a>.</p>\r\n\r\n<p>To put it simply, your domain name is your website name</p>\r\n\r\n<p>For example, the domain name of this site is&nbsp;<strong>afternerd.com</strong></p>\r\n\r\n<p>But let&rsquo;s nerd out a little bit and explain how domain names actually work.</p>\r\n\r\n<p>Each computer on the internet has an address called an&nbsp;<em>IP address</em>.</p>\r\n\r\n<p>For example, to find out the IP address of&nbsp;<strong>google.com</strong>, you can do the following:</p>\r\n\r\n<pre>\r\n<code>$ dig +short google.com\r\n172.217.5.110</code></pre>\r\n\r\n<p>Notice that google.com actually has multiple IP addresses and this is just one of them.</p>\r\n\r\n<p>To be able to communicate with any machine over the internet, you need to know the IP address of that machine.</p>\r\n\r\n<p>So when you type&nbsp;<strong>&lsquo;google.com&rsquo;</strong>&nbsp;on your browser, your OS will automatically try to translate the name&nbsp;<strong>&lsquo;google.com&rsquo;</strong>&nbsp;to its IP address.</p>\r\n\r\n<p>This happens by querying something called a&nbsp;<em>DNS server</em>.</p>\r\n\r\n<p>You can think of a DNS server as a distributed database that is in charge of mapping&nbsp;<em>domain names</em>&nbsp;to&nbsp;<em>IP addresses</em>.</p>\r\n\r\n<p>Alright, now with this information in mind, here is what you are going to do in this step.</p>\r\n\r\n<p><em>1- reserve the domain name for yourself so that no one else can use it.</em></p>\r\n\r\n<p><em>2- configure the domain name to map to the IP address of the machine you have from your web host.</em></p>\r\n\r\n<h3>Where can you buy your domain name?</h3>\r\n\r\n<p>First, before you go shopping around, make sure to check if your host offers a free domain name.</p>\r\n\r\n<p>Sometimes hosting companies will offer you a free domain name for a year to&nbsp;incentivize you to host with them.</p>\r\n\r\n<p>For example, Bluehost gives you a free domain when you host with them.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Another thing you must know is that registering a domain name gives you ownership of that domain for only one year.</p>\r\n\r\n<p>So you will need to renew your registration every year to keep your domain alive.</p>\r\n\r\n<p>Otherwise, your domain name is gone! 😱😱</p>\r\n\r\n<p>Don&rsquo;t forget to do that&nbsp;<a href=\"https://www.politico.com/story/2015/12/jeb-bush-website-donald-trump-redirect-216501\" rel=\"noopener noreferrer\" target=\"_blank\">or bad things could happen 🙂</a>.</p>\r\n\r\n<p>It&rsquo;s only like 10 bucks a year anyways.</p>\r\n\r\n<p>Again you will find a ton of services that you can use to register your domain.</p>\r\n\r\n<p>Here are the only two that I use:</p>\r\n\r\n<h3><a href=\"https://www.namecheap.com/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>1- Namecheap</strong></a></h3>\r\n\r\n<p>Namecheap is an extremely popular choice simply because domains are very cheap compared to others.</p>\r\n\r\n<p>It has an amazing easy-to-use user interface and great customer support.</p>\r\n\r\n<p>To get started,&nbsp;<a href=\"https://www.namecheap.com/\" rel=\"noopener noreferrer\" target=\"_blank\">go to their website</a>&nbsp;and type in what domain name you want and hope it&rsquo;s not taken 🙂</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-06-at-10.13.02-PM.png\" style=\"height:916px; width:2474px\" /></p>\r\n\r\n<p>If you are lucky, your domain will be available and you can, and should, reserve it right away!</p>\r\n\r\n<p>Also make sure to pick a relatively short, easy to remember, and brand-able name for your website.</p>\r\n\r\n<p>Your domain name is your brand, so treat it as such.</p>\r\n\r\n<h3><a href=\"https://domains.google/#/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>2- Google Domains</strong></a></h3>\r\n\r\n<p>Another fantastic service that I frequently use these days is&nbsp;<a href=\"https://domains.google/\" rel=\"noopener noreferrer\" target=\"_blank\">Google domains</a>.</p>\r\n\r\n<p>It also has a very nice interface and is super easy to use.</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-06-at-10.19.19-PM.png\" style=\"height:466px; width:2102px\" /></p>\r\n\r\n<p>Whether you go with Namecheap or Google domains (or any other service for that matter), you will need to configure your domain name to map to your IP address.</p>\r\n\r\n<hr />\r\n<h2>Step Three: Install WordPress</h2>\r\n\r\n<p>Let&rsquo;s revise what you have so far.</p>\r\n\r\n<p>You have a machine from your<strong>&nbsp;web host</strong>&nbsp;that is connected to the internet 24/7 and is ready to serve your website.</p>\r\n\r\n<p>You also have a&nbsp;<strong>domain name</strong>&nbsp;so that people can visit your website by typing this domain name in their browsers.</p>\r\n\r\n<p>Now it&rsquo;s finally time to sit down, relax, and start writing your awesome blog posts.</p>\r\n\r\n<p>Being the cool programmer that you are, you roll up your sleeves and think to yourself: &ldquo;Finally! time to show off my HTML, CSS, and javascript skills&rdquo; 🙂</p>\r\n\r\n<p>Hmm well, not really.</p>\r\n\r\n<p>Even though I recommend learning HTML, CSS, and javascript whether you want to start your programming blog or not, let me stop you right there for a second.</p>\r\n\r\n<p>If you want to build your blog from scratch using HTML, CSS, and javascript, it would take you forever.</p>\r\n\r\n<p>Why reinvent the wheel?</p>\r\n\r\n<p>Use WordPress instead.</p>\r\n\r\n<p>WordPress is a platform that the vast majority of blogs on the internet are built on (including&nbsp;<strong>afternerd.com</strong>).</p>\r\n\r\n<p>Here is how the platform looks like.</p>\r\n\r\n<p><img alt=\"wordpress-snapshot\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-07-at-6.42.17-PM.png\" style=\"height:928px; width:2264px\" /></p>\r\n\r\n<p>As you can see, it has a very clean user interface.</p>\r\n\r\n<p>It is also reliable, free, open-source, and very convenient to use.</p>\r\n\r\n<p>With WordPress, you can literally publish your first article on the same day you sign up for your web host.</p>\r\n\r\n<p>Now let&rsquo;s see how you can install WordPress on Bluehost and on Digital Ocean.</p>\r\n\r\n<h3>WordPress on Bluehost</h3>\r\n\r\n<p>We talked before that with Bluehost you get&nbsp;<em>convenience</em>.</p>\r\n\r\n<p>Case in point, Bluehost doesn&rsquo;t require you to install WordPress. It comes&nbsp;<strong>preinstalled</strong>&nbsp;with your account.</p>\r\n\r\n<p><a href=\"https://www.bluehost.com/track/afternerd/\"><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2019-06-22-at-9.21.14-PM-1024x363.png\" style=\"height:363px; width:1024px\" /></a></p>\r\n\r\n<p>You can roll up your sleeves and start blogging right away!</p>\r\n\r\n<h3>WordPress on Digital Ocean</h3>\r\n\r\n<p>Digital Ocean is a whole different beast.</p>\r\n\r\n<p>Remember that with Digital Ocean you are getting control at the expense of convenience.</p>\r\n\r\n<p>This means that installing WordPress is actually the least of your worries.</p>\r\n\r\n<p>Before worrying about WordPress, you first need to install and configure a web server (<a href=\"https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04\" rel=\"noopener noreferrer\" target=\"_blank\">apache</a>&nbsp;or&nbsp;<a href=\"https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04\" rel=\"noopener noreferrer\" target=\"_blank\">nginx</a>).</p>\r\n\r\n<p>After that, you need to&nbsp;<a href=\"https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04\" rel=\"noopener noreferrer\" target=\"_blank\">install a MySQL database</a>&nbsp;and configure it correctly for WordPress.</p>\r\n\r\n<p>And finally, you need to&nbsp;<a href=\"https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-ubuntu-18-04\" rel=\"noopener noreferrer\" target=\"_blank\">manually install and configure WordPress</a>.</p>\r\n\r\n<p>Alternatively, Digital Ocean has a pre-made WordPress image that you can use right away.</p>\r\n\r\n<p><a href=\"https://www.digitalocean.com/community/tutorials/how-to-use-the-wordpress-one-click-install-on-digitalocean\" rel=\"noopener noreferrer\" target=\"_blank\">Check this article out if you want to install WordPress on Digital Ocean the easy way.</a></p>\r\n\r\n<hr />\r\n<h2>Step four: Setup WordPress Themes and Plugins</h2>\r\n\r\n<p>Now that you have all the tools you need under your belt, it&rsquo;s time to start getting comfortable with the WordPress platform.</p>\r\n\r\n<p>But don&rsquo;t worry, it is actually pretty basic and you can learn it on your own pretty fast in just a few hours.</p>\r\n\r\n<p>I recommend starting by writing a couple of blog posts until you get the hang of it.</p>\r\n\r\n<p>WordPress is actually very extensible.</p>\r\n\r\n<p>This means you can install third-party tools that can integrate with your WordPress site and help you with all sorts of things.</p>\r\n\r\n<p>For example,&nbsp;<em>WordPress themes</em>&nbsp;are meant to enhance the visuals of your blog.</p>\r\n\r\n<p><em>Plugins</em>, on the other hand,&nbsp;are meant to extend the functionality of your WordPress site.</p>\r\n\r\n<p>In the next section, I will talk about the themes and the plugins that you need for your programming blog.</p>\r\n\r\n<h3>Pick a WordPress Theme</h3>\r\n\r\n<p>Long story short, don&rsquo;t use free WordPress themes.</p>\r\n\r\n<p>Free themes are good when you are starting out and you don&rsquo;t know what you&rsquo;re doing but as soon as you decide to get serious then you will need to switch to better themes (which are usually not free).</p>\r\n\r\n<p>Remember that your theme dictates how visually appealing your site will be and this is something you don&rsquo;t want to skimp on&hellip;even for a technical blog.</p>\r\n\r\n<p>So what WordPress themes do I recommend?</p>\r\n\r\n<p><a href=\"https://www.elegantthemes.com/affiliates/idevaffiliate.php?id=53596&amp;url=51974\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>I highly recommend Divi</strong></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://www.elegantthemes.com/affiliates/idevaffiliate.php?id=53596&amp;url=51974\" rel=\"noopener noreferrer\" target=\"_blank\">Divi</a>&nbsp;is probably the most popular WordPress theme on the internet.</p>\r\n\r\n<p>To be able to download Divi, you need to join&nbsp;<a href=\"https://www.elegantthemes.com/affiliates/idevaffiliate.php?id=53596\" rel=\"noopener noreferrer\" target=\"_blank\">elegantthemes</a>.</p>\r\n\r\n<p>You can sign up for their annual subscription or their lifetime subscription.</p>\r\n\r\n<p>With a lifetime subscription, you only pay once and you get lifetime access to all their&nbsp;<strong>premium themes</strong>&nbsp;and&nbsp;<strong>plugins</strong>, including of course&nbsp;<em>Divi</em>.</p>\r\n\r\n<p>Do yourself a favor and do your own research before picking a theme, because migrating later can be really painful.</p>\r\n\r\n<p>Now let&rsquo;s switch gears and talk about the one fundamental plugin that you will absolutely need for any&nbsp;<em>programming</em>&nbsp;blog.</p>\r\n\r\n<p>The one that will allow you to write code snippets in your blog articles.</p>\r\n\r\n<h3>How to Write Code Snippets in your Blog</h3>\r\n\r\n<p>If you are an avid reader of afternerd, you know that I use a lot of code snippets in my articles.</p>\r\n\r\n<p>I mean, what is a programming blog without code anyways? 🙂</p>\r\n\r\n<p>Here is how code appears on my blog:</p>\r\n\r\n<pre>\r\n<code>def hello_msg(name):\r\n  if name is not None:\r\n    print(&#39;Hello &#39; + name)</code></pre>\r\n\r\n<p>And here is exactly how you can do the same in&nbsp;<em>your</em>&nbsp;programming blog.</p>\r\n\r\n<p>First, go ahead and install the&nbsp;<a href=\"https://wordpress.org/plugins/code-prettify/\" rel=\"noopener noreferrer\" target=\"_blank\">Code Prettify plugin</a>&nbsp;to your WordPress.</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/codeprettify.png\" style=\"height:822px; width:2382px\" /></p>\r\n\r\n<p>This plugin uses the&nbsp;<a href=\"https://github.com/google/code-prettify\" rel=\"noopener noreferrer\" target=\"_blank\">Google Code Prettify library</a>&nbsp;and is extremely easy to use.</p>\r\n\r\n<p>Afterwards, all you need to do is put your code between&nbsp;&lt;pre&gt;&nbsp;and&nbsp;&lt;code&gt;&nbsp;tags and it will magically format your code correctly.</p>\r\n\r\n<p>On afternerd, I also have some custom CSS that I apply to my code snippets to makes them look prettier.</p>\r\n\r\n<p>So this is something that you should experiment with.</p>\r\n\r\n<p>Now that everything is in place, let&rsquo;s talk about your logo!</p>\r\n\r\n<hr />\r\n<h2>Step five: Outsource your logo and graphic design</h2>\r\n\r\n<p>By now, you should have all the fundamental building blocks of your blog in place.</p>\r\n\r\n<p>But there is something missing.</p>\r\n\r\n<p>You need a logo.</p>\r\n\r\n<p>Your website has to be visually appealing.</p>\r\n\r\n<p>Having a professional, well-designed logo will not only enhance the aesthetics of your website but it will also build trust with your readers.</p>\r\n\r\n<p>Think about it, how many times have you been turned off by a website just because their logo and graphic design were a bit&hellip;sketchy? Probably many times.</p>\r\n\r\n<p>A good logo is an integral part of your overall personal or business branding, it helps you get noticed in the world and among your peers.</p>\r\n\r\n<p>Now I don&rsquo;t know about you but my artistic skills are pretty much non-existent 🙂</p>\r\n\r\n<p>And for that reason, here is what I do for all my logo designs and social media artwork:&nbsp;<strong>I outsource them</strong>.</p>\r\n\r\n<p>There are two places that I personally use to outsource any graphic design.</p>\r\n\r\n<h3>1. Fiverr</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://track.fiverr.com/visit/?bta=47859&amp;brand=fiverrcpa\" rel=\"noopener noreferrer\" target=\"_blank\">Fiverr</a>&nbsp;is one of the largest online marketplaces for freelancers with services starting at five dollars.</p>\r\n\r\n<p>It is definitely on the cheaper side, and the services offered on Fiverr include a wide variety of categories.</p>\r\n\r\n<p>And of course one of these categories is&nbsp;<a href=\"https://track.fiverr.com/visit/?bta=47859&amp;brand=fiverrcpa&amp;landingPage=https%3A%2F%2Fwww.fiverr.com%2Fcategories%2Fgraphics-design\" rel=\"noopener noreferrer\" target=\"_blank\">logo and graphic design, check it out</a>.</p>\r\n\r\n<p>One thing to consider if you decide to use Fiverr is to carefully check the reviews and work history of the freelancers you are willing to work with.</p>\r\n\r\n<p>Fiverr is relatively cheap, but it is your responsibility to vet the good freelancers from the bad ones.</p>\r\n\r\n<h3>2. 99designs</h3>\r\n\r\n<p><a href=\"https://99designs.com/\" rel=\"noopener noreferrer\" target=\"_blank\">99Designs</a>&nbsp;is another great option for outsourcing your graphic design.</p>\r\n\r\n<p>This option is going to be more expensive than Fiverr but the way it works is completely different.</p>\r\n\r\n<p>Instead of hiring a specific freelancer to design your logo, you create a design competition.</p>\r\n\r\n<p>After you create your design competition and clearly specify what kind of design you are looking for, tens of designers will compete with each other to win the competition by submitting designs that fit the criteria that you specified.</p>\r\n\r\n<p>You receive tons of designs, you decide the winner, and then you get the rights to the design.</p>\r\n\r\n<p>It is that simple!</p>\r\n\r\n<p>I&nbsp;have personally used 99designs multiple times including the design of the logo for this website.</p>\r\n\r\n<hr />\r\n<h2>Step six: Market your Programming Blog</h2>\r\n\r\n<p>You see, it is one thing to go through all the steps of creating your blog, it is another thing to actually bring readers to your blog.</p>\r\n\r\n<p>Marketing your blog requires a set of skills that has nothing to do with programming.</p>\r\n\r\n<p>You need to learn about&nbsp;<em>Online Marketing.</em></p>\r\n\r\n<p>Actually, online marketing is a huge topic and there is no way I can do the topic justice by covering it in one article.</p>\r\n\r\n<p>However, I am going to teach you some tips that will help you promote your blog and get it off the ground.</p>\r\n\r\n<h3>Social Media</h3>\r\n\r\n<p>The easiest thing you could do is to share your blog articles with your friends on&nbsp;<em>Facebook</em>,&nbsp;<em>Twitter</em>, or&nbsp;<em>Linkedin</em>.</p>\r\n\r\n<p>You can also share your articles on&nbsp;<em>Reddit</em>&nbsp;but be aware that Reddit users hate self-promotion and promotion in general. So share your articles on Reddit only if they are relevant (for example, someone asks a programming question that you already wrote an article about).</p>\r\n\r\n<p>Also, you can answer questions on&nbsp;<em>Quora</em>. This way not only will you be promoting your blog, but you will also be establishing yourself as an authority all while helping other people out.</p>\r\n\r\n<h3>SEO</h3>\r\n\r\n<p>SEO means&nbsp;<em>Search Engine Optimization.</em></p>\r\n\r\n<p>In English, this means getting traffic to your website from Google 🙂</p>\r\n\r\n<p>This is hands down the best source of traffic to your blog because most of your&nbsp;<em>consistent</em>&nbsp;traffic will actually come from Google.</p>\r\n\r\n<p>Instead of you actively promoting your blog, Google can promote your blog on your behalf if Google thinks that your article answers questions that users are searching for.</p>\r\n\r\n<p>This is amazing! But don&rsquo;t get me wrong, it is not easy and it takes time.</p>\r\n\r\n<p>You see, when users search on Google, they typically click on one of the first 4 results!</p>\r\n\r\n<p>The lower you are in the ranking, the less likely users will visit your page.</p>\r\n\r\n<p>If you are on the second page of Google, you&rsquo;ll probably get no traffic whatsoever. Trust me, I know 🙂</p>\r\n\r\n<p><img alt=\"\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/seo.jpg\" style=\"height:287px; width:500px\" /></p>\r\n\r\n<p>Now here are&nbsp;<em>three tips</em>&nbsp;to help you with SEO:</p>\r\n\r\n<p><strong>1. Write articles about topics that people are searching for</strong></p>\r\n\r\n<p>Let&rsquo;s face it, not every topic you will want to write about is something that other people are going to be searching for.</p>\r\n\r\n<p>To succeed, you need to make sure that you are writing articles about topics that people are already searching for.</p>\r\n\r\n<p>You can use tools like&nbsp;<a href=\"https://ads.google.com/home/tools/keyword-planner/\" rel=\"noopener noreferrer\" target=\"_blank\">Google&rsquo;s keyword planner</a>&nbsp;to help you identify topics that people are searching for.</p>\r\n\r\n<p><img alt=\"google-keyword-planner\" src=\"https://d6x8u9i2.rocketcdn.me/blog/wp-content/uploads/2018/09/Screen-Shot-2018-09-01-at-7.21.46-PM.png\" style=\"height:882px; width:1654px\" /></p>\r\n\r\n<p>But wait a minute, does that mean you shouldn&rsquo;t write about topics you are passionate about if these topics don&rsquo;t have enough search volume?</p>\r\n\r\n<p><em>Absolutely not.</em></p>\r\n\r\n<p>What I am saying is that you will most likely need to rely on other methods of promoting this type of articles outside of Google.</p>\r\n\r\n<p>For example, you can use social media, Reddit,&nbsp;<a href=\"https://news.ycombinator.com/\" rel=\"noopener noreferrer\" target=\"_blank\">hacker news</a>, or even link to these articles from other SEO-friendly articles on your blog ;).</p>\r\n\r\n<p><strong>2. Write evergreen articles</strong></p>\r\n\r\n<p>Most of your articles should be&nbsp;<em>evergreen</em>.</p>\r\n\r\n<p>By evergreen, I mean articles that are going to be relevant for a long period of time.</p>\r\n\r\n<p>For example, writing an article about&nbsp;<strong>&ldquo;Python Generators&rdquo;</strong>&nbsp;is definitely more evergreen than writing an article about&nbsp;<strong>&ldquo;What&rsquo;s new in Python 3.6&rdquo;</strong>.</p>\r\n\r\n<p>The reason is that evergreen articles are a better investment of your time because these will keep bringing new readers to your blog for years and years to come whereas non-evergreen articles will only be relevant for a shorter period of time.</p>\r\n\r\n<p><strong>3. Write amazing articles</strong></p>\r\n\r\n<p>This is actually crucial.</p>\r\n\r\n<p>Honestly, Google is doing an amazing job bringing the best articles to the top of their search results (most of the time).</p>\r\n\r\n<p>This means that you should focus on writing articles that are better than those of your competition.</p>\r\n\r\n<p>If you do that, you will be fine. It is really that simple. Quality over quantity.</p>\r\n\r\n<p>One final thing, be patient.</p>\r\n\r\n<p>Sometimes it can take up to 6 months before a new article on your blog can bring any traffic from Google.</p>\r\n\r\n<p>SEO is a marathon, not a sprint, but if you actually enjoy writing and teaching people about programming and computer science, then being patient isn&rsquo;t going to be that hard.</p>\r\n\r\n<h2>Conclusion</h2>\r\n\r\n<p>Starting a programming blog can be very useful for you on so many levels.</p>\r\n\r\n<p>To be able to start blogging right away, you need to pick a good web host, a brandable domain name, a visually appealing WordPress theme, and install some plugins that will help you with writing code snippets in your blog.</p>\r\n\r\n<p>You also need to learn about the art and science of promoting your blog, whether through SEO or social media.</p>\r\n\r\n<p>Good luck with your blog 🙂</p>', '2022-08-05 02:41:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_categories`
--

CREATE TABLE `blog_post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_name_en` varchar(255) NOT NULL,
  `blog_category_slug_en` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_post_categories`
--

INSERT INTO `blog_post_categories` (`id`, `blog_category_name_en`, `blog_category_slug_en`, `created_at`, `updated_at`) VALUES
(1, 'CSE', 'cse', '2022-08-05 02:40:13', NULL),
(2, 'Programming', 'programming', '2022-08-05 02:40:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name_en` varchar(255) NOT NULL,
  `brand_slug_en` varchar(255) NOT NULL,
  `brand_image` varchar(255) NOT NULL,
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
(7, 'Razer', 'razer', 'upload/brand/1739474711599397.png', NULL, NULL),
(8, 'Asus', 'asus', 'upload/brand/1740245081015510.jpg', NULL, NULL),
(9, 'Samsung', 'samsung', 'upload/brand/1740248679083461.png', NULL, NULL),
(10, 'RockStar', 'rockstar', 'upload/brand/1740248992309369.png', NULL, NULL),
(11, 'Automobile', 'automobile', 'upload/brand/1740249113022421.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name_en` varchar(255) NOT NULL,
  `category_slug_en` varchar(255) NOT NULL,
  `category_icon` varchar(255) NOT NULL,
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
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_validity` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `coupon_discount`, `coupon_validity`, `status`, `created_at`, `updated_at`) VALUES
(2, 'NEW', 10, '2022-08-31', 1, '2022-08-04 23:43:09', NULL),
(3, 'AWESOME', 95, '2022-08-06', 1, '2022-08-05 02:55:06', NULL);

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
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(2, 3, 'upload/products/multi-image/1739476970953534.jpg', '2022-07-26 22:01:51', NULL),
(3, 3, 'upload/products/multi-image/1739476971250380.jpg', '2022-07-26 22:01:51', NULL),
(4, 11, 'upload/products/multi-image/1740245244009856.jpg', '2022-08-04 09:33:13', NULL),
(5, 11, 'upload/products/multi-image/1740245244464149.jpg', '2022-08-04 09:33:14', NULL),
(6, 11, 'upload/products/multi-image/1740245244760208.jpg', '2022-08-04 09:33:14', NULL),
(7, 11, 'upload/products/multi-image/1740245244972338.jpg', '2022-08-04 09:33:14', NULL),
(8, 11, 'upload/products/multi-image/1740245245168881.jpg', '2022-08-04 09:33:14', NULL),
(9, 12, 'upload/products/multi-image/1740245770620175.jpg', '2022-08-04 09:41:35', NULL),
(10, 12, 'upload/products/multi-image/1740245770812132.jpg', '2022-08-04 09:41:36', NULL),
(11, 12, 'upload/products/multi-image/1740245770982518.jpg', '2022-08-04 09:41:36', NULL),
(12, 12, 'upload/products/multi-image/1740245771100213.jpg', '2022-08-04 09:41:36', NULL),
(13, 12, 'upload/products/multi-image/1740245771220074.jpg', '2022-08-04 09:41:36', NULL),
(14, 12, 'upload/products/multi-image/1740245771333107.jpg', '2022-08-04 09:41:36', NULL),
(15, 12, 'upload/products/multi-image/1740245771470951.jpg', '2022-08-04 09:41:36', NULL),
(16, 13, 'upload/products/multi-image/1740246038059523.jpg', '2022-08-04 09:45:51', NULL),
(17, 13, 'upload/products/multi-image/1740246038356590.jpg', '2022-08-04 09:45:51', NULL),
(18, 13, 'upload/products/multi-image/1740246038606562.jpg', '2022-08-04 09:45:51', NULL),
(19, 13, 'upload/products/multi-image/1740246038768065.jpg', '2022-08-04 09:45:51', NULL),
(20, 13, 'upload/products/multi-image/1740246038986839.jpg', '2022-08-04 09:45:51', NULL),
(21, 13, 'upload/products/multi-image/1740246039215984.jpg', '2022-08-04 09:45:52', NULL),
(22, 14, 'upload/products/multi-image/1740248592403681.jpg', '2022-08-04 10:26:26', NULL),
(23, 14, 'upload/products/multi-image/1740248592593835.jpg', '2022-08-04 10:26:27', NULL),
(24, 14, 'upload/products/multi-image/1740248592818340.jpg', '2022-08-04 10:26:27', NULL),
(25, 15, 'upload/products/multi-image/1740248919334330.jpg', '2022-08-04 10:31:38', NULL),
(26, 15, 'upload/products/multi-image/1740248919598389.jpg', '2022-08-04 10:31:39', NULL),
(27, 15, 'upload/products/multi-image/1740248919871418.jpg', '2022-08-04 10:31:39', NULL),
(28, 15, 'upload/products/multi-image/1740248920142343.jpg', '2022-08-04 10:31:39', NULL),
(29, 15, 'upload/products/multi-image/1740248920365380.jpg', '2022-08-04 10:31:39', NULL),
(30, 16, 'upload/products/multi-image/1740249222794665.jpg', '2022-08-04 10:36:28', NULL),
(31, 17, 'upload/products/multi-image/1740249883357603.jpg', '2022-08-04 10:46:58', NULL),
(32, 18, 'upload/products/multi-image/1740250181441202.jpg', '2022-08-04 10:51:42', NULL),
(33, 18, 'upload/products/multi-image/1740250181586411.jpg', '2022-08-04 10:51:42', NULL),
(34, 19, 'upload/products/multi-image/1773723330934514.webp', '2023-08-08 22:13:05', NULL),
(35, 19, 'upload/products/multi-image/1773723331316941.jpg', '2023-08-08 22:13:05', NULL),
(36, 19, 'upload/products/multi-image/1773723331488514.jpg', '2023-08-08 22:13:05', NULL);

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
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `post_code` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `payment_type` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_month` varchar(255) NOT NULL,
  `order_year` varchar(255) NOT NULL,
  `confirmed_date` varchar(255) DEFAULT NULL,
  `processing_date` varchar(255) DEFAULT NULL,
  `picked_date` varchar(255) DEFAULT NULL,
  `shipped_date` varchar(255) DEFAULT NULL,
  `delivered_date` varchar(255) DEFAULT NULL,
  `cancel_date` varchar(255) DEFAULT NULL,
  `return_order` varchar(255) DEFAULT NULL,
  `return_date` varchar(255) DEFAULT NULL,
  `return_reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `division_id`, `district_id`, `state_id`, `name`, `email`, `phone`, `post_code`, `notes`, `payment_type`, `payment_method`, `transaction_id`, `currency`, `amount`, `order_number`, `invoice_no`, `order_date`, `order_month`, `order_year`, `confirmed_date`, `processing_date`, `picked_date`, `shipped_date`, `delivered_date`, `cancel_date`, `return_order`, `return_date`, `return_reason`, `status`, `created_at`, `updated_at`) VALUES
(6, 1, 2, 3, 8, 'Md Najib Islam', 'user@gmail.com', '01537500950', 4200, 'Safely', 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 15.00, NULL, 'EOS96095687', '05 August 2023', 'August', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'confirm', '2022-08-05 02:29:05', '2023-08-08 22:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `qty` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `color`, `size`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(4, 6, 15, 'Black', 'Midium', '1', 14.00, '2022-08-05 02:29:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `product_name_en` varchar(255) NOT NULL,
  `product_slug_en` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_qty` varchar(255) NOT NULL,
  `product_tags_en` varchar(255) DEFAULT NULL,
  `product_size_en` varchar(255) DEFAULT NULL,
  `product_color_en` varchar(255) DEFAULT NULL,
  `selling_price` varchar(255) NOT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `short_descp_en` text NOT NULL,
  `long_descp_en` text NOT NULL,
  `product_thambnail` varchar(255) NOT NULL,
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
(11, 8, 3, 10, 15, 'ROG Strix G10 Gaming Desktop PC', 'rog-strix-g10-gaming-desktop-pc', 'B09LCC5QWS', '100', 'ROG,ROG Strix G10 Gaming Desktop PC,ROG Strix,Gaming Desktop,ROG Strix G10', 'Large Casing,Extra Large Casing', 'Black,White', '1449', '1129', 'ROG Strix G10 Gaming Desktop PC, Intel Core i7-11700, GeForce RTX 3060, 16GB DDR4 RAM, 1TB PCIe SSD, Wi-Fi 5, Windows 11 Home, G10CE-AH766', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Personal computer design type</td>\r\n			<td>Computer Tower</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Specific Uses For Product</td>\r\n			<td>Personal, Gaming, Business</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Series</td>\r\n			<td>ROG Strix G10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ram Memory Installed Size</td>\r\n			<td>16 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Windows 11 Home</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU Model</td>\r\n			<td>Intel Core i7-11700</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>ASUS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU Manufacturer</td>\r\n			<td>Intel</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Year</td>\r\n			<td>2021</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Human Interface Input</td>\r\n			<td>Mouse, Keyboard</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>HYPERREALISM. IT&rsquo;S ON - Reach another level of pc gaming realism with the powerful 11th Gen Intel Core i7-1170 processor and NVIDIA GeForce RTX 3060 (12GB) graphics with the visual fidelity of real-time ray tracing and the ultimate performance of AI-powered DLSS.</li>\r\n	<li>JUMP INTO THE GAME &ndash; This gaming pc allows you to store all your game library in its a high-performance 1TB M.2 PCIe SSD with Optane Memory Boosts while also boasting a 16GB DDR4 RAM to speed up game load times.</li>\r\n	<li>HEAR EVERYTHING - Featuring DTS Headphone:X technology, this gaming desktop delivers immersive high-fidelity 7.1-channel virtual surround sound for home theater-quality audio through your pc gaming headsets.</li>\r\n	<li>MAKE THEM STARE &ndash; This 27 liters gaming computer puts critical components into a compact body and boasts a transparent side panel to see the internals illuminated by the glow of 20 LEDs powered by Aura Sync.</li>\r\n	<li>STAY COOL &ndash; Our prebuilt gaming PC&#39;s thermal design features two isolated air chambers preventing heat from the CPU and GPU from warming up the power supply unit and storage drives.</li>\r\n	<li>UNMATCHED DURABILITY - The Strix G10CE has undergone a series of rigorous quality tests, including drop and vibration, thermal, noise, and voltage testing to ensure it meets our exacting standards, and surpasses other gaming pc desktops.</li>\r\n	<li>FEEL THE CONNECTION &ndash; This gaming pc desktop gives you quick and easy access to all the essentials, with two USB 3.1 Gen 1 ports and an audio combo jack in the front. Everything else you need, including the additional USB 3.2 Gen 1 ports, Gigabit Ethernet, and HDMI output, are right where you expect them to be.</li>\r\n</ul>', 'upload/products/thambnail/1740245243803260.jpg', NULL, 1, NULL, NULL, 1, NULL, NULL),
(12, 8, 3, 9, 18, 'Asus ROG Phone 5', 'asus-rog-phone-5', 'B08BZ68VPJ', '500', 'Asus ROG Phone 5', '128GB,256GB,512GB,1TB', 'White', '759', '749', 'Asus ROG Phone 5 ZS673KS / I005DA 5G Dual 128GB 12GB RAM Factory Unlocked (GSM Only | No CDMA - not Compatible with Verizon/Sprint) Tencent Games Google Play Installed - Phantom Black', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Wireless Carrier</td>\r\n			<td>Unlocked for All Carriers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>ASUS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Form Factor</td>\r\n			<td>5G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Android 11</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>5G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SIM card slot count</td>\r\n			<td>Dual SIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Year</td>\r\n			<td>2021</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Included Components</td>\r\n			<td>USB Cable</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Screen Size</td>\r\n			<td>1.77 Inches</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Product Description</h2>\r\n\r\n<p>Asus ROG Phone 5 ZS673KS / I005DA 5G Dual 256GB 16GB RAM Factory Unlocked (GSM Only | No CDMA - not Compatible with Verizon/Sprint) Tencent Games Google Play Installed - Phantom Black The Qualcomm Snapdragon 888 5G Mobile Platform Takes Mobile Processing Power to a New Level. With a Stunning 35% Increase in Rendering Performance, Even the Most Demanding 3D Games run Smoothly with Maxed-out Settings. The all-new Performance Manager in Armoury Crate Now Packs the Renowned X Mode, With Multiple System Profiles to Give You Even More Performance Settings and Performance Tuning Tools, so You Can Instantly Adapt ROG Phone 5 to the Task at Hand. Constant and Reliable Wireless Connections are Vital for Multiplayer Games. ROG Phone 5 is one of the First Devices with WiFi 6E7 Support, Which Delivers Much More Stable Connections Even in Crowded Networks. The Multiple Antenna Setup with Upgraded HyperFusion Technology Allows Simultaneous Connections to WiFi and the Mobile Network, with Intelligent Redirection to Whichever Has the Best Signal. Pair Your ROG Phone 5 With an ASUS WiFi 6E Router to Experience the full Networking Potential of WiFi 6E.</p>', 'upload/products/thambnail/1740245770151421.jpg', 1, NULL, NULL, 1, 1, NULL, NULL),
(13, 4, 3, 11, 22, '2021 Apple 11-inch iPad Pro', '2021-apple-11-inch-ipad-pro', 'B0932275HY', '100', 'IPAD,IPAD PRO', '128GB,256GB,512GB', 'Black,Silver', '999', '998', '2021 Apple 11-inch iPad Pro (Wi-Fi + Cellular, 128GB)', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Model Name</td>\r\n			<td>IPad Pro</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Screen Size</td>\r\n			<td>11 Inches</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>IPadOS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Apple M1 chip for next-level performance</li>\r\n	<li>Stunning 11-inch Liquid Retina display with ProMotion, True Tone, and P3 wide color</li>\r\n	<li>TrueDepth camera system featuring Ultra Wide front camera with Center Stage</li>\r\n	<li>12MP Wide camera, 10MP Ultra Wide camera, and LiDAR Scanner for immersive AR</li>\r\n	<li>5G for superfast downloads and high-quality streaming</li>\r\n	<li>Stay connected with ultrafast Wi-Fi</li>\r\n	<li>Go further with all-day battery life</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Thunderbolt port for connecting to fast external storage, displays, and docks</li>\r\n	<li>Face ID for secure authentication and Apple Pay</li>\r\n	<li>Four speaker audio and five studio-quality microphones</li>\r\n</ul>', 'upload/products/thambnail/1740246037813645.jpg', 1, 1, 1, 1, 1, NULL, NULL),
(14, 9, 4, 12, 25, 'Weatherized TVs Elite Converted Samsung 7', 'weatherized-tvs-elite-converted-samsung-7', 'B087JJXB7G', '3', 'Lorem,Ipsum,Amet', 'Small,Midium', 'Black,Silver', '1449', '1229', 'Weatherized TVs Elite Converted Samsung 7 Series Full Protection 65 Inch 4K LED HDR Outdoor Smart UHDTV - 65WTS', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Screen Size</td>\r\n			<td>65 Inches</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Supported Internet Services</td>\r\n			<td>Netflix, Amazon Instant Video, YouTube</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Connectivity Technology</td>\r\n			<td>Bluetooth, Wi-Fi, USB, HDMI</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Weatherized TVs</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Resolution</td>\r\n			<td>4K</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display Technology</td>\r\n			<td>LED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Refresh Rate</td>\r\n			<td>120 Hz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Item Weight</td>\r\n			<td>45 Pounds</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wireless Communication Technology</td>\r\n			<td>Bluetooth, Wi-Fi</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Specialized hydrophobic treatment repels water, protecting your TV from moisture, corrosion, and rain</li>\r\n	<li>Super bright LED screen presents vivid colors even in full sunlight exposure</li>\r\n	<li>High Dynamic Range (HDR) provides the greatest contrast between the darkest blacks and brightest whites</li>\r\n	<li>Smart hub provides all your favorite apps in one place, making this an all-in-one entertainment center</li>\r\n	<li>Bluetooth/Wi-Fi plus Alexa/Google Assistant compatibility provide extra convenience and connectivity</li>\r\n</ul>\r\n\r\n<p>Note:&nbsp;Products with electrical plugs are designed for use in the US. Outlets and voltage differ internationally and this product may require an adapter or converter for use in your destination. Please check compatibility before purchasing.</p>', 'upload/products/thambnail/1740248592185180.jpg', NULL, 1, 1, 1, 1, '2022-08-04 10:28:15', '2022-08-04 10:28:15'),
(15, 10, 5, 8, 11, 'Grand Theft Auto V Premium Edition Playstation 4', 'grand-theft-auto-v-premium-edition-playstation-4', 'B09LCC5QWS', '500', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'red,Black,Amet', '19', '14', 'GRAND THEFT AUTO V: When a young street hustler, a retired bank robber and a terrifying psychopath land themselves in trouble, they must pull off a series of dangerous heists to survive in a city in which they can trust nobody, least of all each other.', '<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>GRAND THEFT AUTO V: When a young street hustler, a retired bank robber and a terrifying psychopath land themselves in trouble, they must pull off a series of dangerous heists to survive in a city in which they can trust nobody, least of all each other.</li>\r\n	<li>GRAND THEFT AUTO ONLINE: Discover an ever-evolving world of choices and ways to play as you climb the criminal ranks of Los Santos and Blaine County in the ultimate shared Online experience.</li>\r\n	<li>THE CRIMINAL ENTERPRISE STARTER PACK: The Criminal Enterprise Starter Pack is the fastest way for new GTA Online players to jumpstart their criminal empires with the most exciting and popular content plus 1,000,000 dollars bonus cash to spend in GTA Online - all content valued at over GTA 10,000,000 dollares if purchased separately.</li>\r\n</ul>', 'upload/products/thambnail/1740248918734389.jpg', 1, 1, 1, 1, 1, '2022-08-04 10:33:19', '2022-08-04 10:33:19'),
(16, 11, 7, 2, 4, 'Motor Trend (formerly Automobile)', 'motor-trend-(formerly-automobile)', 'B086HH8XYC', '1', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'red,Black,Amet', '199999', '198799', 'Motor Trend (formerly Automobile)', '<ul>\r\n	<li>Kindle paid subscriptions come with a risk-free FREE period after which the subscription starts.&nbsp;<a href=\"https://www.amazon.com/gp/help/customer/display.html?_encoding=UTF8&amp;ref=kinw_subs_lrnmore&amp;nodeId=201265770\">Learn more about subscriptions</a>.</li>\r\n	<li>A Kindle paid subscription to this magazine will automatically renew until you decide to cancel. For subscriptions with terms of 6 months or longer, or where otherwise required by law, Amazon will send you a renewal notice via email before your subscription expires and notify you of the rate at which your subscription will renew. Amazon will renew on your behalf at the lowest renewal rate then available to Amazon.com customers at the time of renewal. We will send you a notification if the renewal price changes. You may change your credit card, address information or cancel your subscription before the renewal order is placed.&nbsp;<a href=\"https://www.amazon.com/gp/help/customer/display.html?_encoding=UTF8&amp;nodeId=201265770#GUID-C5D3260E-5CFC-422C-B5A6-CF0D6FCF8F95\">Learn more about auto-renewal</a>.</li>\r\n</ul>', 'upload/products/thambnail/1740249222652925.jpg', NULL, 1, 1, NULL, 1, '2022-08-04 10:52:26', '2022-08-04 10:52:26'),
(17, 11, 7, 3, 3, 'Suzuki Hayate EP', 'suzuki-hayate-ep', 'B094W8Y46N', '10', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'red,Black,Amet', '1999', '1499', 'Suzuki Hayate EP Price in Bangladesh is Tk 105,950.00. Hayate EP powered by 113 cc which generates Maximum power 8.7Ps @ 7500rpm and its maximum torque is 9.3Nm @ 5000rpm. Suzuki Hayate EP mileage is 70 KM per Liter (approx). Click Here to find Suzuki motorcycle showroom near you.', '<h2>Hayate EP Specifications</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Bike Name</td>\r\n			<td>Suzuki Hayate EP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td><a href=\"https://www.motorcyclevalley.com/brand/suzuki/\" title=\"Standard Bike\">Suzuki</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bike Category</td>\r\n			<td><a href=\"https://www.motorcyclevalley.com/type/standard/\" title=\"Standard Bike\">Standard</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand Origin</td>\r\n			<td>Japan</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Assemble/Made in</td>\r\n			<td>Bangladesh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><img src=\"https://www.motorcyclevalley.com/images/icon/power-performance.png\" style=\"width:35px\" />&nbsp;Hayate EP Engine</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>4 -Stroke,1-Cylinder, Air cooled, SOHC, 2 Valve</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Displacement (cc)</td>\r\n			<td>113</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Max Power</td>\r\n			<td>8.7Ps @ 7500rpm<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/power-converter/\" target=\"_blank\" title=\"Max Power Converter\"><strong>(Max Power Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Max Torque</td>\r\n			<td>9.3Nm @ 5000rpm<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/torque-converter/\" target=\"_blank\" title=\"Max Torque Converter\"><strong>(Max Torque Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Top Speed</td>\r\n			<td>100 KM/H (Approx)<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/speed-converter/\" target=\"_blank\" title=\"Speed Converter\"><strong>(Speed Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mileage (Company)</td>\r\n			<td>70 KM/L (Approx)<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/volume-converter/\" target=\"_blank\" title=\"Fuel Measure Converter\"><strong>(Fuel Measure Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mileage (user)</td>\r\n			<td>60 KM/L (Approx)<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/volume-converter/\" target=\"_blank\" title=\"Fuel Measure Converter\"><strong>(Fuel Measure Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bore x Stroke</td>\r\n			<td>51.0 x 55.3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cooling</td>\r\n			<td>Air Cooled</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Starting Method</td>\r\n			<td>Electric &amp; Kick</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gears</td>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Clutch</td>\r\n			<td>Wet Type Multiplate</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Hayate EP Engine Oil</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Oil Capacity (Liter)</td>\r\n			<td>.85</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mineral</td>\r\n			<td>10W-40</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>Suggested</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img src=\"https://www.motorcyclevalley.com/images/engine-oils/brands/repsol.jpg\" style=\"height:50px; width:100px\" /><br />\r\n	<strong>Moto Rider 10W-40</strong><br />\r\n	Mineral</p>\r\n	</li>\r\n</ul>\r\n\r\n<table style=\"width:100%\">\r\n</table>\r\n\r\n<h2>Hayate EP Body</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimension (LxWxH)</td>\r\n			<td>2025x740x1060</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Seat Height</td>\r\n			<td>795</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wheel Base (mm)</td>\r\n			<td>1305</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ground Clearance (mm)</td>\r\n			<td>165</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fuel Tank Capacity (L)</td>\r\n			<td>10<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/volume-converter/\" target=\"_blank\" title=\"Fuel Measure Converter\"><strong>(Fuel Measure Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kerb Weight (KG)</td>\r\n			<td>107<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/mass-converter/\" target=\"_blank\" title=\"Mass Converter\"><strong>(Weight Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Suspension Front</td>\r\n			<td>Telescopic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Suspension Rear</td>\r\n			<td>Dual 5-step adjustable</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brake Front</td>\r\n			<td>Drum</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brake Rear</td>\r\n			<td>Drum</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wheel Front</td>\r\n			<td>Alloy</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wheel Rear</td>\r\n			<td>Alloy</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tyre Front</td>\r\n			<td>70/100 -17 - Tubeless</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tyre Rear</td>\r\n			<td>80/100 -17 - Tubeless</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Hayate EP Electricals</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>Maintenance Free 12 V, 3Ah</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Head Lamp</td>\r\n			<td>12V 35/35W</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tail Lamp</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trun Lamp</td>\r\n			<td>Clear Lense</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Hayate EP Extra Features</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Glass Sparkle Black, Pearl Mira Red, Metallic Oork Grey</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Hayate EP Price/Availability</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>Tk. 105950</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Search</td>\r\n			<td>300,013 times</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'upload/products/thambnail/1740249883198636.jpg', 1, NULL, 1, 1, 1, NULL, NULL),
(18, 11, 7, 3, 3, 'Yamaha MT 15', 'yamaha-mt-15', 'B07B44DTJY', '15', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'red,Black,Amet', '3899', '3299', 'Yamaha MT 15 Price in Bangladesh is Tk 430,000.00. MT 15 powered by 155 cc which generates Maximum power 19 bhp @ 10,000 rpm and its maximum torque is 14.7 Nm @ 8500 rpm. Yamaha MT 15 mileage is 45 KM per Liter (approx). Click Here to find Yamaha motorcycle showroom near you.', '<h2>MT 15 Specifications</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Bike Name</td>\r\n			<td>Yamaha MT 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td><a href=\"https://www.motorcyclevalley.com/brand/yamaha/\" title=\"Sports Bike\">Yamaha</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bike Category</td>\r\n			<td><a href=\"https://www.motorcyclevalley.com/type/sports/\" title=\"Sports Bike\">Sports</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand Origin</td>\r\n			<td>Japan</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Assemble/Made in</td>\r\n			<td>India</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><img src=\"https://www.motorcyclevalley.com/images/icon/power-performance.png\" style=\"width:35px\" />&nbsp;MT 15 Engine</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>Single Cylinder, 4-Stroke, 4-Valve, SOHC</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Displacement (cc)</td>\r\n			<td>155</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Max Power</td>\r\n			<td>19 bhp @ 10,000 rpm<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/power-converter/\" target=\"_blank\" title=\"Max Power Converter\"><strong>(Max Power Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Max Torque</td>\r\n			<td>14.7 Nm @ 8500 rpm<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/torque-converter/\" target=\"_blank\" title=\"Max Torque Converter\"><strong>(Max Torque Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Top Speed</td>\r\n			<td>0 KM/H (Approx)<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/speed-converter/\" target=\"_blank\" title=\"Speed Converter\"><strong>(Speed Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mileage (Company)</td>\r\n			<td>45 KM/L (Approx)<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/volume-converter/\" target=\"_blank\" title=\"Fuel Measure Converter\"><strong>(Fuel Measure Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mileage (user)</td>\r\n			<td>40 KM/L (Approx)<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/volume-converter/\" target=\"_blank\" title=\"Fuel Measure Converter\"><strong>(Fuel Measure Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bore x Stroke</td>\r\n			<td>58x58.7</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fuel System</td>\r\n			<td>Fuel Injection</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Compression Ratio</td>\r\n			<td>11.6:1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cooling</td>\r\n			<td>Liquid Cooled</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Starting Method</td>\r\n			<td>Electric</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ignition Type</td>\r\n			<td>TCI</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gears</td>\r\n			<td>6</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Clutch</td>\r\n			<td>Slipper Clutch</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>MT 15 Engine Oil</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Mineral</td>\r\n			<td>10W-40</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>Suggested</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img src=\"https://www.motorcyclevalley.com/images/engine-oils/brands/repsol.jpg\" style=\"height:50px; width:100px\" /><br />\r\n	<strong>Moto Rider 10W-40</strong><br />\r\n	Mineral</p>\r\n	</li>\r\n</ul>\r\n\r\n<table style=\"width:100%\">\r\n</table>\r\n\r\n<h2>MT 15 Body</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimension (LxWxH)</td>\r\n			<td>1965x800x1065</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Seat Height</td>\r\n			<td>810</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wheel Base (mm)</td>\r\n			<td>1335</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fuel Tank Capacity (L)</td>\r\n			<td>10<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/volume-converter/\" target=\"_blank\" title=\"Fuel Measure Converter\"><strong>(Fuel Measure Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kerb Weight (KG)</td>\r\n			<td>138<br />\r\n			<a href=\"https://www.motorcyclevalley.com/info/mass-converter/\" target=\"_blank\" title=\"Mass Converter\"><strong>(Weight Converter)</strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Suspension Front</td>\r\n			<td>Telescopic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Suspension Rear</td>\r\n			<td>Swingarm, (Link suspension)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brake Front</td>\r\n			<td>Disc with ABS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brake Rear</td>\r\n			<td>Disc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wheel Front</td>\r\n			<td>Alloy</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wheel Rear</td>\r\n			<td>Alloy</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tyre Front</td>\r\n			<td>110/70-17</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tyre Rear</td>\r\n			<td>140/70-17</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>MT 15 Electricals</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>12V,4.0Ah(10HR)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Head Lamp</td>\r\n			<td>LED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tail Lamp</td>\r\n			<td>LED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trun Lamp</td>\r\n			<td>LED</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>MT 15 Extra Features</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Color</td>\r\n			<td>Metallic Black, Dark Matt Blue</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>MT 15 Price/Availability</h2>\r\n\r\n<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>Tk. 430000</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Search</td>\r\n			<td>644,105 times</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'upload/products/thambnail/1740250181275645.jpg', 1, 1, 1, 1, 1, NULL, NULL),
(19, 4, 3, 9, 19, 'iPhone 14', 'iphone-14', 'product-for-fools', '10', 'apple,iphone', '128gb,256gb,512gb', 'Black,mid-night-green,purple', '150000', '149999', 'Our environmental goals.\r\n\r\nAs part of our efforts to reach carbon neutrality by 2030, iPhone 14 and iPhone 14 Plus do not include a power adapter or EarPods. Included in the box is a USB‑C to Lightning Cable that supports fast charging and is compatible with USB‑C power adapters and computer ports.\r\n\r\nWe encourage you to re‑use your current USB‑A to Lightning cables, power adapters, and headphones, which are compatible with these iPhone models. But if you need any new Apple power adapters or headphones, they are available for purchase.', '<p>6.7&Prime; or 6.1&Prime;</p>\r\n\r\n<p>Super Retina XDR displayfootnote&sup1;<br />\r\nProMotion technology<br />\r\nAlways-On display</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-dynamic-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995666\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Dynamic Island<br />\r\nA new way to interact with iPhone</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-sos-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995664\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Emergency SOS via satellitefootnote&sup3;<br />\r\nEmergency SOS<br />\r\nCrash Detectionfootnote⁶</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-pro-camera-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1662060749123\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Pro camera system</p>\r\n\r\n<p>48MP Main&nbsp;|&nbsp;Ultra Wide<br />\r\nTelephoto<br />\r\nPhotonic Engine for incredible detail and color<br />\r\nAutofocus on TrueDepth front camera</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-action-202303?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1676573250832\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Action mode smooths out shaky handheld videos</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-battery-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995596\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Up to 29 hours video playbackfootnote⁴</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-a16-chip-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995670\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>A16 Bionic chip</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-face-id-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995588\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Face ID</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-5g-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995509\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Super Retina XDR displayfootnote&sup1;</p>\r\n\r\n<p>&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-sos-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995664\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Emergency SOS via satellitefootnote&sup3;<br />\r\nEmergency SOS<br />\r\nCrash Detectionfootnote⁶</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-14-dual-camera-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1661956958037\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Advanced dual-camera system</p>\r\n\r\n<p>12MP Main&nbsp;|&nbsp;Ultra Wide<br />\r\n&mdash;<br />\r\nPhotonic Engine for incredible detail and color<br />\r\nAutofocus on TrueDepth front camera</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-action-202303?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1676573250832\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Action mode smooths out shaky handheld videos</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-battery-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995596\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Up to 26 hours video playbackfootnote⁴</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-a15-chip-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995661\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>A15 Bionic chip<br />\r\nwith 5-core GPU</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-face-id-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995588\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Face ID</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-5g-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995509\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Superfast 5G cellularfootnote⁵</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Super Retina XDR displayfootnote&sup1;</p>\r\n\r\n<p>&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-sos-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995664\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>&mdash;<br />\r\nEmergency SOS<br />\r\n&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-13-dual-camera-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1661956958035\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Dual-camera system</p>\r\n\r\n<p>12MP Main&nbsp;|&nbsp;Ultra Wide<br />\r\n&mdash;<br />\r\n&mdash;<br />\r\n<br />\r\nTrueDepth front&nbsp;camera</p>\r\n\r\n<p>&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-battery-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995596\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Up to 19 hours video playbackfootnote⁴</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-a15-chip-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995661\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>A15 Bionic chip<br />\r\nwith 4-core GPU</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-face-id-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995588\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Face ID</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-5g-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995509\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Retina HD displayfootnote&sup1;</p>\r\n\r\n<p>&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-sos-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995664\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>&mdash;<br />\r\nEmergency SOS<br />\r\n&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-iphone-single-camera-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1661784502370\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Advanced camera</p>\r\n\r\n<p>12MP Main<br />\r\n&mdash;<br />\r\n&mdash;<br />\r\n<br />\r\nFront camera</p>\r\n\r\n<p>&mdash;</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-battery-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995596\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Up to 15 hours video playbackfootnote⁴</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-a15-chip-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995661\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>A15 Bionic chip<br />\r\nwith 4-core GPU</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-finger-print-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995658\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>Touch ID</p>\r\n\r\n<p><img alt=\"\" src=\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-compare-icon-5g-202209?wid=112&amp;hei=112&amp;fmt=jpeg&amp;qlt=90&amp;.v=1660759995509\" style=\"height:56px; width:56px\" /></p>\r\n\r\n<p>5G cellularfootnote⁵</p>', 'upload/products/thambnail/1773723330273090.jpg', 1, 1, 1, 1, 1, '2023-08-08 22:43:24', '2023-08-08 22:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `summary` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_author` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `meta_title`, `meta_author`, `meta_keyword`, `meta_description`, `google_analytics`, `created_at`, `updated_at`) VALUES
(1, 'E-Zone - Happy Shopping', 'Md Najib Islam', 'Online Shopping', 'This is an online shopping platform.', NULL, NULL, '2022-08-05 02:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0zBO06LL9GPKoftKyBw8wzyZsZsYi8xzf7myQ0I0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoib0QzSk5NZHpTNUJiMnJ4bzNKYU56cnpzQkdzU3VnUExoSHFkdjc0MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0L21hbmFnZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoiY2FydCI7YToxOntzOjc6ImRlZmF1bHQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e3M6MzI6IjQwZDI3NGI3NjU4YjZiOGVjZWE1M2M1NjhkZTAxODY3IjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6MTE6e3M6NToicm93SWQiO3M6MzI6IjQwZDI3NGI3NjU4YjZiOGVjZWE1M2M1NjhkZTAxODY3IjtzOjI6ImlkIjtzOjI6IjE5IjtzOjM6InF0eSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6OToiaVBob25lIDE0IjtzOjU6InByaWNlIjtkOjE0OTk5O3M6Njoid2VpZ2h0IjtkOjE7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6Mzp7czo1OiJpbWFnZSI7czo0NjoidXBsb2FkL3Byb2R1Y3RzL3RoYW1ibmFpbC8xNzczNzIzMzMwMjczMDkwLmpwZyI7czo1OiJjb2xvciI7czo1OiJCbGFjayI7czo0OiJzaXplIjtzOjU6IjEyOGdiIjt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjc6InRheFJhdGUiO2k6MjE7czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7TjtzOjQ2OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AZGlzY291bnRSYXRlIjtpOjA7czo4OiJpbnN0YW5jZSI7czo3OiJkZWZhdWx0Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkbWtxUXlMQ3R4cFNyeE45Zi5IUzF2ZXFKZVBPbVNqZFdDUEw3QnhXaDFMeTBwMVJpZ1VLdVMiO3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO31zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG1rcVF5TEN0eHBTcnhOOWYuSFMxdmVxSmVQT21TamRXQ1BMN0J4V2gxTHkwcDFSaWdVS3VTIjt9', 1691556204),
('NYuGbKgg7D95ZKMapo667EFIXIwRNeW4laRAcfHp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNnB5STVWMVZNaFFVcmhWRHBUcFc1UkdTdjJtRkc1STZrdnZJUkJaeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9teWNhcnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxOToicGFzc3dvcmRfaGFzaF9hZG1pbiI7czo2MDoiJDJ5JDEwJFB2OXBlTnR2emJnY1dNejlMUXY4YmVCbEFTa2hrcWlNWVFtYWcvWVRSZFV6WUpXeVprZkQuIjtzOjQ6ImNhcnQiO2E6MTp7czo3OiJkZWZhdWx0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntzOjMyOiI5MjVjMzI1MGIwMWIzOWRhNTU3OWRhYjE1NDVlZWFlZiI7TzozMjoiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0iOjExOntzOjU6InJvd0lkIjtzOjMyOiI5MjVjMzI1MGIwMWIzOWRhNTU3OWRhYjE1NDVlZWFlZiI7czoyOiJpZCI7czoyOiIxOSI7czozOiJxdHkiO3M6MToiMSI7czo0OiJuYW1lIjtzOjk6ImlQaG9uZSAxNCI7czo1OiJwcmljZSI7ZDoxNDk5OTtzOjY6IndlaWdodCI7ZDoxO3M6Nzoib3B0aW9ucyI7TzozOToiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjM6e3M6NToiaW1hZ2UiO3M6NDY6InVwbG9hZC9wcm9kdWN0cy90aGFtYm5haWwvMTc3MzcyMzMzMDI3MzA5MC5qcGciO3M6NToiY29sb3IiO3M6MTY6Ii0tQ2hvb3NlIENvbG9yLS0iO3M6NDoic2l6ZSI7czoxNToiLS1DaG9vc2UgU2l6ZS0tIjt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjc6InRheFJhdGUiO2k6MjE7czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7TjtzOjQ2OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AZGlzY291bnRSYXRlIjtpOjA7czo4OiJpbnN0YW5jZSI7czo3OiJkZWZhdWx0Ijt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fX0=', 1691554587);

-- --------------------------------------------------------

--
-- Table structure for table `ship_districts`
--

CREATE TABLE `ship_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_name` varchar(255) NOT NULL,
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
  `division_name` varchar(255) NOT NULL,
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
  `state_name` varchar(255) NOT NULL,
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
  `logo` varchar(255) DEFAULT NULL,
  `phone_one` varchar(255) DEFAULT NULL,
  `phone_two` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `phone_one`, `phone_two`, `email`, `company_name`, `company_address`, `facebook`, `twitter`, `linkedin`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'upload/logo/1740310672594787.png', '01537500950', NULL, 'support@e-zone.com', 'E-Zone', 'Chittagong, Bangladesh', 'https://www.facebook.com/E-Zone', 'https://www.twitter.com/E-Zone', 'https://www.linkedin.com/company/e-zone/', 'https://www.youtube.com/channel/UCff--R6-ME79ZIfZQQVGMyw', NULL, '2022-08-05 02:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_img` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
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
  `subcategory_name_en` varchar(255) NOT NULL,
  `subcategory_slug_en` varchar(255) NOT NULL,
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
  `subsubcategory_name_en` varchar(255) NOT NULL,
  `subsubcategory_slug_en` varchar(255) NOT NULL,
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
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `last_seen` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
