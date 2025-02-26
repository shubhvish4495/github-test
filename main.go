package main

import (
	"fmt"
	"math/rand"
)

func main() {
	r := RandomNumber()
	fmt.Println(r)
}

func RandomNumber() int {
	return rand.Int()
}
