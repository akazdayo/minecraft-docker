# Ubuntuのインストール
FROM ubuntu:jammy-20240627.1

ENV DEBIAN_FRONTEND=noninteractive
# 依存関係のインストールと初期設定
RUN apt update && apt upgrade -y && apt install -y tzdata wget openjdk-21-jre git
# サーバーのインストール
WORKDIR /opt
RUN wget https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar

# ワールドデータの取得
RUN mkdir /root/minecraft
WORKDIR /root

# 起動ファイルの作成
RUN echo "echo machine github.com login \"\${GIT_NAME}\" password \"\${GIT_PAT}\" > ~/.netrc" > run.sh && \
    echo "git config --global user.name \"\${GIT_NAME}\"" >> run.sh && \
    echo "git config --global user.email \"\${GIT_EMAIL}\"" >> run.sh && \
    echo "git clone \"\${GIT_REPO}\" /root/minecraft" >> run.sh && \
    echo "cd minecraft" >> run.sh && \
    echo "git pull origin main" >> run.sh && \
    echo 'echo "eula=true" > /root/minecraft/eula.txt' >> run.sh && \
    echo "java -Xmx1024M -Xms1024M -jar /opt/server.jar nogui" >> run.sh && \
    echo "git add ." >> run.sh && \
    echo 'git commit -m"save"' >> run.sh && \
    echo 'git push origin main' >> run.sh

# 実行
CMD [ "sh", "run.sh" ]