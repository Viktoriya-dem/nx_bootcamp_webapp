FROM ubuntu:18.04 as generator

RUN mkdir -p /$HOME/hugo

WORKDIR /$HOME/hugo

RUN wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_extended_0.83.1_Linux-64bit.deb && \
    apt install ./hugo.deb && \
    rm hugo.deb

RUN hugo

FROM nginx:alpine

RUN mkdir -p /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

COPY . /usr/share/nginx/html

COPY --from=generator /$HOME/hugo /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]



