package tools

func SliceContains[T comparable](arr []T, el T) (int, bool) {
	for i, s := range arr {
		if el == s {
			return i, true
		}
	}
	return 0, false
}
