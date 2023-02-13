import Cocoa

// Classes

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// In Swift, when to use Structs over Classes?
//Swift uses structs for storing most of its data types, including String, Int, Double, and Array, but there is another way to create custom data types called classes. These have many things in common with structs, but are different in key places.
//
//First, the things that classes and structs have in common include:
//
//You get to create and name them.
//You can add properties and methods, including property observers and access control.
//You can create custom initializers to configure new instances however you want.
//However, classes differ from structs in five key places:
//
//You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
//Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
//When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
//When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
//Even if you make a class constant, you can still change its properties as long as they are variables.
//On the surface those probably seem fairly random, and there’s a good chance you’re probably
// The only difference between that and a struct is that it was created using class rather than struct – everything else is identical.

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
joseph.printSummary()
robert.printSummary()

// *****

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// We need to use the 'Super' keyword to be able to override the init in children
// super is another one of those values that Swift automatically provides for us, similar to self: it allows us to call up to methods that belong to our parent class, such as its initializer. You can use it with other methods if you want; it’s not limited to initializers.

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"

var user3 = User()
user3.copy()

print(user1.username)
print(user2.username)
print(user3.username)

// *****

// Deinit

class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

//

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// *****

class User3 {
    var name = "Paul"
}

//let user4 = User3()
//user4.name = "Taylor"
//print(user4.name)


var user5 = User3()
user5.name = "Taylor"
user5 = User3()
print(user5.name)

//



