original: [github.com/breez/lspd/rpc](https://github.com/breez/lspd/tree/ad0595f3f9dc417dd2371215ec9c52ea2c66a801/rpc)

# NayutaHub2LspdProto

NayutaHub2Lpsd proto file definition.

## update *.go and API.md

[Compiling Your Protocol Buffers](https://protobuf.dev/getting-started/gotutorial/#compiling-protocol-buffers)

### install requirements

https://grpc.io/docs/languages/go/quickstart/

#### protoc

Download, unzip and place your PATH.

[protobuf v3.19.1](https://github.com/protocolbuffers/protobuf/releases/tag/v3.19.1)

#### protoc-gen-go

```bash
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.27.1
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
```

#### check

```bash
protoc --version
protoc-gen-go --version
protoc-gen-go-grpc --version
```

Expected results

```bash
libprotoc 3.19.1
protoc-gen-go v1.27.1
protoc-gen-go-grpc 1.1.0
```

### update

```bash
./genproto.sh
```
