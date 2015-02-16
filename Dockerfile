FROM ubuntu:latest
MAINTAINER Tom Nguyen <tnguyen@groceryshopping.net>
# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Make sure www-data has access to external files
RUN usermod -u 1000 www-data
RUN apt-get update
RUN apt-get -y upgrade

# Basic Requirements
RUN apt-get -y install mysql-server pwgen python-setuptools curl git unzip

# Install the rest
RUN chmod +x docker-install
RUN ./docker-install

# Supervisor Config
RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout
ADD ./supervisord.conf /etc/supervisord.conf

# Wordpress Initialization and Startup Script
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# private expose
EXPOSE 3306
EXPOSE 8000
EXPOSE 46317
CMD ["/bin/bash", "/start.sh"]