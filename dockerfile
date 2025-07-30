FROM python:3.11-slim

# bind mount or volume 방식으로도 가능하지만 서비스 단계에서는 부적합
# COPY . /home/auto_shorts_maker
# WORKDIR /home/auto_shorts_maker
# RUN pip install -r requirements.txt

# volume 방식 사용
COPY ./requirements.txt /app/
RUN pip install -r /app/requirements.txt
WORKDIR /home/auto_shorts_maker

EXPOSE 8000

# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
# https://stackoverflow.com/questions/55831728/what-is-statreloader-while-running-django
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]

# "." 를 지정하면 docker CLI 실행 위치에 dockerfile(명칭)이 있다면 자동 인식 후 build 시작
# dockerfile 직접 명시 하고 싶을 때 "." -> "파일명"
# 동일한 이름으로 이미지 생성시 기존 이미지 이름이 default naming change
# docker image build . -t auto_shorts_maker:v0.0.1
# docker run --name auto_shorts_maker -p 8000:8000 auto_shorts_maker:v0.0.1
# docker run --name auto_shorts_maker \
# --network auto_shorts_maker \
# -v /Users/whizkid1/study/auto_shorts_maker:/home/auto_shorts_maker \
# -p 8000:8000 \
# auto_shorts_maker:v0.0.1_volume

# docker network 생성
# docker network create auto_shorts_maker
# docker network connect {네트워크명} {컨테이너명}
# docker network connect auto_shorts_maker auto_shorts_maker