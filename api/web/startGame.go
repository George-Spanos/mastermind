package web

import (
	"net/http"

	"github.com/George-Spanos/mastermind/core"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func startGame(ctx *gin.Context) {
	colors := core.CreateColors(8)
	code := core.GenerateCode(colors, 4)
	gameUuid := uuid.New()
	activeGames[gameUuid.String()] = &Game{guessIndex: 0, Uuid: gameUuid, Code: code}
	ctx.JSON(http.StatusCreated, gin.H{"gameId": gameUuid.String()})
}
