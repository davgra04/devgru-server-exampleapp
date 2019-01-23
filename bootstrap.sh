#!/bin/bash

set -x

# copy nginx config in place
sudo cp dgserv-example.conf /etc/nginx/conf.d/

# reload nginx
sudo nginx -s reload

# run server
devgru-server-app-example 2> dgserv-example.stderr.log 1> dgserv-exapmle.stdout.log &
