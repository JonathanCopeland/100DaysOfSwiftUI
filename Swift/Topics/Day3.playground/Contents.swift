import Cocoa

var greeting = "Hello, playground"

// Arrays
var korn = ["James 'Munky' Shaffer" , "Brian 'Head' Welch", "Jonathan Davis", "Reginal 'Fieldy' Arvizu", "David Siveria"]

korn.remove(at: 4)

korn.append("Ray Luzier")

for bandMember in korn {
    print(bandMember)
}


// Setting array types
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// Arrays shorthand
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

// Even more shorthand

var macs = ["Mac Mini"]
macs.append("MacBook Pro")
macs.append("MacBook Air")
macs.append("Mac Pro")
macs.append("iMac")
macs.append("Mac Studio")


print(macs[0])
print(macs.count)
print(macs.sorted())


// Dictionaries

var employee = ["Taylor Swift", "Singer", "Nashville"]

print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")
// This relies on us rememberding  which array locations contain which data

print("Name: \(employee[0])")
employee.remove(at: 1)
print("Job title: \(employee[1])")
// print("Location: \(employee[2])")
// This will cause our code to fail

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]


print(employee2["name", default: "Unknown"])
// This enables us to print the dictionary, and have a back-up post if the data is missing

var devices = [String: Int]()
devices["iPhone 14 Pro"] = 2022
devices["Mac Mini"] = 2023
devices["iPad Pro"] = 2021
devices["Airpods Pro"] = 2020

// Sets
// you can’t have duplicates and you lose the order of your items

var people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson", "Samuel L Jackson"])
// Sets remove duplicates, and don't store them in order

print(people)

people.insert("Harvey Dent")

print(people)

// sets are super optimised at searching for data in large data-sets


// Enums
// Enums are essentially like making your own booleans - we set the predefined values up-front

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = .tuesday
day = .friday
// After assigning once, then we can use short hand

// There are 4 data types we can use in Swift Array, Sets, Dictionaries and Enums
