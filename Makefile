REPO = docker.io
NS = mschygulla
NAME = chefdk
VERSION ?= 1.1.16
SHELL := /bin/bash

.PHONY: build test push clean

default: build test

build:
	docker build --build-arg CHEFDK_VERSION=$(VERSION) -t $(NAME):$(VERSION) .

test:
	docker run --rm -ti $(NAME):$(VERSION) chef -v

push:
	docker tag $(NAME):$(VERSION) $(REPO)/$(NS)/$(NAME):$(VERSION)
	docker push $(REPO)/$(NS)/$(NAME):$(VERSION)

clean:
	-docker rmi $(REPO)/$(NS)/$(NAME):$(VERSION)
	-docker rmi $(NAME):$(VERSION)
