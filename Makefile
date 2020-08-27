PJTDIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: build
build:
	@ docker-compose -f docker-compose.test.yml build

.PHONY: ansible
ansible:
	@ docker-compose -f docker-compose.test.yml run --rm ansible

.PHONY: goss
goss:
	@ docker-compose -f docker-compose.test.yml run --rm sut dgoss edit -it -u root ansible

.PHONY: test
test:
	@ docker-compose -f docker-compose.test.yml run --rm sut

.PHONY: clean
clean:
	@ docker-compose -f docker-compose.test.yml down
