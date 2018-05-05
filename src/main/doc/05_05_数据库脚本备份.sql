/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50718
Source Host           : 120.79.43.33:6033
Source Database       : eason_phone

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-05-05 12:53:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `uid` int(20) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  `count` int(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cid` int(11) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `manme` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) NOT NULL,
  `type_id` int(10) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `describes` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `detail` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `stock` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_attr_biz
-- ----------------------------
DROP TABLE IF EXISTS `product_attr_biz`;
CREATE TABLE `product_attr_biz` (
  `pid` int(11) NOT NULL,
  `attr_code` varchar(255) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_bh_order
-- ----------------------------
DROP TABLE IF EXISTS `product_bh_order`;
CREATE TABLE `product_bh_order` (
  `bhid` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `pid` int(20) NOT NULL,
  `cout` int(20) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`bhid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_b_order
-- ----------------------------
DROP TABLE IF EXISTS `product_b_order`;
CREATE TABLE `product_b_order` (
  `oid` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `pid` int(20) NOT NULL,
  `cout` int(20) NOT NULL,
  `order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_status` int(20) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture` (
  `pr_id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `pr_address` varchar(255) DEFAULT NULL,
  `pr_status` int(10) NOT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `pv_id` int(11) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `reg_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `aname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `areaProvince` varchar(255) DEFAULT NULL,
  `areaCity` varchar(255) DEFAULT NULL,
  `areaDetail` varchar(255) DEFAULT NULL,
  `areaStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
