FROM ubuntu:18.04 AS build

RUN apt-get update && apt-get install -y wget

ENV HUGO_VERSION="0.83.1"

RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/bin

COPY . .

RUN hugo

FROM nginx:alpine

COPY --from=build ./public /usr/share/nginx/html

RUN mkdir -p /etc/nginx

COPY default.conf /etc/nginx/default.conf

WORKDIR /usr/share/nginx/html


CMD ["nginx", "-g", "daemon off;"]
