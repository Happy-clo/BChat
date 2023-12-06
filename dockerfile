FROM python:3.10-slim

COPY . /app
WORKDIR /app

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y ffmpeg \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install --upgrade pip setuptools \
    && pip install -U openai-whisper bilibili-api-python==16.1.1 websocket-client pymysql chardet \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME /tmp
CMD ["python", "main.py"]
