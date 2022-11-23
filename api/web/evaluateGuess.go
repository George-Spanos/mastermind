package web

import (
	"fmt"
	"net/http"

	"github.com/George-Spanos/mastermind/core"
	"github.com/gin-gonic/gin"
)

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
