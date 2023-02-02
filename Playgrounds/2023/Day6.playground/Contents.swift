import Cocoa

let platforms = ["iOS", "macOS"]


// For loop
for os in platforms {
    print("Swift works great on \(os)")
}
// os is created by the loop, and is used only in that loop
// This is called a loop variable'



// This is a range
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// This is a nested loop
for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}


// *****

// While loop

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")


// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

// ******
// Breaks

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}
// continue jumps Swift out of the loop


let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)
// Break exits the loop


//We’ve covered a lot about conditions and loops in the previous chapters, so let’s recap:
//
//We use if statements to check a condition is true. You can pass in any condition you want, but ultimately it must boil down to a Boolean.
//If you want, you can add an else block, and/or multiple else if blocks to check other conditions. Swift executes these in order.
//You can combine conditions using ||, which means that the whole condition is true if either subcondition is true, or &&, which means the whole condition is true if both subconditions are true.
//If you’re repeating the same kinds of check a lot, you can use a switch statement instead. These must always be exhaustive, which might mean adding a default case.
//If one of your switch cases uses fallthrough, it means Swift will execute the following case afterwards. This is not used commonly.
//The ternary conditional operator lets us check WTF: What, True, False. Although it’s a little hard to read at first, you’ll see this used a lot in SwiftUI.
//for loops let us loop over arrays, sets, dictionaries, and ranges. You can assign items to a loop variable and use it inside the loop, or you can use underscore, _, to ignore the loop variable.
//while loops let us craft custom loops that will continue running until a condition becomes false.
//We can skip some or all loop items using continue or break respectively.
