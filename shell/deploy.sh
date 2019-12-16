#!/bin/bash

echo "begin"

cd '/root/html/deploy'

git pull

echo 'post-receive: building…' \
&& echo 'post-receive: restart deploy serve' \
&& (pm2 restart 'deploy' || true) \
&& echo 'post-receive: app started successfully with pm2.'

echo "end"