/*
SQLyog Enterprise - MySQL GUI v8.18 
MySQL - 5.6.17 : Database - siapesantren
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`siapesantren` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `siapesantren`;

/*Table structure for table `data_santri` */

DROP TABLE IF EXISTS `data_santri`;

CREATE TABLE `data_santri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jenkel` enum('Wanita','Pria') DEFAULT NULL,
  `tmp_lhr` varchar(20) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `id_prov` tinyint(4) DEFAULT NULL,
  `id_kab` int(4) DEFAULT NULL,
  `kec` varchar(50) DEFAULT NULL,
  `desa` varchar(30) DEFAULT NULL,
  `rt_rw` varchar(7) DEFAULT NULL,
  `kodepos` varchar(10) DEFAULT NULL,
  `ket_alamat_lain` text,
  `agama` enum('Islam') DEFAULT 'Islam',
  `email` varchar(50) NOT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `nama_ayah` varchar(30) DEFAULT NULL,
  `nama_ibu` varchar(30) DEFAULT NULL,
  `work_ayah` varchar(30) DEFAULT NULL,
  `work_ibu` varchar(30) DEFAULT NULL,
  `hp_ortu` varchar(20) DEFAULT NULL,
  `status_sistem` enum('Aktif','Baru','Lulus') DEFAULT NULL,
  PRIMARY KEY (`nis`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `data_santri` */

insert  into `data_santri`(`id`,`nis`,`nama`,`jenkel`,`tmp_lhr`,`tgl_lhr`,`id_prov`,`id_kab`,`kec`,`desa`,`rt_rw`,`kodepos`,`ket_alamat_lain`,`agama`,`email`,`nohp`,`nama_ayah`,`nama_ibu`,`work_ayah`,`work_ibu`,`hp_ortu`,`status_sistem`) values (1,'111111','Andy Resta','Pria','Tegal','1994-06-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Islam','restapradika@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'Aktif');

/*Table structure for table `loc_kabkot` */

DROP TABLE IF EXISTS `loc_kabkot`;

CREATE TABLE `loc_kabkot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_provinsi` tinyint(4) DEFAULT NULL,
  `kabkot` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loc_kabkot` */

/*Table structure for table `loc_kec` */

DROP TABLE IF EXISTS `loc_kec`;

CREATE TABLE `loc_kec` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_kabkot` int(7) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loc_kec` */

/*Table structure for table `loc_prov` */

DROP TABLE IF EXISTS `loc_prov`;

CREATE TABLE `loc_prov` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `provinsi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loc_prov` */

/*Table structure for table `penawaran` */

DROP TABLE IF EXISTS `penawaran`;

CREATE TABLE `penawaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penawaran` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `penawaran` */

insert  into `penawaran`(`id`,`penawaran`) values (1,'Amtsilatis');

/*Table structure for table `tahunajaran` */

DROP TABLE IF EXISTS `tahunajaran`;

CREATE TABLE `tahunajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tahun` year(4) DEFAULT NULL,
  `periode` enum('Genap','Ganjil') DEFAULT NULL,
  `status` enum('Aktif','Tidak_aktif') DEFAULT 'Tidak_aktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tahunajaran` */

insert  into `tahunajaran`(`id`,`tahun`,`periode`,`status`) values (1,2017,'Ganjil','Tidak_aktif'),(2,2017,'Genap','Aktif');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sebagai` enum('admin','santri') DEFAULT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_datasantri` (`nis`),
  CONSTRAINT `user_datasantri` FOREIGN KEY (`nis`) REFERENCES `data_santri` (`nis`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`nis`,`password`,`sebagai`,`lastlogin`) values (1,'111111','40292cf66b17f2942d3e5560744c28d1a527f9c7','admin','2017-03-31 05:55:30');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
