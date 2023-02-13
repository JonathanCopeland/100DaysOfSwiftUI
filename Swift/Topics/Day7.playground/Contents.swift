import Cocoa

// Functions

func showGreeting() {
    print("Success!")
}

showGreeting()

// Passing values into functions

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

// Returning values from functions

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

let result2 = areLettersIdentical(string1: "Jonathan", string2: "Jonathan")
print(result2)

// Returning multiple values from a function

// Array
// That’s problematic, because it’s hard to remember what user[0] and user[1] are, and if we ever adjust the data in that array then user[0] and user[1] could end up being something else or perhaps not existing at all.

func getUser() -> [String] {
    return ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

// Dictionary
// Even though we know both firstName and lastName will exist, we still need to provide default values just in case things aren’t what we expect.

func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")

// *****

// Tuples
// A less arbitrary means of calling data


func getUser3() -> (firstName: String, lastName: String) {
    return (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

// Optimisations

//func getUser3() -> (firstName: String, lastName: String) {
//     ("Taylor", "Swift")
//}
// This code does the same thing, but it's more concise

//func getUser() -> (String, String) {
//    ("Taylor", "Swift")
//}
//
//let user = getUser()
//print("Name: \(user.0) \(user.1)")
// This code doesn't have names, so we can treat it like an array

//func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}
//
//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
//
//print("Name: \(firstName) \(lastName)")

// let (firstName, lastName) = getUser()
// print("Name: \(firstName) \(lastName)")


//let (firstName, _) = getUser()
//print("Name: \(firstName)")


// *****

// Customising parameter labels
// Instead of calling each function and needing to define the data type of the input each time, we can simplify the call and make it more elegent

//func isUppercase(string: String) -> Bool {
//    string == string.uppercased()
//}
//
//let string = "HELLO, WORLD"
//let result = isUppercase(string: string)

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let myResult = isUppercase(string)



// Readability
// We can make our functions more readable by defining a

//func printTimesTables(number: Int) {
//    for i in 1...12 {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//
//printTimesTables(number: 5)
// This requires us to write the word number in ever call, which is verbose and less readable

//func printTimesTables(for: Int) {
//    for i in 1...12 {
//        print("\(i) x \(for) is \(i * for)")
//    }
//}
//
//printTimesTables(for: 5)
// This is not valid, becasue for belongs to Swift

func printTimesTables(for number: Int) {
    for i in 1...12 {
            print("\(i) x \(number) is \(i * number)")
        }
}

printTimesTables(for: 5)
// So we can define a word to to externally (for) AND internally (number) of the function



// There are three things in there you need to look at closely:

// 1. We write for number: Int: the external name is for, the internal name is number, and it’s of type Int.
// 2. When we call the function we use the external name for the parameter: printTimesTables(for: 5).
// 3. Inside the function we use the internal name for the parameter: print("\(i) x \(number) is \(i * number)").

// So, Swift gives us two important ways to control parameter names: we can use _ for the external parameter name so that it doesn’t get used, or add a second name there so that we have both external and internal parameter names.
