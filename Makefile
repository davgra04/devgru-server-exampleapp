NAME=exampleapp
TAR_FILE=dgserv_${NAME}.tar.gz

all: build package

build:
	cd webapp && env GOARCH=amd64 GOOS=linux go build

package: webapp/dgserv-${NAME}
	mkdir ${NAME}
	cp webapp/dgserv-${NAME} dgserv-${NAME}.conf dgserv-${NAME}.service bootstrap.sh ${NAME}
	tar -zcvf ${TAR_FILE} ${NAME}

clean:
	rm -rf webapp/dgserv-${NAME} ${TAR_FILE} ${NAME}


deploy: ${TAR_FILE}
	rsync -e "ssh -i ${DGSERV_SSH_KEY}" -avz ${TAR_FILE} centos@devgru.cc:/home/centos/
	ssh -i ${DGSERV_SSH_KEY} centos@devgru.cc "sudo tar -C /dgserv -zxvf /home/centos/${TAR_FILE}"
	ssh -i ${DGSERV_SSH_KEY} centos@devgru.cc "cd /dgserv/${NAME} && bash bootstrap.sh"
