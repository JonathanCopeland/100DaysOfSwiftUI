import Cocoa

// If else

// Create the username variable
var username = "jmcopel"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// Multiple checks

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

// enums are used go define a range of acceptable outputs

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// Switch statements

enum weather {
    case sun, rain, snow, wind, unknown
}

var forecast = weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary conditional operator

let age = 18

var canVote = age >= 18 ? "Yes" : "No"
print(canVote)

let names = ["Jonathan", "Bianca", "Clove"]
let crewCount = names.isEmpty ? "No One" : "\(names.count) people"
print(crewCount)


enum Theme {
    case light, dark
}

let activeTheme = Theme.dark
let background = activeTheme == .dark ? "black" : "white"

print(background)
