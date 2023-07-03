//
//  PreviousResults.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 03/07/2023.
//

import Foundation

class PreviousResults: ObservableObject {
    @Published var items = [Result]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Result")
            }
        }
    }
    

    init() {
        if let savedResults = UserDefaults.standard.data(forKey: "Result") {
            if let decodedResults = try? JSONDecoder().decode([Result].self, from: savedResults) {
                items = decodedResults
                return
            }
        }

        items = []
    }
}
