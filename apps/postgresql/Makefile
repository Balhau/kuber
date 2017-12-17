HOST = 10.108.252.69:5000
NS = balhau
APP = postgres
ARCH = armv6
VERSION ?= 0.0.2

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release

DIR=/media/wd5t/rasp5/apps/postgresql/data
MAPPING=$(DIR):/var/lib/postgresql/data

build:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	mkdir -p $(DIR)
	docker run -p 192.168.1.14:5432:5432 -v $(MAPPING) --rm $(ARTIFACT)

default: build
