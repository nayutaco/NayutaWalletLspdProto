#!/bin/bash
#protoc -I . lspd.proto --go_out=plugins=grpc:.

# https://grpc.io/docs/languages/go/quickstart/#regenerate-grpc-code
protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative lspd.proto

docker run --rm -v $(pwd):/out -v $(pwd):/protos pseudomuto/protoc-gen-doc --doc_opt=markdown,API.md
