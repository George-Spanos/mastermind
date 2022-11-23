package core

import (
	"math/rand"
	"time"

	"github.com/George-Spanos/mastermind/tools"
)

func CreateColors(length uint8) []uint8 {
	s := make([]uint8, length)
	for i := range s {
		s[i] = uint8(i) + 1
	}
	return s
}

func GenerateCode(colors []uint8, codeLength uint8) []uint8 {
	code := make([]uint8, codeLength)
	rand.Seed(time.Now().Unix())
	for i := range code {
		randomIndex := rand.Intn(len(colors))
		code[i] = colors[randomIndex]
	}
	return code
}

func EvaluateGuess(guess []uint8, code []uint8) (uint8, uint8) {
	var correctSpots uint8
	var incorrectSpots uint8
	index := 0
	for index < len(code) {
		if guess[index] == code[index] {
			correctSpots++
			guess = append(guess[:index], guess[index+1:]...)
			code = append(code[:index], code[index+1:]...)
		} else {
			index++
		}
	}
	for len(code) > 0 {
		if i, isInArray := tools.SliceContains(guess, code[0]); isInArray {
			incorrectSpots++
			guess = append(guess[:i], guess[i+1:]...)
		}
		code = code[1:]
	}
	return correctSpots, incorrectSpots
}

// Returns 0 if game is over and player lost.
//
// Returns 1 if game is over and player won.
//
// Returns 2 if game is not over.
func DetermineGameState(correntSpots uint8, codeLength uint8, guessLimit uint8, guessIndex uint8) uint8 {
	if correntSpots == codeLength {
		return 1
	}
	if guessIndex == guessLimit {
		return 0
	}
	return 2
}
func GameIsFinished(gameStatus uint8) bool {
	return gameStatus == 0 || gameStatus == 1
}
