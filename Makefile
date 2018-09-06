
BUILD_ID ?= "latest"
REGISTRY ?= ""


.PHONY: build_mirror
build_mirror:
	docker build -t ${REGISTRY}docker-alpine-mirror:${BUILD_ID} .
	@echo Image tag: ${REGISTRY}docker-alpine-mirror:${BUILD_ID}

.PHONY: build_rsync
build_rsync:
	docker build -t ${REGISTRY}docker-alpine-rsync:${BUILD_ID} rsync/
	@echo Image tag: ${REGISTRY}docker-alpine-rsync:${BUILD_ID}


build: build_mirror build_rsync
