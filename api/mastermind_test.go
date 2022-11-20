package main

import "testing"

func TestEvaluateGuess1(t *testing.T) {
	code := []uint8{1, 3, 3, 4}
	guess := []uint8{1, 4, 4, 3}
	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != 1 {
		t.Error("Expexted 1 correct spot, got", correctSpots)
	}
	if incorrectSpots != 2 {
		t.Error("Expexted 2 incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess2(t *testing.T) {
	code := []uint8{1, 2, 3, 4}
	guess := []uint8{1, 2, 3, 4}
	expectedCorrectSpots := 4
	expectedIncorrectSpots := 0

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess3(t *testing.T) {
	code := []uint8{1, 1, 2, 2}
	guess := []uint8{1, 2, 7, 8}
	expectedCorrectSpots := 1
	expectedIncorrectSpots := 1

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess4(t *testing.T) {
	code := []uint8{1, 1, 0, 0}
	guess := []uint8{2, 2, 1, 1}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 2

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess5(t *testing.T) {
	code := []uint8{7, 7, 7, 7}
	guess := []uint8{1, 4, 7, 2}
	expectedCorrectSpots := 1
	expectedIncorrectSpots := 0

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess6(t *testing.T) {
	code := []uint8{2, 2, 2, 2}
	guess := []uint8{2, 2, 2, 2}
	expectedCorrectSpots := 4
	expectedIncorrectSpots := 0

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess7(t *testing.T) {
	code := []uint8{1, 2, 3, 4}
	guess := []uint8{5, 6, 7, 8}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 0

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
func TestEvaluateGuess8(t *testing.T) {
	code := []uint8{1, 2, 3, 4}
	guess := []uint8{5, 6, 1, 2}
	expectedCorrectSpots := 0
	expectedIncorrectSpots := 2

	correctSpots, incorrectSpots := evaluateGuess(guess, code)
	if correctSpots != uint8(expectedCorrectSpots) {
		t.Error("Expexted", expectedCorrectSpots, "correct spot, got", correctSpots)
	}
	if incorrectSpots != uint8(expectedIncorrectSpots) {
		t.Error("Expexted", expectedIncorrectSpots, "incorrect spot, got", incorrectSpots)
	}
}
