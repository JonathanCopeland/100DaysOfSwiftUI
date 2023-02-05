import Cocoa

//write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
//
//You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
//If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
//You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
//If you can’t find the square root, throw a “no root” error.
//As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.
//
//I’ll give you some hints in a moment, but as always I encourage you to try it yourself first – struggling to remember how things work, and often having to look them up again, is a powerful way to make progress.


let number = 20

enum functionError: Error {
    case outOfBounds, noRoot
}

func squareRoot(value: Int) throws -> Int {
    
    if value >= 10000 || value < 1 {
        throw functionError.outOfBounds
    }
    
    var x = 1
    var y = value
    var z = 0

    while y != 0 {
        
        if z == 10000 {
            throw functionError.noRoot
        }
        
        y = y - x
        x = x + 2
        z = z + 1
    }
    
    return z
}

do {
    let result = try squareRoot(value: number)
    print("The square root of \(number) is \(result)")
} catch functionError.outOfBounds {
    print("Out of bounds")
} catch functionError.noRoot {
    print("No root")
}
