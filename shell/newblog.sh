#!/bin/bash

echo "begin"

cd '/root/html/yang/blog'

git pull origin master

{
echo 'post-receive: building…' \
&& npm run build \
&& echo 'post-receive: → done.' \
&& rm -rf /usr/share/nginx/yangblog \
&& cp -rf ~/html/yang/blog/public /usr/share/nginx/yangblog \
&& /usr/sbin/nginx -s reload \
&& echo 'post-receive: nginx reload success'
} || {
  echo 'error'
}

echo "end"