.PHONY: test build_web build_console run_web

all: clean test build_web

clean:
	rm -rf build/
test:
	go test ./...

bench:
	go test ./... -bench=. -benchmem

launch: all
	go run ./cmd/web
run_web:
	go run ./cmd/web

run_console:
	go run ./cmd/console

build_web: 
	go build -o build/web ./cmd/web

build_console:
	go build -o build/console ./cmd/console
