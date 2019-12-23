HOST = 10.108.252.69:5000
NS = balhau
APP = gitea
ARCH = armv6
VERSION ?= 0.0.9

ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release


build:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	docker run -p 8080:3000 -it --rm $(ARTIFACT) ash

default: build
