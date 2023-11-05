DOCKER_RUN ?= docker run -v ./:/work -w /work -v /var/run/docker.sock:/var/run/docker.sock:ro -e PYTHONDONTWRITEBYTECODE=1

.PHONY: build
build:
	docker build -t molecule .

.PHONY: run-in-molecule
run-in-molecule: build
	$(DOCKER_RUN) -it -u "$(shell id -u):$(shell id -g)" molecule

.PHONY: test
test: build
	$(DOCKER_RUN) molecule molecule test
