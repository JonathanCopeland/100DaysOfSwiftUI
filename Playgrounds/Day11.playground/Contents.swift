import UIKit

// protocols, extensions, and protocol extensions

protocol Identifiable {
    var id: String { get set }
}

/**
 Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.
 */

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

var x = User(id: "u15170404")

displayID(thing: x)

// Protocol inheritance

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

struct employee : Employee {
    
    func calculateWages() -> Int {
        return 5
    }
    
    func study() {
        print("Hello")
    }
    
    func takeVacation(days: Int) {
        print(days)
    }

}

var y = employee()
y.study()
y.takeVacation(days: 5)
print(y.calculateWages())

// Extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

number.isEven

// Protocol extensions

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// Protocol-oriented programming

/**
 Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions.
 */

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()

//


/**
 You’ve made it to the end of the ninth part of this series, so let’s summarize:

 Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
 You can build protocols on top of other protocols, similar to classes.
 Extensions let you add methods and computed properties to specific types such as Int.
 Protocol extensions let you add methods and computed properties to protocols.
 Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
 */

protocol HasAge {
    var age: Int { get set }
    mutating func celebrateBirthday()
}

protocol Paintable { }
protocol Tileable { }
struct Wall: Paintable, Tileable { }

extension Collection {
    func describe() {
        if count == 1 {
            print("There is 1 item.")
        } else {
            print("There are \(count) items.")
        }
    }
}


protocol TravelsThroughTime {
    mutating func travel(to year: Int)
}

protocol BiggerOnTheInside {
    func findSwimmingPool()
}

protocol TARDIS: TravelsThroughTime , BiggerOnTheInside {
    var doctorNumber: Int { get set }
}

struct Tardis: TARDIS {
    var doctorNumber: Int
    
    func findSwimmingPool() {
    }
    
    mutating func travel(to year: Int) {
    }
}

var Doctor = Tardis(doctorNumber: 5)

protocol Inflatable {
    mutating func refillAir()
}
extension Inflatable {
    mutating func refillAir() {
        print("Refilling the air.")
    }
}

protocol SuitableForKids {
    var minimumAge: Int { get set }
    var maximumAge: Int { get set }
}
protocol SupportsMultiplePlayers {
    var minimumPlayers: Int { get set }
    var maximumPlayers: Int { get set }
}
struct FamilyBoardGame: SuitableForKids, SupportsMultiplePlayers {
    var minimumAge = 3
    var maximumAge = 110
    var minimumPlayers = 1
    var maximumPlayers = 4
}

