-- 1. admin 권한 계정 생성
-- CREATE USER IF NOT EXISTS 'devadmin'@'%' IDENTIFIED BY 'ghkdxowk1!';

-- 2. 전체 권한 부여 (admin과 동일하게 MySQL 서버 전체 권한)
-- GRANT ALL PRIVILEGES ON *.* TO 'devadmin'@'%' WITH GRANT OPTION;

-- 3. 권한 즉시 반영
-- FLUSH PRIVILEGES;