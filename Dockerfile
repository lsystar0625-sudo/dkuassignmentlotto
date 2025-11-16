# lotto_project/Dockerfile
# 1. Python 3.11 기반의 가벼운(slim) 이미지를 사용
FROM python:3.11-slim

# 2. 파이썬이 표준 출력 버퍼링을 하지 않도록 설정
ENV PYTHONUNBUFFERED 1

# 3. 컨테이너 내부의 작업 디렉토리 설정
WORKDIR /usr/src/app

# 4. requirements.txt를 복사하고 패키지 설치
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

# 5. 프로젝트의 나머지 모든 파일을 복사
COPY . /usr/src/app/

# 6. Django 개발 서버가 실행될 포트 노출
EXPOSE 8000

# 7. 컨테이너 시작 시 실행될 기본 명령어 (Django 개발 서버 구동)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]