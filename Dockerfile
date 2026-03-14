FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install mysqlclient
    pip install --no-cache-dir -r requirements.txt


COPY . .

RUN useradd -m fahad

USER fahad

EXPOSE 5000

CMD ["python", "app.py"]


