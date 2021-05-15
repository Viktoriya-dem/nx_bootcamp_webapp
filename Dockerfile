FROM nginx:alpine

RUN mkdir -p /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

COPY . /usr/share/nginx/html

<<<<<<< HEAD
CMD ["nginx", "-g", "daemon off;"]
=======

>>>>>>> 93b655291b36263a21f7980a94460f61604eb946
