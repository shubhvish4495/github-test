package main

import (
	"fmt"
	"math/rand"
)

func main() {
	r := RandomNumber()
	fmt.Println("random number is here", r)
}

func RandomNumber() int {
	return rand.Int()
}
