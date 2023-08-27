//
//  DiceSet.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 09/07/2023.
//

import Foundation

class DiceSet: ObservableObject {
    @Published var diceSet = [Die]()
    
    static var example = [Die.example1, Die.example2]
    
}
