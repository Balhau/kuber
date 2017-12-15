HOST = 10.108.252.69:5000
NS = balhau
APP = postgres
ARCH = armv6
VERSION ?= 0.0.1

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release


build:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	docker run -it -p 5432:5432 --rm $(ARTIFACT) ash

default: build
