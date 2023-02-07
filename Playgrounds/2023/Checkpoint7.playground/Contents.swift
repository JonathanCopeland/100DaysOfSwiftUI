import Cocoa

class Animal {
    let legs: Int

    init(legs: Int) {
        self.legs = legs
        print("Animal has \(legs) legs")
    }
}

class Dog: Animal {
    
    let sound = ["Bark!", "Roof!", "Arf!"]
    
    func speak() {
        print(sound.randomElement())
    }
}

class Cat: Animal {
    
    var isTame : Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
        
        if isTame {
            print("The Cat is tame")
        }
        else {
            print("The Cat is not tame")
        }
        
        
    }
    
}


var Clove = Dog(legs: 4)
Clove.speak()

var Sparkles = Cat(isTame: true)



//class Vehicle {
//    let isElectric: Bool
//
//    init(isElectric: Bool) {
//        self.isElectric = isElectric
//    }
//}
//
//class Car: Vehicle {
//    let isConvertible: Bool
//
//    init(isElectric: Bool, isConvertible: Bool) {
//        self.isConvertible = isConvertible
//        super.init(isElectric: isElectric)
//    }
//}
