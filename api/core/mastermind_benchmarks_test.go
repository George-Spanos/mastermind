package core_test

import (
	"testing"

	core "github.com/George-Spanos/mastermind/api/core"
)

func BenchmarkCreateColors(b *testing.B) {
	for i := 0; i < b.N; i++ {
		core.CreateColors(10)
	}
}

//	func BenchmarkCreateColorsInt(b *testing.B) {
//		for i := 0; i < b.N; i++ {
//			core.CreateColorsInt(10)
//		}
//	}
func BenchmarkGenerateCode(b *testing.B) {
	for i := 0; i < b.N; i++ {
		core.GenerateCode(core.CreateColors(5), 5)
	}
}

//	func BenchmarkGenerateCodeInt(b *testing.B) {
//		for i := 0; i < b.N; i++ {
//			core.GenerateCodeInt(core.CreateColorsInt(5), 5)
//		}
//	}
func BenchmarkEvaluageGuess(b *testing.B) {
	for i := 0; i < b.N; i++ {
		core.EvaluateGuess([]uint8{1, 2, 3, 4, 5}, []uint8{3, 4, 5, 2, 1})
	}
}

// func BenchmarkEvaluageGuessInt(b *testing.B) {
// 	for i := 0; i < b.N; i++ {
// 		core.EvaluateGuessInt([]int{1, 2, 3, 4, 5}, []int{3, 4, 5, 2, 1})
// 	}
// }
