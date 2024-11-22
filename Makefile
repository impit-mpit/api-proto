API_PROTO_FILES=$(shell find src/proto -name *.proto)
.PHONY: generate
generate:
	protoc --proto_path=./src/proto \
		   --proto_path=./src/third_party \
 	       --go_out=paths=source_relative:./gen/go \
 	       --go-http_out=paths=source_relative:./gen/go \
 	       --go-grpc_out=paths=source_relative:./gen/go \
	       --openapi_out=fq_schema_naming=true,default_response=false:. \
	       $(API_PROTO_FILES)

SHELL := /bin/bash
PROTO_DIR := src/proto
GO_OUT_DIR := gen/go
GOPATH := $(shell go env GOPATH)

.PHONY: proto
proto:
	mkdir -p $(GO_OUT_DIR)
	PATH=$(GOPATH)/bin:$$PATH find $(PROTO_DIR) -name "*.proto" -exec protoc \
    		--proto_path=$(PROTO_DIR) \
    		--go_out=$(GO_OUT_DIR) --go_opt=paths=source_relative \
    		--go-grpc_out=$(GO_OUT_DIR) --go-grpc_opt=paths=source_relative \
    		--experimental_allow_proto3_optional \
    		{} \;