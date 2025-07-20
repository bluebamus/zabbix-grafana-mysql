#!/bin/bash
set -e

# Zabbix 서버 설정 경로
ZABBIX_SERVER_CONF="/etc/zabbix/zabbix_server.conf"
ZABBIX_AGENT_CONF="/etc/zabbix/zabbix_agent2.conf"
NGINX_CONF="/etc/zabbix/nginx.conf"
PHP_FPM_CONF="/etc/zabbix/php-fpm.conf"

# 함수: 서비스가 있으면 시작
start_service() {
    local bin=$1
    local conf=$2
    local name=$3
    if command -v "$bin" >/dev/null 2>&1; then
        echo "Starting $name ..."
        # foreground 모드 실행
        if [[ "$bin" == "nginx" ]]; then
            "$bin" -c "$conf"
        elif [[ "$bin" == "php-fpm" ]]; then
            "$bin" --nodaemonize --fpm-config "$conf"
        else
            "$bin" -f -c "$conf"
        fi
    else
        echo "$name binary not found, skipping ..."
    fi
}

# 1. Zabbix Server 시작
start_service "/usr/sbin/zabbix_server" "$ZABBIX_SERVER_CONF" "Zabbix Server" &

# 2. Zabbix Agent2 시작
start_service "/usr/sbin/zabbix_agent2" "$ZABBIX_AGENT_CONF" "Zabbix Agent2" &

# 3. Nginx 시작
start_service "/usr/sbin/nginx" "$NGINX_CONF" "Nginx"

# 4. PHP-FPM 시작
start_service "/usr/sbin/php-fpm" "$PHP_FPM_CONF" "PHP-FPM" &

# 5. foreground 상태 유지 (혹은 마지막 서비스가 foreground임)
wait
