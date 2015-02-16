#!/bin/sh
if [ ! -d /mnt/Users/Shared/gsn-git ]; then
  mkdir -p /mnt/Users/Shared/gsn-git
fi

if [ ! -d /mnt/Users/Shared/gsn-git/wp-skeleton ]; then
  cd /mnt/Users/Shared/gsn-git
  git clone --recursive https://github.com/gsn/wp-skeleton.git
  cp -f wp-skeleton/wp-config-sample.php wp-skeleton/htdocs/wp-config-sample.php
  cp -f wp-skeleton/my-ms-install.php wp-skeleton/htdocs/wp-admin/my-ms-install.php
fi
chmod -R u+rwX,go+rX,go-w /mnt/Users/Shared/gsn-git

# start all the services
/usr/local/bin/supervisord -n
