# docker-wordpress
Allow for wordpress local development environment.

## Installation

```
$ git clone https://github.com/gsn/docker-wordpress.git
$ cd docker-wordpress
$ sudo docker build -t="docker-wordpress" .
```

## Usage

To spawn a new instance of wordpress on port 80.  The -p 80:8000 maps the internal docker port 8000 to the outside port 80 of the host machine.

```bash
$ docker run -v /Users:/mnt/Users -p 80:8000 --name docker-wordpress -d docker-wordpress
```

Start your newly created docker.

```
$ docker start docker-wordpress
```

After starting the docker-wordpress check to see if it started and the port mapping is correct.  This will also report the port mapping between the docker container and the host machine.

```
$ docker ps

0.0.0.0:80 -> 80/tcp docker-wordpress
```

You can the visit the following URL in a browser on your host machine to get started:

```
http://127.0.0.1:80
```
