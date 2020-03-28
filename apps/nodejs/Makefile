HOST = 10.108.252.69:5000
NS = balhau
APP = nodejs
ARCH = armv6
VERSION ?= 1.1.0

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release


build:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	docker run -it --rm $(ARTIFACT) ash

default: build
