import UIKit

// Arrays (Collection)

let jonathan = "Jonathan Davis"
let munky = "James Shaffer"
let head = "Brian Welch"
let fieldy = "Reginald Arvizu"
let ray = "Ray Luzier"

let korn = [jonathan, munky, head, fieldy, ray]
korn[0]

// Sets (Collection)

let korn2 = Set([jonathan, jonathan, munky, head, fieldy, ray])

// Tuples

var name = (first: "Jonathan", last: "Copeland")
name.first
name.0

// Dictionaries (Collection)

let copelands = [
    "Husband" : "Jonty",
    "Wife" : "Bianca"
]

copelands["Husband"]
copelands["Baby", default: "None"]

// Empty collections
var scores = Dictionary<String, Int>()
var results = Array<Int>()

// Enums
enum Result {
    case success
    case failure
}
var result1 = Result.failure

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)

