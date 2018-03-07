HOST = 10.108.252.69:5000
NS = balhau
APP = postgres
ARCH = armv6
VERSION ?= 0.0.4

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release

#Mountpoint configs
DIR=/media/wd5t/rasp5/apps/postgresql/data
MAPPING=$(DIR):/var/lib/postgresql/data

#Postgresql configs
PKG_PKG=10.3-r0
PKG_VERSION=10.3
PKG_MAJOR=10


build:
	docker build --build-arg PG_PACKAGE=${PKG_PKG} --build-arg PG_VERSION=${PKG_VERSION} --build-arg PG_MAJOR=${PKG_MAJOR} -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	mkdir -p $(DIR)
	docker run -p 192.168.1.14:5432:5432 -v $(MAPPING) --rm $(ARTIFACT)

default: build
