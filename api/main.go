package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"

	core "github.com/George-Spanos/mastermind-api/core"
)

func main() {
	fmt.Println("Hello from Golang Console Mastermind!")
	colors := core.CreateColors(8)
	guessLimit := 12
	guessIndex := 0
	codeLength := 4
	code := core.GenerateCode(colors, uint8(codeLength))
	fmt.Println("Secret code is generated. It has a length of", codeLength, ". You have", guessLimit, "more guesses.")
	fmt.Println("Type your guess and press enter. Each color should be an number from 0-7. Seperate each color/number by a coma (,).")
	var gameState uint8 = 2
	for gameState == 2 {
		input, err := bufio.NewReader(os.Stdin).ReadString('\n')
		if err != nil {
			fmt.Println("An error occured while reading input. Please try again", err)
			os.Exit(1)
		}
		input = strings.TrimSpace(input)
		guess, err := convertInputToGuess(input, codeLength)
		for err != nil {
			fmt.Println(err)
			input, err = bufio.NewReader(os.Stdin).ReadString('\n')
			if err != nil {
				fmt.Println("An error occured while reading input. Please try again", err)
				os.Exit(1)
			}
			guess, err = convertInputToGuess(input, codeLength)
		}
		correntSpots, incorrectSpots := core.EvaluateGuess(append(make([]uint8, 0), guess...), append(make([]uint8, 0), code...))

		guessIndex++
		gameState = core.DetermineGameState(correntSpots, uint8(codeLength), uint8(guessLimit), uint8(guessIndex))
		if gameState == 2 {
			fmt.Println("Corrent Spots", correntSpots)
			fmt.Println("Incorrent Spots", incorrectSpots)
			fmt.Println("You have", guessLimit-guessIndex, "more guesses")
		}
	}
	if gameState == 0 {
		fmt.Println("You lost")
		fmt.Println("Secret code was", code)
		os.Exit(1)
	}
	if gameState == 1 {
		fmt.Println("You found the answer! Code was", code)
		os.Exit(0)
	}
}
func convertInputToGuess(input string, length int) ([]uint8, error) {
	guess := make([]uint8, length)
	strGuess := strings.Split(input, ",")
	if len(strGuess) != length {
		return nil, fmt.Errorf("length of code and answer are not equal")
	}
	for i := range strGuess {
		n, err := strconv.Atoi(strGuess[i])
		if err != nil {
			return nil, fmt.Errorf("failed to parse input")
		}
		guess[i] = uint8(n)
	}
	return guess, nil
}
