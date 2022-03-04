/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.24 : Database - rabbit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rabbit` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `rabbit`;

/*Table structure for table `tb_blog` */

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blog_body` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blog_type` int DEFAULT NULL,
  `blog_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `blog_like_quantity` int DEFAULT '0',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_blog` */

insert  into `tb_blog`(`blog_id`,`blog_title`,`blog_body`,`blog_type`,`blog_image`,`user_id`,`blog_like_quantity`) values (18,'s','ss',0,'/image/1486739559887.jpg',0,43),(21,'bbbbb','bbbbbbbcc',0,'/image/pose (17).jpg',0,2),(22,'ffffffff','fffffffffffffff\r\nfffffffffbbbbb',0,'/image/pose (9).jpg',5,0),(23,'m\'m','mmm\'m\'m\'m\'mkk',0,'/image/pose (26).jpg',5,0),(24,'ssssss','      ssssssss',1,'/image/pose (9).jpg',5,0),(26,'vvv','vvv',1,'/image/pose (5).jpg',5,0),(27,'hhhh','hhhhhh',1,'/image/pose (23).jpg',5,0),(28,'vvvvv','欻欻欻',1,'/image/pose (62).jpg',5,0),(29,'aaaaaa','aaaaaaaa',1,'/image/pose (47).jpg',5,0);

/*Table structure for table `tb_image` */

DROP TABLE IF EXISTS `tb_image`;

CREATE TABLE `tb_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_image` varchar(32) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_image` */

insert  into `tb_image`(`id`,`user_image`,`user_id`) values (2,'/image/pose (10).jpg',5),(3,'/image/pose (58).jpg',5),(4,'/image/pose (142).jpg',5);

/*Table structure for table `tb_like` */

DROP TABLE IF EXISTS `tb_like`;

CREATE TABLE `tb_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `state` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_like` */

insert  into `tb_like`(`id`,`blog_id`,`user_id`,`state`) values (1,31,NULL,0),(2,18,NULL,0),(3,18,NULL,0),(4,18,NULL,0),(5,18,NULL,0),(6,18,NULL,0),(7,18,NULL,0),(8,18,NULL,0),(9,18,NULL,0),(10,18,NULL,0),(11,18,NULL,0),(12,18,NULL,0),(13,21,5,0),(14,18,NULL,0),(15,18,NULL,0),(16,18,NULL,0),(17,18,NULL,0),(18,18,NULL,0),(19,21,NULL,0);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pass_word` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`user_name`,`pass_word`,`user_email`) values (2,'aaaaaaaa','aaaaaaaa',NULL),(3,'aaaaaaaa','aaaaaaaa',NULL),(4,'aaaaaaaa','aaaaaaaa','aaaaaaaa'),(5,'admin','12345678','aaaa@qq.com'),(7,'admin2','12345678','aaaa@qq.com'),(8,'admin3','12345678',''),(9,'admin6','12345678',''),(10,'admin9','12345678',''),(11,'admin5','12345678',''),(12,'adminmm','12345678',''),(15,'xxxxxxx','xxxxxxxxxx','zzzzz@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
