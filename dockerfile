FROM python:3.11-slim

# bind mount or volume 방식으로도 가능하지만 서비스 단계에서는 부적합
COPY . /home/auto_shorts_maker
WORKDIR /home/auto_shorts_maker

RUN pip install -r requirements.txt

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
EXPOSE 8000

# "." 를 지정하면 docker CLI 실행 위치에 dockerfile(명칭)이 있다면 자동 인식 후 build 시작
# docker image build . -t auto_shorts_maker:v0.0.1