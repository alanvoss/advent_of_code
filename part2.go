// You can edit this code!
// Click here and start typing.
package main

import (
	"fmt"
	"strconv"
	"io/ioutil"
	"strings"
	"sort"
)

func main() {
	content, err := ioutil.ReadFile("./input")
	check(err)

	calories := strings.Split(string(content), "\n")
	elvenCalories := make([]int, 1)

	i := 0
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
	}

	sort.Sort(sort.Reverse(sort.IntSlice(elvenCalories)))
	topThree := elvenCalories[0:3]
	fmt.Println(elvenCalories)
	fmt.Println(topThree)
	topThreeSum := 0
	for _, calories := range topThree {
		topThreeSum += calories
	}

	fmt.Println("the sum")
	fmt.Println(topThreeSum)
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}
