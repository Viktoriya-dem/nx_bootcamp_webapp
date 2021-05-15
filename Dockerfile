FROM nginx:alpine

RUN mkdir -p /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

COPY . /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]