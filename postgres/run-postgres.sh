#!/bin/bash

docker build -t postgres15:v0.0.1 -f Dockerfile .

docker network create auto_shorts_maker || echo "auto_shorts_maker Network already exists"

#docker run --name postgres \
#  --network auto_shorts_maker \
#  -p 5432:5432 \
#  -e POSTGRES_DB=auto_shorts_maker \
#  -e POSTGRES_USER=sdw1000 \
#  -e POSTGRES_PASSWORD=sdw1004 \
#  -e TZ='Asia/Seoul' \
#  -v ./data:/var/lib/postgresql/data \
#  -d postgres15:v0.0.1

# 아래 옵션들은 init.sql을 통해서 미리 설정해줌
docker run --name postgres \
  --network auto_shorts_maker \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=sdw1004 \
  -e TZ='Asia/Seoul' \
  -v ./data:/var/lib/postgresql/data \
  -d postgres15:v0.0.1

# 실행 명령어
# chmod +x run-postgres.sh
# ./run-postgres.sh

# 주의점!!!
# POSTGRES_DB, POSTGRES_PASSWORD 둘 중 admin 으로 설정하면 -> fail
# 컨테이너 재생성 시 이전 data 폴더 안의 내용물 삭제(or 바뀐 설정에 맞춰 설정 파일 변경)
# -> POSTGRES_DB, POSTGRES_PASSWORD 변경 사항이 적용되지 않았던 사례 1