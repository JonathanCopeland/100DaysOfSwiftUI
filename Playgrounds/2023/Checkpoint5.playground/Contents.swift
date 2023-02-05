import Cocoa

// Instructions
    // Filter out any numbers that are even
    // Sort the array in ascending order
    // Map them to strings in the format “7 is a lucky number”
    // Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let filterArray = luckyNumbers.filter {!$0.isMultiple(of: 2)}
print(filterArray)

print()

let sortArray = filterArray.sorted()
print(sortArray)

print()

let mapArray = sortArray.map {
    var x = "\($0) is a lucky number"
    return x
}
print(mapArray)

print()

for printArray in mapArray {
    print("\(printArray)")
}
