CREATE DATABASE clima;
CREATE USER 'dedeco'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON clima . * TO 'dedeco'@'localhost';
FLUSH PRIVILEGES;