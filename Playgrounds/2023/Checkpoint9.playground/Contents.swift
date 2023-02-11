import Cocoa

// write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

var testArray: [Int]? = nil
testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func myFunction(myVar: [Int]?) -> Int {myVar?.randomElement() ?? Int.random(in: 1..<100)}

print(myFunction(myVar: testArray))

var number: Int? = nil
