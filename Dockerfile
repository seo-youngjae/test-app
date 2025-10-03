# Flask 앱용 Dockerfile
FROM python:3.9-slim

# 작업 디렉토리 생성
WORKDIR /app

# 종속성 설치용 requirements.txt가 있다면 복사
# (없다면 pip로 직접 설치해도 무방)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt || pip install flask

# Flask 앱 코드 복사
COPY src/ /app/

# Flask 기본 포트
EXPOSE 5000

# Flask 앱 실행
CMD ["python", "app.py"]
