import Cocoa

protocol Vehicle {
    var name: String { get }
    var currentPassengers : Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// new type like Int, String etc

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}


struct Car: Vehicle {
    
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

let testCar = Car()
testCar.openSunroof()

//

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

// Now we can use any type of vehicle - this is more abstract


struct Bicycle: Vehicle {
    
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)


getTravelEstimates(using: [car, bike], distance: 150)

// *****

//func getRandomNumber() -> Int {
//    Int.random(in: 1...6)
//}
//
//func getRandomBool() -> Bool {
//    Bool.random()
//}

// We can make our code more generic by using 'some Equatable'

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable  {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

var num = getRandomNumber()
print(num)

// So, when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.”


var quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// Protocols let us define contracts that conforming types must adhere to, and extensions let us add functionality to existing types.

//extension Array {
//    var isNotEmpty: Bool {
//        isEmpty == false
//    }
//}
//
//let guests = ["Mario", "Luigi", "Peach"]
//
//guests.isNotEmpty

// How can we make this more generic?
// Collection is the parent of Array

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

guests.isNotEmpty

// Term: protocal oriented programming 'POP'


//Let’s recap what we learned:
//
//Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
//Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
//Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
//Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.
