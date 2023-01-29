import UIKit

// optionals, unwrapping, and typecasting

// Handling missing data

var age: Int? = nil
age = 38

// Unwrapping optionals

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// Unwrapping with guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

greet(name)

// Force unwrapping

let str = "5"
let num = Int(str)
let num2 = Int(str)!

// Implicitly unwrapped optionals

let age2: Int! = nil // allows us to treat this as if it is already an int

// Nil coalescing

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

// Optional chaining

let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()
 
// Optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("Password is too simple")
}

// Failable initializers

let str3 = "5"
let num3 = Int(str3)

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

var x = Person(id: "940614532")

// Typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

/**
 Optionals let us represent the absence of a value in a clear and unambiguous way.
 Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
 You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
 Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
 You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
 Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
 You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
 If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
 You can use typecasting to convert one type of object to another.*/

func brewBeer(to strength: Double?) {
    guard strength == strength else { return }
    print("Let's brew some beer!")
}
brewBeer(to: 5.5)
