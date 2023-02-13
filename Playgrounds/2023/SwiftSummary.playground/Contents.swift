import Cocoa

// This document is a summary of the key principles in Swift
// https://www.hackingwithswift.com/articles/242/learn-essential-swift-in-one-hour

// Variables, constants, strings, and numbers
let name = "Jonathan Copeland"
var job = "Designer"

var bio = """
Multiple
lines
String
"""

var randomNumber = Int.random(in: 1...100)

// Booleans
var cloveIsGood = true

// String interpolation
var message = "My name is \(name) and I work as a \(job)"

// Arrays
var family = ["Bianca", "Clove"]
family.append("Nutmeg?")
family.remove(at: 2)
print(family.count)
print(family.contains("Clove"))

// Dictionaries

let jobDetails = [
    "name" : "Designer",
    "company" : "Microsoft"
]

print(jobDetails["name", default: "Unknown"])

// Sets

var numbers = Set([1, 1, 3, 5, 7, 9])
print(numbers)
numbers.insert(10)
numbers.contains(3)

// Enums

enum Weekday {
    case monday, tuesday, wednesday
}

var day = Weekday.monday
day = .tuesday

// Type annotations
var score: Double = 0
var player: String = "Jonathan"
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: Array<String> = ["Minutes to Midnight", "Hybrid Theory"]
var bands: Dictionary<String, String> = ["band": "Linkin Park"]
var books: Set<String> = Set(["Zen and the Art of Motorcycle Maintenance", "Build"])


var albums2: [String] = ["Minutes to Midnight", "Hybrid Theory"]
var bands2: [String: String] = ["band": "Linkin Park"]

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light

// If

let age = 16

if age < 12 {
   print("You can't vote")
} else if age < 18 {
    print("You can vote soon")
} else {
    print("You can vote")
}

let temp = 26

if temp > 20 {
    print("Nice day!")
}

// Switch

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("Sunny")
case .rain:
    print("Rainy")
case .wind:
    print("Windy")
default:
    print("Not sure")
}

// Ternary

let age2 = 18
let canVote = age2 >= 18 ? "Yes" : "No"
print(canVote)

// Loops, summary,

let platforms = ["iOS", "macOS", "watchOS", "tvOS", "iPadOS"]

for os in platforms {
    print("Swift works on \(os)")
}

for i in 1...12 {
    print(i)
}

print("Hater's gonna...")
for _ in 1...5 {
    print("hate")
}

var count = 5

while count > 0 {
    print("\(count)...")
    count -= 1
}
print("Go!")


let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(file)")
}

// Functions

func myFunc(number: Int) {
    print(number)
}

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func myFunc2(i: Int) -> Int {
    5*i
}

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

let (firstName, _) = getUser()
print("Name: \(firstName)")

// Function parameters

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)
  


func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)


// Default values

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

greet("Tim", formal: true)
greet("Taylor")

// Throwing functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}


let string2 = "12345"

do {
    let result = try checkPassword(string2)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


// Closures


//let sayHello = {
//    print("Hi there!")
//}
//
//sayHello()


let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Jonathan")


// Passing functions into functions

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})


    //let onlyT = team.filter({ (name: String) -> Bool in
    //    name.hasPrefix("T")
    //})

    //let onlyT = team.filter({ name in
    //    name.hasPrefix("T")
    //})

    //let onlyT = team.filter { name in
    //    name.hasPrefix("T")
    //}

    //let onlyT = team.filter {
    //    $0.hasPrefix("T")
    //}


// Structs

struct Album {
    let title: String
    let artist: String
    var isReleased = true

    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
}

var red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()
red.removeFromSale()
red.printSummary()


// Computed properties

struct Employee {
    public let name: String
    private var vacationAllocated = 14
    private var vacationTaken = 0

    public var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
}

var emplyee1 = Employee(name: "Jonathan")
emplyee1.vacationRemaining

// Property observers

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3


// Access control

    // Use private for “don’t let anything outside the struct use this.”
    // Use private(set) for “anything outside the struct can read this, but don’t let them change it.”
    // Use fileprivate for “don’t let anything outside the current file use this.”
    // Use public for “let anyone, anywhere use this.”

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


// Static properties and methods,

struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}


// Classes, inheritance

class Employee2 {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee2 {
    func work() {
        print("I'm coding for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I spend \(hours) hours a day searching Stack Overflow.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()




// Inheritance

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}


// Protocols

protocol Vehicle2 {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}


struct Car2: Vehicle2 {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle2) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car2()
commute(distance: 100, using: car)


// Extensions

var quote = "   The truth is rarely pure and never simple   "
print(quote.trimmingCharacters(in: .whitespacesAndNewlines))



extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var quoteTRIMMED = "   The truth is rarely pure and never simple   "
let trimmedTRIMMED = quoteTRIMMED.trimmed()


extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quote.trim()

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var stringExtensionTEST = "Jonathan"
print(stringExtensionTEST.lines)
print(stringExtensionTEST.lines.count)

// Protocol extensions

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


// Optionals

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]



if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}



func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

var x : Int?

printSquare(of: x)

// Nil coalescing

var tvShows = Array<String>()
tvShows.append("Archer")
tvShows.append("Babylon 5")
tvShows.append("Ted Lasso")

let favorite = tvShows.randomElement() ?? "None"
               
            
let input = ""
let number = Int(input) ?? 0
print(number)

// Optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")

// Optional try?

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
} else {
    print("Failed")
}



let user3 = (try? getUser(id: 23)) ?? "Anonymous"
print(user3)


    // Optional try? is a fancy do/catch

    //do {
    //    let result = try runRiskyFunction()
    //    print(result)
    //} catch {
    //    // it failed!
    //}

    // Becomes this! 

    //if let result = try? runRiskyFunction() {
    //    print(result)
    //}
