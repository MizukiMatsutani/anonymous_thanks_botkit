FROM node:13.2-alpine

RUN apk update && apk upgrade --update && apk --no-cache add \
    git \
    shadow \
    && rm -r /var/cache/apk/*

ENV HOME=/root
RUN mkdir $HOME/bot

COPY package.json $HOME/bot/

USER root
WORKDIR $HOME/bot
RUN npm init -f \
    && npm install botkit --save

EXPOSE 3000