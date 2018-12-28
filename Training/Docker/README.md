https://www.youtube.com/watch?v=XgKOC6X8W28

https://www.udemy.com/docker-mastery/learn/v4/overview

https://docs.docker.com/

container = instance of an image

docker container run --publish 80:80 --detach --name webhost nginx
docker container ls -a
docker container logs webhost
docker container stop a0f9
docker container rm -f a0f9 d9b34 77fd 9187
docker container top db_mysql
docker container inspect db_mysql
docker container --stats

docker container run -it --name db_mysql mysql bash

docker container start -ai db_mysql
docker container exec -it db_mysql bash

docker pull alpine
docker image ls

