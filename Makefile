IMG ?= public.ecr.aws/b4u2x4n7/cyclonus:latest

test:
	go test ./pkg/...

fmt:
	go fmt ./cmd/... ./pkg/...

vet:
	go vet ./cmd/... ./pkg/...

cyclonus:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOPROXY=direct go build -o ./cmd/cyclonus/cyclonus ./cmd/cyclonus
	docker build -t ${IMG} ./cmd/cyclonus
	docker push ${IMG}
