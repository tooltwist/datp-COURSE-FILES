-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 14, 2023 at 11:01 AM
-- Server version: 5.7.42
-- PHP Version: 8.1.17

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datp`
--
CREATE DATABASE IF NOT EXISTS `datp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `datp`;

-- --------------------------------------------------------

--
-- Table structure for table `atp_alert`
--

DROP TABLE IF EXISTS `atp_alert`;
CREATE TABLE `atp_alert` (
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `summary` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `silenced` tinyint(1) NOT NULL DEFAULT '0',
  `silenced_time` timestamp NULL DEFAULT NULL,
  `silenced_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atp_domain_status`
--

DROP TABLE IF EXISTS `atp_domain_status`;
CREATE TABLE `atp_domain_status` (
  `status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_domain_status`
--

INSERT INTO `atp_domain_status` (`status`, `description`) VALUES
('active', 'Active, in use'),
('inactive', 'Not in use'),
('noplugin', 'No plugin is defined in the software'),
('prepare', 'Being prepared for use');

-- --------------------------------------------------------

--
-- Table structure for table `atp_logbook`
--

DROP TABLE IF EXISTS `atp_logbook`;
CREATE TABLE `atp_logbook` (
  `sequence` int(11) NOT NULL,
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `step_id` varchar(72) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_logbook`
--

INSERT INTO `atp_logbook` (`sequence`, `transaction_id`, `step_id`, `level`, `source`, `message`, `created`) VALUES
(1, 'tx-3cad8cddb4a9db268d1ce8e40d0c76cfc454b3da', 's-fc5fecbc8f0a8927b8adbdcbd818123088a1ebee', 'error', 'exception', 'Exception in step', '2023-05-01 01:48:44.658136'),
(2, 'tx-3cad8cddb4a9db268d1ce8e40d0c76cfc454b3da', 's-fc5fecbc8f0a8927b8adbdcbd818123088a1ebee', 'error', 'exception', 'Exception in step\nError: Duplicate entry \'tx-3cad8cddb4a9db268d1ce8e40d0c76cfc454b3da-1\' for key \'PRIMARY\'\n    at PromisePool.query (/workspace/myProject/node_modules/mysql2/promise.js:341:22)\n    at dbupdate (/workspace/myProject/node_modules/@tooltwist/DATP/database/dbupdate.js:132:44)\n    at async Function.persistDelta_database (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionPersistance.js:136:20)\n    at async Function.persistDelta (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionPersistance.js:104:16)\n    at async TransactionState.delta (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionState.js:1022:9)\n    at async TransactionState.addChildStep (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionState.js:275:5)\n    at async Pipeline.invoke (/workspace/myProject/node_modules/@tooltwist/datp/ATP/hardcoded-steps/PipelineStep.js:66:27)\n    at async Worker2.processEvent_StepStart (/workspace/myProject/node_modules/@tooltwist/DATP/ATP/Scheduler2/Worker2.js:302:22)\n    at async Worker2.processEvent (/workspace/myProject/node_modules/@tooltwist/DATP/ATP/Scheduler2/Worker2.js:109:23)', '2023-05-01 01:48:44.658136'),
(3, 'tx-b6b166876da7d11ced43b87734a5c403e3f9a7fe', 's-d4bfe13934ffa155a9fbab52050edbaa6f22c4d7', 'error', 'exception', 'Exception in step', '2023-05-01 01:49:33.966191'),
(4, 'tx-b6b166876da7d11ced43b87734a5c403e3f9a7fe', 's-d4bfe13934ffa155a9fbab52050edbaa6f22c4d7', 'error', 'exception', 'Exception in step\nError: Duplicate entry \'tx-b6b166876da7d11ced43b87734a5c403e3f9a7fe-1\' for key \'PRIMARY\'\n    at PromisePool.query (/workspace/myProject/node_modules/mysql2/promise.js:341:22)\n    at dbupdate (/workspace/myProject/node_modules/@tooltwist/DATP/database/dbupdate.js:132:44)\n    at async Function.persistDelta_database (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionPersistance.js:136:20)\n    at async Function.persistDelta (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionPersistance.js:104:16)\n    at async TransactionState.delta (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionState.js:1022:9)\n    at async TransactionState.addChildStep (/workspace/myProject/node_modules/@tooltwist/datp/ATP/Scheduler2/TransactionState.js:275:5)\n    at async Pipeline.invoke (/workspace/myProject/node_modules/@tooltwist/datp/ATP/hardcoded-steps/PipelineStep.js:66:27)\n    at async Worker2.processEvent_StepStart (/workspace/myProject/node_modules/@tooltwist/DATP/ATP/Scheduler2/Worker2.js:302:22)\n    at async Worker2.processEvent (/workspace/myProject/node_modules/@tooltwist/DATP/ATP/Scheduler2/Worker2.js:109:23)', '2023-05-01 01:49:33.966191');

-- --------------------------------------------------------

--
-- Table structure for table `atp_node_group`
--

DROP TABLE IF EXISTS `atp_node_group`;
CREATE TABLE `atp_node_group` (
  `node_group` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host_mondat_webapp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Host the MONDAT webapp',
  `serve_mondat_api` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Serve API used by MONDAT',
  `eventloop_workers` int(11) NOT NULL DEFAULT '100',
  `num_workers` int(11) NOT NULL DEFAULT '100' COMMENT 'Initial number of worker threads',
  `eventloop_pause_busy` int(11) NOT NULL DEFAULT '20' COMMENT 'When all workers busy',
  `eventloop_pause_idle` int(11) NOT NULL DEFAULT '20' COMMENT 'When queues are empty',
  `eventloop_pause` int(11) NOT NULL DEFAULT '5' COMMENT 'Pause between iterations',
  `webhook_processing` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Group processes webhooks',
  `webhook_workers` int(11) NOT NULL,
  `webhook_pause` int(11) NOT NULL DEFAULT '50' COMMENT 'Delay between batches',
  `webhook_pause_busy` int(11) NOT NULL DEFAULT '20' COMMENT 'Delay when all workers are in use',
  `webhook_pause_idle` int(11) NOT NULL DEFAULT '2000' COMMENT 'Delay when no workers are in use',
  `archive_processing` tinyint(1) NOT NULL DEFAULT '1',
  `archive_batch_size` int(11) NOT NULL DEFAULT '200',
  `archive_pause` int(11) NOT NULL DEFAULT '50' COMMENT 'Delay between batches',
  `archive_pause_idle` int(11) NOT NULL DEFAULT '2000' COMMENT 'Delay when nothing are being archived',
  `wakeup_processing` tinyint(1) NOT NULL DEFAULT '1',
  `wakeup_pause` int(11) NOT NULL DEFAULT '30',
  `sloth_mode_delay` int(11) NOT NULL DEFAULT '5000' COMMENT 'Enter sloth mode after no events',
  `debug_scheduler` int(11) NOT NULL DEFAULT '0',
  `debug_workers` int(11) NOT NULL DEFAULT '0',
  `debug_steps` int(11) NOT NULL DEFAULT '0',
  `debug_pipelines` int(11) NOT NULL DEFAULT '0',
  `debug_routers` int(11) NOT NULL DEFAULT '0',
  `debug_longpolling` int(11) NOT NULL DEFAULT '0',
  `debug_webhooks` int(11) NOT NULL DEFAULT '0',
  `debug_transactions` int(11) NOT NULL DEFAULT '0',
  `debug_transaction_cache` int(11) NOT NULL DEFAULT '0',
  `debug_redis` int(11) NOT NULL DEFAULT '0',
  `debug_db` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_node_group`
--

INSERT INTO `atp_node_group` (`node_group`, `description`, `host_mondat_webapp`, `serve_mondat_api`, `eventloop_workers`, `num_workers`, `eventloop_pause_busy`, `eventloop_pause_idle`, `eventloop_pause`, `webhook_processing`, `webhook_workers`, `webhook_pause`, `webhook_pause_busy`, `webhook_pause_idle`, `archive_processing`, `archive_batch_size`, `archive_pause`, `archive_pause_idle`, `wakeup_processing`, `wakeup_pause`, `sloth_mode_delay`, `debug_scheduler`, `debug_workers`, `debug_steps`, `debug_pipelines`, `debug_routers`, `debug_longpolling`, `debug_webhooks`, `debug_transactions`, `debug_transaction_cache`, `debug_redis`, `debug_db`) VALUES
('archiver', 'Persist transaction states to database', 0, 0, 0, 0, 20, 20, 5, 1, 0, 0, 0, 0, 1, 1000, 5000, 5000, 1, 30, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('master', 'Main application contact point', 1, 1, 100, 100, 20, 20, 5, 1, 0, 0, 0, 0, 1, 0, 500, 0, 1, 30, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('slave1', 'Test slave', 0, 0, 100, 100, 20, 20, 5, 1, 0, 0, 0, 0, 1, 0, 500, 0, 1, 30, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('slave2', 'Test slave', 0, 0, 100, 100, 20, 20, 5, 1, 0, 0, 0, 0, 1, 0, 500, 0, 1, 30, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('webhooks', 'Process webhooks', 0, 0, 0, 0, 20, 20, 5, 1, 200, 50, 50, 1000, 1, 0, 500, 0, 1, 30, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `atp_pipeline`
--

DROP TABLE IF EXISTS `atp_pipeline`;
CREATE TABLE `atp_pipeline` (
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `node_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'deprecated',
  `description` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'deprecated',
  `steps_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci COMMENT 'deprecated',
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commit_comments` text COLLATE utf8mb4_unicode_ci,
  `tags` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_pipeline`
--

INSERT INTO `atp_pipeline` (`name`, `version`, `node_name`, `description`, `steps_json`, `notes`, `status`, `commit_comments`, `tags`) VALUES
('example', '1.0', 'master', 'Example pipeline', '[\n  {\n    \"id\": 0,\n    \"definition\": {\n      \"delta\": 90.8,\n      \"stepType\": \"example/exampleStep\",\n      \"description\": \"Example\"\n    }\n  },\n  {\n    \"id\": 1,\n    \"definition\": {\n      \"min\": 50,\n      \"max\": 500,\n      \"stepType\": \"util/delay\",\n      \"description\": \"Delay a random period of time\"\n    }\n  }\n]', 'This is an example pipeline, to show how pipelines are defined.', 'active', NULL, NULL),
('example', '1.1', 'master', 'Example pipeline', '[\r\n  {\r\n    \"id\": 0,\r\n    \"definition\": {\r\n      \"delta\": 90.8,\r\n      \"stepType\": \"example/exampleStep\",\r\n      \"description\": \"Example\"\r\n    }\r\n  },\r\n  {\r\n    \"id\": 1,\r\n    \"definition\": {\r\n      \"min\": 50,\r\n      \"max\": 1500,\r\n      \"stepType\": \"util/delay\",\r\n      \"description\": \"Delay a random period of time\"\r\n    }\r\n  },\r\n  {\r\n    \"id\": 2,\r\n    \"definition\": {\r\n      \"min\": 50,\r\n      \"max\": 1500,\r\n      \"stepType\": \"util/delay\",\r\n      \"description\": \"Delay a bit more\"\r\n    }\r\n  }\r\n]', 'This is an example pipeline, to show how pipelines are defined.', 'active', '[{\"c\": \"Test commit with longer delay\" } ]', 'test'),
('example', '17a36bd6a45a86393b00e528594f137e01189b70', NULL, NULL, '[{\"definition\":{\"message\":\"Rainy outside :-(\",\"stepType\":\"util/fixed-reply\",\"description\":\"Return a fixed reply\"},\"description\":\"Return a fixed reply\"}]', 'This is an example pipeline, to show how pipelines are defined.', 'active', '[{\"ts\":\"2022-03-03T20:26:47.111Z\",\"v\":\"17a36bd6a45a86393b00e528594f137e01189b70\",\"c\":\"Tuesday\'s version\"},{\"ts\":\"2022-03-03T20:22:18.917Z\",\"v\":\"9944f7d12d4fcdf06518ee83c1caac8f961cba81\",\"c\":\"Nice version on Monday\"},{\"ts\":\"2022-03-03T15:44:51.372Z\",\"v\":\"f75740c1246cf100d6d7a0941ec3c041e3885b4c\",\"c\":\"h2\"},{\"ts\":\"2022-03-03T14:34:00.211Z\",\"v\":\"e109954c7a6a23d80285a3aeb5228334527d90d7\",\"c\":\"Unhappy message.\"},{\"ts\":\"2022-03-03T14:25:52.724Z\",\"v\":\"999f51b1346375e22bb8a1fb4dbd50c312cb1dd8\",\"c\":\"Return a happy message.\"}]', NULL),
('example', '9944f7d12d4fcdf06518ee83c1caac8f961cba81', NULL, NULL, '[{\"definition\":{\"message\":\"Rainy outside :-(\",\"stepType\":\"util/fixed-reply\",\"description\":\"Return a fixed reply\"},\"description\":\"Return a fixed reply\"}]', 'This is an example pipeline, to show how pipelines are defined.', 'inactive', '[{\"ts\":\"2022-03-03T20:22:18.917Z\",\"v\":\"9944f7d12d4fcdf06518ee83c1caac8f961cba81\",\"c\":\"Nice version on Monday\"},{\"ts\":\"2022-03-03T15:44:51.372Z\",\"v\":\"f75740c1246cf100d6d7a0941ec3c041e3885b4c\",\"c\":\"h2\"},{\"ts\":\"2022-03-03T14:34:00.211Z\",\"v\":\"e109954c7a6a23d80285a3aeb5228334527d90d7\",\"c\":\"Unhappy message.\"},{\"ts\":\"2022-03-03T14:25:52.724Z\",\"v\":\"999f51b1346375e22bb8a1fb4dbd50c312cb1dd8\",\"c\":\"Return a happy message.\"}]', NULL),
('example', 'draft', 'master', NULL, '[{\"definition\":{\"min\":0,\"max\":5,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time\"},\"description\":\"Delay a random period of time\",\"stepType\":\"util/delay\"},{\"definition\":{\"forceDeepSleep\":false,\"min\":0,\"max\":10,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time\"},\"description\":\"Delay a random period of time\"}]', 'This is an example pipeline, to show how pipelines are defined.', 'active', '[{\"ts\":\"2022-03-18T06:14:45.005Z\",\"v\":\"draft\",\"m\":\"draft version\"},{\"ts\":\"2022-03-03T20:26:47.111Z\",\"v\":\"17a36bd6a45a86393b00e528594f137e01189b70\",\"c\":\"Tuesday\'s version\"},{\"ts\":\"2022-03-03T20:22:18.917Z\",\"v\":\"9944f7d12d4fcdf06518ee83c1caac8f961cba81\",\"c\":\"Nice version on Monday\"},{\"ts\":\"2022-03-03T15:44:51.372Z\",\"v\":\"f75740c1246cf100d6d7a0941ec3c041e3885b4c\",\"c\":\"h2\"},{\"ts\":\"2022-03-03T14:34:00.211Z\",\"v\":\"e109954c7a6a23d80285a3aeb5228334527d90d7\",\"c\":\"Unhappy message.\"},{\"ts\":\"2022-03-03T14:25:52.724Z\",\"v\":\"999f51b1346375e22bb8a1fb4dbd50c312cb1dd8\",\"c\":\"Return a happy message.\"}]', NULL),
('example', 'f75740c1246cf100d6d7a0941ec3c041e3885b4c', NULL, NULL, '[{\"definition\":{\"message\":\"Rainy outside :-(\",\"stepType\":\"util/fixed-reply\",\"description\":\"Return a fixed reply\"},\"description\":\"Return a fixed reply\"}]', 'This is an example pipeline, to show how pipelines are defined.', 'inactive', '[{\"ts\":\"2022-03-03T15:44:51.372Z\",\"v\":\"f75740c1246cf100d6d7a0941ec3c041e3885b4c\",\"c\":\"h2\"},{\"ts\":\"2022-03-03T14:34:00.211Z\",\"v\":\"e109954c7a6a23d80285a3aeb5228334527d90d7\",\"c\":\"Unhappy message.\"},{\"ts\":\"2022-03-03T14:25:52.724Z\",\"v\":\"999f51b1346375e22bb8a1fb4dbd50c312cb1dd8\",\"c\":\"Return a happy message.\"}]', NULL),
('example.sleeper', '1.0', 'master', 'Example pipeline that sleeps for ten to fifteen seconds.', '[\r\n  {\r\n    \"id\": 0,\r\n    \"definition\": {\r\n      \"min\": 10000,\r\n      \"max\": 15000,\r\n      \"stepType\": \"util/delay\",\r\n      \"description\": \"Delay a random period of time\"\r\n    }\r\n  }\r\n]', '', 'active', NULL, NULL),
('example.sleeper', '1.1', 'master', 'Example pipeline that sleeps for ten to fifteen seconds.', '[\r\n  {\r\n    \"id\": 0,\r\n    \"definition\": {\r\n      \"min\": 10000,\r\n      \"max\": 15000,\r\n      \"stepType\": \"util/delay\",\r\n      \"description\": \"Delay a random period of time\"\r\n    }\r\n  }\r\n]', 'This is an example pipeline only. Do not use for actual transactions, as it might change.', 'active', '[ { \"message\": \"This is a test commit\" } ]', 'test,delayed'),
('myPipeline', 'draft', NULL, NULL, '[{\"definition\":{\"msg\":\"Hello World 1\",\"stepType\":\"example/saySomething\",\"description\":\"Display a message to the console\"},\"description\":\"Display a message to the console\",\"stepType\":\"example/saySomething\"},{\"definition\":{\"description\":\"Test sleeping\",\"stepType\":\"myProject/mySleepingStep\"}},{\"definition\":{\"description\":\"Just a test step\",\"stepType\":\"myProject/myFirstStep\"}},{\"definition\":{\"msg\":\"Hello World 2\",\"stepType\":\"example/saySomething\",\"description\":\"Display a message to the console\"},\"description\":\"Display a message to the console\",\"stepType\":\"example/saySomething\"},{\"definition\":{\"returnError\":false,\"note\":\"Good afternoon\",\"reply\":{\"message\":\"Have a nice day\"},\"stepType\":\"util/fixed-reply\",\"description\":\"Return a fixed reply\"},\"description\":\"Return a fixed reply\"}]', '', 'draft', '[{\"ts\":\"2023-05-10T16:19:57.136Z\",\"v\":\"draft\",\"m\":\"draft version\"}]', NULL),
('not-supported', '1.0', 'master', 'Return a \"not supported\" message', '[\n  {\n    \"id\": 0,\n    \"definition\": {\n      \"returnError\": false,\n      \"note\": \"Not supported\",\n      \"reply\": {\n        \"message\": \"Operation not supported\"\n      },\n      \"stepType\": \"util/fixed-reply\",\n      \"description\": \"Return fixed reply \\\"not supported\\\"\"\n    }\n  }\n]', NULL, 'active', NULL, NULL),
('null', '1.0', 'master', 'Do nothing', '[\r\n  {\r\n    \"id\": 1,\r\n    \"definition\": {\r\n      \"min\": 5,\r\n      \"max\": 10,\r\n      \"stepType\": \"util/delay\",\r\n      \"description\": \"Sleep an insignificant amount of time\"\r\n    }\r\n  }\r\n]', 'This is an example pipeline, to show how pipelines are defined.', 'active', NULL, NULL),
('null', 'draft', 'master', NULL, '[{\"definition\":{\"min\":0,\"max\":1,\"forceDeepSleep\":false,\"stepType\":\"util/delay\",\"description\":\"Sleep an insignificant amount of time\"},\"description\":\"Sleep an insignificant amount of time\",\"stepType\":\"util/delay\"}]', 'This is an example pipeline, to show how pipelines are defined.', 'active', '[{\"ts\":\"2022-07-21T13:33:38.878Z\",\"v\":\"draft\",\"m\":\"draft version\"}]', NULL),
('test-longrun', '07e9c7db2174c11f0767fcfa3f52b2f5aa148595', 'slave2', NULL, '[{\"definition\":{\"duration\":120,\"stepType\":\"test/longRunning\",\"description\":\"Long running step - use for testing only\"},\"description\":\"Long running step - use for testing only\"}]', '', 'draft', '[{\"ts\":\"2023-03-22T09:44:13.908Z\",\"v\":\"07e9c7db2174c11f0767fcfa3f52b2f5aa148595\",\"c\":\"Initial version\"}]', NULL),
('test-longrun', 'draft', 'slave2', NULL, '[{\"definition\":{\"duration\":120,\"stepType\":\"test/longRunning\",\"description\":\"Long running step - use for testing only\"},\"description\":\"Long running step - use for testing only\"}]', '', 'active', '[{\"ts\":\"2023-03-22T09:45:10.532Z\",\"v\":\"draft\",\"m\":\"draft version\"},{\"ts\":\"2023-03-22T09:44:13.908Z\",\"v\":\"07e9c7db2174c11f0767fcfa3f52b2f5aa148595\",\"c\":\"Initial version\"}]', NULL),
('test-longrun-parent', '039550376bccff82f4d5d486fb5986377506ca39', 'slave1', NULL, '[{\"definition\":{\"field\":\"selection-field\",\"map\":[],\"defaultPipeline\":\"test-longrun\",\"stepType\":\"util/child-pipeline\",\"description\":\"Route to a child pipeline\"},\"description\":\"Route to a child pipeline\"}]', '', 'draft', '[{\"ts\":\"2023-03-22T21:01:02.496Z\",\"v\":\"039550376bccff82f4d5d486fb5986377506ca39\",\"c\":\"Initial version\"}]', NULL),
('test-longrun-parent', 'draft', 'slave1', NULL, '[{\"definition\":{\"field\":\"selection-field\",\"map\":[],\"defaultPipeline\":\"test-longrun\",\"stepType\":\"util/child-pipeline\",\"description\":\"Route to a child pipeline\"},\"description\":\"Route to a child pipeline\"}]', '', 'active', '[{\"ts\":\"2023-03-22T21:04:43.354Z\",\"v\":\"draft\",\"m\":\"draft version\"},{\"ts\":\"2023-03-22T21:01:02.496Z\",\"v\":\"039550376bccff82f4d5d486fb5986377506ca39\",\"c\":\"Initial version\"}]', NULL),
('test-longsleep', 'draft', NULL, NULL, '[{\"definition\":{\"min\":30000,\"max\":30000,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time\"},\"description\":\"Delay a random period of time\",\"stepType\":\"util/delay\"},{\"definition\":{\"forceDeepSleep\":false,\"min\":30000,\"max\":30000,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time (ms)\"},\"description\":\"Delay a random period of time (ms)\",\"stepType\":\"util/delay\"}]', '', 'active', '[{\"ts\":\"2023-04-03T10:31:21.076Z\",\"v\":\"draft\",\"m\":\"draft version\"},{\"ts\":\"2023-04-03T10:30:00.256Z\",\"v\":\"e409166ac090958bdef7e5a5371e9690446f6e0a\",\"c\":\"Initial version\"}]', NULL),
('test-longsleep', 'e409166ac090958bdef7e5a5371e9690446f6e0a', 'master', NULL, '[{\"definition\":{\"min\":300,\"max\":300,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time\"},\"description\":\"Delay a random period of time\"}]', '', 'draft', '[{\"ts\":\"2023-04-03T10:30:00.256Z\",\"v\":\"e409166ac090958bdef7e5a5371e9690446f6e0a\",\"c\":\"Initial version\"}]', NULL),
('test-master', 'draft', 'slave1', NULL, '[{\"definition\":{\"field\":\"-\",\"map\":[],\"defaultPipeline\":\"test-slave\",\"stepType\":\"util/child-pipeline\",\"description\":\"Route to a child pipeline\"},\"description\":\"Route to a child pipeline\",\"stepType\":\"util/child-pipeline\"}]', '', 'active', '[{\"ts\":\"2022-07-20T09:10:08.589Z\",\"v\":\"draft\",\"m\":\"draft version\"}]', NULL),
('test-slave', 'draft', 'slave2', NULL, '[{\"definition\":{\"min\":5,\"max\":10,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time\"},\"description\":\"Delay a random period of time\",\"stepType\":\"util/delay\"},{\"definition\":{\"forceDeepSleep\":false,\"min\":10,\"max\":15,\"stepType\":\"util/delay\",\"description\":\"Delay a random period of time\"},\"description\":\"Delay a random period of time\",\"stepType\":\"util/delay\"},{\"definition\":{\"returnError\":false,\"note\":\"Not supported\",\"reply\":{\"message\":\"Carry on...\"},\"stepType\":\"util/fixed-reply\",\"description\":\"Return a fixed reply\"},\"description\":\"Return a fixed reply\"}]', '', 'active', '[{\"ts\":\"2022-07-20T09:06:54.492Z\",\"v\":\"draft\",\"m\":\"draft version\"}]', NULL),
('test-wait', 'draft', NULL, NULL, '[{\"definition\":{\"switch\":\"happiness\",\"stepType\":\"util/wait\",\"description\":\"Wait for a switch to be activated\"},\"description\":\"Wait for a switch to be activated\"}]', '', 'draft', '[{\"ts\":\"2023-04-11T13:49:07.439Z\",\"v\":\"draft\",\"m\":\"draft version\"}]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `atp_pipeline_status`
--

DROP TABLE IF EXISTS `atp_pipeline_status`;
CREATE TABLE `atp_pipeline_status` (
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_pipeline_status`
--

INSERT INTO `atp_pipeline_status` (`status`, `description`) VALUES
('active', 'In use'),
('draft', 'Still in preparation'),
('inactive', 'Not available');

-- --------------------------------------------------------

--
-- Table structure for table `atp_step_artifact`
--

DROP TABLE IF EXISTS `atp_step_artifact`;
CREATE TABLE `atp_step_artifact` (
  `step_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artifact_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Prefixed with json: if object',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atp_step_instance`
--

DROP TABLE IF EXISTS `atp_step_instance`;
CREATE TABLE `atp_step_instance` (
  `step_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `step_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` varchar(72) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `definition` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'init',
  `percentage_complete` int(11) NOT NULL DEFAULT '0',
  `completion_token` varchar(72) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` text COLLATE utf8mb4_unicode_ci,
  `start_time` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `status_time` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `completion_time` timestamp(2) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atp_transaction2`
--

DROP TABLE IF EXISTS `atp_transaction2`;
CREATE TABLE `atp_transaction2` (
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User ID',
  `external_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `completion_time` timestamp(3) NULL DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `response_acknowledge_time` timestamp(3) NULL DEFAULT NULL,
  `sequence_of_update` int(11) NOT NULL DEFAULT '0',
  `progress_report` text COLLATE utf8mb4_unicode_ci,
  `transaction_output` text COLLATE utf8mb4_unicode_ci,
  `switches` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sleeping_since` timestamp NULL DEFAULT NULL,
  `sleep_counter` int(11) DEFAULT NULL,
  `wake_time` timestamp NULL DEFAULT NULL,
  `wake_switch` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wake_node_group` varchar(72) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wake_step_id` varchar(72) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atp_transaction_delta`
--

DROP TABLE IF EXISTS `atp_transaction_delta`;
CREATE TABLE `atp_transaction_delta` (
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL,
  `owner` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User ID',
  `step_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_time` timestamp(3) NULL DEFAULT NULL,
  `log_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_transaction_delta`
--

INSERT INTO `atp_transaction_delta` (`transaction_id`, `sequence`, `owner`, `step_id`, `data`, `event_time`, `log_time`) VALUES
('tx-045574558eaa207916f776f457c4725e36363f88', 1, 'acme', 's-f9382c4d0f27366c8a624f6f807e25d0f2537dc0', '{\"vogPath\":\"045574=null\",\"vogI\":0,\"vogP\":null,\"stepDefinition\":\"null\",\"level\":0,\"fullSequence\":\"045574\",\"status\":\"initial\"}', '2023-05-01 01:34:22.081', '2023-05-01 01:34:22.121'),
('tx-045574558eaa207916f776f457c4725e36363f88', 2, 'acme', 's-f9382c4d0f27366c8a624f6f807e25d0f2537dc0', '{\"stepDefinition\":\"null\"}', '2023-05-01 01:34:22.138', '2023-05-01 01:34:22.138'),
('tx-28d237f913c866224524c386dd0760445a8104f6', 1, 'acme', 's-05857e60cb9699b658775d0b785f911ed444d25c', '{\"vogPath\":\"28d237=null\",\"vogI\":0,\"vogP\":null,\"stepDefinition\":\"null\",\"level\":0,\"fullSequence\":\"28d237\",\"status\":\"initial\"}', '2023-04-29 11:52:38.683', '2023-04-29 11:52:38.721'),
('tx-28d237f913c866224524c386dd0760445a8104f6', 2, 'acme', 's-05857e60cb9699b658775d0b785f911ed444d25c', '{\"stepDefinition\":\"null\"}', '2023-04-29 11:52:38.780', '2023-04-29 11:52:38.781'),
('tx-3cad8cddb4a9db268d1ce8e40d0c76cfc454b3da', 1, 'acme', 's-fc5fecbc8f0a8927b8adbdcbd818123088a1ebee', '{\"vogPath\":\"3cad8c=null\",\"vogI\":0,\"vogP\":null,\"stepDefinition\":\"null\",\"level\":0,\"fullSequence\":\"3cad8c\",\"status\":\"initial\"}', '2023-05-01 01:48:44.574', '2023-05-01 01:48:44.603'),
('tx-3cad8cddb4a9db268d1ce8e40d0c76cfc454b3da', 2, 'acme', 's-fc5fecbc8f0a8927b8adbdcbd818123088a1ebee', '{\"stepDefinition\":\"null\"}', '2023-05-01 01:48:44.611', '2023-05-01 01:48:44.613'),
('tx-b6b166876da7d11ced43b87734a5c403e3f9a7fe', 1, 'acme', 's-d4bfe13934ffa155a9fbab52050edbaa6f22c4d7', '{\"vogPath\":\"b6b166=null\",\"vogI\":0,\"vogP\":null,\"stepDefinition\":\"null\",\"level\":0,\"fullSequence\":\"b6b166\",\"status\":\"initial\"}', '2023-05-01 01:49:33.903', '2023-05-01 01:49:33.923'),
('tx-b6b166876da7d11ced43b87734a5c403e3f9a7fe', 2, 'acme', 's-d4bfe13934ffa155a9fbab52050edbaa6f22c4d7', '{\"stepDefinition\":\"null\"}', '2023-05-01 01:49:33.932', '2023-05-01 01:49:33.933');

-- --------------------------------------------------------

--
-- Table structure for table `atp_transaction_state`
--

DROP TABLE IF EXISTS `atp_transaction_state`;
CREATE TABLE `atp_transaction_state` (
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atp_transaction_status`
--

DROP TABLE IF EXISTS `atp_transaction_status`;
CREATE TABLE `atp_transaction_status` (
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_transaction_status`
--

INSERT INTO `atp_transaction_status` (`status`, `description`) VALUES
('complete', 'Transaction completed'),
('frozen', 'Processing temporarily stopped by system'),
('hold', 'Transaction has been put on hold by a step'),
('rollback', 'Rollback in progress'),
('rollback_complete', 'Successfully rolled back all steps'),
('rollback_failed', 'Failed to roll back steps'),
('running', 'Running steps'),
('terminated', 'Halted processing and not attempting rollback');

-- --------------------------------------------------------

--
-- Table structure for table `atp_transaction_type`
--

DROP TABLE IF EXISTS `atp_transaction_type`;
CREATE TABLE `atp_transaction_type` (
  `transaction_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_transaction_type` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pipeline_version` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'master',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `pipeline_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'deprecated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atp_transaction_type`
--

INSERT INTO `atp_transaction_type` (`transaction_type`, `is_transaction_type`, `description`, `pipeline_version`, `node_group`, `notes`, `pipeline_name`) VALUES
('example', 1, 'Example pipeline', 'draft', 'slave1', 'This is an example pipeline\nused to test stuff. We hope you like it.\n', 'example'),
('example.sleeper', 1, 'Goes to sleep for 10 - 15 seconds, which is useful for showing polling and status changes.', '1.0', 'master', NULL, 'example.sleeper'),
('myPipeline', 1, 'My tutorial pipeline', 'draft', 'master', '', 'myPipeline'),
('not-supported', 1, 'Return a \"not supported\" message', '1.0', 'master', NULL, 'not-supported'),
('null', 1, 'Do nothing', 'draft', 'master', NULL, 'null'),
('test-longrun', 1, 'Pipeline takes 2 minutes to complete', 'draft', 'master', '', 'test-longrun'),
('test-longrun-parent', 1, '', '039550376bccff82f4d5d486fb5986377506ca39', 'slave2', '', 'test-longrun-parent'),
('test-longsleep', 1, '', 'draft', 'slave1', '', 'test-longsleep'),
('test-master', 1, '', 'draft', 'slave1', '', 'test-master'),
('test-slave', 1, 'Pipeline for testing master / slave setup', 'draft', 'slave2', '', 'test-slave'),
('test-wait', 1, '', 'draft', 'slave1', '', 'test-wait'),
('webhook-test', 1, '', 'draft', 'master', '', 'webhook-test');

-- --------------------------------------------------------

--
-- Table structure for table `atp_webhook`
--

DROP TABLE IF EXISTS `atp_webhook`;
CREATE TABLE `atp_webhook` (
  `transaction_id` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'outstanding',
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latest_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `next_attempt` timestamp NULL DEFAULT NULL,
  `retry_count` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formservice_field`
--

DROP TABLE IF EXISTS `formservice_field`;
CREATE TABLE `formservice_field` (
  `tenant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(11) NOT NULL DEFAULT '-1',
  `view` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_value` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `example_value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowable_values` text COLLATE utf8mb4_unicode_ci,
  `column_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mysql only',
  `is_primary_key` tinyint(1) NOT NULL DEFAULT '0',
  `is_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'json only',
  `is_description` tinyint(1) NOT NULL DEFAULT '0',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  `is_searchable` tinyint(1) NOT NULL DEFAULT '0',
  `modifiers` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modes` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Request and response parameters';

--
-- Dumping data for table `formservice_field`
--

INSERT INTO `formservice_field` (`tenant`, `version`, `view`, `name`, `sequence`, `label`, `type`, `default_value`, `example_value`, `allowable_values`, `column_name`, `is_primary_key`, `is_index`, `is_description`, `is_mandatory`, `is_searchable`, `modifiers`, `modes`) VALUES
('datp', -1, 'cebuana-getFees-request', 'currency_id', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'extra1', 2, 'Extra1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'extra2', 3, 'Extra2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'extra3', 4, 'Extra3', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'extra4', 5, 'Extra4', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'extra5', 6, 'Extra5', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'extra6', 7, 'Extra6', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'junk1', 8, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'junk2', 9, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'junk3', 10, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'junk4', 11, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'junk5', 12, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-request', 'principal_amount', 0, 'Principal amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-response', 'code', 0, 'Code', 'string', NULL, NULL, NULL, 'yarp', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'message', 3, 'Message', 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'principal_amount', 2, 'Principal amount', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-getFees-response', 'remco_id', 8, 'Remco', 'number', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'result.LogID', 6, 'Log ID', 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'result.MessageID', 5, 'Message', 'number', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'result.ResultStatus', 4, 'Result status', 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'result.ServiceFee', 7, 'Service fee', 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'cebuana-getFees-response', 'service_fee', 1, 'Service fee', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'amount', 28, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'forApproval', 31, 'ForApproval', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'processorId', 30, 'ProcessorId', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'purpose', 29, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverAddress', 21, 'ReceiverAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverCityBarangay', 23, 'ReceiverCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverEmail', 26, 'ReceiverEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverFirstName', 18, 'ReceiverFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverLastName', 20, 'ReceiverLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverMiddleName', 19, 'ReceiverMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverMobileNumber', 25, 'ReceiverMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverNationality', 27, 'ReceiverNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverProvince', 22, 'ReceiverProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'receiverZipCode', 24, 'ReceiverZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderAddress', 4, 'SenderAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderBirthDate', 13, 'SenderBirthDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderBirthPlace', 12, 'SenderBirthPlace', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderCityBarangay', 6, 'SenderCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderEmail', 11, 'SenderEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderFirstName', 1, 'SenderFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderFundSource', 17, 'SenderFundSource', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderGender', 9, 'SenderGender', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderIDExpiry', 16, 'SenderIDExpiry', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderIDNumber', 15, 'SenderIDNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderIDType', 14, 'SenderIDType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderLastName', 3, 'SenderLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderMiddleName', 2, 'SenderMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderMobileNumber', 10, 'SenderMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderNationality', 8, 'SenderNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderProvince', 5, 'SenderProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-i2i-transfer-request', 'senderZipCode', 7, 'SenderZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'cebuana-transfer-request', 'junk1', 0, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.accountName', 13, 'AccountName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.accountNumber', 14, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.address', 17, 'Address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.bank.code', 22, 'Code', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.bank.name', 21, 'Name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.barangay', 18, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.city', 19, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.email', 16, 'Email', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.gender', 23, 'Gender', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.mobileNumber', 15, 'MobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'receiver.zipCode', 20, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'representative.firstName', 24, 'FirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'representative.lastName', 26, 'LastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'representative.middleName', 25, 'MiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'representative.suffix', 27, 'Suffix', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.accountName', 5, 'AccountName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.accountNumber', 6, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.address', 9, 'Address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.barangay', 10, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.city', 11, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.email', 8, 'Email', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.mobileNumber', 7, 'MobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'sender.zipCode', 12, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'transaction.amount', 1, 'Amount', 'amount', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'transaction.callbackURL', 4, 'CallbackURL', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'transaction.purpose', 2, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'transaction.receiverType', 3, 'ReceiverType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'instapay-i2i-transfer-request', 'transaction.senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'amount', 28, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'forApproval', 31, 'ForApproval', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'processorId', 30, 'ProcessorId', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'purpose', 29, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverAddress', 21, 'ReceiverAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverCityBarangay', 23, 'ReceiverCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverEmail', 26, 'ReceiverEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverFirstName', 18, 'ReceiverFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverLastName', 20, 'ReceiverLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverMiddleName', 19, 'ReceiverMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverMobileNumber', 25, 'ReceiverMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverNationality', 27, 'ReceiverNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverProvince', 22, 'ReceiverProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'receiverZipCode', 24, 'ReceiverZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderAddress', 4, 'SenderAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderBirthDate', 13, 'SenderBirthDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderBirthPlace', 12, 'SenderBirthPlace', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderCityBarangay', 6, 'SenderCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderEmail', 11, 'SenderEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderFirstName', 1, 'SenderFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderFundSource', 17, 'SenderFundSource', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderGender', 9, 'SenderGender', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderIDExpiry', 16, 'SenderIDExpiry', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderIDNumber', 15, 'SenderIDNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderIDType', 14, 'SenderIDType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderLastName', 3, 'SenderLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderMiddleName', 2, 'SenderMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderMobileNumber', 10, 'SenderMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderNationality', 8, 'SenderNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderProvince', 5, 'SenderProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'lbc-i2i-transfer-request', 'senderZipCode', 7, 'SenderZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'address', 25, 'Address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'barangay', 26, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'birth_country', 22, 'Birth_country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'birth_date', 20, 'Birth_date', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'birth_place', 21, 'Birth_place', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'city', 27, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'client_reference_no', 43, 'Client_reference_no', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'contact_number', 31, 'Contact_number', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'control_number', 42, 'Control_number', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'country', 30, 'Country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'currency_id', 4, 'Currency_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'current_address', 32, 'Current_address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'customer_id', 3, 'Customer_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'customer_name', 8, 'Customer_name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'destination_country', 15, 'Destination_country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'dst_amount', 11, 'Dst_amount', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'form_number', 37, 'Form_number', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'form_type', 36, 'Form_type', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'id_number', 24, 'Id_number', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'id_type', 23, 'Id_type', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'is_domestic', 7, 'Is_domestic', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'location_id', 0, 'Location_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'location_name', 45, 'Location_name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'occupation', 18, 'Occupation', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'originating_country', 14, 'Originating_country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'payout_type', 38, 'Payout_type', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'permanent_address', 33, 'Permanent_address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'principal_amount', 41, 'Principal_amount', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'province', 28, 'Province', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'purpose_transaction', 16, 'Purpose_transaction', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'receiver_name', 40, 'Receiver_name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'reference_number', 44, 'Reference_number', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'relation_to', 19, 'Relation_to', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'remco_id', 5, 'Remco_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'remote_location_id', 10, 'Remote_location_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'remote_user_id', 13, 'Remote_user_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'risk_criteria', 35, 'Risk_criteria', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'risk_score', 34, 'Risk_score', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'sender_name', 39, 'Sender_name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'service_charge', 9, 'Service_charge', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'source_fund', 17, 'Source_fund', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'total_amount', 12, 'Total_amount', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'trx_date', 2, 'Trx_date', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'trx_type', 6, 'Trx_type', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'user_id', 1, 'User_id', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'metrobank-transfer-request', 'zip_code', 29, 'Zip_code', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'amount', 3, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'forApproval', 0, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'purpose', 20, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'receiverMobileNumber', 5, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'receiverName', 4, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'relationToBene', 19, 'Relation to beneficiary', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderAddress', 8, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderBirthDate', 13, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderBirthPlace', 12, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderEmail', 18, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderFundSource', 17, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderGender', 11, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderIDExpiry', 16, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderIDNumber', 15, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderIDType', 14, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderMobileNumber', 7, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderName', 6, 'Sender name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderNationality', 10, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderReference', 2, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'senderZipCode', 9, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'p2p-i2i-transfer-request', 'smsNotification', 1, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'amount', 28, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'forApproval', 31, 'ForApproval', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'processorId', 30, 'ProcessorId', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'purpose', 29, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverAddress', 21, 'ReceiverAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverCityBarangay', 23, 'ReceiverCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverEmail', 26, 'ReceiverEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverFirstName', 18, 'ReceiverFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverLastName', 20, 'ReceiverLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverMiddleName', 19, 'ReceiverMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverMobileNumber', 25, 'ReceiverMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverNationality', 27, 'ReceiverNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverProvince', 22, 'ReceiverProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'receiverZipCode', 24, 'ReceiverZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderAddress', 4, 'SenderAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderBirthDate', 13, 'SenderBirthDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderBirthPlace', 12, 'SenderBirthPlace', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderCityBarangay', 6, 'SenderCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderEmail', 11, 'SenderEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderFirstName', 1, 'SenderFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderFundSource', 17, 'SenderFundSource', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderGender', 9, 'SenderGender', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderIDExpiry', 16, 'SenderIDExpiry', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderIDNumber', 15, 'SenderIDNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderIDType', 14, 'SenderIDType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderLastName', 3, 'SenderLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderMiddleName', 2, 'SenderMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderMobileNumber', 10, 'SenderMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderNationality', 8, 'SenderNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderProvince', 5, 'SenderProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'perahub-i2i-transfer-request', 'senderZipCode', 7, 'SenderZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.accountName', 14, 'AccountName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.accountNumber', 15, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.address', 18, 'Address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.bank.code', 23, 'Code', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.bank.name', 22, 'Name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.barangay', 19, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.city', 20, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.email', 17, 'Email', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.gender', 24, 'Gender', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.mobileNumber', 16, 'MobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'receiver.zipCode', 21, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'representative.firstName', 25, 'FirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'representative.lastName', 27, 'LastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'representative.middleName', 26, 'MiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'representative.suffix', 28, 'Suffix', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.accountName', 6, 'AccountName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.accountNumber', 7, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.address', 10, 'Address', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.barangay', 11, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.city', 12, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.email', 9, 'Email', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.mobileNumber', 8, 'MobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'sender.zipCode', 13, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'transaction.amount', 1, 'Amount', 'amount', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'transaction.purpose', 2, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'transaction.receiverType', 3, 'ReceiverType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'transaction.remarks', 5, 'Remarks', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'pesonet-i2i-transfer-request', 'transaction.senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'amount', 1, 'Amount', 'amount', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'forApproval', 4, 'ForApproval', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'purpose', 2, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverAddress', 26, 'ReceiverAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverCityBarangay', 28, 'ReceiverCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverEmail', 25, 'ReceiverEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverFirstName', 21, 'ReceiverFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverLastName', 23, 'ReceiverLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverMiddleName', 22, 'ReceiverMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverMobileNumber', 24, 'ReceiverMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverNationality', 30, 'ReceiverNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverProvince', 27, 'ReceiverProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'receiverZipCode', 29, 'ReceiverZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'remarks', 3, 'Remarks', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderAddress', 9, 'SenderAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderBirthDate', 16, 'SenderBirthDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderCityBarangay', 11, 'SenderCityBarangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderEmail', 8, 'SenderEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderFirstName', 5, 'SenderFirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderFundSource', 20, 'SenderFundSource', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderGender', 14, 'SenderGender', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderIDExpiry', 19, 'SenderIDExpiry', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderIDNumber', 18, 'SenderIDNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderIDType', 17, 'SenderIDType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderLastName', 7, 'SenderLastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderMiddleName', 6, 'SenderMiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderMobileNumber', 15, 'SenderMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderNationality', 13, 'SenderNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderProvince', 10, 'SenderProvince', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'remittance-i2i-transfer-request', 'senderZipcode', 12, 'SenderZipcode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'currency', 0, 'Currency', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other1', 2, 'Some other property', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other2', 3, 'Other2', 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other3.val2', 5, 'Value 3', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other3.valx', 4, 'X', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other4', 6, 'Other4', 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other5', 7, 'Other5', 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other6', 8, 'Other6', 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'other7', 9, 'Other7', 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-request', 'principal_amount', 1, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-response', 'code', 0, 'Code', 'string', NULL, NULL, NULL, 'yarp', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'std-getFees-response', 'principal_amount', 2, NULL, 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-getFees-response', 'service_fee', 1, NULL, 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-kyc-create-customer-request', 'tenant_id', 0, 'Tenant ID', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-kyc-initiate-check-request', 'customer_id', 1, 'Customer ID', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-kyc-initiate-check-request', 'tenant_id', 0, 'Tenant ID', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-kyc-result-of-check-request', 'check_id', 2, 'Check ID', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-kyc-result-of-check-request', 'customer_id', 1, 'Customer_id', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-kyc-result-of-check-request', 'tenant_id', 0, 'Tenant_id', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.accountNumber', 15, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.barangay', 22, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.city', 23, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.country', 25, 'Country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.line1', 20, 'Line1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.line2', 21, 'Line2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.province', 24, 'Province', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.address.zipCode', 26, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.birthDate', 27, 'BirthDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.emailAddress', 29, 'EmailAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.mobileNumber', 28, 'MobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.name.firstName', 16, 'FirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.name.lastName', 18, 'LastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.name.middleName', 17, 'MiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.name.suffix', 19, 'Suffix', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.nationality', 30, 'Nationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'beneficiary.receivingBank', 14, 'ReceivingBank', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'channel', 0, 'Channel', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'method', 1, '', 'string', '', '', '', NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'remarks', 35, 'Remarks', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'remittance.amount', 31, 'Amount', 'amount3', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'remittance.currency', 32, 'Currency', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'remittance.instructions', 34, 'Instructions', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'remittance.purpose', 33, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.barangay', 9, 'Barangay', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.city', 10, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.country', 12, 'Country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.line1', 7, 'Line1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.line2', 8, 'Line2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.province', 11, 'Province', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.address.zipCode', 13, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.name.firstName', 3, 'FirstName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.name.lastName', 5, 'LastName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.name.middleName', 4, 'MiddleName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'sender.name.suffix', 6, 'Suffix', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-payment-request', 'senderReference', 2, 'Sender Reference', 'string', '', '', '', NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badAmount', 9, '', 'amount', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badAmount3', 10, '', 'amount3', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badAmount3_b', 10, '', 'amount3', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badBoolean', 11, '', 'boolean', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badEnum', 12, '', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badFloat', 9, 'Ba dfloat', 'float', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badInteger', 8, '', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badNumber', 7, '', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'badString', 7, 'Bad string', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodAmount', 14, '', 'amount', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodAmount3', 15, '', 'amount3', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodBoolean', 16, '', 'boolean', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodDate', 17, '', 'date', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodEnum', 20, '', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodFloat', 13, '', 'float', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodInteger', 12, '', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodString', 11, '', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodTime', 18, '', 'time', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'goodTimestamp', 19, '', 'timestamp', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'missingMandatoryField', 0, '', 'string', '', '', '', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-test-request', 'nonMandatoryField', 4, 'Non-mandatory field', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-fees-request', 'amount', 0, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'amount', 2, 'Amount', 'amount3', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'forApproval', 8, 'ForApproval', 'boolean', NULL, 'true', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'method', 0, 'Instapay / PesoNet / i2i / Bux / etc', 'string', 'pesonet', 'i2i-transfer', 'instapay-i2i | i2i-transfer | pesonet-i2i', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'projectCode', 9, 'ProjectCode', 'string', NULL, 'AB37', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'purpose', 5, 'Purpose', 'string', NULL, '135', 'Charity', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.accountName', 36, 'Receiver account name', 'string', NULL, 'Harold J Smyth', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.accountNumber', 37, 'AccountNumber', 'string', NULL, '9999 3344 5566', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.address', 40, 'Address', 'string', NULL, '5631 Flower Street', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `formservice_field` (`tenant`, `version`, `view`, `name`, `sequence`, `label`, `type`, `default_value`, `example_value`, `allowable_values`, `column_name`, `is_primary_key`, `is_index`, `is_description`, `is_mandatory`, `is_searchable`, `modifiers`, `modes`) VALUES
('datp', -1, 'std-transfer-request', 'receiver.bank.code', 47, 'Code', 'string', NULL, 'pe-tal', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.bank.name', 46, 'Name', 'string', NULL, 'First National Flower Growers Community Bank', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.barangay', 42, 'Barangay', 'string', NULL, 'Malabanias', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.city', 43, 'City', 'string', NULL, 'Angeles City', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.country', 45, 'Country', 'string', NULL, 'Philippines', NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.email', 39, 'Email', 'string', NULL, 'harold.smyth@nowhere.com', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.firstName', 33, 'FirstName', 'string', NULL, 'Harold', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.gender', 48, 'Gender', 'string', NULL, 'male', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.lastName', 35, 'LastName', 'string', NULL, 'Smyth', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.middleName', 34, 'MiddleName', 'string', NULL, 'John', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.mobileNumber', 38, 'MobileNumber', 'string', NULL, '0905 123 5555', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.name', 32, 'Name', 'string', NULL, 'Harold J Smyth', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.nationality', 49, 'Nationality', 'string', NULL, 'Norwegan', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.province', 41, 'Province', 'string', NULL, 'Pampanga', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiver.zipCode', 44, 'ZipCode', 'string', NULL, '2023', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'receiverType', 6, 'Receiver Type', 'string', NULL, 'INDIVIDUAL', 'INDIVIDUAL|CORPORATE', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'remarks', 7, 'Remarks', 'string', NULL, 'Swift routing XXX827AABG7', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'representative.firstName', 50, 'FirstName', 'string', NULL, 'Barry', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'representative.lastName', 52, 'LastName', 'string', NULL, 'Snogglespark', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'representative.middleName', 51, 'MiddleName', 'string', NULL, 'Cederick', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'representative.suffix', 53, 'Suffix', 'string', NULL, 'Mr', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.accountName', 14, 'AccountName', 'string', NULL, 'Mary J Smith', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.accountNumber', 15, 'AccountNumber', 'string', NULL, '1234 5678 9876', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.address', 18, 'Address', 'string', NULL, '123 Victoria Road', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.barangay', 20, 'Barangay', 'string', NULL, 'Mabalacat', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.birthDate', 26, 'BirthDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.birthPlace', 24, 'BirthPlace', 'string', NULL, 'Moscow', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.city', 21, 'City', 'string', NULL, 'Angeles City', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.email', 17, 'Email', 'string', NULL, 'mary.smith@nowhere.com', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.firstName', 11, 'FirstName', 'string', NULL, 'Mary', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.fundSource', 30, 'FundSource', 'string', NULL, 'salary', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.gender', 25, 'Gender', 'string', NULL, 'female', 'male | female', NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.IDExpiry', 29, 'IDExpiry', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.IDNumber', 28, 'IDNumber', 'string', NULL, 'KY88292-4', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.IDType', 27, 'IDType', 'string', NULL, 'driver license', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.lastName', 13, 'Last Name', 'string', NULL, 'Smith', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.middleName', 12, 'MiddleName', 'string', NULL, 'Julie', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.mobileNumber', 16, 'MobileNumber', 'string', NULL, '0917 555 5555', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.name', 10, 'Name', 'string', NULL, 'Mary Smith', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.nationality', 23, 'Nationality', 'string', NULL, 'Russian', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.province', 19, 'Province', 'string', NULL, 'Pampanga', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.relationshipToBeneficiary', 31, 'RelationshipToBene', 'string', NULL, 'Mother', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'sender.zipCode', 22, 'ZipCode', 'string', NULL, '2009', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-request', 'senderReference', 1, 'Sender Reference', 'string', NULL, 'BU123456', NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-response', 'reference_number', 0, 'Ref #', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-response', 'status', 1, 'Status', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-transfer-status-request', 'senderReference', 0, 'Sender Reference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transfer-validate-request', 'senderReference', 0, 'Sender Reference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-transferFees-request', 'amount', 0, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-wallet-topup-request', 'amount', 1, 'Amount', 'number', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-wallet-topup-request', 'remarks', 2, 'Remarks', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-wallet-topup-request', 'senderReference', 0, 'Sender reference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-wallet-topup-status-request', 'senderReference', 0, 'Sender Reference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-wallet-withdrawal-request', 'amount', 1, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-wallet-withdrawal-request', 'remarks', 2, 'Remarks', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'std-wallet-withdrawal-request', 'senderReference', 0, 'Sender Reference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'std-wallet-withdrawal-status-request', 'senderReference', 0, 'Sender Reference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'amount', 1, 'Amount', 'amount', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'projectCode', 4, 'ProjectCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'purpose', 2, 'Purpose', 'string', NULL, NULL, 'allowance|charity|family support|savings|payroll / salary|loan disbursement|cash disbursement', NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'receiverMobileNumber', 20, 'ReceiverMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'receiverName', 19, 'ReceiverName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'relationToBene', 18, 'RelationshipToBene', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'remarks', 3, 'Remarks', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderAddress', 7, 'SenderAddress', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderBirthDate', 10, 'Sender birth date', 'date', '', '2011-01-02', '', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderBirthPlace', 11, 'Sender Birthplace', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderEmail', 6, 'SenderEmail', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderFundSource', 17, 'SenderFundSource', 'string', NULL, NULL, 'salary|allowance|investments|proceed of sale|bonus|donation| inheritance|cash gift|proceeds of loan or borrowing|online sales', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderGender', 12, 'SenderGender', 'string', NULL, NULL, 'male|female', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderIDExpiry', 16, 'SenderIDExpiry', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderIDNumber', 15, 'SenderIDNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderIDType', 14, 'SenderIDType', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderMobileNumber', 13, 'SenderMobileNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderName', 5, 'SenderName', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderNationality', 9, 'SenderNationality', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderReference', 0, 'SenderReference', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'transfer-i2i-transfer-request', 'senderZipCode', 8, 'SenderZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.accountNumber', 9, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.address.city', 13, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.address.country', 15, 'Country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.address.line1', 11, 'Line1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.address.line2', 12, 'Line2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.address.province', 14, 'Province', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.address.zipCode', 16, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'beneficiary.name', 10, 'Name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'remittance.amount', 17, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'remittance.currency', 18, 'Currency', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'remittance.instructions', 21, 'Instructions', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'remittance.purpose', 20, 'Purpose', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'remittance.receivingBank', 19, 'ReceivingBank', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.address.city', 4, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.address.country', 7, 'Country', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.address.line1', 3, 'Line1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.address.line2', 5, 'Line2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.address.province', 6, 'Province', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.address.zipCode', 8, 'ZipCode', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'sender.name', 2, 'Name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'senderRefId', 0, 'Sender Reference (we generate this)', 'string', '', '123456789', '', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'ub-instapay-payment-request', 'tranRequestDate', 1, 'Transaction request date', 'string', '', '2022-02-13T15:29:16.333', '', NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.accountNumber', 9, 'AccountNumber', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.address.city', 13, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.address.country', 16, 'Country', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.address.line1', 11, 'Line1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.address.line2', 12, 'Line2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.address.province', 14, 'Province', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.address.zipCode', 15, 'ZipCode', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'beneficiary.name', 10, 'Name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'remittance.amount', 17, 'Amount', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'remittance.currency', 18, 'Currency', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'remittance.instructions', 21, 'Instructions', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'remittance.purpose', 20, 'Purpose', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'remittance.receivingBank', 19, 'ReceivingBank', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.address.city', 5, 'City', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.address.country', 8, 'Country', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.address.line1', 3, 'Line1', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.address.line2', 4, 'Line2', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.address.province', 6, 'Province', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.address.zipCode', 7, 'ZipCode', 'integer', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'sender.name', 2, 'Name', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'senderRefId', 0, 'SenderRefId', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ub-instapay-transfer-request', 'tranRequestDate', 1, 'TranRequestDate', 'string', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-request', 'amount', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-request', 'panalokard', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-request', 'ussc_promo', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-response', 'code', 0, NULL, 'number', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'message', 1, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'principal_amount', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-response', 'reference_1', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-response', 'reference_2', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-response', 'remco_id', 12, NULL, 'number', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.code', 5, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.journal_no', 7, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.message', 4, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.new_screen', 6, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.principal_amount', 2, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.process_date', 8, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.reference_number', 9, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.send_otp', 11, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.service_charge', 3, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'result.total_amount', 10, NULL, 'string', NULL, NULL, NULL, '', 0, 0, 0, 0, 0, NULL, ''),
('datp', -1, 'ussc-getFees-response', 'service_fee', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'ussc-getFees-response', 'total_amount', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.module', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.destination_country_code', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.destination_currency_code', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.fixed_amount_flag', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.foreign_reference_no', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.message', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.message_line_count', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.operator_id', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.principal_amount', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.promo_code', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.terminal_id', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.param.transaction_type', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL),
('datp', -1, 'wu-getFees-request', 'body.request', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `formservice_field_converter`
--

DROP TABLE IF EXISTS `formservice_field_converter`;
CREATE TABLE `formservice_field_converter` (
  `tenant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `converter` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formservice_field_converter`
--

INSERT INTO `formservice_field_converter` (`tenant`, `converter`, `description`) VALUES
('datp', 'copy', 'Copy from a source'),
('datp', 'literal', 'Set to a predefined value'),
('datp', 'skip', 'Not sure how to set this value');

-- --------------------------------------------------------

--
-- Table structure for table `formservice_field_mapping`
--

DROP TABLE IF EXISTS `formservice_field_mapping`;
CREATE TABLE `formservice_field_mapping` (
  `tenant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapping_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(11) NOT NULL DEFAULT '-1',
  `to_field` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converter` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formservice_field_mapping`
--

INSERT INTO `formservice_field_mapping` (`tenant`, `mapping_id`, `version`, `to_field`, `source`, `converter`) VALUES
('datp', 'cebuana-getFees-request', -1, 'currency_id', 'request:currency', NULL),
('datp', 'cebuana-getFees-request', -1, 'extra2', 'request:other2', NULL),
('datp', 'cebuana-getFees-request', -1, 'extra3', 'request:other5', NULL),
('datp', 'cebuana-getFees-request', -1, 'extra6', 'request:other6', NULL),
('datp', 'cebuana-getFees-request', -1, 'junk4', 'request:other7', NULL),
('datp', 'cebuana-getFees-response', -1, 'message', 'response:MessageID', 'copy'),
('datp', 'cebuana-getFees-response', -1, 'service_fee', 'response:ServiceFee', 'copy'),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.accountName', 'request:receiver.accountName', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.accountNumber', 'request:receiver.acountNumber', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.address', 'request:receiver.address', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.bank.code', 'request:receiver.bank.code', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.bank.name', 'request:receiver.bank.name', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.barangay', 'request:receiver.barangay', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.city', 'request:receiver.city', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.email', 'request:receiver.email', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.mobileNumber', 'request:receiver.mobileNumber', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'receiver.zipCode', 'request:receiver.zipCode', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'representative.firstName', 'request:representative.firstName', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'representative.lastName', 'request:representative.lastName', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'representative.middleName', 'request:representative.middleName', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'representative.suffix', 'request:representative.suffix', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.accountName', 'request:sender.accountName', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.accountNumber', 'request:sender.accountNumber', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.address', 'request:sender.address', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.barangay', 'request:sender.barangay', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.city', 'request:sender.city', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.email', 'request:sender.email', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.mobileNumber', 'request:sender.mobileNumber', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'sender.zipCode', 'request:sender.zipCode', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'transaction.amount', 'request:amount', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'transaction.purpose', 'request:purpose', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'transaction.receiverType', 'request:receiverType', NULL),
('datp', 'instapay-i2i-transfer-request', -1, 'transaction.senderReference', 'request:senderReference', NULL),
('datp', 'p2p-i2i-transfer-request', -1, 'amount', 'request:amount', NULL),
('datp', 'p2p-i2i-transfer-request', -1, 'senderIDType', 'request:payor.accountName', NULL),
('datp', 'p2p-i2i-transfer-request', -1, 'senderZipCode', 'request:receiver.details', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.accountName', 'request:receiver.accountName', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.accountNumber', 'request:receiver.accountNumber', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.address', 'request:receiver.address', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.bank.code', 'request:receiver.bank.code', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.bank.name', 'request:receiver.bank.name', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.barangay', 'request:receiver.barangay', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.city', 'request:receiver.city', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.email', 'request:receiver.email', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.gender', 'request:receiver.gender', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.mobileNumber', 'request:receiver.mobileNumber', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'receiver.zipCode', 'request:receiver.zipCode', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'representative.firstName', 'request:representative.firstName', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'representative.lastName', 'request:representative.lastName', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'representative.middleName', 'request:representative.middleName', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'representative.suffix', 'request:representative.suffix', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.accountName', 'request:sender.accountName', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.accountNumber', 'request:sender.accountNumber', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.address', 'request:sender.address', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.barangay', 'request:sender.barangay', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.city', 'request:sender.city', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.email', 'request:sender.email', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.mobileNumber', 'request:sender.mobileNumber', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'sender.zipCode', 'request:sender.zipCode', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'transaction.amount', 'request:amount', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'transaction.purpose', 'request:purpose', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'transaction.receiverType', 'request:receiverType', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'transaction.remarks', 'request:remarks', NULL),
('datp', 'pesonet-i2i-transfer-request', -1, 'transaction.senderReference', 'request:senderReference', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'amount', 'request:amount', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'forApproval', 'request:forApproval', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'purpose', 'request:purpose', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverAddress', 'request:receiver.address', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverEmail', 'request:receiver.email', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverFirstName', 'request:receiver.firstName', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverLastName', 'request:receiver.lastName', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverMiddleName', 'request:receiver.middleName', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverMobileNumber', 'request:receiver.mobileNumber', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverNationality', 'request:receiver.nationality', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverProvince', 'request:receiver.province', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'receiverZipCode', 'request:receiver.zipCode', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'remarks', 'request:remarks', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderAddress', 'request:sender.address', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderBirthDate', 'request:sender.birthDate', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderEmail', 'request:sender.email', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderFirstName', 'request:sender.firstName', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderFundSource', 'request:sender.fundSource', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderGender', 'request:sender.gender', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderIDExpiry', 'request:sender.IDExpiry', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderIDNumber', 'request:sender.IDNumber', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderIDType', 'request:sender.IDType', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderLastName', 'request:sender.lastName', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderMiddleName', 'request:sender.middleName', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderMobileNumber', 'request:sender.mobileNumber', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderNationality', 'request:sender.nationality', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderProvince', 'request:sender.province', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderReference', 'request:senderReference', NULL),
('datp', 'remittance-i2i-transfer-request', -1, 'senderZipcode', 'request:sender.zipCode', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'amount', 'request:amount', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'projectCode', 'request:projectCode', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'purpose', 'request:purpose', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'receiverMobileNumber', 'request:receiver.mobileNumber', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'receiverName', 'request:receiver.name', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'relationToBene', 'request:sender.relationshipToBeneficiary', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'remarks', 'request:remarks', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderAddress', 'request:sender.address', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderBirthDate', 'request:sender.birthDate', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderBirthPlace', 'request:sender.birthPlace', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderEmail', 'request:sender.email', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderFundSource', 'request:sender.fundSource', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderGender', 'request:sender.gender', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderIDExpiry', 'request:sender.IDExpiry', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderIDNumber', 'request:sender.IDNumber', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderIDType', 'request:sender.IDType', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderMobileNumber', 'request:sender.mobileNumber', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderName', 'request:sender.name', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderNationality', 'request:sender.nationality', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderReference', 'request:senderReference', NULL),
('datp', 'transfer-i2i-transfer-request', -1, 'senderZipCode', 'request:sender.zipCode', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.accountNumber', 'request:beneficiary.accountNumber', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.address.city', 'request:beneficiary.address.city', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.address.country', 'request:beneficiary.address.country', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.address.line1', 'request:beneficiary.address.line1', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.address.line2', 'request:beneficiary.address.line2', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.address.province', 'request:beneficiary.address.province', NULL),
('datp', 'ub-instapay-payment-request', -1, 'beneficiary.address.zipCode', 'request:beneficiary.address.zipCode', NULL),
('datp', 'ub-instapay-payment-request', -1, 'remittance.amount', 'request:remittance.amount', NULL),
('datp', 'ub-instapay-payment-request', -1, 'remittance.currency', 'request:remittance.currency', NULL),
('datp', 'ub-instapay-payment-request', -1, 'remittance.instructions', 'request:remittance.instructions', NULL),
('datp', 'ub-instapay-payment-request', -1, 'remittance.purpose', 'request:remittance.purpose', NULL),
('datp', 'ub-instapay-payment-request', -1, 'remittance.receivingBank', 'request:beneficiary.receivingBank', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.address.city', 'request:sender.address.city', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.address.country', 'request:sender.address.country', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.address.line1', 'request:sender.address.line1', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.address.line2', 'request:sender.address.line2', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.address.province', 'request:sender.address.province', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.address.zipCode', 'request:sender.address.zipCode', NULL),
('datp', 'ub-instapay-payment-request', -1, 'sender.name', 'request:sender.name.firstName', NULL),
('datp', 'ub-instapay-payment-request', -1, 'senderRefId', 'request:senderRefId', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'beneficiary.address.country', 'request:receiver.country', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'beneficiary.address.line1', 'request:receiver.address', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'beneficiary.address.province', 'request:receiver.province', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'beneficiary.address.zipCode', 'request:receiver.zipCode', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'beneficiary.name', 'request:receiver.name', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'remittance.amount', 'request:amount', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'remittance.instructions', 'request:remarks', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'remittance.purpose', 'request:purpose', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'sender.address.city', 'request:sender.city', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'sender.address.province', 'request:sender.province', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'sender.address.zipCode', 'request:sender.zipCode', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'sender.name', 'request:sender.name', NULL),
('datp', 'ub-instapay-transfer-request', -1, 'senderRefId', 'request:senderReference', NULL),
('datp', 'ussc-getFees-request', -1, 'amount', 'request:principal_amount', 'copy'),
('datp', 'ussc-getFees-request', -1, 'panalokard', 'request:loyalty_card_no', 'copy'),
('datp', 'ussc-getFees-request', -1, 'ussc_promo', 'request:promo_code', 'copy'),
('datp', 'ussc-getFees-response', -1, 'code', 'response:code', 'copy'),
('datp', 'ussc-getFees-response', -1, 'message', 'response:message', 'copy'),
('datp', 'ussc-getFees-response', -1, 'principal_amount', 'response:principal_amount', 'copy'),
('datp', 'ussc-getFees-response', -1, 'reference_1', 'response:journal_no', 'copy'),
('datp', 'ussc-getFees-response', -1, 'reference_2', 'response:reference_number', 'copy'),
('datp', 'ussc-getFees-response', -1, 'service_fee', 'response:service_charge', 'copy'),
('datp', 'ussc-getFees-response', -1, 'total_amount', 'response:total_amount', 'copy'),
('datp', 'wu-getFees-request', -1, 'body.module', 'prereq', 'literal'),
('datp', 'wu-getFees-request', -1, 'body.param.destination_country_code', 'request:destination_country', 'copy'),
('datp', 'wu-getFees-request', -1, 'body.param.destination_currency_code', 'request:currency', 'copy'),
('datp', 'wu-getFees-request', -1, 'body.param.fixed_amount_flag', 'N', 'literal'),
('datp', 'wu-getFees-request', -1, 'body.param.foreign_reference_no', '', 'skip'),
('datp', 'wu-getFees-request', -1, 'body.param.message', '', 'skip'),
('datp', 'wu-getFees-request', -1, 'body.param.message_line_count', '', 'skip'),
('datp', 'wu-getFees-request', -1, 'body.param.operator_id', '', 'skip'),
('datp', 'wu-getFees-request', -1, 'body.param.principal_amount', 'request:amount', 'copy'),
('datp', 'wu-getFees-request', -1, 'body.param.promo_code', 'request:promo_code', 'copy'),
('datp', 'wu-getFees-request', -1, 'body.param.terminal_id', '', 'skip'),
('datp', 'wu-getFees-request', -1, 'body.param.transaction_type', 'SO', 'literal'),
('datp', 'wu-getFees-request', -1, 'body.request', 'feeinquiry', 'literal'),
('datp', 'wu-getFees-response', -1, 'calcs.comment', 'hello there!', 'literal'),
('datp', 'wu-getFees-response', -1, 'calcs.total', 'response:uspwuapi.body.gross_total_amount', 'copy'),
('datp', 'wu-getFees-response', -1, 'gross', 'response:uspwuapi.body.gross_total_amount', 'copy'),
('datp', 'wu-getFees-response', -1, 'sender.email', 'auth:email', 'copy'),
('datp', 'wu-getFees-response', -1, 'sender.id', 'auth:userId', 'copy');

-- --------------------------------------------------------

--
-- Table structure for table `formservice_view`
--

DROP TABLE IF EXISTS `formservice_view`;
CREATE TABLE `formservice_view` (
  `tenant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(11) NOT NULL DEFAULT '-1',
  `view` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `view_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formservice_view`
--

INSERT INTO `formservice_view` (`tenant`, `version`, `view`, `description`, `notes`, `view_type`) VALUES
('datp', -1, 'cebuana-getFees-request', NULL, NULL, 'message'),
('datp', -1, 'cebuana-getFees-response', NULL, NULL, 'message'),
('datp', -1, 'cebuana-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'cebuana-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'instapay-i2i-getFees-response', NULL, NULL, 'message'),
('datp', -1, 'instapay-i2i-kyc-create-customer-response', NULL, NULL, 'message'),
('datp', -1, 'instapay-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'instapay-i2i-wallet-balance-response', NULL, NULL, 'message'),
('datp', -1, 'lbc-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'metrobank-transfer-fees-request', NULL, NULL, 'message'),
('datp', -1, 'metrobank-transfer-request', 'Format for metrobank transfers', 'See https://documenter.getpostman.com/view/9236752/SWTBcweg#e9f17d61-574d-4d76-b082-1bc87002013d\n\n{{local}}/usp/v2/metrobank/payout\n', 'message'),
('datp', -1, 'metrobank-transfer-status-request', NULL, NULL, 'message'),
('datp', -1, 'null', NULL, NULL, 'message'),
('datp', -1, 'p2p-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'p2p-i2i-transfer-response', NULL, NULL, 'message'),
('datp', -1, 'perahub-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'pesonet-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'remittance-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'std-account-request', NULL, NULL, 'message'),
('datp', -1, 'std-account-response', NULL, NULL, 'message'),
('datp', -1, 'std-example-request', NULL, NULL, 'message'),
('datp', -1, 'std-example-response', NULL, NULL, 'message'),
('datp', -1, 'std-getFees-request', NULL, NULL, 'message'),
('datp', -1, 'std-getFees-response', NULL, NULL, 'message'),
('datp', -1, 'std-kyc-create-customer-request', NULL, NULL, 'message'),
('datp', -1, 'std-kyc-create-customer-response', NULL, NULL, 'message'),
('datp', -1, 'std-kyc-initiate-check-request', NULL, NULL, 'message'),
('datp', -1, 'std-kyc-result-of-check-request', NULL, NULL, 'message'),
('datp', -1, 'std-payment-request', NULL, NULL, 'message'),
('datp', -1, 'std-payment-response', NULL, NULL, 'message'),
('datp', -1, 'std-test-request', NULL, NULL, 'message'),
('datp', -1, 'std-transfer-fees-request', NULL, NULL, 'message'),
('datp', -1, 'std-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'std-transfer-response', NULL, NULL, 'message'),
('datp', -1, 'std-transfer-status-request', NULL, NULL, 'message'),
('datp', -1, 'std-transfer-validate-request', NULL, NULL, 'message'),
('datp', -1, 'std-transferFees-request', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-balance-request', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-balance-response', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-topup-request', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-topup-status-request', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-topup-status-response', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-withdrawal-request', NULL, NULL, 'message'),
('datp', -1, 'std-wallet-withdrawal-status-request', NULL, NULL, 'message'),
('datp', -1, 'transfer-i2i-example-response', NULL, NULL, 'message'),
('datp', -1, 'transfer-i2i-getFees-response', NULL, NULL, 'message'),
('datp', -1, 'transfer-i2i-transfer-fees-request', NULL, NULL, 'message'),
('datp', -1, 'transfer-i2i-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'transfer-i2i-transfer-status-request', NULL, NULL, 'message'),
('datp', -1, 'transfer-i2i-transfer-status-response', NULL, NULL, 'message'),
('datp', -1, 'ub-instapay-payment-request', NULL, NULL, 'message'),
('datp', -1, 'ub-instapay-transfer-fees-request', NULL, NULL, 'message'),
('datp', -1, 'ub-instapay-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'ub-pesonet-transfer-request', NULL, NULL, 'message'),
('datp', -1, 'ussc-getFees-request', NULL, NULL, 'message'),
('datp', -1, 'ussc-getFees-response', NULL, NULL, 'message'),
('datp', -1, 'wu-getFees-request', NULL, NULL, 'message'),
('datp', -1, 'wu-getFees-response', NULL, NULL, 'message'),
('datp', -1, 'zoloz-kyc-initiate-check-request', NULL, NULL, 'message');

-- --------------------------------------------------------

--
-- Table structure for table `formservice_view_type`
--

DROP TABLE IF EXISTS `formservice_view_type`;
CREATE TABLE `formservice_view_type` (
  `view_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formservice_view_type`
--

INSERT INTO `formservice_view_type` (`view_type`, `description`) VALUES
('json', 'Stored in formservice JSON database'),
('message', 'Message passed between systems'),
('mysql', 'Stored in MySQL database');

-- --------------------------------------------------------

--
-- Table structure for table `map_domain`
--

DROP TABLE IF EXISTS `map_domain`;
CREATE TABLE `map_domain` (
  `domain_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_domain`
--

INSERT INTO `map_domain` (`domain_code`, `name`, `status`) VALUES
('bpi', 'BPI', 'inactive'),
('cebuana', 'Cebuana', 'active'),
('instapay-i2i', 'InstaPay (i2i)', 'prepare'),
('iremit', 'iRemit', 'noplugin'),
('jumio', 'Jumio KYC service', NULL),
('landbank', 'Landbank', 'noplugin'),
('metrobank', 'Metrobank', 'prepare'),
('onfido', 'Onfido KYC service', NULL),
('pesonet-i2i', 'PESONet (i2i)', 'prepare'),
('remittance-i2i', 'Domestic Remittance (i2i)', 'prepare'),
('ria', 'RIA', 'noplugin'),
('smartpedala', 'Smart Pedala', 'noplugin'),
('std', 'The Gateway API', 'active'),
('transfast', 'Transfast', 'noplugin'),
('transfer-i2i', 'Transfer (i2i)', 'prepare'),
('ub-instapay', 'InstaPay via Unionbank API', 'prepare'),
('ub-pesonet', 'PesoNET payment via Unionbank API', 'prepare'),
('ussc', 'USSC', 'inactive'),
('wu', 'Western Union', 'inactive'),
('xpressmoney', 'XpressMoney', 'noplugin'),
('yoti', 'Yoti KYC service', NULL),
('zoloz', 'Zoloz KYC service', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `map_message_type`
--

DROP TABLE IF EXISTS `map_message_type`;
CREATE TABLE `map_message_type` (
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_message_type`
--

INSERT INTO `map_message_type` (`type`, `description`) VALUES
('request', 'Request to backend'),
('response', 'Request response');

-- --------------------------------------------------------

--
-- Table structure for table `map_service`
--

DROP TABLE IF EXISTS `map_service`;
CREATE TABLE `map_service` (
  `service` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_service`
--

INSERT INTO `map_service` (`service`, `description`, `category`) VALUES
('account', 'Account information', 'XPANSE'),
('example', 'Example', 'XPANSE'),
('getFees', 'Get fee for a remittance', 'X'),
('kyc-create-customer', 'Create a new customer record', 'kyc'),
('kyc-initiate-check', 'Initiate a KYC check', 'kyc'),
('kyc-result-of-check', 'Get the result of a KYC check', 'kyc'),
('payment', 'Payment', 'XPANSE'),
('test', 'Test mapping functionality', 'X'),
('transfer', 'Transfer funds', 'transfer'),
('transfer-fees', 'Get fees for a transfer', 'transfer'),
('transfer-status', 'Get status of transfer request', 'transfer'),
('transfer-validate', 'Validate parameters for transfer request', 'transfer'),
('wallet-balance', 'Get balance of escrow account', 'wallet'),
('wallet-topup-status', 'Get status of wallet top-up request', 'wallet'),
('wallet-withdrawal', 'Withdrawal from escrow account', 'wallet'),
('wallet-withdrawal-status', 'Get status of wallet withdrawal request', 'wallet');

-- --------------------------------------------------------

--
-- Table structure for table `map_service_category`
--

DROP TABLE IF EXISTS `map_service_category`;
CREATE TABLE `map_service_category` (
  `category` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_service_category`
--

INSERT INTO `map_service_category` (`category`, `description`, `sequence`) VALUES
('kyc', 'Know-Your-Customer identity checks', NULL),
('remittance', 'Remittance', NULL),
('transfer', 'Fund transfers', NULL),
('wallet', 'Transaction on Union Bank escrow account', 0),
('X', 'Early testing', 1),
('XPANSE', 'UBX Open Finance Platform', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_test_case`
--

DROP TABLE IF EXISTS `m_test_case`;
CREATE TABLE `m_test_case` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input_data` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_test_case`
--

INSERT INTO `m_test_case` (`name`, `description`, `transaction_type`, `input_data`) VALUES
('example.sleeper', 'Test sleep functionality', 'example.sleeper', '{\n  \"metadata\": {\n    \"reply\": \"longpoll\"\n  },\n  \"data\": {\n    \"delay\": 15000\n  }\n}'),
('master-slave', 'Test master / slave routing', 'test-master', '{\n  \"metadata\": {\n    \"reply\": \"shortpoll\"\n  },\n  \"data\": {}\n}'),
('myPipeline', 'My first pipeline', 'myPipeline', '{\n  \"metadata\": {\n    \"reply\": \"shortpoll\"\n  },\n  \"data\": {}\n}'),
('null', 'Do nothing', 'null', '{\n  \"metadata\": {\n    \"reply\": \"longpoll\",\n    \"Zwebhook\": \"http://localhost:3030/webhook\",\n    \"ZexternalId\": \"123000123\"\n  },\n  \"data\": {\n    \"afield\": \"xyz\"\n  }\n}'),
('test-longrun', 'Test pipeline(s) that take 2 minutes to run (i.e.in a  \"stuck\" step)', 'test-longrun-parent', '{\n  \"metadata\": {\n    \"reply\": \"shortpoll\"\n  },\n  \"data\": {}\n}'),
('test-longsleep', 'Test DATP scheduled sleeps', 'test-longsleep', '{\n  \"metadata\": {\n    \"reply\": \"shortpoll\"\n  },\n  \"data\": {}\n}'),
('test-wait', 'Wait for a switch to be set', 'test-wait', '{\n  \"metadata\": {\n    \"reply\": \"shortpoll\"\n  },\n  \"data\": {}\n}'),
('webhook-test', 'Check that webhooks are being called properly for progress reports.', 'webhook-test', '{\n  \"metadata\": {\n    \"reply\": \"shortpoll\",\n    \"webhook\": \"http://no.where.I.know\",\n    \"progressReports\": true\n  },\n  \"data\": {}\n}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atp_alert`
--
ALTER TABLE `atp_alert`
  ADD PRIMARY KEY (`transaction_id`,`identifier`);

--
-- Indexes for table `atp_domain_status`
--
ALTER TABLE `atp_domain_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `atp_logbook`
--
ALTER TABLE `atp_logbook`
  ADD PRIMARY KEY (`sequence`),
  ADD KEY `atp_logbook_transaction_id` (`transaction_id`) USING BTREE;

--
-- Indexes for table `atp_node_group`
--
ALTER TABLE `atp_node_group`
  ADD PRIMARY KEY (`node_group`);

--
-- Indexes for table `atp_pipeline`
--
ALTER TABLE `atp_pipeline`
  ADD PRIMARY KEY (`name`,`version`) USING BTREE,
  ADD KEY `pipeline_status` (`status`);

--
-- Indexes for table `atp_pipeline_status`
--
ALTER TABLE `atp_pipeline_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `atp_step_artifact`
--
ALTER TABLE `atp_step_artifact`
  ADD PRIMARY KEY (`step_id`,`artifact_name`) USING BTREE;

--
-- Indexes for table `atp_step_instance`
--
ALTER TABLE `atp_step_instance`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `transaction_id` (`transaction_id`) USING BTREE,
  ADD KEY `status` (`status`),
  ADD KEY `completion_time` (`completion_time`),
  ADD KEY `start_time` (`start_time`);

--
-- Indexes for table `atp_transaction2`
--
ALTER TABLE `atp_transaction2`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `external_id` (`owner`,`external_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `last_updated` (`last_updated`) USING BTREE;

--
-- Indexes for table `atp_transaction_delta`
--
ALTER TABLE `atp_transaction_delta`
  ADD PRIMARY KEY (`transaction_id`,`sequence`) USING BTREE;

--
-- Indexes for table `atp_transaction_state`
--
ALTER TABLE `atp_transaction_state`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `atp_transaction_status`
--
ALTER TABLE `atp_transaction_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `atp_transaction_type`
--
ALTER TABLE `atp_transaction_type`
  ADD PRIMARY KEY (`transaction_type`);

--
-- Indexes for table `atp_webhook`
--
ALTER TABLE `atp_webhook`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `webhook_status` (`status`,`next_attempt`) USING BTREE;

--
-- Indexes for table `formservice_field`
--
ALTER TABLE `formservice_field`
  ADD PRIMARY KEY (`tenant`,`version`,`view`,`name`) USING BTREE;

--
-- Indexes for table `formservice_field_converter`
--
ALTER TABLE `formservice_field_converter`
  ADD PRIMARY KEY (`converter`);

--
-- Indexes for table `formservice_field_mapping`
--
ALTER TABLE `formservice_field_mapping`
  ADD PRIMARY KEY (`tenant`,`version`,`mapping_id`,`to_field`) USING BTREE,
  ADD KEY `converter` (`converter`);

--
-- Indexes for table `formservice_view`
--
ALTER TABLE `formservice_view`
  ADD PRIMARY KEY (`tenant`,`version`,`view`) USING BTREE,
  ADD KEY `view_type` (`view_type`),
  ADD KEY `tenant` (`tenant`,`view`) USING BTREE;

--
-- Indexes for table `formservice_view_type`
--
ALTER TABLE `formservice_view_type`
  ADD PRIMARY KEY (`view_type`);

--
-- Indexes for table `m_test_case`
--
ALTER TABLE `m_test_case`
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atp_logbook`
--
ALTER TABLE `atp_logbook`
  MODIFY `sequence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `atp_pipeline`
--
ALTER TABLE `atp_pipeline`
  ADD CONSTRAINT `atp_pipeline_ibfk_1` FOREIGN KEY (`name`) REFERENCES `atp_transaction_type` (`transaction_type`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
