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
  `client_id` int NOT NULL,
  `good_id` int NOT NULL,
  
  PRIMARY KEY (`id_delivery`),
  FOREIGN KEY (`client_id`) REFERENCES `client`(`id_client`),
  FOREIGN KEY (`good_id`) REFERENCES `good`(`id_good`)
);

INSERT INTO `shop`(`name`, `address`) VALUES ('Шестёрочка', 'Арбузова д54');
INSERT INTO `shop`(`name`, `address`) VALUES ('Изо-Лента', 'Огуречная д2');
INSERT INTO `shop`(`name`, `address`) VALUES ('Белое - Красное', 'Яблочная д102а');

INSERT INTO `client`(`name`, `surname`, `address`, `phone`, `shop_id`)
VALUES
('Михаил', 'Пушилин', 'Думская д3', '89264826174', 1),
('Ислам', 'Гараев', 'перекресная д14', '89264135562', 1),
('Мирон', 'Гатаулин', 'Декабристов д10', '89212516143', 2),
('Камиль', 'Гилязов', 'Ошибка д404', '89264826221', 3),
('Лейла', 'Сафиулина', 'Строительная д33', '89234821414', 2);

INSERT INTO `good`(`name`, `count`, `price`, `category`) VALUES ('Скидки богатым', 99, 100, 'Недвижимость');
INSERT INTO `good`(`name`, `count`, `price`, `category`) VALUES ('9 мая', 149, 400, 'Подарки');

INSERT INTO `action`(`name_good`, `discount`, `price_discount`, `good_id`)
VALUES
('Скидки богатым', 99, 1, 1),
('Скидки богатым', 99, 41, 1),
('9 мая', 48, 35, 2),
('Скидки богатым', 99, 991, 1),
('9 мая', 48, 52, 2);

INSERT INTO `delivery`(`delivery_time`, `price`, `client_id`, `good_id`) VALUES ('00:10:00', '239', 1, 1);
INSERT INTO `delivery`(`delivery_time`, `price`, `client_id`, `good_id`) VALUES ('00:02:00', '899', 2, 1);


SELECT * FROM `shop`;
SELECT * FROM `client`;
SELECT * FROM `good`;
SELECT * FROM `action`;
SELECT * FROM `delivery`;
