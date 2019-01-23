TAR_FILE=deployment_devgru-server-app-example.tar.gz

all: build package

build:
	cd webapp && env GOARCH=amd64 GOOS=linux go build

package: webapp/devgru-server-app-example
	mkdir deployment_devgru-server-app-example
	cp webapp/devgru-server-app-example devgru-server-app-example.conf bootstrap.sh deployment_devgru-server-app-example
	tar -zcvf ${TAR_FILE} deployment_devgru-server-app-example

clean:
	rm -rf webapp/devgru-server-app-example ${TAR_FILE} deployment_devgru-server-app-example
