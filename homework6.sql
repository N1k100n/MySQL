USE VK;

SELECT
CONCAT(users.lastname, ' ', users.firstname)
AS 'Full name',
IF(profiles.gender = 'f', 'Женщина', 'Мужчина')
AS 'Gender',
DATE_FORMAT(profiles.birthday, '%d %M %Y')
AS 'Birthday'
FROM users, profiles
WHERE users.id = profiles.user_id;
