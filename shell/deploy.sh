#!/bin/bash

echo "begin"

cd '/root/html/deploy'

git pull origin master

echo 'post-receive: stop serve' \
&& (pm2 delete 'deploy' || true) \
&& echo 'post-receive: start new serve' \
&& pm2 start index.js --name deploy

echo "end"