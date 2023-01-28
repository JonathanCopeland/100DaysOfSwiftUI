import UIKit

// Structs

struct Sport { // called struct
    var name: String // called property
}

var tennis = Sport(name: "Rugby")
tennis.name = "7s Rugby"

print(tennis.name)

// Computed properties

struct videoGame {
    var name: String
    var isConsole: Bool
    
    var consolePlayable: String {
        if isConsole {
            return "\(name) is playable on console"
        }
        else {
            return "\(name) is not playable on console"
        }
    }
}

let DawnOfWar = videoGame(name: "Dawn of War 2", isConsole: false)
print(DawnOfWar.isConsole)

// Property observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

// I could use this for each budget category
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// Methods

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let dublin = City(population: 9_000_000)
print(dublin.collectTaxes())

// Mutating methods

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
print(person.name)
person.makeAnonymous()
print(person.name)

// Properties and methods of strings

let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// Properties and methods of arrays

var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.append("Mr. Potato")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
toys.remove(at: 1)
print(toys)
print(toys[0])
toys.capacity

// Initializers

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"
print(user.username)

// Referring to the current instance, self is a keyword to use within of Person

struct Person2 {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var me = Person2(name: "Jonty")
print(me.name)

// Lazy properties, only create things when they are needed

struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}

struct Person3 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
        
    }
}

var ed = Person3(name: "Ed")
print(ed.name)
ed.familyTree

// Static properties and methods

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

var taylor = Student.init(name: "Taylor Swift")
var jonty = Student.init(name: "Jonathan Copeland")

print(Student.classSize)

// Access control

struct Person4 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed2 = Person4(id: "12345")
print(ed2.identify()) // here we are accessing id, but indirectly through the function within Person4

/**
 You’ve made it to the end of the seventh part of this series, so let’s summarize:

 You can create your own types using structures, which can have their own properties and methods.
 You can use stored properties or use computed properties to calculate values on the fly.
 If you want to change a property inside a method, you must mark it as mutating.
 Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 Use the self constant to refer to the current instance of a struct inside a method.
 The lazy keyword tells Swift to create properties only when they are first used.
 You can share properties and methods across all instances of a struct using the static keyword.
 Access control lets you restrict what code can use properties and methods.
 
 */
