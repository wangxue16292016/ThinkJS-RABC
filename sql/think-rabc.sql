
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rabc` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `rabc`;

/*Table structure for table `north_admin` */

DROP TABLE IF EXISTS `rabc_user`;

CREATE TABLE `rabc_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT '主键，自增',
  `code` VARCHAR(32) NOT NULL UNIQUE COMMENT '用户编码',
  `username` VARCHAR(16) NOT NULL COMMENT '用户名称',
  `password` VARCHAR(48) NOT NULL COMMENT '用户密码(md5加密)',
  `email` VARCHAR(48) NULL COMMENT '用户邮箱',
  `sex` TINYINT DEFAULT 0 COMMENT '性别 0:未知 1:男 2：女',
  `phone` VARCHAR(15) NULL COMMENT '电话号码',
  `photo` VARCHAR(100) NULL COMMENT '用户头像',
  `status` INT(1) NOT NULL DEFAULT 1 COMMENT '是否启用(0:不启用 1:启用)',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `login_time` TIMESTAMP NULL COMMENT '登陆时间',
  `login_ip` VARCHAR(16) NOT NULL DEFAULT '0.0.0.0' COMMENT '登陆IP',
  `delstatus` TINYINT  NOT NULL DEFAULT 1 COMMENT '是否删除(0:删除 1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rabc_log`;
CREATE TABLE `rabc_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT '主键，自增',
  `ip` VARCHAR(32)  NOT NULL DEFAULT 0 COMMENT  '客户端IP',
  `url` VARCHAR(255) NULL COMMENT '操作地址',
  `param` TEXT NULL DEFAULT "" COMMENT '操作参数',
  `username` VARCHAR(25) NULL COMMENT '当前登陆用户',
  `userid` INT(11) NULL COMMENT '登录用户ID',
  ``rabc_menu`` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rabc_menu`;
CREATE TABLE `rabc_menu` (
  `id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT '主键，自增',
  `pid` INT(11)  NOT NULL DEFAULT 0 COMMENT  '父键',
  `code` VARCHAR(32) NOT NULL UNIQUE COMMENT '菜单编码',
  `url` VARCHAR(255) NULL COMMENT '菜单地址',
  `ismenu` TINYINT NOT NULL COMMENT '是否菜单(0:菜单 1:操作权限)',
  `name` VARCHAR(16) NOT NULL COMMENT '菜单名称',
  `briefname` VARCHAR(48) NOT NULL COMMENT '菜单简称',
  `sort` INT NOT NULL DEFAULT 0 COMMENT '排序',
  `icon` VARCHAR(25) NULL COMMENT '图标',
  `status` INT(1) NOT NULL DEFAULT 1 COMMENT '是否启用(0:不启用 1:启用)',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `delstatus` TINYINT  NOT NULL DEFAULT 1 COMMENT '是否删除(0:删除 1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rabc_group`;
CREATE TABLE `rabc_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT '主键，自增',
  `pid` INT(11)  NOT NULL DEFAULT 0 COMMENT  '父键',
  `code` VARCHAR(32) NOT NULL UNIQUE COMMENT '组编码',
  `name` VARCHAR(16) NOT NULL COMMENT '组名称',
  `briefname` VARCHAR(48) NOT NULL COMMENT '组简称',
  `status` INT(1) NOT NULL DEFAULT 1 COMMENT '是否启用(0:不启用 1:启用)',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `delstatus` TINYINT  NOT NULL DEFAULT 1 COMMENT '是否删除(0:删除 1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rabc_setup_group`;
CREATE TABLE `rabc_setup_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT '主键，自增',
  `pid` INT(11)  NOT NULL DEFAULT 0 COMMENT  '父键',
  `code` VARCHAR(32) NOT NULL UNIQUE COMMENT '组编码',
  `name` VARCHAR(16) NOT NULL COMMENT '组名称',
  `briefname` VARCHAR(48) NOT NULL COMMENT '组简称',
  `status` INT(1) NOT NULL DEFAULT 1 COMMENT '是否启用(0:不启用 1:启用)',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `delstatus` TINYINT  NOT NULL DEFAULT 1 COMMENT '是否删除(0:删除 1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rabc_setup`;
CREATE TABLE `rabc_setup` (
  `id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT '主键，自增',
  `gid` INT(11)  NOT NULL DEFAULT 0 COMMENT  '字典组ID',
  `code` VARCHAR(32) NOT NULL UNIQUE COMMENT '字典编码',
  `name` VARCHAR(16) NOT NULL COMMENT '字典名称',
  `value` VARCHAR(255) NOT NULL COMMENT '字典值',
  `sort` INT NOT NULL DEFAULT 0 COMMENT '排序',
  `status` INT(1) NOT NULL DEFAULT 1 COMMENT '是否启用(0:不启用 1:启用)',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `delstatus` TINYINT  NOT NULL DEFAULT 1 COMMENT '是否删除(0:删除 1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rabc_rabc`;
-- auto-generated definition
create table rabc_rabc
(
	id int auto_increment comment '主键，自增'
		primary key,
	rid int not null comment '关联的用户组或者用户',
	mid varchar(128) not null comment '关联的菜单',
	gstatus int(1) default '1' not null comment '是否用户组(0:用户 1:用户组)',
	create_time timestamp default CURRENT_TIMESTAMP not null comment '创建时间'
)
;
