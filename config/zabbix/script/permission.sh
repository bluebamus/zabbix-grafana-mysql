#!/bin/bash

chmod 644 /etc/zabbix/zabbix_server.conf
chmod 644 /etc/zabbix/zabbix_agent2.conf

# /var/log/zabbix 디렉토리의 권한을 755로 설정
chmod 755 /var/log/zabbix/
chmod 644 /var/log/zabbix/*

# /var/log/zabbix 디렉토리 및 하위 파일들을 zabbix 사용자/그룹으로 소유권 변경
chown -R zabbix:zabbix /var/log/zabbix/ -R
