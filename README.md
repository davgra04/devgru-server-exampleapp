devgru-server-app-example
=========================

An example project for a webapp that runs on devgru-server (gitlab.devgru.cc/devgru/devgru-server)

# Getting Started

## Build Application

```
make all
```

## Deploy Application

```
scp -i ~/.ssh/20190122_devgru-server.key ./deployment_devgru-server-app-example.tar.gz centos@54.203.153.151:/home/centos/

ssh -i ~/.ssh/20190122_devgru-server.key centos@54.203.153.151 "tar zxvf /home/centos/deployment_devgru-server-app-example.tar.gz"


```

