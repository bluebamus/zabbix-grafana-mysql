#!/bin/bash

# MySQL root 비밀번호 (이 값을 수정하세요)
MYSQL_ROOT_PWD="test1!"
ZABBIX_USER_PWD="password"

# MySQL에 root로 접속해서 필요한 명령 실행
mysql -uroot -p"${MYSQL_ROOT_PWD}" <<EOF
CREATE DATABASE zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'zabbix'@'%' IDENTIFIED BY '${ZABBIX_USER_PWD}';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'%';
SET GLOBAL log_bin_trust_function_creators = 1;
QUIT;
EOF

# Zabbix 초기 데이터 입력
zcat /zabbix/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p"zabbix" zabbix

# log_bin_trust_function_creators 원복
mysql -uroot -p"${MYSQL_ROOT_PWD}" <<EOF
SET GLOBAL log_bin_trust_function_creators = 0;
QUIT;
EOF

echo "Zabbix MySQL 초기 설정이 완료되었습니다."
