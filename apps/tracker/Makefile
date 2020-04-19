HOST = 10.108.252.69:5000
NS = balhau
APP = bt-tracker
ARCH = arm32v7
VERSION ?= 0.0.6
ARTIFACT=$(HOST)/$(NS)/$(APP):$(ARCH)-$(VERSION)

.PHONY: build push shell run start stop rm release


build:
	docker build -t $(ARTIFACT) . --no-cache

debug:
	docker build -t $(ARTIFACT) .
push:
	docker push $(ARTIFACT)
run: 
	docker run -it --rm $(ARTIFACT) ash

default: build
