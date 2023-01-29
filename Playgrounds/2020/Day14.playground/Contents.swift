import UIKit

// Functions

func greeting(name: String) -> String {
    return "Hello \(name)"
}

print(greeting(name: "Jonty"))


// Optionals

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}

if let test = yearAlbumReleased(name: "Korn") {
    print("Album year: \(test)")
}
else {
    print("Error: This is not a Taylor Swift album")
}

//******* force unwrap

var year = yearAlbumReleased(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}

// Optional chaining

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album)")
// ******* everything after the question mark will only be run if everything before the question mark has a value.

let album2 = albumReleased(year: 2001) ?? "unknown"
print("The album is \(album2)")

// nil coalescing operator is a far more sucinct way of writing optinals

// Enumerations

// ******* Basicaly we can define the values that are allowed into an input field. This would be useful for Budget categories and number input

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

enum WeatherType2 {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == WeatherType.sun {
        return nil
    } else {
        return "Hate"
    }
}

getHaterStatus(weather: WeatherType.sun) ?? "Happy"


func getHaterStatus2(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    case .snow:
        return "cold"
    }
}

func getHaterStatus3(weather2: WeatherType2) -> String? {
    switch weather2 {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus3(weather2: WeatherType2.wind(speed: 5))

// Structs

struct budget {
    var name: String
    var value: Double
    var used: Double
    
    func status() {
        print("R\(value-used) left of \(name)")
    }
}

let item1 = budget(name: "Groceries", value: 4000, used: 500)
print(item1.name)
print(item1.status())


struct Person {
    var clothes: String
    var shoes: String

}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)



// Classes

/** How are classes differant deom structs?
 You don't get an automatic memberwise initializer for your classes; you need to write your own. (Initilisers)
 You can define a class as being based off another class, adding any new things you want. (Inheritance)
 When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default – change one, and the copy changes too.*/

class Person2 {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Child: Person2 {
    var parent: String
    
    init(clothes: String, shoes: String, parent: String) {
        self.parent = parent
        super.init(clothes: clothes, shoes: shoes)
    }
}


/**
 If you want to have one shared state that gets passed around and modified in place, you're looking for classes. You can pass them into functions or store them in arrays, modify them in there, and have that change reflected in the rest of your program.
 If you want to avoid shared state where one copy can't affect all the others, you're looking for structs. You can pass them into functions or store them in arrays, modify them in there, and they won't change wherever else they are referenced.*/
