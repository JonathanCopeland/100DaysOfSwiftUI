import UIKit

// Classes

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// Class inheritance

class Pug: Dog {
    init(name: String) {
        super.init(name: name, breed: "Pug")
    }
    
    override func makeNoise() {
        print("Gurgle!")
    }
    

}

var myDog = Pug(name: "Jabba")

print(myDog.name + " is a " + myDog.breed)

// Overriding methods

myDog.makeNoise()

// Final classes

final class Human {
    var name: String

    init(name: String) {
        self.name = name
    }
}

// Copying objects

print("***Making a Class***")


class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

print("***Making a Struct***")

struct Singer2 {
    var name = "Taylor Swift"
}

var singer2 = Singer2()
singer2.name = "Taylor Swift"

var singerCopy2 = singer2
singerCopy2.name = "Justin Bieber"

print(singer2.name)

// Deinitializers

class Person {
    var name = "Andrew"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

let andrew = Person()

print(andrew.name)

// Mutability

print("***Making a Class***")


class Singer3 {
    var name = "Taylor Swift"
}

let taylor = Singer3()
taylor.name = "Ed Sheeran"
print(taylor.name)

print("***Making a Struct***")

struct Singer4 {
    var name = "Taylor Swift"
}

let taylor2 = Singer4()
//taylor2.name = "Ed Sheeran" // this would not work
print(taylor2.name)

// classes are easier to modify

/**
 You’ve made it to the end of the eighth part of this series, so let’s summarize:

 Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
 You can mark a class with the final keyword, which stops other classes from inheriting from it.
 Method overriding lets a child class replace a method in its parent class with a new implementation.
 When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
 */




