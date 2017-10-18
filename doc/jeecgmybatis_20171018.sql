/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.20-log : Database - jeecgmybatis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jeecgmybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jeecgmybatis`;

/*Table structure for table `jeecg_note` */

DROP TABLE IF EXISTS `jeecg_note`;

CREATE TABLE `jeecg_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `crtuser` varchar(255) DEFAULT NULL,
  `crtuser_name` varchar(255) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL COMMENT '建创时间',
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_note` */

insert  into `jeecg_note`(`id`,`title`,`content`,`crtuser`,`crtuser_name`,`create_dt`,`deleted`) values (1,'12','12','','','2013-02-06 13:31:56',NULL);

/*Table structure for table `jeecg_person` */

DROP TABLE IF EXISTS `jeecg_person`;

CREATE TABLE `jeecg_person` (
  `id` varchar(36) NOT NULL,
  `age` int(11) NOT NULL COMMENT '年龄',
  `name` varchar(255) NOT NULL COMMENT '名字',
  `salary` decimal(19,2) DEFAULT NULL COMMENT '工资',
  `createdt` datetime DEFAULT NULL COMMENT '出生日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_person` */

insert  into `jeecg_person`(`id`,`age`,`name`,`salary`,`createdt`) values ('93c78b3e-d297-4a62-abd7-2acf6665df3d',20,'张三','1000.00','2013-02-13 14:50:01'),('e4dbf837-550e-4fbd-9766-15ed4079da4c',23,'李四','100.00','2013-02-20 13:33:02');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '系统url',
  `parentId` int(10) DEFAULT NULL COMMENT ' 父id 关联sys_menu.id',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除,0=未删除，1=已删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `actions` varchar(500) DEFAULT '0' COMMENT '注册Action 按钮|分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`url`,`parentId`,`deleted`,`createTime`,`updateTime`,`rank`,`actions`) values (1,'系统管理','',NULL,0,'2012-12-23 17:21:58','2017-10-16 18:28:01',2,''),(2,'菜单管理','/sysMenu/menu.shtml',1,0,'2012-12-23 18:18:32','2013-01-13 02:29:33',0,'dataList.do'),(3,'站点管理','',NULL,1,'2012-12-23 20:26:35','2012-12-23 21:16:51',1,''),(4,'站点信息管理','/siteMain/list.shtml',3,0,'2012-12-23 20:26:53','2013-01-13 01:24:47',0,'dataList.do|/siteType/typeListJson.do'),(5,'站点类型','/siteType/list.shtml',3,0,'2012-12-23 20:28:23','2013-01-13 01:20:46',0,'dataList.do'),(6,'系统用户管理','/sysUser/list.shtml',1,0,'2012-12-23 22:15:33','2013-02-18 11:42:46',0,'dataList.do'),(7,'角色管理','/sysRole/role.shtml',1,0,'2012-12-24 22:17:51','2013-01-13 01:15:00',0,'dataList.do|/sysMenu/getMenuTree.do'),(8,'系统用户授权','/sysUser/userRole.shtml',1,0,'2013-01-06 11:42:26','2013-02-18 11:43:19',0,'userList.do|/sysRole/loadRoleList.do'),(9,'业务功能','',NULL,0,'2013-02-09 10:42:42','2013-02-19 17:25:42',1,''),(10,'仓库管理','/jeecgPerson/list.shtml',9,1,'2013-02-09 10:44:45','2017-10-16 18:32:56',1,'dataList.do'),(11,'1','2',NULL,1,'2013-02-18 11:37:01','2013-02-18 11:37:09',0,'2'),(12,'12','',NULL,1,'2013-02-18 11:37:20','2013-02-18 11:37:29',0,''),(13,'型号管理','/jeecgNote/list.shtml',9,1,'2013-02-19 17:24:36','2017-10-16 18:33:12',1,'dataList.do'),(14,'7777','777',NULL,1,'2013-02-20 10:55:26',NULL,0,''),(15,'77','77',NULL,1,'2013-02-20 11:01:08',NULL,77,'77'),(16,'联系人管理','/tContactPerson/list.shtml',9,0,'2017-10-16 19:20:02','2017-10-16 19:20:58',3,'dataList.do'),(17,'仓库管理','/tWarehouse/list.shtml',9,0,'2017-10-17 18:10:10',NULL,4,'dataList.do'),(18,'型号管理','/tGoodsKind/list.shtml',9,0,'2017-10-17 18:10:53',NULL,5,'dataList.do'),(19,'进出库记录','/tRecords/list.shtml',9,0,'2017-10-17 18:11:55',NULL,6,'dataList.do');

/*Table structure for table `sys_menu_btn` */

DROP TABLE IF EXISTS `sys_menu_btn`;

CREATE TABLE `sys_menu_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` int(11) NOT NULL COMMENT ' 菜单id关联 sys_menu.id',
  `btnName` varchar(30) DEFAULT NULL COMMENT '按钮名称',
  `btnType` varchar(30) DEFAULT NULL COMMENT '按钮类型，用于列表页显示的按钮',
  `actionUrls` varchar(250) DEFAULT NULL COMMENT 'url注册，用"," 分隔 。用于权限控制UR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_btn` */

insert  into `sys_menu_btn`(`id`,`menuid`,`btnName`,`btnType`,`actionUrls`) values (5,2,'添加','add','save.do'),(6,2,'修改','edit','getId.do|save.do'),(7,2,'删除','remove','delete.do'),(8,6,'添加','add','save.do'),(9,6,'修改','edit','getId.do|save.do'),(10,6,'修改密码','editPwd','updatePwd.do'),(11,6,'删除','remove','delete.do'),(12,7,'添加','add','save.do'),(13,7,'修改','edit','getId.do|save.do'),(14,7,'删除','remove','delete.do'),(15,8,'授权','authRole','/sysUser/getUser.do|/sysUser/addUserRole.do'),(16,5,'添加','add','save.do'),(17,5,'修改','edit','getId.do|save.do'),(18,5,'删除','remove','delete.do'),(19,4,'添加','add','save.do'),(20,4,'修改','edit','getId.do|save.do'),(21,4,'删除','remove','delete.do'),(28,16,'添加','add','save.do'),(29,16,'修改','edit','getId.do|save.do'),(30,16,'删除','remove','delete.do'),(31,17,'添加','add','save.do'),(32,17,'修改','edit','getId.do|save.do'),(33,17,'删除','remove','delete.do'),(34,18,'添加','add','save.do'),(35,18,'修改','edit','getId.do|save.do'),(36,18,'删除','remove','delete.do'),(37,19,'添加','add','save.do'),(38,19,'修改','edit','getId.do|save.do'),(39,19,'删除','remove','delete.do');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `roleName` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateBy` int(11) DEFAULT NULL COMMENT '修改人',
  `state` int(1) DEFAULT NULL COMMENT '状态0=可用 1=禁用',
  `descr` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`roleName`,`createTime`,`createBy`,`updateTime`,`updateBy`,`state`,`descr`) values (1,'系统管理员','2013-01-05 16:07:00',NULL,'2013-02-19 17:31:13',NULL,0,NULL),(3,'管理员','2013-01-06 10:45:06',NULL,'2013-01-14 11:22:38',NULL,0,NULL),(18,'站点管理','2013-01-13 01:21:46',NULL,'2013-01-13 01:21:54',NULL,0,'站点管理'),(19,'测试管理员','2013-01-13 17:10:21',NULL,'2013-02-09 21:11:41',NULL,0,NULL);

/*Table structure for table `sys_role_rel` */

DROP TABLE IF EXISTS `sys_role_rel`;

CREATE TABLE `sys_role_rel` (
  `roleId` int(11) NOT NULL COMMENT '角色主键 sys_role.id',
  `objId` int(11) NOT NULL COMMENT '关联主键 type=0管理sys_menu.id, type=1关联sys_user.id',
  `relType` int(1) DEFAULT NULL COMMENT '关联类型 0=菜单,1=用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_rel` */

insert  into `sys_role_rel`(`roleId`,`objId`,`relType`) values (1,3,1),(18,4,0),(18,5,0),(18,19,2),(18,20,2),(18,16,2),(18,17,2),(18,5,1),(3,5,1),(3,8,0),(3,1,0),(3,2,0),(3,6,0),(3,7,0),(3,5,2),(3,8,2),(3,9,2),(3,12,2),(3,13,2),(3,15,2),(19,8,0),(19,1,0),(19,2,0),(19,6,0),(19,7,0),(19,7,2),(19,8,2),(19,10,2),(19,13,2),(19,15,2),(3,1,1),(18,1,1),(19,1,1),(1,1,1),(1,1,0),(1,2,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,5,2),(1,6,2),(1,7,2),(1,8,2),(1,9,2),(1,10,2),(1,11,2),(1,12,2),(1,13,2),(1,14,2),(1,15,2),(1,22,2),(1,23,2),(1,24,2),(1,25,2),(1,26,2),(1,27,2);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `email` varchar(50) NOT NULL COMMENT '邮箱也是登录帐号',
  `pwd` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `nickName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0=可用,1=禁用',
  `loginCount` int(11) DEFAULT NULL COMMENT '登录总次数',
  `loginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态 0=未删除,1=已删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `updateBy` int(11) DEFAULT NULL COMMENT '修改人',
  `superAdmin` int(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0= 不是，1=是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`email`,`pwd`,`nickName`,`state`,`loginCount`,`loginTime`,`deleted`,`createTime`,`updateTime`,`createBy`,`updateBy`,`superAdmin`) values (1,'admin@qq.com','C33367701511B4F6020EC61DED352059','系统管理员',0,269,'2017-10-18 16:19:22',0,'2012-12-23 23:01:15','2017-10-18 16:19:22',NULL,NULL,1),(5,'wolf@qq.com','E10ADC3949BA59ABBE56E057F20F883E','scott',0,71,'2013-02-09 10:29:42',0,'2013-01-07 12:30:10','2013-02-09 10:29:42',NULL,NULL,0);

/*Table structure for table `t_contact_person` */

DROP TABLE IF EXISTS `t_contact_person`;

CREATE TABLE `t_contact_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_contact_person` */

insert  into `t_contact_person`(`id`,`name`,`phone`) values (1,'俊强1','13718710523'),(3,'亚超','17636251632');

/*Table structure for table `t_goods_kind` */

DROP TABLE IF EXISTS `t_goods_kind`;

CREATE TABLE `t_goods_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `gooddsKindName` varchar(50) NOT NULL COMMENT '型号名称',
  `price` varchar(10) DEFAULT NULL COMMENT '价格(元)',
  `isFixedweight` int(1) NOT NULL DEFAULT '0' COMMENT '是否固定重量 0(不定),1(定重)',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_goods_kind` */

insert  into `t_goods_kind`(`id`,`gooddsKindName`,`price`,`isFixedweight`,`remark`) values (1,'三扒','17.65',1,''),(2,'175_前腱','15.56',0,'');

/*Table structure for table `t_records` */

DROP TABLE IF EXISTS `t_records`;

CREATE TABLE `t_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `opertype` int(1) NOT NULL COMMENT '类型 0(入库),1(出库)',
  `warehouseId` int(11) NOT NULL COMMENT '仓库编号',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `goodsKindId` int(11) NOT NULL COMMENT '型号',
  `nums` int(4) NOT NULL DEFAULT '0' COMMENT '件数',
  `peopleId` int(11) NOT NULL COMMENT '买家',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `details` varchar(800) DEFAULT NULL COMMENT '详情',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_records` */

insert  into `t_records`(`id`,`opertype`,`warehouseId`,`createTime`,`goodsKindId`,`nums`,`peopleId`,`status`,`details`,`remark`) values (1,1,1,'2017-10-17 19:48:22',1,10,1,2,'1230,4560,4565,4561,13245677','备注');

/*Table structure for table `t_warehouse` */

DROP TABLE IF EXISTS `t_warehouse`;

CREATE TABLE `t_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `warehouseName` varchar(50) NOT NULL COMMENT '仓库名称',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_warehouse` */

insert  into `t_warehouse`(`id`,`warehouseName`,`remark`) values (1,'西_大库','西边的大库1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
