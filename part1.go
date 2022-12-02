// You can edit this code!
// Click here and start typing.
package main

import (
	"fmt"
	"strconv"
	"io/ioutil"
	"strings"
)

func main() {
	content, err := ioutil.ReadFile("./input")
	check(err)

	calories := strings.Split(string(content), "\n")
	elvenCalories := make([]int, 1)

	i := 0
	max := 0
	for _, calorieCount := range calories {
		if calorieCount == "" {
			elvenCalories = append(elvenCalories, 0)
			i += 1
			continue
		}

		toInt, err := strconv.Atoi(calorieCount)
		if err != nil {
			fmt.Println(err)
			break
		}

		elvenCalories[i] += toInt

		if elvenCalories[i] > max {
			max = elvenCalories[i]
		}
	}

	fmt.Println("the max")
	fmt.Println(max)
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}
