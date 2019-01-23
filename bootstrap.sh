#!/bin/bash

# copy nginx config in place
sudo cp devgru-server-app-example.conf /etc/nginx/conf.d/

# reload nginx
sudo nginx -s reload

# run server
./devgru-server-app-example
