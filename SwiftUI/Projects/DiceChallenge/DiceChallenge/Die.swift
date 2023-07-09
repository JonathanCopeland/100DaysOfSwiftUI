//
//  Die.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 09/07/2023.
//

import Foundation

struct Die: Identifiable {
    
    var id = UUID()
    private var faceValue: Int
    let name: String
    let sides: Int

    mutating func roll() {
        faceValue = Int.random(in: 1...sides)
    }
    
    func rollResult() -> Int {
        return faceValue
    }
    
    init(sides: Int) {
        self.sides = sides

        faceValue = Int.random(in: 1...sides)

        switch sides {
            case 2:
                name = "Coin"
            case 100:
                name = "Percent"
            default:
                name = "D" + String(sides)
        }
    }
    
    static let example1 = Die(sides: 6)
    static let example2 = Die(sides: 10)
    
    
}
