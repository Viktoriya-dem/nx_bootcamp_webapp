FROM ubuntu:18.04 AS build

WORKDIR nx_bootcamp_webapp

RUN apt-get update && apt-get install -y wget

ENV HUGO_VERSION="0.83.1"

RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64b>
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/bin

COPY ./ /site

WORKDIR /site

RUN hugo

FROM nginx:alpine

COPY --from=build /site/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html



#CMD ["nginx", "-g", "daemon off;"]



