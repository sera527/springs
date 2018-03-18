-- Adminer 4.6.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9,	'2014_10_12_000000_create_users_table',	1),
(10,	'2014_10_12_100000_create_password_resets_table',	1),
(11,	'2018_03_18_130033_create_posts_table',	1),
(12,	'2018_03_18_130703_post_user',	1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `slug`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1,	'iraq-syria-border',	'Iraq-Syria border',	'Our thoughts and prayers go out to the families and loved ones of the brave troops lost in the helicopter crash on the Iraq-Syria border yesterday. Their sacrifice in service to our country will never be forgotten.',	'2018-03-18 23:02:28',	'2018-03-18 23:02:28'),
(2,	'safety-of-americas-children',	'safety of America\'s children',	'Today the House took major steps toward securing our schools by passing the STOP School Violence Act. We must put the safety of America\'s children FIRST by improving training and by giving schools and law enforcement better tools. A tragedy like Parkland can\'t happen ever again!',	'2018-03-18 23:04:44',	'2018-03-18 23:04:44'),
(3,	'pidsumki-paralimpiadi',	'Підсумки паралімпіади',	'Вітаю наших незламних паралімпійців з фантастичними перемогами на Зимових Паралімпійських іграх-2018.\r\n22 медалі: 7 золотих, 7 срібних та 8 бронзових – неймовірний результат. Дякуємо за ті незабутні емоції, які ви дарували нам кожного дня! Україна пишається вами!',	'2018-03-18 23:09:22',	'2018-03-18 23:09:22'),
(4,	'kuveyt',	'Кувейт',	'З Віце-прем’єр-міністром, Міністром закордонних справ Кувейту обговорили питання регіональної безпеки.\r\nВдячний Кувейту за підтримку ініціатив України в рамках міжнародних організацій.',	'2018-03-18 23:10:12',	'2018-03-18 23:10:12'),
(5,	'sanktsii-proti-kremlya',	'Санкції проти Кремля',	'Вітаю нові санкції США проти Кремля. Кожен протиправний та нелегітимний акт Кремля, будь-то у Криму, на Донбасі чи у Солсбері, і надалі отримуватиме нашу солідарну, рішучу та тверду відповідь по обидва боки Атлантики.',	'2018-03-18 23:11:36',	'2018-03-18 23:11:36'),
(6,	'vybory-prezidenta',	'Выборы Президента',	'В воскресенье выборы Президента России. Мы все общаемся в соцсетях, делимся мыслями, спорим, считая, что это повлияет на нашу жизнь. Но 18 марта – время выйти из интернета в реальную жизнь,сделать выбор, который определит будущее всей страны. До встречи на избирательных участках!',	'2018-03-18 23:13:53',	'2018-03-18 23:13:53'),
(7,	'olimpiada',	'Олимпиада',	'Наши хоккеисты – олимпийские чемпионы! Спасибо за победу! Поздравляю команду, поздравляю всех нас! #PyeongChang2018 #Olympics',	'2018-03-18 23:15:34',	'2018-03-18 23:15:34'),
(8,	'olympic-games',	'Olympic Games',	'The Olympic Games unite the peoples!',	'2018-03-18 23:17:11',	'2018-03-18 23:17:11');

DROP TABLE IF EXISTS `post_user`;
CREATE TABLE `post_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `post_user` (`id`, `post_id`, `user_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	2,	1),
(4,	3,	3),
(5,	3,	2),
(6,	4,	3),
(7,	5,	3),
(8,	5,	1),
(9,	6,	4),
(10,	7,	4),
(11,	8,	2),
(12,	8,	1),
(13,	8,	3),
(14,	8,	4);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Donald',	'tramp@yahoo.com',	'$2y$10$VxsUOAgCeTfe2.ecwb4OPu5ZlKmoZNvdJ5XWwrXLDmk46JYgBK13q',	'c6fjg41XsadbtXVWkjzoSGgTbpVnWsClObxhMq7nOj9oTkU7hT4gZsUNRmhc',	'2018-03-18 23:01:24',	'2018-03-18 23:01:24'),
(2,	'Serhii',	'serpos95@gmail.com',	'$2y$10$JtgqiGkig1XtGQTOoMf8dOG3wEYDn0iw9jG1n5Vc3KVi9gvgoi.rC',	'q0lnSiUTImoi80XxPbgId6L4Mt84iRE8jYUOqbQQcbJHqUVOzfzci9G17CIx',	'2018-03-18 23:03:31',	'2018-03-18 23:03:31'),
(3,	'Petro',	'incognita@ukr.net',	'$2y$10$AxK1VbMMe6GpriRXWlPVE.X6Mtt8UCMXvzcUG8Nvs8BUu4/UFLOEa',	'V4Xm3Am5HORvr1ZD7qhN3gGXUCCbYlc3qE29AaNRuUlyE1i2HeETtgEmROn0',	'2018-03-18 23:06:41',	'2018-03-18 23:06:41'),
(4,	'Dima',	'medvedev@yandex.ru',	'$2y$10$hjSvqY3MqrIbWqxrfBkDq.Rl8JSiD4BBcWloua59xb8HiiLu64pZ6',	'ECdxmvbTBktXYBtFvDuY6lkqMh2Awp2mVrcv85HuXDqjs4RQeyBWZmRhFVF9',	'2018-03-18 23:13:33',	'2018-03-18 23:13:33');

-- 2018-03-18 23:18:57

