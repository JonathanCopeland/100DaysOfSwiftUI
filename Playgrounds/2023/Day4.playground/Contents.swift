import Cocoa

// Type inference
let name = "Jonathan"

// Type annotation
var age: Int = 28
var height: Double = 1.2
var family: [String] = ["Bianca", "Clove"] // array
var devices: [String: String] = ["Apple": "Mac Mini", "Nintendo": "Switch"] // dictionary
var books: Set<String> = Set([
    "Zen and th Art of Motorcycle Maintenance",
    "Steal like an Artist"
]) // set

// Four different ways to make type annotated array
var friends: [String] = ["Chris", "Dillon", "Josh"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

// Enum
enum UIStyle {
    case light, dark, system
}
var style = UIStyle.light
style = .dark

// When to use type annotation?
// As muchas you can


// Swift is a 'type-safe' language

