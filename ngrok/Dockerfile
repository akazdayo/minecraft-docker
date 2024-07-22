# Ubuntuのインストール
FROM ubuntu:latest

# 引数
ARG NGROK_TOKEN

# 依存関係のインストール
RUN apt update && apt upgrade -y && apt install -y curl && \
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt update && apt install -y ngrok && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 認証
RUN ngrok config add-authtoken "${NGROK_TOKEN}"

# 実行
CMD ["ngrok", "tcp", "127.0.0.1:25565"]