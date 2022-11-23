package core_test

import (
	"testing"

	core "github.com/George-Spanos/mastermind/core"
)

func BenchmarkCreateColors(b *testing.B) {
	for i := 0; i < b.N; i++ {
		core.CreateColors(10)
	}
}
func BenchmarkGenerateCode(b *testing.B) {
	for i := 0; i < b.N; i++ {
		core.GenerateCode(core.CreateColors(5), 5)
	}
}
func BenchmarkEvaluageGuess(b *testing.B) {
	for i := 0; i < b.N; i++ {
		core.EvaluateGuess([]uint8{1, 2, 3, 4, 5}, []uint8{3, 4, 5, 2, 1})
	}
}
