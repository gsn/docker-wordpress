# docker-wordpress
Allow for wordpress local development environment.

## Installation

```
$ git clone https://github.com/gsn/docker-wordpress.git
$ cd docker-wordpress
$ docker build -t="docker-wordpress" .
```

## Usage

Wordpress is running in your container on port 8000.  

To run your instance and redirect local port 80 to port 8000:
```bash
$ docker run -v /Users:/mnt/Users -p 80:8000 --name docker-wordpress -i -d docker-wordpress
```

After starting the docker-wordpress check to see if it started and the port mapping is correct.  This will also report the port mapping between the docker container and the host machine.  It will look something like this.

```
$ docker ps

... docker-wordpress:latest ... 46317/tcp, 3306/tcp, 0.0.0.0:80->8000/tcp   docker-wordpress
```

You can the visit the following URL in a browser on your host machine to get started:

```
# with boot2docker
http://192.168.59.103

# with local docker
http://127.0.0.1
```

To enter and inspect your instance:

```bash
$ docker exec -it docker-wordpress /bin/bash
```

To start your instance:

```bash
$ docker start docker-wordpress
```

To stop your instance:

```bash
$ docker stop docker-wordpress
```
