package main

import (
	"fmt"
	"math/rand"
	"testing"
)

func TestRandomNumber(t *testing.T) {
	exp1 := RandomNumber()
	exp2 := RandomNumber()

	tfp := rand.Float64()

	if exp1 == exp2 {
		t.Errorf("Random number should be different")
	}

	if tfp > 0.60 {
		fmt.Println(tfp)
		t.Errorf("Failing test randomly")
	}
}
