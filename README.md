devgru-server-app-example
=========================

An example project for a webapp that runs on devgru-server.


# Getting Started

## Build Application

```bash
make clean
make all
```


## Deploy Application

```bash
make deploy DGSERV_SSH_KEY=~/whatever.key
```


## Obtain Let's Encrypt cert that includes example.devgru.cc

```bash
sudo -H /usr/bin/letsencrypt --nginx -n --agree-tos --email your@email.com -d devgru.cc -d www.devgru.cc -d example.devgru.cc --expand
```

NOTE: Include other subdomains that are deployed to the devgru-server with the -d flag.
