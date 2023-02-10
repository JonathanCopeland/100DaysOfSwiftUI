import Cocoa

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// Unwrapping

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

// We can't use number until we 'unwrap' it using 'if let'

// *****

// Guard let

var myVar: Int? = 3

//if let unwrapped = myVar {
//    print("Run if myVar has a value inside")
//}
//
//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//}


print("Hello")

//

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

//So: use 'if let' to unwrap optionals so you can process them somehow, and use 'guard let' to ensure optionals have something inside them and exit otherwise.


let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


struct Book {
let title: String
let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

// How to handle multiple optionals using optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// IF optional has an element, unwrap it, then uppercase it

struct Book2 {
    let title2: String
    let author2: String?
}

var book2: Book2? = nil
let author2 = book2?.author2?.first?.uppercased() ?? "A"
print(author2)

// IF there is a book and author, then unwrap

// How to handle function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

//

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

//You’ll find try? is mainly used in three places:
//In combination with guard let to exit the current function if the try? call returns nil.
//In combination with nil coalescing to attempt something or provide a default value on failure.
//When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example
///


