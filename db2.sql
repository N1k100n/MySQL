DROP DATABASE IF EXISTS `data`;
CREATE DATABASE `data`;
USE `data`;

CREATE TABLE `shop` (
  `id_shop` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  
  PRIMARY KEY (`id_shop`)
);

CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `shop_id` int NOT NULL,
  
  PRIMARY KEY (`id_client`),
  FOREIGN KEY (`shop_id`) REFERENCES `shop`(`id_shop`)
);

CREATE TABLE `good` (
  `id_good` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `count` int NOT NULL,
  `price` int NOT NULL,
  `category` varchar(30) NOT NULL,
  
  PRIMARY KEY (`id_good`)
);

CREATE TABLE `action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `name_good` varchar(30) NOT NULL,
  `discount` int NOT NULL,
  `price_discount` int NOT NULL,
  `good_id` int NOT NULL,
  
  PRIMARY KEY (`id_action`),
  FOREIGN KEY (`good_id`) REFERENCES `good`(`id_good`)
);

CREATE TABLE `delivery` (
  `id_delivery` int NOT NULL AUTO_INCREMENT,
  `delivery_time` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `delivery_id` int NOT NULL,
  `good_id` int NOT NULL,
  
  PRIMARY KEY (`id_delivery`),
  FOREIGN KEY (`delivery_id`) REFERENCES `client`(`id_client`),
  FOREIGN KEY (`good_id`) REFERENCES `good`(`id_good`)
);
