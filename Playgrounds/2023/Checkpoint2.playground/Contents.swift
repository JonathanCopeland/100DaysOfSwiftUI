import Cocoa

// This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.


var names: Set<String> = Set([])

names.insert("Jonathan")
names.insert("Bianca")
names.insert("Clove")

print(names.count)
//print("Hello " + \(names[0]))
print(names.contains("Jonathan"))
