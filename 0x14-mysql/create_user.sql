CREATE USER IF NOT EXISTS 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVLEGES;

