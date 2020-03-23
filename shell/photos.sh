#!/bin/bash

echo "begin"

cd '/root/html/yang/photos'

git pull origin master

{
echo 'post-receive: building…' \
&& npm run build \
&& echo 'post-receive: → done.' \
&& rm -rf /usr/share/nginx/photos \
&& cp -rf /root/html/yang/photos/dist /usr/share/nginx/photos \
&& /usr/sbin/nginx -s reload \
&& echo 'post-receive: nginx reload success'
} || {
  echo 'error'
}

echo "end"