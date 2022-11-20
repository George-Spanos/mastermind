package main

import (
	"math/rand"
	"time"

	"github.com/George-Spanos/mastermind-api/tools"
)

func createColors(length uint8) []uint8 {
	s := make([]uint8, length)
	for i := range s {
		s[i] = uint8(i)
	}
	return s
}

func generateCode(colors []uint8, codeLength uint8) []uint8 {
	code := make([]uint8, codeLength)
	rand.Seed(time.Now().Unix())
	for i := range code {
		randomIndex := rand.Intn(len(colors))
		code[i] = colors[randomIndex]
	}
	return code
}

func evaluateGuess(guess []uint8, code []uint8) (uint8, uint8) {
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
func determineGameState(correntPins uint8, codeLength uint8, guessLimit uint8, guessIndex uint8) uint8 {
	if correntPins == codeLength {
		return 1
	}
	if guessIndex == guessLimit {
		return 0
	}
	return 2
}

// Int methods are present only for benchmarking purposes

func createColorsInt(length int) []int {
	s := make([]int, length)
	for i := range s {
		s[i] = int(i)
	}
	return s
}
func generateCodeInt(colors []int, codeLength int) []int {
	code := make([]int, codeLength)
	rand.Seed(time.Now().Unix())
	for i := range code {
		randomIndex := rand.Intn(len(colors))
		code[i] = colors[randomIndex]
	}
	return code
}
func evaluateGuessInt(guess []int, code []int) (int, int) {
	var correctSpots int
	var incorrectSpots int
	for i := range guess {
		if guess[i] == code[i] {
			correctSpots++
			guess = append(guess[:i], guess[i:]...)
			code = append(code[:i], code[i:]...)
		}
	}
	for len(code) > 0 {
		if i, isInArray := tools.SliceContains(guess, code[0]); isInArray {
			incorrectSpots++
			guess = append(guess[:i], guess[i:]...)
		}
		code = code[1:]
	}
	return correctSpots, incorrectSpots
}
