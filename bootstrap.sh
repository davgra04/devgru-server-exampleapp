#!/bin/bash

set -x

# copy nginx config in place
sudo cp dgserv-exampleapp.conf /etc/nginx/conf.d/

# reload nginx
sudo nginx -s reload

# install systemd service
sudo cp dgserv-exampleapp.service /etc/systemd/system/dgserv-exampleapp.service

# start service
sudo systemctl enable dgserv-exampleapp.service
sudo systemctl restart dgserv-exampleapp.service
