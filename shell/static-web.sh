#!/bin/bash

echo "begin"

cd '/root/html/yang/static-web'

git pull origin master

echo 'post-receive: building…' \
&& npm run build \
&& echo 'post-receive: → done.' \
&& (pm2 delete 'static-web' || true) \
&& pm2 serve ./dist 9011 --name static-web --spa \
&& echo 'post-receive: app started successfully with pm2.'

echo "end"