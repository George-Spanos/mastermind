package tools_test

import (
	"fmt"
	"testing"

	"github.com/George-Spanos/mastermind/api/tools"
)

func TestSliceContains(t *testing.T) {
	index, found := tools.SliceContains([]int{1, 2, 3, 4}, 8)
	if found || index != 0 {
		t.Error("Expeted 8 to not be inside of given array")
	}
	index, found = tools.SliceContains([]int{1, 2, 3, 4}, 4)
	if index != 4 || found == false {
		t.Error("Expeted 4 to be inside of given array")
	}
}
func ExampleSliceContains() {
	index, found := tools.SliceContains([]int{1, 2, 3, 4}, 8)
	fmt.Println(found, index)
	// Output:
	// false 0
}
