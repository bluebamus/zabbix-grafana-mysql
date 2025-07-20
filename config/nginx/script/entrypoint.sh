#!/bin/bash
set -e

# PHP-FPM 서비스 시작 (백그라운드 실행)
echo "Starting PHP-FPM..."
php-fpm8.3

# Nginx 서비스 시작 (백그라운드 실행)
echo "Starting Nginx..."
nginx

# Zabbix Agent 2 서비스 시작 (백그라운드 실행)
echo "Starting Zabbix Agent 2..."
zabbix_agent2

# Zabbix Server를 포그라운드로 실행하여 컨테이너가 계속 실행되도록 함
echo "Starting Zabbix Server in foreground..."
# exec를 사용하여 셸 프로세스를 zabbix_server 프로세스로 대체합니다.
# 이렇게 하면 Docker의 종료 신호(SIGTERM)가 Zabbix 서버에 직접 전달되어 정상적인 종료가 가능합니다.
exec /usr/sbin/zabbix_server -f -c /etc/zabbix/zabbix_server.conf
