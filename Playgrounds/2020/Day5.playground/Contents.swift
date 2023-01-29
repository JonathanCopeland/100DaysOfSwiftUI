import UIKit

// Functions

var str = "Hello, playground"

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()

// Accepting parameters

func square2(number: Int) {
    print(number * number)
}

square2(number: 8)

// returning values

func square3(number: Int) -> Int {
    return number * number
}

let result = square3(number: 8)
print(result)

// Parameter labels
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

//Omitting parameter labels

func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("Taylor")

//Default parameters

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Chris")
greet("Steve", nicely: false)


// Variadic Functions

func square4(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square4(numbers: 1, 2, 3, 4, 5)

// Writing throwing functions


enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// inout parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)


/**
 
 You’ve made it to the end of the fifth part of this series, so let’s summarize:

 Functions let us re-use code without repeating ourselves.
 Functions can accept parameters – just tell Swift the type of each parameter.
 Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
 You can use different names for parameters externally and internally, or omit the external name entirely.
 Parameters can have default values, which helps you write less code when specific values are common.
 Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
 Functions can throw errors, but you must call them using try and handle errors using catch.
 You can use inout to change variables inside a function, but it’s usually better to return a new value.
 
 */
