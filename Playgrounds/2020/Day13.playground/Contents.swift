import UIKit

var x : Int
x = 5
print(x)

var y = 6
print(y)

// don't use Floats

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

// Strings

var name = "Jonathan"
print("Hello, \(name)")
print("Hello, " + name)
print("Your name is \(name.count) long")

// Arrays

var devices : [String] = ["MacBook Pro 16", "iPhone XR", "AirPods Pro", "Magic Keyboard", "Magic Mouse"]

print("I own the following Apple products:")
for device in devices {
    print(device)
}

print("My most recent purchase is \(devices[2])")

var emptyArray : [String] = []
emptyArray.append("First")
print(emptyArray[0])

var toBuy : [String] = ["iPad Pro", "Apple Pencil 2"]

var dream = devices + toBuy

// Dictionaries
// these basically allow us to be more specific is how we call items in an array

var myDetails = ["name": "Jonathan", "middleName": "Michael", "surname": "Copeland"]

myDetails["name"]

// Conditionals

var person : String
var type = "Interesting"

if type == "Interesting" {
    person = "friends"
    print("Let's be \(person)!")
}
else {
    person = "Meh"
    print("\(person)")
}

// Loops
var str = "Fakers gonna "

for _ in 1...5 {
    str += "fake, "
}

print(str)

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}

// Switch

let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}























































