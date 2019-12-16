#!/bin/bash

echo "begin"

cd '/root/html/deploy'

git pull


echo 'post-receive: building…' \
&& npm run build \
&& echo 'post-receive: → done.' \
&& (pm2 delete 'deploy' || true) \
&& echo 'post-receive: start new serve' \
&& pm2 start /root/html/deploy/index.js --name deploy \
&& echo 'post-receive: app started successfully with pm2.'

echo "end"