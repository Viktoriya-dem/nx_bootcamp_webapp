FROM ubuntu:18.04 AS build

WORKDIR /www

RUN apt-get update && apt-get install -y wget

COPY config.toml /www/config.toml

COPY . /www

ENV HUGO_VERSION="0.83.1"

RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/bin

RUN hugo

FROM nginx

RUN mkdir -p /www/site

WORKDIR /www/site

COPY --from=build /www/public /www/site

COPY default.conf /etc/nginx/conf.d/default.conf
