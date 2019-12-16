#!/bin/bash

echo "begin"

cd '/root/html/deploy'

git pull


echo 'post-receive: building…' \
&& echo 'post-receive: remove old serve' \
&& (pm2 delete 'deploy' || true) \
&& echo 'post-receive: add new serve' \
&& pm2 start /root/html/deploy/index.js --name deploy \
&& echo 'post-receive: app started successfully with pm2.'

echo "end"