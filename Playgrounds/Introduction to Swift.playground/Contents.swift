import Cocoa

var name = "Bianca"
name = "Jonathan"

let surname = "Copeland"

var greeting = "Hello,"

print(greeting + " " + name + " " + surname)
print("Greetings \(name)")

let dog = "Clove"

print(dog)

let statement = "She's a \"baby\""

let message = """
Hello
This
Is
A Test
"""

print(message.count)

print(message.uppercased())

print(message.hasPrefix("Hello"))
print(message.hasSuffix("A Test"))

let x = 10_000
var divider = x / 2

print(x)
print(divider)

divider *= 2

print(divider)

// Checkpoint 1
// Convert Farenheit to Celcius

let farenheit = 66.4
let celcius = (((farenheit - 32) * 5) / 9)

print(celcius)



