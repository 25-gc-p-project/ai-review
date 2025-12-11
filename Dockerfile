FROM python:3.11-slim

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 패키지 업데이트 + 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    gcc \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt 복사 후 설치
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# 프로젝트 전체 복사
COPY . .

# FastAPI 서버 실행 (포트 8000)
EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

