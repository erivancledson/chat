# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.42)
# Base de Dados: chat
# Tempo de Geração: 2016-07-26 09:39:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela chamados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chamados`;

CREATE TABLE `chamados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `nome` varchar(50) DEFAULT NULL,
  `data_inicio` time NOT NULL,
  `status` tinyint(1) NOT NULL,
  `data_last_suporte` datetime DEFAULT NULL,
  `data_last_cliente` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `chamados` WRITE;
/*!40000 ALTER TABLE `chamados` DISABLE KEYS */;

INSERT INTO `chamados` (`id`, `ip`, `nome`, `data_inicio`, `status`, `data_last_suporte`, `data_last_cliente`)
VALUES
	(1,'0','Fulano','10:00:00',1,'2016-07-26 06:39:56',NULL),
	(2,'1','Cicrano','11:00:00',1,NULL,NULL),
	(3,'2','Beltrano','12:00:00',1,NULL,NULL),
	(4,'::1','Bonieky','10:58:56',1,'2016-07-26 05:32:06','2016-07-25 06:38:17'),
	(5,'::1','Testador','10:18:05',1,NULL,'2016-07-26 05:20:33'),
	(6,'::1','Testador 2','10:25:57',1,NULL,'2016-07-26 05:27:51'),
	(7,'::1','Testador 2','10:27:53',1,'2016-07-26 05:32:19','2016-07-26 05:32:18'),
	(8,'::1','Testador 2','10:32:19',1,'2016-07-26 05:36:40','2016-07-26 05:36:42'),
	(9,'::1','Testador 2','10:36:42',1,'2016-07-26 05:46:27','2016-07-26 05:46:30'),
	(10,'::1','Testador 2','10:46:31',1,'2016-07-26 05:47:28','2016-07-26 05:47:45');

/*!40000 ALTER TABLE `chamados` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela mensagens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mensagens`;

CREATE TABLE `mensagens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_chamado` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `origem` tinyint(1) NOT NULL,
  `data_enviado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mensagens` WRITE;
/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;

INSERT INTO `mensagens` (`id`, `id_chamado`, `mensagem`, `origem`, `data_enviado`)
VALUES
	(1,4,'oi, tudo bem?',1,'2016-07-25 06:11:26'),
	(2,4,'teste ficticio',0,'2016-07-25 06:34:00'),
	(3,4,'Teste 2',0,'2016-07-25 06:36:43'),
	(4,4,'Oi',1,'2016-07-25 06:37:16'),
	(5,4,'opa',0,'2016-07-26 05:18:37'),
	(6,5,'asr',1,'2016-07-26 05:18:57'),
	(7,4,'Opa',0,'2016-07-26 05:26:28'),
	(8,4,'lkasjr',0,'2016-07-26 05:26:54'),
	(9,4,'kjhk',0,'2016-07-26 05:27:19'),
	(10,4,'Oi, tudo bem?',0,'2016-07-26 05:28:14'),
	(11,8,'Oi, tudo bem?',1,'2016-07-26 05:32:42'),
	(12,8,'Opa!',0,'2016-07-26 05:33:00'),
	(13,8,'teste',1,'2016-07-26 05:33:30'),
	(14,8,'asr',1,'2016-07-26 05:34:02'),
	(15,9,'Opa',1,'2016-07-26 05:36:55'),
	(16,9,'tudo bem?',0,'2016-07-26 05:37:06'),
	(17,9,'Tudo, maravilha!',1,'2016-07-26 05:37:14'),
	(18,9,'Opa!',1,'2016-07-26 05:37:34'),
	(19,9,'teste novamente',1,'2016-07-26 05:37:46'),
	(20,9,'entÃ£o... meu problema Ã©....',1,'2016-07-26 05:37:56'),
	(21,9,'me fala aÃ­ qual Ã©...',0,'2016-07-26 05:38:10'),
	(22,9,'Ã‰ o seguinte...',1,'2016-07-26 05:38:18'),
	(23,9,'EntÃ£o... vou explicar',1,'2016-07-26 05:38:28'),
	(24,9,'mais alguma coisa?',1,'2016-07-26 05:38:49'),
	(25,9,'EntÃ£o Ã³...',0,'2016-07-26 05:39:06'),
	(26,9,'Legal?',1,'2016-07-26 05:39:12'),
	(27,9,'alskrjlasjr',1,'2016-07-26 05:39:34'),
	(28,9,'lkajsr',1,'2016-07-26 05:39:35'),
	(29,9,'alksjr',1,'2016-07-26 05:39:36'),
	(30,9,'laksjr',1,'2016-07-26 05:39:38'),
	(31,9,'qpwoeipqowie',1,'2016-07-26 05:39:40'),
	(32,9,'lkasjrljkar',0,'2016-07-26 05:40:08'),
	(33,10,'asr',0,'2016-07-26 05:46:42'),
	(34,10,'laksjr',1,'2016-07-26 05:46:45'),
	(35,10,'laksjrl',1,'2016-07-26 05:46:46'),
	(36,10,'laskjrlasr',1,'2016-07-26 05:46:48'),
	(37,10,'lkajsrl',1,'2016-07-26 05:46:48'),
	(38,10,'laksjr',1,'2016-07-26 05:46:49'),
	(39,10,'laksjrl',1,'2016-07-26 05:46:50'),
	(40,10,'laksjrlasr',1,'2016-07-26 05:46:51'),
	(41,10,'asrasr',0,'2016-07-26 05:46:54'),
	(42,10,'asrasrasr',1,'2016-07-26 05:46:56'),
	(43,10,'xctxctxctxt',0,'2016-07-26 05:46:58'),
	(44,10,'sdtsdtstd',1,'2016-07-26 05:47:01'),
	(45,10,'sdtsdtsdt',1,'2016-07-26 05:47:02'),
	(46,10,'sdtsdtsdt',1,'2016-07-26 05:47:03'),
	(47,10,'sdtsdtsdt',1,'2016-07-26 05:47:04'),
	(48,10,'sdtsdtsdt',1,'2016-07-26 05:47:05'),
	(49,10,'sdtsdtsdt',1,'2016-07-26 05:47:06'),
	(50,10,'sdtsdt',1,'2016-07-26 05:47:07'),
	(51,10,'xcgxgxgc',1,'2016-07-26 05:47:09'),
	(52,10,'xtctxct',1,'2016-07-26 05:47:11'),
	(53,10,'qweqwe',1,'2016-07-26 05:47:12'),
	(54,10,'xctxctcxtxct',1,'2016-07-26 05:47:14'),
	(55,10,'vbnvbnvn',1,'2016-07-26 05:47:16'),
	(56,10,'eryeyey',1,'2016-07-26 05:47:19'),
	(57,10,'ugutuytyu',1,'2016-07-26 05:47:22'),
	(58,10,'laksjrlars',1,'2016-07-26 05:47:32');

/*!40000 ALTER TABLE `mensagens` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
