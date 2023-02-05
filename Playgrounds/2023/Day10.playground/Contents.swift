import Cocoa

// Structs

struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let voidEternal = Album(title: "VOID ETERNAL", artist: "nothing,nowhere", year: 2023)

voidEternal.printSummary()

//

struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var jonty = Employee(name: "Jonathan Copeland", vacationRemaining: 25)
// This cannot be a Let as the'Mutating' keyword tells Swift that things will change

print(jonty.vacationRemaining)

// Terms
// - Properties
// - Methods
// - Initialiser
// - Instance

// *****

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        
        // Getter
        get {
            vacationAllocated - vacationTaken
        }
        
        
        // Setter
        set {
            vacationAllocated = vacationTaken + newValue
            // newValue is provided by Swift
        }
        
    }
}

var nicholas = Employee2(name: "Nicholas")
nicholas.vacationTaken += 4
nicholas.vacationRemaining = 5
print(nicholas.vacationAllocated)

// *****

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
        // This is included by Swift
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// *****

//struct Player {
//    let name: String
//    let number: Int
//}
//
//let player = Player(name: "Megan R", number: 15)
//print(player.number)


struct Player {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    // This is the Struct initialiser
}




