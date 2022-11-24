.PHONY: test build_web build_console run_web


clean:
	rm -rf build/
test:
	go test ./...

bench:
	go test ./... -bench=. -benchmem

run_web:
	go run ./cmd/web

run_console:
	go run ./cmd/console

build_web: clean
	go build ./cmd/web -o build/web

build_console: clean
	go build ./cmd/console -o build/console