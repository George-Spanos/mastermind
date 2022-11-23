package main

import (
	"log"

	"github.com/George-Spanos/mastermind/web"
)

func main() {
	err := web.StartServer()
	if err != nil {
		log.Fatal(err)
	}
}
