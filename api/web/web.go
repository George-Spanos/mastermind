package web

import (
	"fmt"
	"net/http"

	"github.com/George-Spanos/mastermind-api/core"
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
	router.POST("/startGame", startGame)
	router.POST("/evaluateGuess", evaluateGuess)
	return router
}
func StartServer() error {
	router := registerRoutes()
	return router.Run()
}
func startGame(ctx *gin.Context) {
	colors := core.CreateColors(8)
	code := core.GenerateCode(colors, 4)
	gameUuid := uuid.New()
	activeGames[gameUuid.String()] = &Game{guessIndex: 0, Uuid: gameUuid, Code: code}
	ctx.JSON(http.StatusCreated, gin.H{"gameId": gameUuid.String()})
}
func evaluateGuess(ctx *gin.Context) {
	var dto EvaluateGuessDto
	err := ctx.BindJSON(&dto)
	fmt.Println(dto)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, err.Error())
		return
	}
	game, exists := activeGames[dto.GameUuid]
	if !exists {
		ctx.Status(http.StatusNotFound)
		return
	}
	correctSpots, incorrectSpots := core.EvaluateGuess(dto.Guess, game.Code)
	game.guessIndex++
	gameStatus := core.DetermineGameState(correctSpots, uint8(len(game.Code)), guessLimit, game.guessIndex)
	fmt.Println(game)
	if core.GameIsFinished(gameStatus) {
		delete(activeGames, dto.GameUuid)
	}
	ctx.JSON(http.StatusOK, gin.H{
		"correctSpots":   correctSpots,
		"incorrectSpots": incorrectSpots,
		"gameStatus":     gameStatus,
	})
}
