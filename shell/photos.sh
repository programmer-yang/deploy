#!/bin/bash

echo "begin"

cd '/root/html/yang/photos'

git pull origin master

echo 'post-receive: building…' \
&& npm run build \
&& echo 'post-receive: → done.' \
&& (pm2 delete 'photos' || true) \
&& pm2 serve ./dist 9001 --name photos --spa \
&& echo 'post-receive: app started successfully with pm2.'

echo "end"