SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `agent_has_client` (
  `id_agent` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `agent_has_supervisor` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user_agent` int(11) DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `base` double(8,2) DEFAULT 0.00,
  `id_wallet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `agent_has_supervisor` VALUES(1, 3, 2, NULL, 100000.00, 1);

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT 0.00,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_wallet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `close_day` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `base_before` double(8,2) DEFAULT NULL,
  `from_number` double(8,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `countrys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `countrys` VALUES(1, 'Tokelau');
INSERT INTO `countrys` VALUES(2, 'Qatar');
INSERT INTO `countrys` VALUES(3, 'Belarus');
INSERT INTO `countrys` VALUES(4, 'Gibraltar');
INSERT INTO `countrys` VALUES(5, 'Antarctica (the territory South of 60 deg S)');
INSERT INTO `countrys` VALUES(6, 'Svalbard & Jan Mayen Islands');

CREATE TABLE `credit` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount_neto` double(8,2) DEFAULT 0.00,
  `order_list` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `payment_number` int(11) DEFAULT NULL,
  `utility` double(8,2) DEFAULT NULL,
  `status` enum('close','inprogress') COLLATE utf8mb4_unicode_ci DEFAULT 'inprogress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `list_bill` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '	',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `list_bill` VALUES(1, 'Combustible');
INSERT INTO `list_bill` VALUES(2, 'Comida');
INSERT INTO `list_bill` VALUES(3, 'Transporte');

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` VALUES(1, '2017_12_03_000000_create_agent_has_supervisor_table', 1);
INSERT INTO `migrations` VALUES(2, '2017_12_03_000001_create_users_table', 1);
INSERT INTO `migrations` VALUES(3, '2017_12_03_000002_create_credit_table', 1);
INSERT INTO `migrations` VALUES(4, '2017_12_03_000003_create_agent_has_client_table', 1);
INSERT INTO `migrations` VALUES(5, '2017_12_03_000004_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES(6, '2017_12_03_000005_create_route_table', 1);
INSERT INTO `migrations` VALUES(7, '2017_12_03_000006_create_migrations_table', 1);
INSERT INTO `migrations` VALUES(8, '2017_12_03_000007_create_summary_table', 1);
INSERT INTO `migrations` VALUES(9, '2017_12_03_000008_create_countrys_table', 1);
INSERT INTO `migrations` VALUES(10, '2017_12_03_000009_create_not_pay_table', 1);
INSERT INTO `migrations` VALUES(11, '2017_12_03_000010_create_users_has_route_table', 1);
INSERT INTO `migrations` VALUES(12, '2017_12_03_000011_create_payment_number_table', 1);
INSERT INTO `migrations` VALUES(13, '2017_12_03_000012_create_close_day_table', 1);
INSERT INTO `migrations` VALUES(14, '2017_12_03_000013_create_bills_table', 1);
INSERT INTO `migrations` VALUES(15, '2017_12_03_000014_create_list_bill_table', 1);
INSERT INTO `migrations` VALUES(16, '2017_12_03_000015_create_wallet_table', 1);

CREATE TABLE `not_pay` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_credit` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `payment_number` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` int(11) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `selected` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `payment_number` VALUES(1, 1, NULL, NULL);
INSERT INTO `payment_number` VALUES(2, 2, NULL, NULL);
INSERT INTO `payment_number` VALUES(3, 3, NULL, NULL);
INSERT INTO `payment_number` VALUES(4, 4, NULL, NULL);
INSERT INTO `payment_number` VALUES(5, 5, NULL, NULL);
INSERT INTO `payment_number` VALUES(6, 6, NULL, NULL);
INSERT INTO `payment_number` VALUES(7, 7, NULL, NULL);
INSERT INTO `payment_number` VALUES(8, 8, NULL, NULL);
INSERT INTO `payment_number` VALUES(9, 9, NULL, NULL);
INSERT INTO `payment_number` VALUES(10, 10, NULL, NULL);
INSERT INTO `payment_number` VALUES(11, 11, NULL, NULL);
INSERT INTO `payment_number` VALUES(12, 12, NULL, NULL);
INSERT INTO `payment_number` VALUES(13, 13, NULL, NULL);
INSERT INTO `payment_number` VALUES(14, 14, NULL, NULL);
INSERT INTO `payment_number` VALUES(15, 15, NULL, NULL);
INSERT INTO `payment_number` VALUES(16, 16, NULL, NULL);
INSERT INTO `payment_number` VALUES(17, 17, NULL, NULL);
INSERT INTO `payment_number` VALUES(18, 18, NULL, NULL);
INSERT INTO `payment_number` VALUES(19, 19, NULL, NULL);
INSERT INTO `payment_number` VALUES(20, 20, NULL, NULL);
INSERT INTO `payment_number` VALUES(21, 21, NULL, NULL);
INSERT INTO `payment_number` VALUES(22, 22, NULL, NULL);
INSERT INTO `payment_number` VALUES(23, 23, NULL, NULL);
INSERT INTO `payment_number` VALUES(24, 24, NULL, NULL);
INSERT INTO `payment_number` VALUES(25, 25, NULL, NULL);
INSERT INTO `payment_number` VALUES(26, 26, NULL, NULL);
INSERT INTO `payment_number` VALUES(27, 27, NULL, NULL);
INSERT INTO `payment_number` VALUES(28, 28, NULL, NULL);
INSERT INTO `payment_number` VALUES(29, 29, NULL, NULL);
INSERT INTO `payment_number` VALUES(30, 30, NULL, NULL);

CREATE TABLE `route` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `summary` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `id_credit` int(11) DEFAULT NULL,
  `number_index` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_user` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci DEFAULT 'enabled',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('user','agent','supervisor','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('bad','good') COLLATE utf8mb4_unicode_ci DEFAULT 'good',
  `lng` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` VALUES(1, 'Administrador', 'admin@admin.com', '$2y$10$WB.P.u9ddZHpN86EXpfV9OVr2Mm3X.iYuGPGFu6BDZcXk/5eCidQa', 'enabled', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES(2, 'Supervisor', 'supervisor@supervisor.com', '$2y$10$tgsQ.BZl.tivHi6g5y20y.xpNxaDu8zuvAY3RwetXcsfAvQ7IZ.Za', 'enabled', NULL, 'supervisor', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES(3, 'Agente', 'agente@agente.com', '$2y$10$y9YNkRlUgFvqEzxP7dJvHuA0QCroZIk99FcadC6Tpz3NVsSKo0o.e', 'enabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES(4, 'josue', 'Josue esquina', '$2y$10$l9Z4i7chMyP6sfGGpS0i4eLsb7qjrq.AhsekCU1dfIbomK2I8kBBK', 'enabled', NULL, 'supervisor', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, '2021-05-04 03:06:55');
INSERT INTO `users` VALUES(5, 'el patito feo', 'el patito feo', 'FZrqNiq0kXtS73n', 'disabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, '2021-05-04 03:10:48');
INSERT INTO `users` VALUES(6, 'panti chocolate', 'penti chocolate', 'xc0fGhKHBVWRjgc', 'disabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, '2021-05-04 03:07:06');
INSERT INTO `users` VALUES(7, 'pito raro', 'pito raroman', 'TQJK5caRo5rjmrX', 'disabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, '2021-05-04 03:07:09');
INSERT INTO `users` VALUES(8, 'Administrador', 'admin@admin.com', '$2y$10$7SqVLvG5kM6jSo0dc26XSuE0TI8A4XHNMzLfogStLU03Ij3/0qwdm', 'enabled', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES(9, 'Supervisor', 'supervisor@supervisor.com', '$2y$10$n3xOu1gNQ7OkTGcazvgiP.3QlLG026dm0vsevp0FbBN0LgjAHF.he', 'enabled', NULL, 'supervisor', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES(10, 'Agente', 'agente@agente.com', '$2y$10$ZvOksaCIiBJcIIQ9lIXg2eMzg1vDrdQRjnlkXZLHs/5sS34SQiM5y', 'enabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES(11, 'el bello durmiente', 'el bello durmiente', '$2y$10$eSdvD3hTKC7wIKM7uWlyFedNG5K2hZwOrkbMZbq8OxZa00tLz3bPy', 'enabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL);

CREATE TABLE `users_has_route` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `agent_has_supervisor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `wallet` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wallet` VALUES(1, 'Caja principal', NULL, '1', 'Madrid');
INSERT INTO `wallet` VALUES(2, 'admin', '2021-05-04 02:58:48', '1', 'budapest');
INSERT INTO `wallet` VALUES(3, 'admin', '2021-05-04 02:59:56', '2', 'budapest');
INSERT INTO `wallet` VALUES(4, 'admin', '2021-05-04 03:01:08', '2', 'bucarest');


ALTER TABLE `agent_has_supervisor`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `close_day`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `countrys`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `list_bill`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `not_pay`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

ALTER TABLE `payment_number`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `summary`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users_has_route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_users_has_route_agent_has_supervisor1_idx` (`agent_has_supervisor_id`),
  ADD KEY `fk_users_has_route_route1_idx` (`route_id`);

ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `agent_has_supervisor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `close_day`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `countrys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `credit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `list_bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '	', AUTO_INCREMENT=4;

ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `not_pay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `payment_number`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

ALTER TABLE `route`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `summary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `users_has_route`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `wallet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
