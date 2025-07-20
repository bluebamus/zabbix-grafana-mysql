# zabbix-grafana-mysql
zabbix-grafana-mysql

# 컨테이너 실행 및 파일 복사
## 1. 컨테이너 실행 (볼륨 마운트가 주석 처리된 상태)
docker-compose up -d webserver

## 2. 컨테이너의 /etc/nginx 폴더를 호스트의 ./config/nginx/ 로 복사
### 컨테이너 이름은 docker-compose.yml에 지정된 container_name을 사용합니다.
docker cp nginx-gunicorn-webserver:/etc/nginx ./config/

## 3. 임시로 실행했던 컨테이너 중지 및 삭제
docker-compose down
