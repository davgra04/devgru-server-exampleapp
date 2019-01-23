TAR_FILE=deployment_devgru-server-app-example.tar.gz

all: build package

build:
	cd webapp && env GOARCH=amd64 GOOS=linux go build

package: webapp/devgru-server-app-example
	mkdir deployment_devgru-server-app-example
	cp webapp/devgru-server-app-example dgserv-example.conf bootstrap.sh deployment_devgru-server-app-example
	tar -zcvf ${TAR_FILE} deployment_devgru-server-app-example

clean:
	rm -rf webapp/devgru-server-app-example ${TAR_FILE} deployment_devgru-server-app-example


deploy: ${TAR_FILE}
	# scp -i  ${DGSERV_SSH_KEY} ${TAR_FILE} centos@devgru.cc:/home/centos/
	rsync -e "ssh -i ${DGSERV_SSH_KEY}" -avz ${TAR_FILE} centos@devgru.cc:/home/centos/
	ssh -i ${DGSERV_SSH_KEY} centos@devgru.cc "tar zxvf /home/centos/${TAR_FILE}"
	ssh -i ${DGSERV_SSH_KEY} centos@devgru.cc "cd /home/centos/deployment_devgru-server-app-example && bash bootstrap.sh"
	# ssh -i ${DGSERV_SSH_KEY} centos@devgru.cc "echo 'heyo boyo'"

