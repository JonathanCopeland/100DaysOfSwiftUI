//
//  Dice.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 08/07/2023.
//

import Foundation

struct Dice: Codable, Identifiable {
    
    enum Sides {
        case four, six, eight, ten, twelve, twenty, hundred
    }
    
    var id = UUID()
    let result: Int
    

    
}




