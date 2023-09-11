# Simple Docker

Введение в докер. Разработка простого докер образа для собственного сервера


## Оглавление

[Часть 1. Готовый докер](#часть-1-готовый-докер)  
[Часть 2. Операции с контейнером](#часть-2-операции-с-контейнером)  
[Часть 3. Мини веб-сервер](#часть-3-мини-веб-сервер)  
[Часть 4. Свой докер](#часть-4-свой-докер)  
[Часть 5. Dockle](#часть-5-dockle)  
[Часть 6. Базовый Docker Compose](#часть-6-базовый-docker-compose)  


## Часть 1. Готовый докер

Выкачиваю [официальный](https://hub.docker.com/_/nginx) ngnix образ `docker pull nginx`

![docker pull nginx](01/1.png)

Проверяю наличие образа `docker images`

![docker images](01/2.png)

Запускаю образ `docker run -d nginx`

> -d - запуск контейнера в фоновом режиме

![docker run -d nginx](01/3.png)

Проверяю, что образ запущен `docker ps`

![docker ps](01/4.png)

Информация о контейнере `docker inspect -s`

> -s The --size, or short-form -s, option adds two additional fields to the docker inspect output

Размер контейнера

![Размер контейнера](01/5.png)

> SizeRootFs: the total size of all the files in the container, in bytes

> SizeRw: the size of the files that have been created or changed in the container, compared to it's image, in bytes

Список портов

![Список портов](01/6.png)

ip контейнера

![ip контейнера](01/7.png)

Останавливаю контейнер `docker stop`

![docker stop](01/8.png)

Проверяю, что образ остановлен `docker ps`

![docker ps](01/9.png)

Запускаю контейнер с замапленными портами 80 и 443

`docker run -d -p 80:80 -p 443:443 nginx`

> -p: Publish a container's port(s) to the host

![docker run](01/10.png)

Проверяю стартовую страницу в бразузере

![localhoost](01/11.png)

Перезапускаю контейнер `docker restart`

![docker restart](01/12.png)

Проверяю, что образ перезапущен `docker ps`

![docker ps](01/13.png)



## Часть 2. Операции с контейнером

Читаю конфигурационный файл

> The docker exec command runs a new command in a running container

![nginx.conf](02/1.png)

Создаю на локальной машине конфигурационный файл `touch nginx.conf`

![new nginx.conf](02/2.png)

Копирую файл в nginx `docker cp`

![docker cp](02/3.png)

Перезапускаю nginx `nginx -s reload`

![nginx -s reload](02/4.png)

Проверяю, что все работает 

![localhost/status](02/5.png)

Экспортирую контейнер `docker export`

![docker export](02/6.png)

Останавливаю контейнер `docker stop`

Удаляю образ `docker rmi`

![docker rmi](02/7.png)

Удаляю контейнер `docker rm`

![docker rm](02/8.png)

Импортирую образ `docker import`

![docker import](02/9.png)

Запускаю контейнер `docker run`

![docker run](02/10.png)

Проверяю, что все работает 

![localhost/status](02/11.png)


## Часть 3. Мини веб-сервер

Заново выкачиваю [официальный](https://hub.docker.com/_/nginx) ngnix образ `docker pull nginx`

![docker pull nginx](01/1.png)

Запускаю контейнер `docker run`


![docker run](03/1.png)

> --name: имя контейнера

Копирую файл сервера и конфигурационный файл в контейнер `docker cp`

![docker cp](03/2.png)

Устанавливаю необходимые пакеты в контейнер

![apt-get install](03/3.png)

Компилирую и запускаю сервер

![gcc](03/4.png)

Перезапускаю nginx `nginx -s reload`

Проверяю, что все работает

![curl localhost:81](03/5.png)


## Часть 4. Свой докер

Собираю образ `docker build` и проверяю его наличие `docker images`

![docker build](04/1.png)

> -t: Name and optionally a tag in the name:tag format

Запускаю контейнер `docker run` и проверяю, что все работает `docker ps`

![docker run](04/2.png)

> -v: Bind mount a volume

> -i: Keep STDIN open even if not attached

> -t: Allocate a pseudo-TTY

> -p: Publish a container's port(s) to the host

Смотрю

![curl localhost:80](04/3.png)

Обновляю конфиг на локальной машине, перезапускаю nginx `nginx -s reload`

Проверяю

![curl localhost/status:80](04/4.png)


## Часть 5. Dockle

[Гайд](https://github.com/goodwithtech/dockle#installation) по установке Dockle

Проверяю -_-

![Dockle](05/1.png)

После правки

![Dockle](05/2.png)



## Часть 6. Базовый Docker Compose

[Гайд](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04) по установке Docker Compose


Собираю образы `docker compose build`

![compose build](06/1.png)

Запускаю контейнеры и проверяю, что все работает `docker compose up -d`

> -d: deamon

![compose build](06/2.png)
