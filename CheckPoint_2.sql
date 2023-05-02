/* КТ#2 Контрольная точка */
USE data;

/* 1. Простыми запросами 1-2 */
-- Выводим имя пользователя который живет по адрессу 'Думская д3'
SELECT name, surname FROM client WHERE address = 'Думская д3';

/* 2. Запросами с агрегациями 1-2 */
-- Количество зарегистрированных клиентов
SELECT COUNT(*) FROM client;

/* 3. Сложными запросами с объединением 2-3 таблиц с помощью Join 2-3 */
-- 1) Выведем имя пользователя, цену и время доставки
SELECT
CONCAT(client.name, ' ', client.surname) AS 'Full name',
delivery.price,
delivery.delivery_time
FROM client
JOIN delivery ON delivery.client_id = client.id_client;
-- 2) Выведем пользователей которые зарегистрированы в сети 'Шестёрочка' или 'Изо-Лента'
SELECT
CONCAT(client.name, ' ', client.surname) AS 'Full name',
shop.name AS 'Shop'
FROM client
JOIN shop ON shop.id_shop = client.shop_id && (shop.name = 'Шестёрочка' || shop.name = 'Изо-Лента');

/* 4. Сложными запросами с объединениями 2-3 таблиц подзапросами 2-3 */
-- 1) Выведем пользователей, их общую стоимость за доставку и за товар с учётом скидки по акции
SELECT
CONCAT(client.name, ' ', client.surname) AS 'Full name',
delivery.price + (SELECT good.price - good.count FROM good WHERE delivery.good_id = good.id_good) AS 'Price'
FROM client, delivery
WHERE client.id_client = delivery.client_id;
-- 2) В какой сети магазинов меньше всего зарегестрированно пользователей
SELECT
shop.name,
(SELECT COUNT(client.id_client) FROM client WHERE client.shop_id = shop.id_shop) AS 'Count'
FROM shop
ORDER BY Count ASC
LIMIT 1;

