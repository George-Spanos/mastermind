package main

import (
	"log"

	"github.com/George-Spanos/mastermind-api/web"
)

func main() {
	err := web.StartServer()
	if err != nil {
		log.Fatal(err)
	}
}
