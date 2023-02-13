import Cocoa

// Closure: The idea of treating functions are variables


func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

//

//let sayHello = {
//    print("Hi there!")
//}
//
//sayHello()

// This is an example of a closure, where we add a function into a variable

// Accept parameters?

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Jonathan")
print(sayHello("Jonathan"))

// Take note of the 'in' keyword
// Functions are a type, kind of like Int, Double, String

// What does 'by:' mean?
// not sure, looks like it triggers a variant of sorted()


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//let sortedTeam = team.sorted()
//print(sortedTeam)
//
//func captainFirstSorted(name1: String, name2: String) -> Bool {
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//}
//
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

// Above, you can see use passing in a function into another function to create a variable
// We're effectively overwriting sorted to create a special edition version with extra funtionality

print(captainFirstTeam)

// *****
// How to use trailing closures and shorthand syntax

// We can simplfy the above code by saying
// let captainFirstTeam = team.sorted(by: { a, b in
// ...
// Swift already knows the sorted function much take two strings and return a bool so we don;t need to communicate more

// We can simplify this code even more!

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

print(captainFirstTeam2)

// Can we make this even simpler ?
// Swift automatically gives variable names for closures, so we can get rid of the internal variable names, and ratehr use $0, and $1

let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

print(captainFirstTeam3)


let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

print(captainFirstTeam4)

//There are no fixed rules about when to use shorthand syntax and when not to, but in case it’s helpful I use shorthand syntax unless any of the following are true:
//
//The closure’s code is long.
//$0 and friends are used more than once each.
//You get three or more parameters (e.g. $2, $3, etc).

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// we can use this with other default function in Swift

let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)

// *****
// How write function that accept functions as parameters

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("1")
    first()
    print("2")
    second()
    print("3")
    third()
    print("Done")
}

doImportantWork {
    print("First work")
} second: {
    print("Second work")
} third: {
    print("Third work")
}

//We’ve covered a lot about closures in the previous chapters, so let’s recap:
//
//You can copy functions in Swift, and they work the same as the original except they lose their external parameter names.
//All functions have types, just like other data types. This includes the parameters they receive along with their return type, which might be Void – also known as “nothing”.
//You can create closures directly by assigning to a constant or variable.
//Closures that accept parameters or return a value must declare this inside their braces, followed by the keyword in.
//Functions are able to accept other functions as parameters. They must declare up front exactly what data those functions must use, and Swift will ensure the rules are followed.
//In this situation, instead of passing a dedicated function you can also pass a closure – you can make one directly. Swift allows both approaches to work.
//When passing a closure as a function parameter, you don’t need to explicitly write out the types inside your closure if Swift can figure it out automatically. The same is true for the return value – if Swift can figure it out, you don’t need to specify it.
//If one or more of a function’s final parameters are functions, you can use trailing closure syntax.
//You can also use shorthand parameter names such as $0 and $1, but I would recommend doing that only under some conditions.
//You can make your own functions that accept functions as parameters, although in practice it’s much more important to know how to use them than how to create them.
//Of all the various parts of the Swift language, I’d say closures are the single toughest thing to learn. Not only is the syntax a little hard on your eyes at first, but the very concept of passing a function into a function takes a little time to sink in.
//
//So, if you’ve read through these chapters and feel like your head is about to explode, that’s great – it means you’re half way to understanding closures!
