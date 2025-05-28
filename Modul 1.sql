-- Создаем служебные базы данных
DROP DATABASE IF EXISTS BD1; CREATE DATABASE BD1;
DROP DATABASE IF EXISTS BD2; CREATE DATABASE BD2;
DROP DATABASE IF EXISTS BD3; CREATE DATABASE BD3;
DROP DATABASE IF EXISTS BD4; CREATE DATABASE BD4;
DROP DATABASE IF EXISTS BD5; CREATE DATABASE BD5;
DROP DATABASE IF EXISTS BD6; CREATE DATABASE BD6;
DROP DATABASE IF EXISTS BD7; CREATE DATABASE BD7;
DROP DATABASE IF EXISTS BD8; CREATE DATABASE BD8;
DROP DATABASE IF EXISTS BD9; CREATE DATABASE BD9;
DROP DATABASE IF EXISTS BD10; CREATE DATABASE BD10;

-- Создаем основную БД для хранения информации о пользователях
DROP DATABASE IF EXISTS BD;
CREATE DATABASE BD;
USE BD;

-- Создаем таблицу для хранения пользователей
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(6) NOT NULL UNIQUE,
    users_password VARCHAR(255)
);

-- ===== User1 =====
SET @user1_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),  -- A-Z
    CHAR(FLOOR(97 + RAND() * 26)),  -- a-z
    FLOOR(RAND() * 10),             -- 0-9
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user1'@'localhost';
SET @sql = CONCAT('CREATE USER ''user1''@''localhost'' IDENTIFIED BY ''', @user1_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD1.* TO 'user1'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user1', @user1_password);

-- ===== User2 =====
SET @user2_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user2'@'localhost';
SET @sql = CONCAT('CREATE USER ''user2''@''localhost'' IDENTIFIED BY ''', @user2_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD2.* TO 'user2'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user2', @user2_password);

-- ===== User3 =====
SET @user3_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user3'@'localhost';
SET @sql = CONCAT('CREATE USER ''user3''@''localhost'' IDENTIFIED BY ''', @user3_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD3.* TO 'user3'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user3', @user3_password);

-- ===== User4 =====
SET @user4_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user4'@'localhost';
SET @sql = CONCAT('CREATE USER ''user4''@''localhost'' IDENTIFIED BY ''', @user4_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD4.* TO 'user4'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user4', @user4_password);

-- ===== User5 =====
SET @user5_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user5'@'localhost';
SET @sql = CONCAT('CREATE USER ''user5''@''localhost'' IDENTIFIED BY ''', @user5_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD5.* TO 'user5'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user5', @user5_password);

-- ===== User6 =====
SET @user6_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user6'@'localhost';
SET @sql = CONCAT('CREATE USER ''user6''@''localhost'' IDENTIFIED BY ''', @user6_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD6.* TO 'user6'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user6', @user6_password);

-- ===== User7 =====
SET @user7_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user7'@'localhost';
SET @sql = CONCAT('CREATE USER ''user7''@''localhost'' IDENTIFIED BY ''', @user7_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD7.* TO 'user7'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user7', @user7_password);

-- ===== User8 =====
SET @user8_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user8'@'localhost';
SET @sql = CONCAT('CREATE USER ''user8''@''localhost'' IDENTIFIED BY ''', @user8_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD8.* TO 'user8'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user8', @user8_password);

-- ===== User9 =====
SET @user9_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user9'@'localhost';
SET @sql = CONCAT('CREATE USER ''user9''@''localhost'' IDENTIFIED BY ''', @user9_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD9.* TO 'user9'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user9', @user9_password);

-- ===== User10 =====
SET @user10_password = CONCAT(
    CHAR(FLOOR(65 + RAND() * 26)),
    CHAR(FLOOR(97 + RAND() * 26)),
    FLOOR(RAND() * 10),
    IF(RAND() > 0.5, CHAR(FLOOR(65 + RAND() * 26)), FLOOR(RAND() * 10)),
    IF(RAND() > 0.5, CHAR(FLOOR(97 + RAND() * 26)), FLOOR(RAND() * 10))
);
DROP USER IF EXISTS 'user10'@'localhost';
SET @sql = CONCAT('CREATE USER ''user10''@''localhost'' IDENTIFIED BY ''', @user10_password, '''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
GRANT ALL PRIVILEGES ON BD10.* TO 'user10'@'localhost';
INSERT INTO Users(username, users_password) VALUES('user10', @user10_password);

select * from Users;

USE BD;  -- Выбор базы данных

-- Отключаем безопасные обновления для текущей сессии
SET SQL_SAFE_UPDATES = 0;

-- После шифрования с помощью AES_ENCRYPT() данные становятся бинарными, поэтому изменяем тип данных колонки для их хранения
ALTER TABLE Users MODIFY users_password VARBINARY(255);

-- Шифруем все пароли в таблице Users
UPDATE Users
SET users_password = AES_ENCRYPT(users_password, 'your-secret-key-123');

-- Включаем безопасные обновления обратно
SET SQL_SAFE_UPDATES = 1;

-- Просмотр результатов (пароли будут отображаться в зашифрованном виде)
SELECT * FROM Users;

-- дешифровка
SELECT 
    CAST(AES_DECRYPT(users_password, 'your-secret-key-123') AS CHAR) AS decrypted_password
FROM Users;