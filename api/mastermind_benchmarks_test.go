package main

import "testing"

func BenchmarkCreateColors(b *testing.B) {
	for i := 0; i < b.N; i++ {
		createColors(10)
	}
}
func BenchmarkCreateColorsInt(b *testing.B) {
	for i := 0; i < b.N; i++ {
		createColorsInt(10)
	}
}
func BenchmarkGenerateCode(b *testing.B) {
	for i := 0; i < b.N; i++ {
		generateCode(createColors(5), 5)
	}
}
func BenchmarkGenerateCodeInt(b *testing.B) {
	for i := 0; i < b.N; i++ {
		generateCodeInt(createColorsInt(5), 5)
	}
}
func BenchmarkEvaluageGuess(b *testing.B) {
	for i := 0; i < b.N; i++ {
		evaluateGuess([]uint8{1, 2, 3, 4, 5}, []uint8{3, 4, 5, 2, 1})
	}
}
func BenchmarkEvaluageGuessInt(b *testing.B) {
	for i := 0; i < b.N; i++ {
		evaluateGuessInt([]int{1, 2, 3, 4, 5}, []int{3, 4, 5, 2, 1})
	}
}
