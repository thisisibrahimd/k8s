## Generate a library from its config.json.
## Optionally restrict to one or more versions by passing VERSIONS="<v1> <v2> ...".
.PHONY: libs/*
libs/*:
	./k8s-gen generate k8s --config $(shell realpath $@)/config.json $(VERSIONS)

.PHONY: update-golden-test-data
update-golden-test-data:
	cd pkg/compiler/jsonschemacompiler && go test -update

.PHONY: test
test:
	go test ./...
