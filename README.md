# nx_bootcamp_webapp
Генератор статических сайтов на HUGO

Для работы нужно:
- Скачать данные репозитория
- выполнить команду docker build -t nx_bootcamp_webapp .
- выполнить команду docker run -d -p 8080:80 --name webapp nx_bootcamp_webapp
- для просмотра сайта открыть в браузере http://localhost:8080
