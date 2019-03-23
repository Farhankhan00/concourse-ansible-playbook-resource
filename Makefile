.PHONY: help

.DEFAULT_GOAL := help

REPOSITORY := 'fkhan2/concourse-ansible-resource'
SHELL := /bin/bash

REPO   := ${ORG}/${NAME}
TAG    := $(shell git log -1 --pretty=format:"%h")
IMG    := ${REPO}:${TAG}
LATEST := ${REPO}:latest

build: ## build the Docker image for this app
	docker build --tag $(REPOSITORY):$(TAG) --tag $(REPOSITORY):latest --rm=false .

push: ## push the latest Docker image to DockerHub
	docker push $(REPOSITORY)

deploy: build push