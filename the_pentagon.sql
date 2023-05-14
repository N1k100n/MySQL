DROP DATABASE IF EXISTS `the_pentagon`;
CREATE DATABASE `the_pentagon`;
USE `the_pentagon`;

CREATE TABLE `secret_doc` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `disclosed` BOOLEAN DEFAULT FALSE,
    `importance` TINYINT DEFAULT 0,
    `body` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    
    PRIMARY KEY (`id`)
);

CREATE TABLE `corps` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1) NOT NULL UNIQUE,
    `info` TEXT NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `position` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `access_secret_doc` INT DEFAULT 3,
    PRIMARY KEY (`id`)
);

CREATE TABLE `workers` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `firstname`  VARCHAR(255),
    `lastname`  VARCHAR(255),
    `age` INT NOT NULL,
    `disclosed` BOOLEAN DEFAULT FALSE,
    
    `position_id` INT NOT NULL,
    `corps_id` INT NOT NULL,
    
    PRIMARY KEY (`id`),
    FOREIGN KEY (`position_id`) REFERENCES `position`(`id`),
    FOREIGN KEY (`corps_id`) REFERENCES `corps`(`id`)
);

CREATE TABLE `mission`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30)NOT NULL,
    `body` TEXT NOT NULL,
    `importance` TINYINT DEFAULT 0,
    `run_up_to` DATE,
    `complete` BOOLEAN DEFAULT FALSE,
    
    PRIMARY KEY (`id`)
);

CREATE TABLE `undercover_agent` (
	`location` VARCHAR(50) DEFAULT 'База',
	`workers_id` INT NOT NULL,
    `mission_id` INT NOT NULL,
    
    FOREIGN KEY (`workers_id`) REFERENCES `workers`(`id`),
    FOREIGN KEY (`mission_id`) REFERENCES `mission`(`id`)
);


INSERT INTO `secret_doc`(`disclosed`, `importance`, `body`, `created_at`)
VALUES
	(FALSE, 8, 'В центре Нью-Йорка был замечен и сбит неопознанный летательный аппарат похожий на тарелку неземной формы происхождения, далее после сбора расбросанных после взрыва обломки реставрировали для дальнейших изучений в корпусе "F"', '2014-01-30 03:12:30'),
	(TRUE, 3, 'Трое исследователей погибло при исследовании марианской впадины, водолазное снаряжение было покрыто радиацией а тела были высушенны вплоть до костей. Сектор STUE-325 марианской впадины закрыт для исследования', '2017-05-14 20:32:56'),
	(FALSE, 10, 'Из-за ошибки учёных искусственный вирус разработанный в корпусе "C" (так-же называемый "COVID-19") выбрался в массы на территории Китая. В ближайшие 7 дней тайно вывести всех важных персон из Китая на спец. участки в целях защиты', '2019-12-02 21:32:56'),
	(FALSE, 5, 'На дне марианской впадины были замечены новые виды серебристых акул, кроме выраженного серебристого цвета их кожа отличалась ярким свечением, скорее всего от радиации найденой также на дне впадины (задокументировано в файле "TS-2")', '2020-02-12 13:52:21'),
	(FALSE, 9, 'Новая программа по вживлению микро-чипов в организм человека показывает неплохие результаты, в течении одного месяца было прочипированно более 36000 человек, при этом 34000 микро-чипов продолжают свою работу в роли прослушки и отправки гео-позиции', '2021-05-10 03:00:56'),
	(TRUE, 4, 'В корпусе "D" по причине дестабилизации солнечного мини-ядра было уничтожено всё в округе 3,5 км. Число погибших 243, раненых 1332', '2022-05-14 14:15:46'),
	(FALSE, 6, 'Найденная на дне черного моря по причине пробоины Русская подлодка несла в себе 3 ядерных боеголовки типа "Царь-Бомба", введено положение черезвучайной готовности страны к ответу на возможную войну с странами России и постсоветских республик', '2023-02-14 23:52:03');

INSERT INTO `corps`(`name`, `info`)
VALUES
	('A', 'Центральный узел'),
	('B', 'Финансовый офис (туалет)'),
	('C', 'Биолаборатория'),
	('D', 'Оружейная'),
	('E', 'Серверная'),
	('F', 'Центр исследований'),
	('G', 'Блэк-Меса');

INSERT INTO `position`(`name`, `access_secret_doc`)
VALUES
	('Уборщик', 0),
	('Уборщик - ниндзя', 4),
	('Копирайтер', 2),
	('Бодибилдер', 5),
	('Бухгалтер', 2),
	('Ведущий IT - специалист', 6),
	('Лаборант', 6),
	('Охранник', 3),
	('Агент', 7),
	('Шут', 10),
	('Офисный планктон', 5),
	('Директор', 10);

INSERT INTO `workers`(`firstname`, `lastname`, `age`, `disclosed`, `position_id`, `corps_id`)
VALUES
	('Иван', 'Золо', 18, FALSE, 1, 1),
    ('Принял', 'Ислам', 44, TRUE, 2, 1),
	('Диана', 'Мазольевна', 71, FALSE, 3, 2),
    ('Моника', 'Гаргаревна', 19, FALSE, 4, 6),
    ('Мерлин', 'Монро', 23, FALSE, 5, 2),
    ('Дуэйн ', 'Джонсон', 53, TRUE, 6, 5),
    ('Паша', 'Александров', 28, FALSE, 7, 3),
    ('Алексей', 'Грибочный', 24, TRUE, 8, 4),
    ('Дима', 'Масленников', 28, FALSE, 8, 4),
    ('Даша', 'Путешественница', 73, FALSE, 9, 4),
    ('Роман', 'Романов', 42, FALSE, 9, 6),
    ('Юрий', 'Гагарин', 72, FALSE, 9, 6),
    ('Илон', 'Маск', 62, TRUE, 10, 7),
    ('Гордон', 'Фримен', 34, FALSE, 11, 7),
    ('Никита', 'Донсков', 18, FALSE, 12, 7);

INSERT INTO `mission`(`name`, `body`, `importance`, `run_up_to`, `complete`)
VALUES
	('Красный побегун', 'Найти организаторов красного восстания и взять живыми', 4, '2021-11-23', TRUE),
    ('Умнее оригинала', 'Подменить старика Байдена на новогоднем обращении', 9, '2022-12-31', TRUE),
    ('Не пойман — не вор', 'Уничтожить улики крушения высокоскоростной ракеты "ФГСР-МЕТЕЛЬ"', 3, '2023-05-10', TRUE),
    ('Ёжик в тумане', 'Проследить куда Байден уходит со сцены', 2, '2023-12-21', FALSE),
	('Спичечный коробок', 'Прикрыть наркопритон "Шальная спичка"', 5, '2024-09-19', FALSE),
    ('Привет, сосед', 'Узнать о новом оружии России', 10, '2025-04-17', FALSE);

INSERT INTO `undercover_agent`(`location`, `workers_id`, `mission_id`)
VALUES
	('Москва', 11, 6),
    ('Вашингтон', 10, 4);


SELECT * FROM `secret_doc`;
SELECT * FROM `corps`;
SELECT * FROM `position`;
SELECT * FROM `workers`;
SELECT * FROM `mission`;
SELECT * FROM `undercover_agent`;


-- DELIMITER //
-- CREATE PROCEDURE access_secret_doc()
-- BEGIN
--     SELECT CONCAT(workers.firstname, ' ', workers.lastname) AS access
--     FROM workers
--     JOIN position ON position.id = workers.position_id
--     WHERE position.access_secret_doc = 6;
-- END //
-- DELIMITER ;
-- CALL access_secret_doc;

-- SELECT 
-- CONCAT(workers.firstname, ' ', workers.lastname) AS 'Agent name',
-- mission.name AS 'Mission name'
-- FROM workers, mission, undercover_agent
-- WHERE undercover_agent.mission_id = mission.id AND undercover_agent.workers_id = workers.id; 

-- SELECT 
-- DISTINCT position.name,
-- COUNT(*) AS 'qt'
-- FROM position, workers
-- WHERE workers.position_id = position.id
-- GROUP BY workers.position_id
-- ORDER BY qt DESC;

-- SELECT id FROM secret_doc
-- WHERE secret_doc.disclosed = 0;

-- SELECT 
-- CONCAT(workers.firstname, ' ', workers.lastname) AS 'Name'
-- FROM workers
-- WHERE workers.corps_id = (SELECT corps.id FROM corps WHERE corps.name = 'G');

-- SELECT * FROM mission WHERE complete = 1 ORDER BY run_up_to DESC LIMIT 1;















