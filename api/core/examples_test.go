package core_test

import (
	"fmt"

	core "github.com/George-Spanos/mastermind/api/core"
)

func ExampleCreateColors() {
	colors := core.CreateColors(10)
	fmt.Println(colors)
	// Output:
	// [1 2 3 4 5 6 7 8 9 10]
}
func ExampleGenerateCode() {
	colors := core.CreateColors(10)
	code := core.GenerateCode(colors, 4)
	fmt.Println(len(code))
	// Output:
	// 4
}
func ExampleEvaluateGuess() {
	code := []uint8{1, 3, 3, 4}
	guess := []uint8{1, 4, 4, 3}
	correctSpots, incorrectSpots := core.EvaluateGuess(guess, code)
	fmt.Println(correctSpots)
	fmt.Println(incorrectSpots)
	// Output:
	// 1
	// 2
}
func ExampleDetermineGameState() {
	state := core.DetermineGameState(5, 5, 8, 8)
	fmt.Println(state)
	// Output:
	// 1
}
