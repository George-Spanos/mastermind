package web

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

const guessLimit uint8 = 8

type Game struct {
	Uuid       uuid.UUID
	Code       []uint8
	guessIndex uint8
}
type EvaluateGuessDto struct {
	GameUuid string  `json:"uuid"`
	Guess    []uint8 `json:"guess"`
}

var activeGames = map[string]*Game{}

func registerRoutes() *gin.Engine {
	router := gin.Default()
	router.Use(cors.Default())
	router.POST("/startGame", startGame)
	router.POST("/evaluateGuess", evaluateGuess)
	return router
}
func StartServer() error {
	router := registerRoutes()
	return router.Run()
}
