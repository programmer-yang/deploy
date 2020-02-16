#!/bin/bash

echo "begin"

cd '/root/html/yang/static-web'

git pull origin master

{
echo 'post-receive: building…' \
&& npm run build \
&& echo 'post-receive: → done.' \
&& rm -rf /usr/share/nginx/filemanage \
&& cp -rf ~/html/yang/static-web/dist /usr/share/nginx/filemanage \
&& /usr/sbin/nginx -s reload \
&& echo 'post-receive: nginx reload success'
} || {
  echo 'error'
}

echo "end"