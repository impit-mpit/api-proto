API_PROTO_FILES=$(shell find proto -name *.proto)
.PHONY: generate
generate:
	protoc --proto_path=./third_party \
		   --proto_path=./proto \
 	       --go_out=paths=source_relative:./gen/go \
 	       --go-http_out=paths=source_relative:./gen/go \
 	       --go-grpc_out=paths=source_relative:./gen/go \
	       --openapi_out=fq_schema_naming=true,default_response=false:. \
	       $(API_PROTO_FILES)