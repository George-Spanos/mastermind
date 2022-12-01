package web

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

type Game struct {
	Uuid       uuid.UUID
	Code       []uint8
	guessIndex uint8
}

var activeGames = map[string]*Game{}

func registerRoutes() *gin.Engine {
	router := gin.Default()
	router.Use(cors.Default())
	router.POST("/startGame", startGame)
	router.POST("/evaluateGuess", evaluateGuess)
	router.StaticFile("/privacy", "privacy.html")
	return router
}
func StartServer() error {
	router := registerRoutes()
	return router.Run()
}
