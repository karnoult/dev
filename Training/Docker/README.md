https://www.youtube.com/watch?v=XgKOC6X8W28
https://www.udemy.com/docker-mastery/learn/v4/overview

---------------------------------------

https://docs.docker.com/
https://www.docker.com/sites/default/files/Docker_CheatSheet_08.09.2016_0.pdf

Docker is a platform for developers and sysadmins to develop, ship, and run applications. Docker lets you quickly assemble applications from components and eliminates the friction that can come when shipping code. Docker lets you get your code tested and deployed into production as fast as possible.

Docker consists of:

- The Docker Engine - our lightweight and powerful open source containerization technology combined with a work flow for building and containerizing your applications.
- Docker Hub - our SaaS service for sharing and managing your application stacks.

Containers aren't mini-VMs, they are just processes.
A container is an instance of an image running as a process.

Images aren't ideal for persistent data
- Mount a host file system path into container
- Use `docker volume` to create storage for unique/persistent data

Images are composed of layers; each layer is uniquely identified and only stored once on a host
A container is just a single read/write layer on top of image: when a container change a file incl. within an image, it doesn't change the image itself but copy this file before changing it (aka cow: copy on write)

Tag = pointer to a specific image commit

---------------------------------------

docker version
docker info

---------------------------------------

# List images
docker image ls

---------------------------------------

# Pull an image or a repository from a registry
# https://hub.docker.com/ = default registry = "the apt package system for Containers"
# https://github.com/docker-library/official-images
docker pull alpine

# List containers
docker container ls -a

# Start one or more stopped containers
docker container start -ai db_mysql

# Run a command in a new container
docker container run -p 80:80 --detach --name webhost nginx

docker container run --rm -it --publish 80:80 --name db_mysql --env MYSQL_RANDOM_ROOT_PASSWORD=yes --network my_network -net-alias db mysql bash

docker container run --name tmp_alpine -it --network my_network --rm alpine nslookup search

# Run a command in a running container
docker container exec -it db_mysql bash

# Stop one or more running containers
docker container stop a0f9

# Remove one or more containers
docker container rm -f b34dc903db14 08e19efe2f69 5fe6e8e09ff9

---------------------------------------

#Display the running processes of a container
docker container top db_mysql

#Display detailed information on one or more containers
docker container inspect db_mysql

#Display a live stream of container(s) resource usage statistics
docker container stats

#List port mappings or a specific mapping for the container
docker container port db_mysql

#Fetch the logs of a container
docker container logs webhost

---------------------------------------

# default private virtual network = "bridge"
# best practvie is to create a new virtual network for each app
# skip virtual network and use host IP: --net=host

docker network ls
docker network inspect bridge
docker network create --driver
docker network connect
docker network disconnect

---------------------------------------

# history of image layers
docker history nginx:latest

---------------------------------------

# exercise DNS round-robin
docker pull alpine
docker container ls -a
docker network create es_network
docker container run -it --name es1 --detach --network es_network --net-alias search elasticsearch:2
docker container run -it --name es2 --detach --network es_network --net-alias search elasticsearch:2
docker container ls -a
 docker network inspect es_network
docker container inspect es1
docker container run --name tmp_alpine -it --rm --network es_network alpine nslookup es1
docker container run --name tmp_alpine -it --rm --net es_network alpine nslookup es2
docker container run --name tmp_alpine -it --rm --net es_network alpine nslookup search
docker container run --name tmp_alpine -it --rm --net es_network centos curl -s search:9200

---------------------------------------
