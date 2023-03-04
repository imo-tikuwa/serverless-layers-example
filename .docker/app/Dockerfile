FROM node:16-buster-slim

ENV TZ=Asia/Tokyo

RUN { \
        echo "alias ll='ls -l --color=auto'"; \
    } >> /home/node/.bashrc

WORKDIR /src

USER node
