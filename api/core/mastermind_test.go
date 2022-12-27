package core_test

import (
	"testing"

	core "github.com/George-Spanos/mastermind/api/core"
)

func TestEvaluateGuess2(t *testing.T) {
	code := []uint8{1, 2, 3, 4}
	guess := []uint8{1, 2, 3, 4}
	expectedCorrectSpots := 4
	expectedIncorrectSpots := 0
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestEvaluateGuess3(t *testing.T) {
	code := []uint8{1, 1, 2, 2}
	guess := []uint8{1, 2, 7, 8}
	expectedCorrectSpots := 1
	expectedIncorrectSpots := 1
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestEvaluateGuess4(t *testing.T) {
	code := []uint8{1, 1, 0, 0}
	guess := []uint8{2, 2, 1, 1}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 2
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestEvaluateGuess5(t *testing.T) {
	code := []uint8{7, 7, 7, 7}
	guess := []uint8{1, 4, 7, 2}
	expectedCorrectSpots := 1
	expectedIncorrectSpots := 0
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestEvaluateGuess6(t *testing.T) {
	code := []uint8{2, 2, 2, 2}
	guess := []uint8{2, 2, 2, 2}
	expectedCorrectSpots := 4
	expectedIncorrectSpots := 0
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestEvaluateGuess7(t *testing.T) {
	code := []uint8{1, 2, 3, 4}
	guess := []uint8{5, 6, 7, 8}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 0
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestEvaluateGuess8(t *testing.T) {
	code := []uint8{1, 2, 3, 4}
	guess := []uint8{5, 6, 1, 2}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 2
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))

}
func TestConsecutiveGuesses(t *testing.T) {
	code := []uint8{1, 7, 3, 3}
	guess := []uint8{5, 6, 1, 2}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 1
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	t.Log("1st Guess")
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))
	guess = []uint8{7, 1, 1, 3}
	expectedCorrectSpots = 1
	expectedIncorrectSpots = 2
	correctSpots, incorrectSpots = core.EvaluateGuess(guess, code)
	t.Log("2nd Guess")
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))
	guess = []uint8{1, 7, 4, 3}
	expectedCorrectSpots = 3
	expectedIncorrectSpots = 0
	correctSpots, incorrectSpots = core.EvaluateGuess(guess, code)
	t.Log("3rd Guess")
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))
	guess = []uint8{7, 7, 3, 3}
	expectedCorrectSpots = 3
	expectedIncorrectSpots = 0
	correctSpots, incorrectSpots = core.EvaluateGuess(guess, code)
	t.Log("4th Guess")
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))
	guess = []uint8{3, 3, 3, 3}
	expectedCorrectSpots = 2
	expectedIncorrectSpots = 0
	correctSpots, incorrectSpots = core.EvaluateGuess(guess, code)
	t.Log("5th Guess")
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))
	guess = []uint8{1, 7, 3, 3}
	expectedCorrectSpots = 4
	expectedIncorrectSpots = 0
	correctSpots, incorrectSpots = core.EvaluateGuess(guess, code)
	t.Log("6th Guess")
	checkCorrectSpots(t, correctSpots, incorrectSpots, uint8(expectedCorrectSpots), uint8(expectedIncorrectSpots))
}

func checkCorrectSpots(t *testing.T, correctSpots, incorrectSpots, expectedCorrectSpots, expectedIncorrectSpots uint8) {
	if correctSpots != uint8((expectedCorrectSpots)) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
