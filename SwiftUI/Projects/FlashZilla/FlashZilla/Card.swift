import SwiftUI

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who is the lead singer of the band Korn?", answer: "Jonathan David")
}
