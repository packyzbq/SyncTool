FROM ubuntu:latest

RUN apt-get update && \
    apt-get install wget python3 sqlite3 && \
    wget https://github.com/haiwen/seafile-rpi/releases/download/v7.1.5/seafile-server-7.1.5-buster-arm64.tar.gz && \
    tar -xzvf seafile-server-7.1.5-buster-arm64.tar.gz && \
    cd seafile-server-7.1.5 && \
    bash setup-seafile.sh

CMD [ "bash","-c", "seafile.sh","start" ]