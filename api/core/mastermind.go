// Core logic of solving the mastermind problem with go.
package core

import (
	"math/rand"
	"time"

	"github.com/George-Spanos/mastermind/api/tools"
)

// Creates a list of uint8 that represent the available colors of a single game.
func CreateColors(length uint8) []uint8 {
	s := make([]uint8, length)
	for i := range s {
		s[i] = uint8(i) + 1
	}
	return s
}

// Given a list of colors and a length, generates the secret code
func GenerateCode(colors []uint8, codeLength uint8) []uint8 {
	code := make([]uint8, codeLength)
	rand.Seed(time.Now().Unix())
	for i := range code {
		randomIndex := rand.Intn(len(colors))
		code[i] = colors[randomIndex]
	}
	return code
}

// Given a guess []uint8 and a code, it returns (correntSpots, incorrectSpots) as a pair of uints for the given guess.
func EvaluateGuess(guess []uint8, code []uint8) (uint8, uint8) {
	// safely copy values to not mess underlying arrays
	guessCopy := make([]uint8, 4)
	codeCopy := make([]uint8, 4)
	copy(guessCopy, guess)
	copy(codeCopy, code)
	return evaluateGuess(guessCopy, codeCopy)
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

// func EvaluateGuessInt(guess []int, code []int) (int, int) {
// 	// safely copy values to not mess underlying arrays
// 	return evaluateGuessInt(append(make([]int, 0), guess...), append(make([]int, 0), code...))
// }

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

// returns true if gameStatus == 1 or gameStatus == 0
func GameIsFinished(gameStatus uint8) bool {
	return gameStatus == 0 || gameStatus == 1
}

// Int methods are present only for benchmarking purposes

//	func CreateColorsInt(length int) []int {
//		s := make([]int, length)
//		for i := range s {
//			s[i] = int(i)
//		}
//		return s
//	}
// func GenerateCodeInt(colors []int, codeLength int) []int {
// 	code := make([]int, codeLength)
// 	rand.Seed(time.Now().Unix())
// 	for i := range code {
// 		randomIndex := rand.Intn(len(colors))
// 		code[i] = colors[randomIndex]
// 	}
// 	return code
// }

// func evaluateGuessInt(guess []int, code []int) (int, int) {
// 	var correctSpots int
// 	var incorrectSpots int

// 	index := 0
// 	for index < len(code) {
// 		if guess[index] == code[index] {
// 			correctSpots++
// 			guess = append(guess[:index], guess[index+1:]...)
// 			code = append(code[:index], code[index+1:]...)
// 		} else {
// 			index++
// 		}
// 	}
// 	for len(code) > 0 {
// 		if i, isInArray := tools.SliceContains(guess, code[0]); isInArray {
// 			incorrectSpots++
// 			guess = append(guess[:i], guess[i+1:]...)
// 		}
// 		code = code[1:]
// 	}
// 	return correctSpots, incorrectSpots
// }
