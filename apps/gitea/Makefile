HOST = 10.108.252.69:5000
NS = balhau
APP = gitea
ARCH = armv6
VERSION ?= 0.0.10

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release

build-nocache:
	docker build -t $(ARTIFACT) . --no-cache
build:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	docker run -p 8080:3000 -it --rm $(ARTIFACT) ash

default: build
