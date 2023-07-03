//
//  Result.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 03/07/2023.
//

import Foundation

struct Result: Codable, Identifiable {
    var id = UUID()
    let result: Int
//    let numerOfDice: Int
//    let values: [Int]
    
    static let example = Result(result: 2)

}
