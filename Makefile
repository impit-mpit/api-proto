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