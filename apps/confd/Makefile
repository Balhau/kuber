HOST = 10.108.252.69:5000
NS = balhau
APP = confd
ARCH = arm32v7
VERSION ?= 0.0.1

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release


build:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	docker run -it --rm $(ARTIFACT) bash

default: build
